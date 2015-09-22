<?php
function _smarty_function_html_ref_select_force_ajax($module, $params) {
    static $count = 0;

    $uniqid = uniqid($count++);

    $html_result = '';
	$html_result .= '<input type="hidden" value="'.$params['value'].'" name="'.$params['name'].'"/>';
	$html_result .= '<span class="'.$uniqid.'-live-search"><input type="text" style="width:150px;" value="'.(!empty($params['text'])? $params['text'] : $params['value']).'" autocomplete="off"></span>';
    $html_result .= '<script type="text/javascript">';
    $html_result .= '$(document).ready(function() {';
    $html_result .= "    \$('.".$uniqid."-live-search input').liveSearch({id: '".$uniqid."-live-search-panel', url: '".APPLICATION_URL."/".$module."/liveSelect?term='});";
    $html_result .= "    \$('#".$uniqid."-live-search-panel ul li a').live('click', function(){";
    $html_result .= "       var a = \$(this);";
    $html_result .= "       \$('input[name=\"".$params['name']."\"]').val(a.data('id'));";
    $html_result .= "       \$('.".$uniqid."-live-search input').val(a.text());";
    $html_result .= "       \$('.live-search-results').hide();";
    $html_result .= "    });";
    $html_result .= '});';
    $html_result .= '</script>';

    return $html_result;
}

function _smarty_function_html_ref_select_simple_input($params) {
	return '<input type="text" value="'.$params['value'].'" name="'.$params['name'].'"/>';
}

function smarty_function_html_ref_select($params, &$smarty)
{
	static $cache = null;

	$method = isset($params['method'])? $params['method'] : '';
	$optionstring = isset($params['options'])? $params['options'] : '';
	$datasource = $params['datasource'];
	$datasourcename = isset($params['datasourcename']) && !empty($params['datasourcename'])? $params['datasourcename'] : str_replace(' ', '', ucwords(str_replace('_', ' ', strtolower($datasource))));
	$noauth = isset($params['noauth'])? $params['noauth'] : false;
	$multilingual = isset($params['multilingual'])? $params['multilingual'] : false;

    $module = str_replace('_', '', strtolower($datasource));

	$options = '';
    $callback = RefSelectHelper::getOptionsSource($params['name']);

    // x. Ajax case
    if (isset($params['ajax']) && $params['ajax']) {
        return _smarty_function_html_ref_select_force_ajax($module, $params);
    }

    // x. Normal case
    if (isset($params['blankitem'])) {
        $blankitemval = isset($params['blankitemval'])? $params['blankitemval'] : '';
        $options .= '<option value="'.$blankitemval.'">'.(!empty($params['blankitem'])? $params['blankitem'] : '&lt;None&gt;').'</option>';
    }

    if (isset($params['noneitem'])) {
        $noneitemval = isset($params['noneitemval'])? $params['noneitemval'] : '__NULL__';
        $options .= '<option value="'.$noneitemval.'"'.($params['value'] == $noneitemval? ' selected' : '').'>'.$params['noneitem'].'</option>';
    }

    if (!empty($optionstring)) {
        $parts = preg_split('/[\|,;]+/', $optionstring, -1, PREG_SPLIT_NO_EMPTY);

        foreach ($parts as $part) {
            $options .= '<option value="'.$part.'">'.$part.'</option>';
        }
    } else if (!empty($method) && is_callable($method)) {
        $options .= call_user_func($method, $params);
    } else if (!empty($callback) && is_callable($callback)) {
        $options .= call_user_func($callback, $params);
    } else {
    	$modelName = $datasourcename.'Model';

        if (!class_exists($modelName)) {
            return _smarty_function_html_ref_select_simple_input($params);
        }

    	$model = new $modelName();

    	$controllerName = $datasourcename.'Controller';

        if (!class_exists($controllerName)) {
            return _smarty_function_html_ref_select_simple_input($params);
        }

    	$controller = new $controllerName();

        $vars = get_object_vars($model);
        $cols = array_keys($vars);

    	$groupcol = isset($params['groupcol'])? $params['groupcol'] : '';

        $useoptgroup = !empty($groupcol) && preg_match('/^id_|_id_|_id$/i', $groupcol);
        $groupmodelname = str_replace(' ', '', ucwords(preg_replace(array('/^id_|.*_id_|_id$/i', '/_/'), ' ', strtolower($groupcol)))).'Model';

    	$textcol = isset($params['textcol'])? $params['textcol'] : '';
        $usereftextcol = !empty($textcol) && preg_match('/^id_|_id_|_id$/i', $textcol);
        $reftextmodelname = str_replace(' ', '', ucwords(preg_replace(array('/^id_|.*_id_|_id$/i', '/_/'), ' ', strtolower($textcol)))).'Model';

    	if (isset($cache[$datasource])) {
    		$rows = $cache[$datasource];
    	} else {
    		$model->selectAdd();
    		$model->selectAdd('`'.TABLE_PREFIX.$model->__table.'`.*');

    		if ($useoptgroup) {
                $gb = new $groupmodelname();

                $gbcols = array_keys(get_object_vars($gb));
                $gbtextcol = in_array('NAME', $gbcols)? 'NAME' : (in_array('TITLE', $gbcols)? 'TITLE' : 'ID');

        		$model->selectAdd('A.'.$gbtextcol.' as OPTGROUP, A.ID as OPTGROUPID');
        		if (in_array('ORDERING', $gbcols)) {
            		$model->selectAdd('A.ORDERING as _ORDERING');
        		}
        		$model->joinAdd($gb, 'LEFT', 'A');
            }

    		if ($usereftextcol) {
                $ref = new $reftextmodelname();

                $refcols = array_keys(get_object_vars($ref));
                $reftextcol = in_array('NAME', $refcols)? 'NAME' : (in_array('TITLE', $refcols)? 'TITLE' : 'ID');

        		$model->selectAdd('B.'.$reftextcol.' as reftext_'.$textcol);
        		$model->joinAdd($ref, 'LEFT', 'B');
            }

            $preset = RequestHelper::get('preset');
            $presetvalue = RequestHelper::get('presetvalue');
            if (!empty($preset) && property_exists($model, $preset)) {
                $model->whereAdd("$preset = '$presetvalue'");
            }

            $preset = isset($params['preset'])? $params['preset'] : '';
            $presetvalue = isset($params['presetvalue'])? $params['presetvalue'] : '';
            if (!empty($preset) && property_exists($model, $preset)) {
                $model->whereAdd("$preset = '$presetvalue'");
            }

            $filters = HtmlRefSelectHelper::getAdditionalFilters($params['name']);
            foreach ($filters as $key => $value) {
                if (property_exists($model, $key)) {
                    $model->whereAdd("$key = '$value'");
                }
            }

            foreach($_REQUEST as $key => $value) {
                if (preg_match('/^preset_(.*)/i', $key, $match) && property_exists($model, $match[1])) {
                    $model->whereAdd("{$match[1]} = '$value'");
                }
            }

            if (!$noauth) {
                $controller->enforceObjectAclCheck($module, $model);
            }

            $orderbyoptgroup = $useoptgroup? (in_array('ORDERING', $gbcols)? '_ORDERING, OPTGROUP, ' : 'OPTGROUP, ') : '';
            if (in_array('ORDERING', $cols)) {
                $model->orderBy($orderbyoptgroup.'ORDERING');
            } elseif (isset($params['sortcol']) && $params['sortcol']) {
                $model->orderBy($orderbyoptgroup.$params['sortcol']);
            } else {
                if (property_exists($model, $textcol)) {
                    $model->orderBy($orderbyoptgroup.$firstcol);
                }
            }

    		$model->find();

            // x. Force ajax in case of large list
    		if ($model->N > 100) {
    		    return _smarty_function_html_ref_select_force_ajax($module, $params);
    		}

    		$rows = array();
         	while ($model->fetch()) {
         		$rows[$model->ID] = clone $model;
    		}

            if (in_array('PARENT', $cols)) {
                $rows = UiHelper::hierachical($rows, $params['valuecol'], '', 'PARENT', '10');
            }

            $cache[$datasource] = $rows;
    	}

        $values = explode(',', $params['value']);

        $curoptgroup = '';
     	foreach ($rows as $model) {
            if ($useoptgroup) {
                if ($model->OPTGROUP != $curoptgroup) {
                    if (!empty($curoptgroup)) {
            		    $options .= '</optgroup>';
                    }
        		    $options .= '<optgroup label="'.$model->OPTGROUP.'" class="optgroup_'.$groupcol.'_'.$model->OPTGROUPID.'">';

        		    $curoptgroup = $model->OPTGROUP;
                }
            }

    		$selected = '';
     		if (in_array($model->{$params['valuecol']}, $values)) {
     			$selected = ' selected="selected" ';
    		}

            $text = ($usereftextcol? htmlspecialchars($model->{'reftext_'.$textcol}, ENT_QUOTES, 'UTF-8') : htmlspecialchars(ModelHelper::get($model, $textcol), ENT_QUOTES, 'UTF-8'));
            if ($multilingual) {
                $text = _t($text);
            }

    	    $options .= '<option id="option-'.$model->{$params['valuecol']}.'" class="option-'.$model->{$params['valuecol']}.'" value="'.$model->{$params['valuecol']}.'"'.$selected.'>'.(isset($model->INDENT)? $model->INDENT : '').$text.'</option>';
    	}
        if (!empty($curoptgroup)) {
    	    $options .= '</optgroup>';
        }

        if ($useoptgroup) {
            if (preg_match('/(.*_formdata)/is', $params['name'], $matches)) {
                $prefix = $matches[1];
                $html_result .= "<script type=\"text/javascript\">$(document).ready(function(){reflection('".$prefix."', '".$groupcol."', 'ID_".$datasource."');});</script>";
            }
        }

    }

    $datas = array();
    foreach ($params as $key => $value) {
        if (preg_match('/^data-/i', $key)) {
            $datas[] = "$key=\"$value\"";
        }
    }

    $html_result = '';
	$html_result .= '<select '.(!empty($datas)? implode(' ', $datas).' ' : '').(isset($params['multiple']) && $params['multiple']? 'multiple ' : '').'data-placeholder="'.(isset($params['placeholder'])? $params['placeholder'] : '').'" class="'.(isset($params['class'])? $params['class'] : '').(isset($params['autocomplete']) && $params['autocomplete']? ' autocomplete' : '').(isset($params['multiple']) && $params['multiple']? ' multiple' : '').'" name="'.$params['name'].(isset($params['multiple']) && $params['multiple']? '[]' : '').'"'.(isset($params['id']) && $params['id']? ' id="'.$params['id'].'"' : '').(isset($params['disabled']) && $params['disabled']? ' disabled' : '').(!empty($params['onchange'])? ' onchange="'.$params['onchange'].'"' : '').'>';
    $html_result .= $options;
    $html_result .= '</select>';

    return $html_result;
}
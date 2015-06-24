<?php
function smarty_function_templatezone($params, &$smarty)
{
    $html = '';

	$position = isset($params['position'])? $params['position'] : '';
	$module = isset($params['module'])? $params['module'] : '';

	$model = new ModuleModel();

    if (!empty($module)) {
        $model->CODE = $module;
    } else if (!empty($position)) {
    	$pl = new PageLayoutModel();

    	$pl->ID_PAGE = $smarty->_tpl_vars['page']->ID;
    	$pl->POSITION = $position;

        $model->joinAdd($pl);

    	$model->orderBy('ORDERING');
    }

	$model->joinAdd(new ModuleHandlerModel(), 'LEFT');
	$model->find();
    $total = $model->N;

    while ($model->fetch()) {
        if ($model->IS_HTML) {
            $html .= '<div class="'.$model->CODE.'">'.$model->HTML_CONTENT.'</div>';
        } else {
            $mname = $model->PHP_CLASS;
            $handler = new $mname();

            parse_str(html_entity_decode($model->PARAMS), $mparams);

            $html .= '<div class="'.$model->CODE.'">'.$handler->fetch($mparams, $smarty).'</div>';
        }
    }

    if (!$total) {
        if (!empty($module)) {
            $html .= '<span style="background-color:yellow;padding:5px;">{'.$module.'} - module</span>';
        } else if (!empty($position)) {
//            $html .= '<span style="background-color:yellow;padding:5px;">{'.$position.'} - position</span>';
        }
    }

	return $html;
}
<?php
function smarty_function_html_boolean_select($params, &$smarty)
{
	$options = '';

    if (isset($params['blankitem'])) {
        $blankitemval = isset($params['blankitemval'])? $params['blankitemval'] : '';
        $options .= '<option value="'.$blankitemval.'">'.$params['blankitem'].'</option>';
    }

    if (isset($params['noneitem'])) {
        $noneitemval = isset($params['noneitemval'])? $params['noneitemval'] : '__NULL__';
        $options .= '<option value="'.$noneitemval.'"'.($params['value'] == $noneitemval? ' selected' : '').'>'.$params['noneitem'].'</option>';
    }

    $options .= '<option value="1"'.($params['value'] == '1'? ' selected="selected" ' : '').'>'.L_YES.'</option>';
    $options .= '<option value="0"'.($params['value'] == '0'? ' selected="selected" ' : '').'>'.L_NO.'</option>';

    $html_result = '';
    $html_result .= '<select class="'.(isset($params['class'])? $params['class'] : '').(isset($params['autocomplete']) && $params['autocomplete']? ' autocomplete' : '').'" name="'.$params['name'].'"'.($params['disabled']? ' disabled' : '').(!empty($params['onchange'])? ' onchange="'.$params['onchange'].'"' : '').'>';
    $html_result .= $options;
    $html_result .= "</select>";

    return $html_result;
}
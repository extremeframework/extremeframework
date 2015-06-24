<?php
function smarty_function_calendar($params, &$smarty)
{
    $output = '';
	$output .= '<link rel="stylesheet" href="'.APPLICATION_URL.'/scripts/calendar/dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>';
	$output .= '<SCRIPT type="text/javascript" src="'.APPLICATION_URL.'/scripts/calendar/dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>';

    $output .= '<input type="text" value="'.$params['value'].'" readonly name="'.$params['name'].'" '.(!empty($params['onchange'])? ' onchange="'.$params['onchange'].'"' : '').'>';

    if (!$params['readonly'] && !$params['disabled']) {
        $output .= '<input type="button" value="Cal" onclick="displayCalendar(document.forms[0].'.$params['name'].',\''.$params['format'].'\',this)">';
    }        
    
    return $output;
}
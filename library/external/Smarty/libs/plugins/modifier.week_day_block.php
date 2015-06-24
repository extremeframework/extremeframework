<?php
function smarty_modifier_week_day_block($string)
{
    require_once(SMARTY_PLUGINS_DIR . 'shared.make_timestamp.php');
    if ($string != '' && $string != '0000-00-00' && $string != '0000-00-00 00:00:00') {
        $timestamp = smarty_make_timestamp($string);
    } else {
        return;
    }

    $day_of_week = date('N', $timestamp);

    if ($day_of_week == 1 && date('Ymd', $timestamp) > date('Ymd')) {
        $day_of_week = 8;
    }

    $days_diff = ceil(($timestamp - time())/(24*60*60));

    $s = abs($days_diff) > 1? 'days' : 'day';
    $days_diff_string = $days_diff < 0? abs($days_diff)." $s ago" : $days_diff." $s more";

    $style = $days_diff == 0? 'style="border: 2px solid #00B0F0;"' : '';

    return ($days_diff < 0 || $days_diff > 7)? $days_diff_string : '<img '.$style.' src="'.APPLICATION_URL.'/images/'.$day_of_week.'.png" height="20px" title="'.date('l, F d, Y', $timestamp).'"/>';
}

?>
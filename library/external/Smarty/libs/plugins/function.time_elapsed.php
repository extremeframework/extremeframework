<?php
function smarty_function_time_elapsed($params, &$smarty) {
    $time_elapsed = microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'];

    $text = '<!-- Time elapsed: '.$time_elapsed.' seconds -->';

    return $text;
}
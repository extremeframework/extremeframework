<?php
function smarty_function_ajaxmodule($params, &$smarty) {
	$class = $params['class'];
	$showindicator = isset($params['showindicator'])? $params['showindicator'] : true;

    if (isset($params['params'])) {
        $_params = $params['params'];

        unset($params['params']);

        $params = array_merge($params, $_params);
    }

    $params['__caller'] = 'ajax';
    $params['__return'] = 'mainbody';

	$querystring = http_build_query($params);
	$querystring = str_ireplace('&amp;', '&', $querystring);

    $signature = md5($querystring);

    $smarty->assign('class', $class);
    $smarty->assign('signature', $signature);
    $smarty->assign('querystring', $querystring);
    $smarty->assign('showindicator', $showindicator);

    return $smarty->fetch('ajax.module.tpl');
}
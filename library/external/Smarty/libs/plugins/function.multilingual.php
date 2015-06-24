<?php
function smarty_function_multilingual($params, &$smarty) {
	$from = isset($params['from'])? $params['from'] : null;
	$key = isset($params['key'])? $params['key'] : null;

	$en = isset($params['en'])? $params['en'] : null;
	$vi = isset($params['vi'])? $params['vi'] : null;
	$fr = isset($params['fr'])? $params['fr'] : null;

    $lang = $_SESSION['lang'];

    if (!empty($from) && !empty($key)) {
        if ($lang == 'vi' && property_exists($from, $key.'_IN_VIETNAMESE')) {
            return $from->{$key.'_IN_VIETNAMESE'};
        }

        if ($lang == 'en' && property_exists($from, $key.'_IN_ENGLISH')) {
            return $from->{$key.'_IN_ENGLISH'};
        }

        if ($lang == 'fr' && property_exists($from, $key.'_IN_FRENCH')) {
            return $from->{$key.'_IN_FRENCH'};
        }

        return $from->$key;
    }

    return ${$lang};
}
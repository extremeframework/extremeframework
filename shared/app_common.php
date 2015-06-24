<?php
function array_select($items, $field, $value) {
    $selection = array();

    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field]) && $array[$field] == $value) {
            $selection[] = $item;
        }
    }

    return $selection;
}

function array_select_single($items, $field, $value) {
    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field]) && $array[$field] == $value) {
            return $item;
        }
    }

    return null;
}

function array_exists($items, $field, $value) {
    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field]) && $array[$field] == $value) {
            return true;
        }
    }

    return false;
}

function array_sum_by_field($items, $field) {
    $sum = 0;

    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field])) {
            $sum += $array[$field];
        }
    }

    return $sum;
}

function array_group($items, $field, $modifier_callback = null) {
    $results = array();

    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field])) {
            $v = $array[$field];

            if (is_callable($modifier_callback)) {
                $v = call_user_func($modifier_callback, $v);
            }

            $results[$v][] = $item;
        }
    }

    return $results;
}

function json_extract($json, $property) {
    $json = json_decode($json);

    return is_object($json) && property_exists($json, $property)? $json->$property : array();
}

// TODO: use cache
function get_option($option, $default = null, $context = null) {
    static $options = null;

    if ($options == null) {
    	$model = new OptionModel();

        $model->selectAdd();
        $model->selectAdd('`CODE`, `CONTEXT`, `VALUE`');

    	$model->find();

        $options = array();

     	while ($model->fetch()) {
     	    $options[$model->CONTEXT][$model->CODE] = $model->VALUE;
        }
    }

    $value = isset($options[$context][$option])? $options[$context][$option] : '';

    if (empty($value)) {
        if (empty($default)) {
            die("<div style=\"color:orange\">[ERROR] Configuration option '$option' ".($context? "of domain '$context' " : '')."is required.</div>");
        }

        $value = $default;
    }

 	return $value;
}

function get_theme_option($option, $default = null) {
    return get_option($option, $default, THEME_NAME);
}

function get_request_param($name, $default = '') {
    return isset($_REQUEST[$name])? $_REQUEST[$name] : $default;
}

function condstring_match($condstring, $model) {
    $condstring = str_replace('=', '==', $condstring);

    $s = preg_replace('/([a-z_]+)/is', '$model->$1', $condstring);

    eval("\$result = $s;");

    return $result;
}
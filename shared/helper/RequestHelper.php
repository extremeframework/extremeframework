<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class RequestHelper {
	static function get($varname, $default = null) {
	    if (isset($_REQUEST[$varname])) {
	        return $_REQUEST[$varname];
	    } else {
    		$args = isset($_REQUEST['args'])? $_REQUEST['args'] : '';

    		$parts = explode('/', $args);

    		foreach ($parts as $i => $part) {
    		    if ($part == $varname) {
    		        return isset($parts[$i+1])? $parts[$i+1] : $default;
                }
            }
        }

        return $default;
	}

    static function filter($prefix, $columns = null) {
        $params = array();

		$raw = $_REQUEST;
		foreach ($_FILES as $key => $value) {
		    $raw[$key] = $value['name'];
		}

		foreach ($raw as $name => $value) {
            if (preg_match('/^'.$prefix.'(.*)/', $name, $matches)) {
                $key = $matches[1];

    		    if (!empty($columns) && !in_array($key, $columns)) {
                    continue;
    		    }

    		    $params[$key] = $value;
            }
		}

        return $params;
    }
}
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
}
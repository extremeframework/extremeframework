<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class __FrontController {
	function display(&$smarty, $template) {
	    $return = isset($_REQUEST['__return'])? $_REQUEST['__return'] : '';

        if (!empty($return)) {
		    $content = $smarty->fetch($template);

            if (($beginpos = strpos($content, '<!--:'.$return.'begin:-->')) && ($endpos = strpos($content, '<!--:'.$return.'end:-->'))) {
                $content = substr($content, $beginpos, $endpos - $beginpos);
            }

		    echo $content;
        } else {
		    $smarty->display($template);
        }
	}

    function onBeforeView(&$model) {
        // This is an abstract method
    }

    function onViewSuccess(&$model) {
        // This is an abstract method
    }

    function pagenotfound() {
        header("HTTP/1.0 404 Not Found");
        exit(-1);
    }
}
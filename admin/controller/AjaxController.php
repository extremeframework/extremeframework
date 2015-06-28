<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AjaxController
{
    function widgetAction() {
		$class = isset($_REQUEST['class'])? $_REQUEST['class'] : '';
        $handler = new $class();

        $smarty = Framework::getSmarty();
        echo $handler->fetch($_REQUEST, $smarty);
    }
}
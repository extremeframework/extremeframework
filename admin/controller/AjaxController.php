<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AjaxController
{
    function widgetAction() {
        $q = isset($_REQUEST['q'])? $_REQUEST['q'] : '';

        if (empty($q)) {
            die('Invalid request.');
        }

        $querystring = base64_decode($q);

        if (empty($querystring)) {
            die('Invalid request.');
        }

        parse_str($querystring, $params);

		$class = isset($params['class'])? $params['class'] : '';

        if (empty($class)) {
            die('Invalid request.');
        }

        $handler = new $class();

        echo $handler->fetch($params);
    }
}
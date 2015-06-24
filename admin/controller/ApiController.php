<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ApiController
{
    function indexAction() {
        $args = $_REQUEST['args'];

        if (preg_match('/([^\/]+)(\/?)([^\/]*)(\/?)(.*)/is', $args, $matches)) {
			$controller = $matches[1];

			global $app_router;

			if (isset($app_router[$controller])) {
			    $controller = $app_router[$controller];
			} else {
			    $controller = ucfirst($controller);
			}

            $controllerName = $controller.'Api';
            $action = lcfirst(str_replace(' ', '', ucwords(str_replace('-', ' ', $matches[3]))));

            if (class_exists($controllerName)) {
                $controller = new $controllerName();

                $actionName = $action.'Action';
                if (method_exists($controller, $actionName)) {
                    $args = $matches[5];

                    $_REQUEST['args'] = $args;

                    $controller->$actionName();
                } else {
                    $args = $matches[3].$matches[4].$matches[5];

                    $_REQUEST['args'] = $args;

                    $controller->indexAction();
                }
            } else {
                Api::error(400, 'Bad Request');
            }
        } else {
            Api::error(400, 'Bad Request');
        }
    }
}
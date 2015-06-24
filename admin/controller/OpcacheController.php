<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class OpcacheController extends __AppController
{
    function indexAction() {
		list($operation) = explode('/', $_REQUEST['args']);

        echo '<a href="'.APPLICATION_URL.'/opcache/config">View config</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/status">Check status</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear">Clear cache</a> &nbsp; ';

        if ($operation == 'config') {
            echo "<pre>";print_r(opcache_get_configuration());echo "</pre>";
        }

        if ($operation == 'status') {
            echo "<pre>";print_r(opcache_get_status());echo "</pre>";
        }

        if ($operation == 'reset') {
            $ok = opcache_reset();

            if ($ok) {
                echo 'Cache cleared';
            }
        }
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class OpcacheController extends __AppController
{
    function indexAction() {
        AuthenticationController::authenticate();

		list($operation) = explode('/', $_REQUEST['args']);

        echo '<a href="'.APPLICATION_URL.'/opcache/config">View config</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/status">Check status</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear">Clear cache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-apc">Clear APC cache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-memcache">Clear Memcache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-html-cache">Clear HTML cache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-template-cache">Clear template cache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-data-cache">Clear data cache</a> &nbsp; ';

        echo '<br/> <br/><a href="'.APPLICATION_URL.'/opcache/test-apc">Test APC</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/test-memcache">Test Memcache</a> &nbsp; ';

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

        if ($operation == 'clear-apc') {
            Cache::getHandler('apc')->clear();

            echo 'APC cache cleared';
        }

        if ($operation == 'clear-memcache') {
            Cache::getHandler('memcache')->clear();

            echo 'Memcache cleared';
        }

        if ($operation == 'clear-html-cache') {
            $dirs  = glob(CACHE_DIR.'/html/*', GLOB_ONLYDIR);

            foreach ($dirs as $dir) {
                array_map('unlink', glob($dir.'/*'));
            }

            echo 'HTML cache cleared';
        }

        if ($operation == 'clear-template-cache') {
            array_map('unlink', glob(CACHE_DIR.'/templates/*'));

            echo 'Template cache cleared';
        }

        if ($operation == 'clear-data-cache') {
            array_map('unlink', glob(CACHE_DIR.'/data/*'));

            echo 'Data cache cleared';
        }

        if ($operation == 'test-apc') {
			Cache::apc()->set('test-apc', 'hello');

			$ok = Cache::apc()->get('test-apc') == 'hello';

            if ($ok) {
                echo 'APC cache working';
            }
        }

        if ($operation == 'test-memcache') {
			Cache::memcache()->set('test-memcache', 'hello2');

			$ok = Cache::memcache()->get('test-memcache') == 'hello2';

            if ($ok) {
                echo 'Memcache working';
            }
        }
    }
}
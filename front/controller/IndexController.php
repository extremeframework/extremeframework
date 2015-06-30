<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class IndexController {
    function indexAction() {
        $pageid = get_theme_option('home-page', '', false);

        if ($pageid) {
            return application_route(APPLICATION_URL.'/page/view/'.$pageid);
        }

        $url = get_theme_option('home-url');

        if (preg_match('/$(http|https|www)/i', $url)) {
            header('Location:'.$url);
        } else {
            header('Location:'.APPLICATION_URL.'/'.$url);
        }
    }
}
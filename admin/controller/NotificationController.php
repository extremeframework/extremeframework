<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exxit();

class NotificationController extends __AppController {
    function changeLogAction() {
        AuthenticationController::authenticate();

        $file = CACHE_DIR.'/data/changelog';

        $data = is_file($file)? unserialize(file_get_contents($file)) : array();

        $this->json_response($data);
    }
}
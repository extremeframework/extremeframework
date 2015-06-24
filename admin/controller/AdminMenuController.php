<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminMenuController extends _AdminMenuController
{
    function changeAction() {
        list($id) = explode('/', $_REQUEST['args']);

        $auth = new AuthenticationController();

        $auth->loadMenu($id);

        Framework::redirect(APPLICATION_URL);
    }
}
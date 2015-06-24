<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class IndexController extends __AppController {
    function __construct() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck();
    }

	function indexAction() {
	    if (!ContextStack::isEmpty() && count($_REQUEST) == 1) {
	        ContextStack::back(0);
        }

		if (empty($_REQUEST['p'])) {
		    ContextStack::reset();
	        ContextStack::register(APPLICATION_URL);
		}

        $iddashboard = isset($_SESSION['user']->preferences->ID_DASHBOARD)? $_SESSION['user']->preferences->ID_DASHBOARD : '';

        if (!empty($iddashboard)) {
            $handler = new DashboardController();

            $handler->_display($iddashboard, false);
        } else {
    		$smarty = Framework::getSmarty();
    		$smarty->assign('module', 'index');
    		$smarty->display('index.tpl');
        }
	}
}
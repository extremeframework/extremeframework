<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class IndexController extends __AppController {
	function indexAction() {
		if (empty($_GET['p'])) {
		    if (!ContextStack::isEmpty()) {
		        ContextStack::back(0);
		    } else {
    		    ContextStack::reset();
    	        ContextStack::register(APPLICATION_URL);
            }
		}

        // x. Support admin pages
        $slug = $_REQUEST['args'];

        if (!empty($slug) && Framework::hasModule('AdminPage')) {
            $model = new AdminPageModel();

            $model->SLUG = $slug;
            $model->find();

            if ($model->fetch()) {
        		$smarty = Framework::getSmarty(__FILE__);
        		$smarty->assign('page', $model);
        		$smarty->display('page.tpl');
        		return;
    		}
        }

        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck();

        $iddashboard = isset($_SESSION['user']->preferences->ID_DASHBOARD)? $_SESSION['user']->preferences->ID_DASHBOARD : '';

        if (!empty($iddashboard)) {
            $handler = new DashboardController();

            $handler->_display($iddashboard, false);
        } else {
    		$smarty = Framework::getSmarty(__FILE__);
    		$smarty->assign('module', 'index');
    		$smarty->display('index.tpl');
        }
	}
}
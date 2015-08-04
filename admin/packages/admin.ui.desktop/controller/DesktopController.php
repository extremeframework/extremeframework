<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class DesktopController extends __AppController {
	function indexAction() {
        AuthenticationController::authenticate();

	    ContextStack::register(APPLICATION_URL.'/desktop/');

        // x. Get user installed packages
        $model = new UserPackageModel();

        $model->ID_USER = $_SESSION['user']->ID;

        $model->joinAdd(new AdminPackageModel());

        $model->find();

        $packages = array();

        while ($model->fetch()) {
            $packages[] = clone $model;
        }

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('packages', $packages);
		$this->display($smarty, 'desktop.tpl');
	}

	function packageAction() {
        AuthenticationController::authenticate();

        list($packageuuid) = explode('/', $_REQUEST['args']);

        if (empty($packageuuid)) {
            $this->pagenotfound();
        }

	    ContextStack::register(APPLICATION_URL.'/desktop/package/'.$packageuuid);

        // x. Get package
        $package = new AdminPackageModel();

        $package->UUID = $packageuuid;

        $package->find();

        if (!$package->fetch()) {
            $this->pagenotfound();
        }

        // x. Get package shortcuts
        $model = new AdminPackageShortcutModel();

        $model->ID_ADMIN_PACKAGE = $package->id();

        $model->find();

        $shortcuts = array();

        while ($model->fetch()) {
            $shortcuts[] = clone $model;
        }

        if (empty($shortcuts) && !empty($package->ENTRY_PATH)) {
            application_route(APPLICATION_URL.'/'.$package->ENTRY_PATH);
        } else {
    		$smarty = Framework::getSmarty(__FILE__);

    		$smarty->assign('package', $package);
    		$smarty->assign('shortcuts', $shortcuts);

    		$this->display($smarty, 'package-home.tpl');
        }
	}
}
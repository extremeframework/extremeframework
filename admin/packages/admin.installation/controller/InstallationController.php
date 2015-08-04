<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class InstallationController extends __AppController
{
    var $module = 'installation';
    var $type = 'controller';

    function indexAction($type = '') {
        AuthenticationController::authenticate();

        AclController::checkPermission('installation', '');

        if ($type == 'package') {
            $this->packageAction();
        } else if ($type == 'plugin') {
            $this->pluginAction();
        } else if ($type == 'theme') {
            $this->themeAction();
        } else {
    		$messages = $this->getMessages();

    		$smarty = Framework::getSmarty(__FILE__);

    		$smarty->assign('messages', $messages);

    		$smarty->display('install.tpl');
        }
    }

    function packageAction($type = 'package') {
        AuthenticationController::authenticate();

        AclController::checkPermission('installation', $type);

		$messages = $this->getMessages();

		$smarty = Framework::getSmarty(__FILE__);

		$smarty->assign('messages', $messages);
		$smarty->assign('type', $type);

		$smarty->display('install.package.tpl');
    }

    function pluginAction() {
		$this->packageAction('plugin');
    }

    function themeAction() {
		$this->packageAction('theme');
    }

    function installAction() {
        AuthenticationController::authenticate();

        AclController::checkPermission('installation', '');

        $type = RequestHelper::get('type');

        if (isset($_FILES['installation_file'])) {
        	if (!$_FILES['installation_file']['error']) {
	            $filepath = $_FILES['installation_file']['tmp_name'];

                $error = $this->performInstall($filepath, $type);

	            if (!empty($error)) {
	                $this->setMessages(array($error));
	        		$this->indexAction($type);
	            } else {
	                $this->setMessages(array("Installation completed"));
	        		$this->indexAction($type);
	            }
            }
        } else {
            $this->indexAction($type);
        }
    }

    function performInstall($filepath, $type) {
        if (!in_array($type, array('package', 'theme', 'plugin'))) {
            return "Unknown installation type";
        }

        switch ($type) {
            case 'package':
                $installer = new PackageInstaller();

                $installer->install($filepath, $error);

                return $error;

            case 'theme':
                $installer = new ThemeInstaller();

                $installer->install($filepath, $error);

                return $error;

            case 'plugin':
                $installer = new PluginInstaller();

                $installer->install($filepath, $error);

                return $error;

            default:
                return "Unknown installation type";
        }
    }

    function userPackagesAction() {
        AuthenticationController::authenticate();

        list($uuid) = explode('/', $_REQUEST['args']);

        // x. Install a requested package
        if (!empty($uuid)) {
            $model = new AdminPackageModel();

            $model->UUID = $uuid;

            $model->find();

            if ($model->fetch()) {
                // x. Add user package
                $up = new UserPackageModel();

                $up->ID_USER = $_SESSION['user']->ID;
                $up->ID_ADMIN_PACKAGE = $model->id();
                $up->INSTALLATION_DATE = date('Y-m-d H:i:s');

                $up->insert();

                // x. Get package permission sets
                $app = new AdminPackagePermissionModel();

                $app->ID_ADMIN_PACKAGE = $model->id();

                $app->find();

                $permission_set_ids = array();

                while ($app->fetch()) {
                    $permission_set_ids[] = $app->ID_PERMISSION_SET;
                }

                // x. Add custom access rights
                foreach ($permission_set_ids as $permission_set_id) {
                    $car = new CustomAccessRightModel();

                    $car->ID_USER = $_SESSION['user']->ID;
                    $car->ID_PERMISSION_SET = $permission_set_id;

                    $car->insert();
                }
            }
        }

        // x. Get available packages
        $model = new AdminPackageModel();

        $model->find();

        $packages = array();

        while ($model->fetch()) {
            $packages[] = clone $model;
        }

        // x. Get user's installed packages
        $model = new UserPackageModel();

        $model->ID_USER = $_SESSION['user']->ID;

        $model->find();

        $user_installed_package_ids = array();

        while ($model->fetch()) {
            $user_installed_package_ids[$model->ID_ADMIN_PACKAGE] = 1;
        }

        // x. Display
		$messages = $this->getMessages();

		$smarty = Framework::getSmarty(__FILE__);

		$smarty->assign('messages', $messages);
		$smarty->assign('packages', $packages);
		$smarty->assign('user_installed_package_ids', $user_installed_package_ids);

		$smarty->display('install.user-packages.tpl');
    }
}
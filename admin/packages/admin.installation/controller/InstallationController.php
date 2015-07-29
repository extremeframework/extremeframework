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
}
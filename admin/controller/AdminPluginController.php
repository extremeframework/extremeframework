<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminPluginController extends _AdminPluginController
{
    function uploadAction() {
        // x. Ensure additional data
        $this->ensure_additional_data(
            'Upload a Plugin',
            'PLUGIN_PACKAGE_ZIP',
            'PLUGIN_PACKAGE_ZIP',
            array(
                'Install' => APPLICATION_URL.'/adminplugin/upload'
            ),
            $formdata,
            array(
                'PLUGIN_PACKAGE_ZIP' => new ColumnSettings('file', 'Plugin package file (.zip)', 'plugin-package-zip')
            )
        );

        if ($formdata['PLUGIN_PACKAGE_ZIP']['error'] == 1) {
            die("File upload failed");
        }

        // x. Package file
        $tmp_name = $formdata['PLUGIN_PACKAGE_ZIP']['tmp_name'];
    	$name = $formdata['PLUGIN_PACKAGE_ZIP']['name'];

        // x. Installation
        $installer = new PluginInstaller();

        $package = $installer->get_temp_dir().'/'.basename($name);

        if (move_uploaded_file($tmp_name, $package)) {
            $installer->install($package, $error);
        } else {
            $error = "Cannot move uploaded file to $package";
        }

        if (!empty($error)) {
            echo('ERROR: '.$error);
        } else {
            $this->syncAction();
        }
    }

    function syncAction() {
        PluginManager::sync_plugins();

        ContextStack::back(0);
    }

    function activateAction() {
		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $model = new AdminPluginModel();

            $model->ID = $id;
            $model->IS_ENABLED = 1;

            $model->update();
        }

        ContextStack::back(0);
    }

    function deactivateAction() {
		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $model = new AdminPluginModel();

            $model->ID = $id;
            $model->IS_ENABLED = 0;

            $model->update();
        }

        ContextStack::back(0);
    }
}
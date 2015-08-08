<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PackageInstaller extends BaseInstaller {
    function check_package_content($package_root, &$packagename) {
        // x. The package root should contain only one directory
        $files = array_diff(scandir($package_root), array('.', '..'));

        if (count($files) != 1) {
            return _t('Invalid package structure: all package content should be put in a single package directory');
        }

        $packagename = array_shift($files);

        $dir = $package_root.'/'.$packagename;

        if (!is_dir($dir)) {
            return _t('Invalid package structure: all package content should be put in a single package directory');
        }

        // x. Should have a autoload file
        if (!file_exists($dir.'/autoload.php')) {
            return _t("Invalid package structure :: it should contain an autoload file 'autoload.php'");
        }

        // x. Should have a 'package.php' file
        if (!file_exists($dir.'/install/package.php')) {
            return _t("Invalid package structure :: it should contain a meta file 'package.php' in the /install folder");
        }

        // x. Check package information
        $msg = $this->check_package_info($dir);
        if (!empty($msg)) {
            return $msg;
        }
    }

    function install_package_content($package_root, $packagename) {
        $dir = realpath(APPLICATION_DIR.'/../packages');

        if (!is_writable($dir)) {
            return "No permission: the directory $dir should be writable";
        }

        // x. Copy package files
        self::recursive_copy($package_root, $dir, true);

        $packagedir = $dir.'/'.$packagename;

        // x. Copy schema files
        if (is_dir($packagedir.'/schema')) {
            $schemadir = realpath(APPLICATION_DIR.'/../schema');

            if (!is_writable($schemadir)) {
                return "No permission: the directory $schemadir should be writable";
            }

            self::recursive_copy($packagedir.'/schema', $schemadir, true);
        }

        // x. Execute db script files
        if (file_exists($packagedir.'/install/database.sql')) {
            $error = $this->install_db_script($packagedir.'/install/database.sql');

            if (!empty($error)) {
                return $error;
            }

            // x. Sync language files
            AdminLanguageController::sync();
        }

        // x. Package info
        $info = $this->get_package_info($packagedir.'/install/package.php');

        // x. Copy package image
        if (!empty($info['image'])) {
            copy($packagedir.'/install/'.$info['image'], UPLOAD_DIR.'/'.$info['image']);
        }

        // x. Update package database
        $this->update_package_database($packagedir);
    }

    function update_package_database($packagedir) {
        // x. Package info
        $info = $this->get_package_info($packagedir.'/install/package.php');

        // x. Insert/update database
        $model = new AdminPackageModel();

        $model->CODE = $info['code'];

        $model->find();
        $model->fetch();

        $model->CODE = $info['code'];
        $model->NAME = $info['name'];
        $model->ID_PACKAGE_CATEGORY = $info['category'];
        if (empty($model->IMAGE)) {
            $model->IMAGE = $info['image'];
        }
        if (empty($model->DESCRIPTION)) {
            $model->DESCRIPTION = $info['description'];
        }
        $model->ENTRY_PATH = $info['entry_path'];
        $model->AUTHOR = $info['author'];
        $model->VERSION = $info['version'];
        $model->PACKAGE_URL = $info['package_url'];
        $model->AUTHOR_URL = $info['author_url'];
        $model->PACKAGE_PATH = $packagedir;

        if (!$model->ID) {
            $model->INSTALLATION_DATE = date('Y-m-d H:i:s');
            $model->insert();
        } else {
            $model->LASTEST_UPDATE = date('Y-m-d H:i:s');
            $model->update();
        }

        // x. Install package shortcuts
        if (isset($info['shortcuts']) && !empty($info['shortcuts'])) {
            $this->install_package_shortcuts($model, $packagedir, $info['shortcuts']);
        }

        // x. Install package permission sets
        if (isset($info['permissions']) && !empty($info['permissions'])) {
            $this->install_package_permission_sets($model, $info['permissions']);
        }

        // x. Install package menu
        if (isset($info['menu']) && !empty($info['menu'])) {
            $this->install_package_menu($model, $info['menu']);
        }
    }

    function check_package_info($packagedir) {
        // x. Get package information
        $info = $this->get_package_info($packagedir.'/install/package.php');

        // x. Check required information
        if (empty($info['name'])) {
            return _t("Package information missing :: package name not found (expected to be in /install/package.php)");
        }

        if (empty($info['code'])) {
            return _t("Package information missing :: package code not found (expected to be in /install/package.php)");
        }

        if (empty($info['entry_path'])) {
            return _t("Package information missing :: package entry path not found (expected to be in /install/package.php)");
        }

        if (!empty($info['image']) && !file_exists($packagedir.'/install/'.$info['image'])) {
            return sprintf(_t("Package information missing :: package image '%s' not found (expected to be in /install/)"), $info['image']);
        }

        // x. Check if package already installed
        $model = new AdminPackageModel();

        $model->CODE = $info['code'];

        $model->find();

        if ($model->fetch()) {
            if ($model->NAME != $info['name']) {
                return sprintf(_t("Package conflict :: there's already a package with the same code '%s' but different name '%s'"), $info['code'], $model->NAME);
            }

            if (!empty($model->ID_PACKAGE_CATEGORY) && !empty($info['category']) && $model->ID_PACKAGE_CATEGORY != $info['category']) {
                return sprintf(_t("Package conflict :: there's already a package '%s' with the same code '%s' but different category '%s'"), $model->NAME, $info['code'], $model->ID_ADMIN_PACKAGE_CATEGORY);
            }

            if (!empty($model->AUTHOR) && !empty($info['author']) && $model->AUTHOR != $info['author']) {
                return sprintf(_t("Package conflict :: there's already a package '%s' with the same code '%s' but different author '%s'"), $model->NAME, $info['code'], $model->AUTHOR);
            }
        }

        return null;
    }

    function install_package_shortcuts($model, $packagedir, $shortcuts) {
        foreach ($shortcuts as $shortcut) {
            // x. Copy image
            if (!empty($shortcut['image']) && file_exists($packagedir.'/install/'.$shortcut['image'])) {
                copy($packagedir.'/install/'.$shortcut['image'], UPLOAD_DIR.'/'.$shortcut['image']);
            }

            // x. Insert shortcut
            $apsm = new AdminPackageShortcutModel();

            $apsm->ID_ADMIN_PACKAGE = $model->id();
            $apsm->NAME = $shortcut['name'];
            $apsm->IMAGE = $shortcut['image'];
            $apsm->PATH = $shortcut['path'];

            $apsm->insert(false);
        }
    }

    function install_package_permission_sets($model, $permissionsets) {
        foreach ($permissionsets as $name => $permissions) {
            $this->install_package_permission_set($model, $name, $permissions);
        }
    }

    function install_package_permission_set($model, $name, $permissions) {
        // x. Create permission set
        $ps = new PermissionSetModel();

        $ps->NAME = 'Permission of '.$model->NAME.' :: '.$name;

        $ps->find();

        if (!$ps->fetch()) {
            $ps->insert();
        }

        // x. Create permission set item
        foreach ($permissions as $module => $actions) {
            $psi = new PermissionSetItemModel();

            $psi->ID_PERMISSION_SET = $ps->id();
            $psi->MODULE = $module;

            $psi->find();
            $psi->fetch();

            $psi->ACTIONS = $actions;

            if (!$psi->ID) {
                $psi->insert();
            } else {
                $psi->update();
            }
        }

        // x. Assign permission set to the package
        $apm = new AdminPackagePermissionModel();

        $apm->NAME = $name;
        $apm->ID_ADMIN_PACKAGE = $model->id();
        $apm->ID_PERMISSION_SET = $ps->id();

        $apm->insert(false);
    }

    function install_package_menu($model, $menu) {
        // x. Create admin menu
        $am = new AdminMenuModel();

        $am->NAME = $model->NAME.' Menu';

        $am->find();

        if (!$am->fetch()) {
            $am->insert();
        }

        // x. Create admin menu item
        $index_ids = array();

        foreach ($menu as $index => $settings) {
            $ami = new AdminMenuItemModel();

            $ami->NAME = $settings['name'];
            $ami->ID_ADMIN_MENU = $am->id();

            $ami->find();
            $ami->fetch();

            if (isset($settings['module']) && !empty($settings['module'])) {
                $ami->MODULE = $settings['module'];
            }

            if (isset($settings['path']) && !empty($settings['path'])) {
                $ami->PATH = $settings['path'];
            }

            if (isset($settings['parent']) && !empty($settings['parent'])) {
                $idx = $settings['parent'];

                if (isset($index_ids[$idx])) {
                    $ami->PARENT = $index_ids[$idx];
                }
            }

            $ami->ENABLE_TOP = true;

            if (!$ami->ID) {
                $ami->insert();
            } else {
                $ami->update();
            }

            $index_ids[$index] = $ami->id();
        }

        // x. Assign admin to the package
        $apm = new AdminPackageMenuModel();

        $apm->ID_ADMIN_PACKAGE = $model->id();
        $apm->ID_ADMIN_MENU = $am->id();

        $apm->insert(false);
    }

    function get_package_info($file) {
        $info = include $file;

        return $info;
    }
}
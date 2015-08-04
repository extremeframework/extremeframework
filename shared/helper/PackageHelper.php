<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PackageHelper {
    public static function getCurrentPackage() {
        $module = strtolower(Framework::get('controller'));

        if (!empty($module)) {
            $modulepackagemap = self::getModulePackageMap();

            return isset($modulepackagemap[$module])? (object) $modulepackagemap[$module] : null;
        }
    }

    private static function getModulePackageMap() {
        static $modulepackagemap = null;

        if ($modulepackagemap === null) {
            $file = APPLICATION_DIR.'/cache/data/modulepackagemap';

            if (file_exists($file)) {
                $modulepackagemap = unserialize(file_get_contents($file));
            } else {
                $model = new AdminModuleModel();

                $model->selectAdd('');
                $model->selectAdd('ADMIN_MODULE.MODULE, ADMIN_PACKAGE.CODE AS PACKAGE_CODE, ADMIN_PACKAGE.NAME AS PACKAGE_NAME, ADMIN_PACKAGE.UUID AS PACKAGE_UUID');

                $model->joinAdd(new AdminPackageModel());

                $model->find();

                $modulepackagemap = array();

                while ($model->fetch()) {
                    $modulepackagemap[$model->MODULE] = array('NAME' => $model->PACKAGE_NAME, 'CODE' => $model->PACKAGE_CODE, 'UUID' => $model->PACKAGE_UUID);
                }

                file_put_contents($file, serialize($modulepackagemap));
            }
        }

        return $modulepackagemap;
    }

    public static function getCurrentPackageMenu() {
        $module = strtolower(Framework::get('controller'));

        if (!empty($module)) {
            $modulepackagemap = self::getModulePackageMap();

            $packagecode = isset($modulepackagemap[$module])? $modulepackagemap[$module]['CODE'] : '';

            if (!empty($packagecode)) {
                // x. Get package menu
                $model = new AdminPackageMenuModel();

                $model->ID_ADMIN_PACKAGE = $packagecode;

                $model->find();

                if ($model->fetch()) {
                    $id_menu = $model->ID_ADMIN_MENU;

                    // x. Get menu structure
                    if (AdminMenuHelper::getMenuStructure($id_menu, $flatmenu, $menutree)) {
                        return $menutree;
                    }
                }
            }
        }

        return array();
    }
}
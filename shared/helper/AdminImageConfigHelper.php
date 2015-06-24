<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminImageConfigHelper {
    static function hasImageConfig($module, $column) {
        $config = AdminImageConfigHelper::_loadImageConfigs();

        return isset($config[$module][$column]);
    }

    static function getImageConfig($module, $column) {
        $config = AdminImageConfigHelper::_loadImageConfigs();

        return isset($config[$module][$column])? $config[$module][$column] : null;
    }

    static function _loadImageConfigs() {
        if (!Framework::hasModule('AdminImageConfig')) {
            return array();
        }

        if (!isset($_SESSION['system.imageconfig'])) {
            $model = new AdminImageConfigModel();

            $model->find();

            $config = array();

            while ($model->fetch()) {
                $config[$model->MODULE][$model->COLUMN] = array('width' => $model->WIDTH, 'height' => $model->HEIGHT);
            }

            $_SESSION['system.imageconfig'] = $config;
        }

        return $_SESSION['system.imageconfig'];
    }
}
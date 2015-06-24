<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class FieldHelper {
    static function getColumnTooltips($module) {
        if (!Framework::hasModule('Field')) {
            return array();
        }

        $key = 'system.fieldtooltips';

        // x. Load ALL custom fields in the system
        if (!CacheHelper::hasCache($key)) {
            $model = new FieldModel();

            $model->whereAdd("TOOLTIP IS NOT NULL AND TOOLTIP != ''");

            $model->find();

            $fieldtooltips = array();

            while ($model->fetch()) {
                $fieldtooltips[$model->MODULE][$model->COLUMN] = $model->TOOLTIP;
            }

            CacheHelper::setCache($key, $fieldtooltips);
        }

        $fieldtooltips = CacheHelper::getCache($key);

        return isset($fieldtooltips[$module])? $fieldtooltips[$module] : array();
    }

    static function getFieldDependencies($module) {
        if (!Framework::hasModule('FieldDependency')) {
            return array();
        }

        if (!isset($_SESSION['system.fieldependencies'])) {
    		$model = new FieldDependencyModel();
    		$model->find();

            $dependencies = array();

            while ($model->fetch()) {
                $model->SOURCE_VALUES = preg_split('/[\s,]+/', $model->SOURCE_VALUES, -1, PREG_SPLIT_NO_EMPTY);
                $model->DEPENDENCY_COLUMNS = preg_split('/[\s,]+/', $model->DEPENDENCY_COLUMNS, -1, PREG_SPLIT_NO_EMPTY);

            	$dependencies[$model->MODULE] = clone $model;
    		}

    		$_SESSION['system.fieldependencies'] = $dependencies;
        }

        return isset($_SESSION['system.fieldependencies'][$module])? $_SESSION['system.fieldependencies'][$module] : array();
    }
}
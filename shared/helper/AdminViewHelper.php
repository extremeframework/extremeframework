<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminViewHelper {
    static function getAdminViews($module, $screen) {
        if (!Framework::hasModule('AdminView')) {
            return array();
        }

        $key = 'system.adminviews';

        // x. Load ALL admin views in the system
        if (!Cache::has($key)) {
            $model = new AdminViewModel();

            $model->find();

            $adminviews = array();

            while ($model->fetch()) {
                $adminviews[$model->MODULE][$model->SCREEN][] = clone $model;
            }

            Cache::set($key, $adminviews);
        }

        $adminviews = Cache::get($key);

        return isset($adminviews[$module][$screen])? $adminviews[$module][$screen] : array();
    }

    static function getAdminView($module, $code) {
        if (!Framework::hasModule('AdminView')) {
            return null;
        }

        $model = new AdminViewModel();

        $model->MODULE = $module;
        $model->CODE = $code;

        $model->find();

        if ($model->fetch()) {
            return $model;
        }

        return null;
    }
}
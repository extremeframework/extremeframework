<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminActionHelper {
    static function getAdminActions($module, $screen) {
        if (!Framework::hasModule('AdminAction')) {
            return array();
        }

        $key = 'system.adminactions';

        if (!Cache::has($key)) {
            $model = new AdminActionModel();

    	    $model->find();

    	    $actions = array();

            while ($model->fetch()) {
                $actions[$model->MODULE][$model->SCREEN][] = clone $model;
            }

            Cache::set($key, $actions);
        }

        $actions = Cache::get($key);

        return isset($actions[$module][$screen])? $actions[$module][$screen] : array();
    }
}
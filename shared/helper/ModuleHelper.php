<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ModuleHelper {
    static function isCommentEnabled($module) {
        if (!class_exists('AdminModule')) {
            return false;
        }

        $key = 'system.settings.comments';

        // x. Load modules in the system
        if (!CacheHelper::hasCache($key)) {
            $model = new AdminModuleModel();

            $model->find();

            $modules = array();

            while ($model->fetch()) {
                $modules[$model->MODULE] = $model->IS_COMMENT_ENABLED;
            }

            CacheHelper::setCache($key, $modules);
        }

        $modules = CacheHelper::getCache($key);

        return isset($modules[$module])? $modules[$module] : false;
    }
}
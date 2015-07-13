<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ModuleHelper {
    static $modulemap = null;

    static function isCommentEnabled($module) {
        if (!class_exists('AdminModule')) {
            return false;
        }

        $key = 'system.settings.comments';

        // x. Load modules in the system
        if (!Cache::has($key)) {
            $model = new AdminModuleModel();

            $model->find();

            $modules = array();

            while ($model->fetch()) {
                $modules[$model->MODULE] = $model->IS_COMMENT_ENABLED;
            }

            Cache::set($key, $modules);
        }

        $modules = Cache::get($key);

        return isset($modules[$module])? $modules[$module] : false;
    }

    static function getModuleDependencies($module) {
        $modulemap = self::getModuleMap();

        return isset($modulemap[$module])? $modulemap[$module] : array();
    }

    static private function parseModuleMapFromSchema() {
        $files = glob(SCHEMA_DIR.'/*.links.ini');

        $dependencies = array();

        foreach ($files as $file) {
	        $ini = parse_ini_file($file, true);

            foreach ($ini as $table => $settings) {
                $module = self::getModuleName($table);

                foreach ($settings as $refcolumn => $refinfo) {
                    list($reftable) = explode(':', $refinfo);

                    $refmodule = self::getModuleName($reftable);

                    $dependencies[$refmodule][$module] = true;
                }
            }
        }

        foreach ($dependencies as $refmodule => $modules) {
            $dependencies[$refmodule] = array_keys($modules);
        }

        return $dependencies;
    }

    function getModuleName($table, $force_hyphenated = false) {
        $table = str_replace(TABLE_PREFIX, '', $table);

        if ($force_hyphenated) {
            $module = str_replace('_', '-', strtolower($table));
        } else {
            $module = str_replace('_', '', strtolower($table));
        }

        return $module;
    }

    private static function getModuleMap() {
        if (self::$modulemap === null) {
            $file = APPLICATION_DIR.'/cache/data/modulemap';

            if (file_exists($file)) {
                self::$modulemap = unserialize(file_get_contents($file));
            } else {
                self::$modulemap = self::parseModuleMapFromSchema();

                file_put_contents($file, serialize(self::$modulemap));
            }
        }

        return self::$modulemap;
    }
}
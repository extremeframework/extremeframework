<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

class NotificationHelper {
    /**
     * @changetype insert|update|delete
     */
    static function notifyChange($module, $changetype) {
        static $notifiedmodules = array();

        if (!isset($notifiedmodules[$module])) {
            // x. Clear html cache
            $modules = array_merge(array($module), self::getReferringModules($module));

            foreach ($modules as $m) {
                self::clearHtmlCaches($m);
            }

            // x. Update database change log
            self::updateDatabaseChangeLog($modules);

            $notifiedmodules[$module] = true;
        }

        // x. Update cache manifest file
        self::updateCacheManifestFile();
    }

    static function clearHtmlCaches($module) {
        $cachedir = APPLICATION_DIR.'/cache/html/'.$module;

        if (is_dir($cachedir)) {
            // Get related cache files
            $files = glob($cachedir."/*.html");

            // Delete files
            array_map('unlink', $files);
        }
    }

    static function notifyNewPackageInstalled() {
        // x. Clear all cached class paths and other similar data
        array_map('unlink', glob(CACHE_DIR.'/data/*'));

        // x. Notify changes for some modules
        self::notifyChange('desktop', '');
        self::notifyChange('installation', '');
    }

    static function notifyNewUserPackageInstalled() {
        // x. Notify changes for some modules
        self::notifyChange('desktop', '');
        self::notifyChange('installation', '');
    }

    static function clearDataCaches() {
        array_map('unlink', glob(CACHE_DIR.'/data/*'));
    }

    static function getReferringModules($module) {
        return ModuleHelper::getModuleDependencies($module);
    }

    static function updateCacheManifestFile() {
        static $updated = false;

        if (!$updated) {
            $manifestfile = APPLICATION_DIR.'/cache.manifest';

            if (is_file($manifestfile)) {
                $content = file_get_contents($manifestfile);

                $content = preg_replace('/# version [0-9]*/is', '# version '.time(), $content);

                file_put_contents($manifestfile, $content);
            }

            $updated = true;
        }
    }

    static function updateDatabaseChangeLog($modules) {
        $file = CACHE_DIR.'/data/changelog';

        $data = is_file($file)? unserialize(file_get_contents($file)) : array();

        $time = time();

        foreach ($modules as $module) {
            $data[$module] = $time;
        }

        file_put_contents($file, serialize($data));
    }
}
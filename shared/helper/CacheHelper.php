<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class CacheHelper {
    static function hasCache($key) {
        return isset($_SESSION['cache'][$key]);
    }

    static function setCache($key, $data) {
        $_SESSION['cache'][$key] = $data;
    }

    static function getCache($key) {
        return isset($_SESSION['cache'][$key])? $_SESSION['cache'][$key] : null;
    }

    static function clearCache($key) {
        if (isset($_SESSION['cache'][$key])) {
            unset($_SESSION['cache'][$key]);
        }
    }

    static function clearAll() {
        if (isset($_SESSION['cache'])) {
            unset($_SESSION['cache']);
        }
    }
}
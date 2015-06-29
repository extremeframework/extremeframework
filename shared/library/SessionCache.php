<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

class SessionCache {
    protected $context = 'cache';

    private function __construct($context) {
        $this->context = $context;
    }

    static function &getInstance($context = '') {
    	static $instances = array();

        if (!isset($instances[$context])) {
            $instances[$context] = new SessionCache($context);
        }

        return $instances[$context];
    }

    static function context($context) {
        return self::getInstance($context);
    }

    function set($key, $value, $seconds = 0) {
        $_SESSION[$this->context][$key] = $value;
    }

    function get($key) {
        return isset($_SESSION[$this->context][$key])? $_SESSION[$this->context][$key] : null;
    }

    function has($key) {
        return isset($_SESSION[$this->context][$key]);
    }

    function delete($key) {
        unset($_SESSION[$this->context][$key]);
    }

    function clear() {
        $_SESSION[$this->context] = array();
    }
}
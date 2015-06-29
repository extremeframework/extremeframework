<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

class ArrayCache {
    protected $storage = array();
    protected $context = 'cache';

    private function __construct($context) {
        $this->context = $context;
    }

    static function &getInstance($context = '') {
    	static $instances = array();

        if (!isset($instances[$context])) {
            $instances[$context] = new ArrayCache($context);
        }

        return $instances[$context];
    }

    static function context($context) {
        return self::getInstance($context);
    }

    function set($key, $value, $seconds = 0) {
        $this->storage[$this->context][$key] = $value;
    }

    function get($key) {
        return isset($this->storage[$this->context][$key])? $this->storage[$this->context][$key] : null;
    }

    function has($key) {
        return isset($this->storage[$this->context][$key]);
    }

    function delete($key) {
        unset($this->storage[$this->context][$key]);
    }

    function clear() {
        $this->storage[$this->context] = array();
    }
}
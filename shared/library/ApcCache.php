<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

class ApcCache {
    protected $context = 'cache';
    protected $apcu = false;

    private function __construct($context) {
        $this->context = $context;
        $this->apcu = function_exists('apcu_fetch');
    }

    static function &getInstance($context = '') {
    	static $instances = array();

        if (!isset($instances[$context])) {
            $instances[$context] = new ApcCache($context);
        }

        return $instances[$context];
    }

    static function context($context) {
        return self::getInstance($context);
    }

    function set($key, $value, $seconds = 0) {
        return $this->apcu ? apcu_store($this->context.$key, $value, $seconds) : apc_store($this->context.$key, $value, $seconds);
    }

    function get($key) {
        return $this->apcu ? apcu_fetch($this->context.$key) : apc_fetch($this->context.$key);
    }

    function has($key) {
        return $this->apcu ? apcu_exists($this->context.$key) : apc_exists($this->context.$key);
    }

    function delete($key) {
        return $this->apcu ? apcu_delete($this->context.$key) : apc_delete($this->context.$key);
    }

    function clear() {
        $this->apcu ? apcu_clear_cache() : apc_clear_cache('user');
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

class MemcacheCache {
    protected $context = 'cache';
    protected $settings = null;
    protected $memcache = null;

    private function __construct($settings, $context) {
        $host = isset($settings['host'])? $settings['host'] : '';
        $port = isset($settings['port'])? $settings['port'] : '';

        if (empty($host) || empty($port)) {
            die("[ERROR::cache] Memcache requires the following configuration options: 'host', 'port'");
        }

        $this->settings = $settings;
        $this->context = $context;

        $this->memcache = new Memcache();
        $this->memcache->connect($host, $port) or die ("[ERROR::cache] Could not connect to Memcache server ($host:$port)");
    }

    static function &getInstance($settings, $context = '') {
    	static $instances = array();

        if (!isset($instances[$context])) {
            $instances[$context] = new MemcacheCache($settings, $context);
        }

        return $instances[$context];
    }

    function context($context) {
        return self::getInstance($this->settings, $context);
    }

    function set($key, $value, $seconds = 0) {
        return $this->memcache->set($this->context.$key, $value, 0, $seconds);
    }

    function get($key) {
        return $this->memcache->get($this->context.$key);
    }

    function has($key) {
        return !!$this->memcache->get($this->context.$key);
    }

    function delete($key) {
        return $this->memcache->delete($this->context.$key);
    }

    function clear() {
        return $this->memcache->flush();
    }
}
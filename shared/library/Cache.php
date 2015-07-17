<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

require_once (dirname(__FILE__).'/ApcCache.php');
require_once (dirname(__FILE__).'/ArrayCache.php');
require_once (dirname(__FILE__).'/SessionCache.php');
require_once (dirname(__FILE__).'/MemcacheCache.php');

class Cache {
	private $handler = null;

    private function __construct() {
        $config = self::getConfig();

        $storename = isset($config['defaultstore'])? $config['defaultstore'] : 'array';

        $this->handler = self::getHandler($storename);
    }

    static function getConfig() {
        static $config = null;

        if ($config === null) {
            $config = include(CONFIG_DIR.'/cache.php');
        }

        return $config;
    }

    static function getStoreSettings($storename) {
        $config = self::getConfig();

        if (!isset($config['stores'][$storename])) {
            die("[ERROR::cache] Unknown store name '$storename'");
        }

        return $config['stores'][$storename];
    }

    static function &getInstance() {
    	static $instance = null;

        if ($instance === null) {
            $instance = new Cache();
        }

        return $instance;
    }

    static function &getHandler($storename) {
        $settings = self::getStoreSettings($storename);

        $driver = isset($settings['driver'])? $settings['driver'] : '';

        if (empty($driver)) {
            die("[ERROR::cache] Unknown driver for the store '$storename'");
        }

        switch ($driver) {
            case 'apc':
                return ApcCache::getInstance();

            case 'session':
                return SessionCache::getInstance();

            case 'array':
                return ArrayCache::getInstance();

            case 'memcache':
                return MemcacheCache::getInstance($settings);

            default:
                die("[ERROR::cache] Unknown driver type '$type'");
        }
    }

    static function handler($type) {
        return self::getHandler($type);
    }

    static function session() {
        return self::getHandler('session');
    }

    static function apc() {
        return self::getHandler('apc');
    }

    static function memcache() {
        return self::getHandler('memcache');
    }

    static function context($context) {
        $cache = self::getInstance();

        return $cache->handler->context($context);
    }

    static function set($key, $value, $seconds = 86400) {
        $cache = self::getInstance();

        return $cache->handler->set($key, $value, $seconds);
    }

    static function get($key) {
        $cache = self::getInstance();

        return $cache->handler->get($key);
    }

    static function has($key) {
        $cache = self::getInstance();

        return $cache->handler->has($key);
    }

    static function delete($key) {
        $cache = self::getInstance();

        return $cache->handler->delete($key);
    }

    static function clear() {
        $cache = self::getInstance();

        return $cache->handler->clear();
    }
}
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

class Cache {
	private $handler = null;

    private function __construct() {
        $config = include(CONFIG_DIR.'/cache.php');

        $type = isset($config['type'])? $config['type'] : 'array';

        $this->handler = self::getHandler($type);
    }

    static function &getInstance() {
    	static $instance = null;

        if ($instance === null) {
            $instance = new Cache();
        }

        return $instance;
    }

    static function &getHandler($type) {
        switch ($type) {
            case 'apc':
                return ApcCache::getInstance();

            case 'session':
                return SessionCache::getInstance();

            case 'array':
                return ArrayCache::getInstance();

            default:
                die("[ERROR] Unknown cache type '$type'");
        }
    }

    static function handler($type) {
        return self::getHandler($type);
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
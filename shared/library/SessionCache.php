<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

class SessionCache {
    protected $context = 'cache';
    protected $tmp = array();

    private function __construct($context) {
        $this->context = $context;
    }

    private function &getStorage() {
        // Temporarily use an array in case of no session
        if (session_id() == '') {
            return $this->tmp;
        } else {
            // Copy the temporary array to session and discard it
            if (!empty($this->tmp)) {
                foreach ($this->tmp as $key => $value) {
                    $_SESSION[$key] = $value;
                }
                $this->tmp = array();
            }

            return $_SESSION;
        }
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
        $storage =& $this->getStorage();

        $storage[$this->context][$key] = $value;
    }

    function get($key) {
        $storage =& $this->getStorage();

        return isset($storage[$this->context][$key])? $storage[$this->context][$key] : null;
    }

    function has($key) {
        $storage =& $this->getStorage();

        return isset($storage[$this->context][$key]);
    }

    function delete($key) {
        $storage =& $this->getStorage();

        unset($storage[$this->context][$key]);
    }

    function clear() {
        $storage =& $this->getStorage();

        $storage[$this->context] = array();
    }
}
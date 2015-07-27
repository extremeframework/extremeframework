<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class RefSelectHelper {
    static $callbacks = array();

	/**
	 * Register options source for a refselect element
	 *
	 * @param $names An array of refselect elements' names
	 * @param $callback A callback function to return options string
	 *        (e.g <option>Hello</option><option>World</option>)
	 */
    public static function registerOptionsSource($names, $callback) {
        if (!is_array($names)) {
            $names = array($names);
        }

        foreach ($names as $name) {
            self::$callbacks[$name] = $callback;
        }
    }

	/**
	 * Get options source of a refselect element
	 *
	 * @param $name Name of the refselect element
	 */
    public static function getOptionsSource($name) {
        return isset(self::$callbacks[$name])? self::$callbacks[$name] : null;
    }
}
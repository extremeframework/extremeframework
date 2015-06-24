<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

/*/////////////////////////////////////////////////////////////////////
// Examples:

// Callback style
Route::register('blog/{year|[0-9]+}/{month|[0-9]+}/{slug|.*}', function($params) {
    return 'post/view/'.$params['slug'];
});

// String style
Route::register('blog/{year|[0-9]+}/{month|[0-9]+}/{slug|.*}', '/post/view/{slug}');

// Register controller names
Route::registerControllerNames(array(
    'user' => 'User',
    'usergroup' => 'UserGroup'
));

/////////////////////////////////////////////////////////////////////*/

class Route {
    static $cache = array();
    static $controllers = array();
    static $rewrites = array();

    static function register($uri_pattern, $callback_or_string, $method = '') {
        if (!self::is_valid_pattern($uri_pattern)) {
            die("<div style=\"color:orange\">[Routing] Invalid routing pattern '$uri_pattern'");
        }

        self::$cache[] = array('uri_pattern' => $uri_pattern, 'handler' => $callback_or_string, 'method' => $method);
    }

    static function registerControllerNames($mappings) {
        foreach ($mappings as $key => $name) {
            self::$controllers[$key] = $name;
        }
    }

    static function translateControllerName($key) {
        return isset(self::$controllers[$key])? self::$controllers[$key] : $key;
    }

    static function registerUrlRewriteType($type, $callback) {
        if (!is_callable($callback)) {
            die("<div style=\"color:orange\">[Routing] Invalid rewrite handler for the type '$type'");
        }

        self::$rewrites[$type] = $callback;
    }

    static function getFriendlyUrl() {
        // Parse arguments
        $args = func_get_args();

        // Rewrite type
        $type = array_shift($args);

        // Callback
        $callback = isset(self::$rewrites[$type])? self::$rewrites[$type] : '';

        if (empty($callback)) {
            die("<div style=\"color:orange\">[Routing] No rewrite handler for the type '$type'");
        }

        return call_user_func_array($callback, $args);
    }

    static function translate($uri) {
        static $matched_patterns = array();

        $request_method = isset($_SERVER['REQUEST_METHOD'])? $_SERVER['REQUEST_METHOD'] : '';

        $translation = '';

        foreach (self::$cache as $settings) {
            $uri_pattern = $settings['uri_pattern'];
            $handler = $settings['handler'];
            $method = $settings['method'];

            // Checked or not
            if (isset($matched_patterns[$uri_pattern])) {
                continue;
            }

            // Method mismatched
            if (!empty($method) && $method != $request_method) {
                continue;
            }

            // Pattern matching
            if (self::match($uri_pattern, $uri, $params)) {
                $matched_patterns[$uri_pattern] = true;

                if (is_callable($handler)) {
                    $translation = call_user_func($handler, $params);
                } else {
                    $translation = $handler;

                    foreach ($params as $name => $value) {
                        $translation = str_replace('{'.$name.'}', $value, $translation);
                    }
                }
            }

            // Translation found
            if (!empty($translation)) {
                // Try recursive translation
                $translation2 = self::translate($translation);

                if (!empty($translation2)) {
                    $translation = $translation2;
                }

                break;
            }
        }

        return !empty($translation)? $translation : $uri;
    }

    static function match($uri_pattern, $uri, &$params) {
        $params = array();

        // Regex and names
        $regex = self::get_regex($uri_pattern, $names);

        // Matching
        if (preg_match($regex, $uri, $matches)) {
            foreach ($names as $i => $name) {
                $params[$name] = $matches[$i + 1];
            }

            return true;
        }

        return false;
    }

    static function get_regex($uri_pattern, &$names) {
        $names = array();

        $regex = $uri_pattern;

        if (preg_match_all('/\{([a-z0-9_]+)\|?([^\}]*)\}/i', $uri_pattern, $matches, PREG_PATTERN_ORDER)) {
            $segments = $matches[0];
            $names = $matches[1];
            $patterns = $matches[2];

            foreach ($segments as $i => $segment) {
                $regex = str_replace($segment, '('.$patterns[$i].')', $regex);
            }
        }

        $regex = '/'.str_replace('/', '\\/', $regex).'/iU';

        return $regex;
    }

    static function is_valid_pattern($uri_pattern) {
        $regex = self::get_regex($uri_pattern, $names);

        return @preg_match($regex, null) !== false;
    }
}
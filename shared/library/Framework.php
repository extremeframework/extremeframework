<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

class Framework {
    static $cache = null;

    static function register($key, $value) {
        if (self::$cache === null) {
            self::$cache = array();
        }

        self::$cache[$key] = $value;
    }

    static function get($key) {
        if (self::$cache === null) {
            self::$cache = array();
        }

        return isset(self::$cache[$key])? self::$cache[$key] : null;
    }

    static function getSmarty($__FILE__) {
        $smarty = self::get('smarty');

        if ($smarty === null) {
            $smarty = new SmartyBC();

            $smarty->left_delimiter     = LEFT_DELIMITER;
            $smarty->right_delimiter    = RIGHT_DELIMITER;
            $smarty->caching            = false;
            $smarty->cache_lifetime     = 3600;
            $smarty->compile_dir        = TEMPLATE_C_DIR;
            $smarty->config_dir         = TEMPLATE_DIR;
            $smarty->config_overwrite   = true;
            $smarty->error_reporting    = E_ALL & ~E_NOTICE & ~E_STRICT;

            $my_security_policy = new Smarty_Security($smarty);
            $my_security_policy->allow_php_tag = true;
            $my_security_policy->php_functions = array();
            $my_security_policy->php_handling = Smarty::PHP_PASSTHRU;
            $my_security_policy->php_modifiers = array('substr', 'strtolower', 'strtoupper', 'ucwords', 'count', 'uniqid', 'htmlspecialchars', 'number_format', 'microtime', 'basename', 'urlencode', 'trim');
            $my_security_policy->modifiers = array();

            $smarty->enableSecurity($my_security_policy);

            self::register('smarty', $smarty);
        }

        $smarty->setTemplateDir(null);

        $templatedirs = self::getTemplateDirs($__FILE__);

        foreach ($templatedirs as $templatedir) {
            $smarty->addTemplateDir($templatedir);
        }

        $smarty->addTemplateDir(TEMPLATE_DIR.'/overriding');
        $smarty->addTemplateDir(TEMPLATE_DIR);

        return $smarty;
    }

    private static function getCacheContextKey() {
        return APPLICATION_NAME.'::Framework';
    }

    static function registerTemplateDir($directory, $packageroot = '') {
        if (!is_dir($directory)) {
            return;
        }

        $cache = Cache::context(self::getCacheContextKey());

        $templatedirs = $cache->get('templatedirs');

        if (!isset($templatedirs[$packageroot])) {
            $templatedirs[$packageroot][] = $directory;

            if (is_dir($directory.'/overriding')) {
                $templatedirs[$packageroot][] = $directory.'/overriding';
            }

            $cache->set('templatedirs', $templatedirs);
        }
    }

    private static function getTemplateDirs($__FILE__) {
        $filedir = dirname($__FILE__);

        $cache = Cache::context(self::getCacheContextKey());

        $templatedirs = $cache->get('templatedirs');

        foreach ($templatedirs as $packageroot => $dirs) {
            if (stripos($filedir, $packageroot) !== false) {
                return $dirs;
            }
        }

        return array();
    }

    static function registerClassSearchDir($classdir, $namespace = '') {
        // Cache context
        $cache = Cache::context(self::getCacheContextKey());

        // Get cache data
        $registered = $cache->get('registered');
        $classpaths = $cache->get('classpaths');

        // If not registered
        if (!isset($registered[$classdir])) {

            // Sub-directories to search
            $subdirs = array('controller', 'table', 'model', 'helper', 'library', 'module', 'api');

            foreach ($subdirs as $subdir) {
                $searchdir = $classdir.'/'.$subdir;

                if (is_dir($searchdir)) {
                    $files = glob("$searchdir/*.php");

                    foreach ($files as $path) {
                        $classname = basename($path, '.php');

                        if ($subdir == 'table') {
                            $classname = 'DataObject_'.$classname;
                        }

                        if (!isset($classpaths[$classname])) {
                             $classpaths[strtolower($classname)] = $path;
                        }
                    }
                }
            }

            $registered[$classdir] = true;

            $cache->set('registered', $registered);
            $cache->set('classpaths', $classpaths);
        }

        // Register autoload function
        self::registerAutoloadFunction();
    }

    private static function registerAutoloadFunction() {
        static $registered = false;

        if (!$registered) {
            $registered = true;

            spl_autoload_register(function($classname) {
                $classname = strtolower($classname);

                // Cache context
                $cache = Cache::context(self::getCacheContextKey());

                // Get cache data
                $classpaths = $cache->get('classpaths');

                // Resolve class
                if (isset($classpaths[$classname])) {
                    require_once($classpaths[$classname]);
                }
            });
        }
    }

    private function getObfuscatedFileName($path) {
        $path_parts = pathinfo($path);

        $dir = $path_parts['dirname'];
        $extension = $path_parts['extension'];
        $file = $path_parts['filename'];

        $newfile = md5($file);

        return $dir.'/'.$newfile.(!empty($extension)? '.'.$extension : '');
    }

    static function loadPackages($packagesdir) {
        if (is_dir($packagesdir)) {
            $packages = include ($packagesdir.'/packages.php');

            if (!empty($packages)) {
                foreach ($packages as $package) {
                    if (!is_dir($packagesdir.'/'.$package)) {
                        die("<div style=\"color:orange\">[ERROR] Package '$package' is not found.</div>");
                    } else {
                        require ($packagesdir.'/'.$package.'/autoload.php');
                    }
                }
            } else {
                $dirs = glob($packagesdir.'/*', GLOB_ONLYDIR|GLOB_NOSORT);

                foreach ($dirs as $dir) {
                    include ($dir.'/autoload.php');
                }
            }
        }
    }

    static function hasModule($name) {
        $cache = Cache::context(self::getCacheContextKey().'::modules');

        if (!$cache->has($name)) {
            $cache->set($name, class_exists($name.'Model'), 86400);
        }

        return $cache->get($name);
    }

	static public function redirect($url) {
		header("Location:".$url);
		exit();
	}

    static public function getActionName($action) {
        return lcfirst(str_replace(' ', '', ucwords(str_replace('-', ' ', $action)))).'Action';
    }

    static public function getControllerName($controller) {
        return str_replace(' ', '', ucwords(str_replace('-', ' ', $controller))).'Controller';
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

class Framework {
    static $cache = null;
    static $classmap = null;
    static $templatemap = null;
    static $autoloadmap = null;

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
        $templatemap = self::getTemplateMap();

        if (!isset($templatemap[$packageroot])) {
            $dirs = array();

            if (is_dir($directory)) {
                if (is_dir($directory.'/overriding')) {
                    $dirs[] = $directory.'/overriding';
                }

                $dirs[] = $directory;
            }

            $templatemap[$packageroot] = $dirs;

            self::updateTemplateMap($templatemap);
        }
    }

    private static function getTemplateDirs($__FILE__) {
        $filedir = dirname($__FILE__);

        $templatemap = self::getTemplateMap();

        foreach ($templatemap as $packageroot => $dirs) {
            if (preg_match('/^'.preg_quote($packageroot).'[\/\\\]{1}/i', $filedir)) {
                return $dirs;
            }
        }

        return array();
    }

    private static function getTemplateMap() {
        if (self::$templatemap === null) {
            $file = APPLICATION_DIR.'/cache/data/theme.'.THEME_NAME.'.templatemap';

            if (file_exists($file)) {
                self::$templatemap = unserialize(file_get_contents($file));
            } else {
                self::$templatemap = array();
            }
        }

        return self::$templatemap;
    }

    private static function updateTemplateMap($templatemap) {
        self::$templatemap = $templatemap;

        $file = APPLICATION_DIR.'/cache/data/theme.'.THEME_NAME.'.templatemap';

        file_put_contents($file, serialize($templatemap));
    }

    static function registerClassSearchDir($classdir, $namespace = '') {
        $classmap = self::getClassMap();

        // If not registered
        if (!isset($classmap['registered'][$classdir])) {

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

                        $classname = strtolower($classname);

                        if (!isset($classmap['classpaths'][$classname])) {
                             $classmap['classpaths'][$classname] = $path;
                        }
                    }
                }
            }

            $classmap['registered'][$classdir] = true;

            // Sync classmap
            self::updateClassMap($classmap);
        }

        // Register autoload function
        self::registerAutoloadFunction();
    }

    private static function registerAutoloadFunction() {
        static $registered = false;

        if (!$registered) {
            $registered = true;

            spl_autoload_register(function($classname) {
                $classpath = self::getClassPath($classname);

                if (!empty($classpath)) {
                    require ($classpath);
                }
            });
        }
    }

    private static function getClassMap() {
        if (self::$classmap === null) {
            $file = APPLICATION_DIR.'/cache/data/theme.'.THEME_NAME.'.classmap';

            if (file_exists($file)) {
                self::$classmap = unserialize(file_get_contents($file));
            } else {
                self::$classmap = array();
            }
        }

        return self::$classmap;
    }

    private static function updateClassMap($classmap) {
        self::$classmap = $classmap;

        $file = APPLICATION_DIR.'/cache/data/theme.'.THEME_NAME.'.classmap';

        file_put_contents($file, serialize($classmap));
    }

    private static function getClassPath($classname) {
        $classmap = self::getClassMap();

        $classname = strtolower($classname);

        return isset($classmap['classpaths'][$classname])? $classmap['classpaths'][$classname] : '';
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
        $autoloadmap = self::getAutoloadMap();

        if (!isset($autoloadmap[$packagesdir])) {
            $autoloads = array();

            if (is_dir($packagesdir)) {
                $packages = include ($packagesdir.'/packages.php');

                if (!empty($packages)) {
                    foreach ($packages as $package) {
                        if (!is_dir($packagesdir.'/'.$package)) {
                            die("<div style=\"color:orange\">[ERROR] Package '$package' is not found.</div>");
                        } else {
                            $autoloads[] = $packagesdir.'/'.$package.'/autoload.php';
                        }
                    }
                } else {
                    $dirs = glob($packagesdir.'/*', GLOB_ONLYDIR|GLOB_NOSORT);

                    foreach ($dirs as $dir) {
                        $autoloads[] = $dir.'/autoload.php';
                    }
                }
            }

            $autoloadmap[$packagesdir] = $autoloads;

            self::updateAutoloadMap($autoloadmap);
        }

        $autoloads = $autoloadmap[$packagesdir];

        foreach ($autoloads as $autoload) {
            include ($autoload);
        }
    }

    private static function getAutoloadMap() {
        if (self::$autoloadmap === null) {
            $file = APPLICATION_DIR.'/cache/data/theme.'.THEME_NAME.'.autoloadmap';

            if (file_exists($file)) {
                self::$autoloadmap = unserialize(file_get_contents($file));
            } else {
                self::$autoloadmap = array();
            }
        }

        return self::$autoloadmap;
    }

    private static function updateAutoloadMap($autoloadmap) {
        self::$autoloadmap = $autoloadmap;

        $file = APPLICATION_DIR.'/cache/data/theme.'.THEME_NAME.'.autoloadmap';

        file_put_contents($file, serialize($autoloadmap));
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
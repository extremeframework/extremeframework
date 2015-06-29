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

    static function getSmarty() {
        $smarty = self::get('smarty');

        if ($smarty === null) {
            $smarty = new SmartyBC();

            $smarty->left_delimiter     = LEFT_DELIMITER;
            $smarty->right_delimiter    = RIGHT_DELIMITER;
            $smarty->caching            = false;
            $smarty->cache_lifetime     = 3600;
            $smarty->setTemplateDir     (TEMPLATE_DIR.'/overriding');
            $smarty->addTemplateDir     (TEMPLATE_DIR);
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

        return $smarty;
    }

    static function registerTemplateDir($directory) {
        $smarty = self::getSmarty();

        $smarty->addTemplateDir($directory);
    }

    static function setCachedClassPath($classname, $cachedpath) {
        $cache = Cache::context('Framework::classpaths');

        $cache->set($classname, $cachedpath, 86400);
    }

    static function hasCachedClassPath($classname) {
        $cache = Cache::context('Framework::classpaths');

        return $cache->has($classname);
    }

    static function getCachedClassPath($classname) {
        $cache = Cache::context('Framework::classpaths');

        return $cache->get($classname);
    }

    static function registerClassSearchDir($searchdir, $namespace = '') {
        static $registered = array();

        if (isset($registered[$searchdir.'-'.$namespace])) {
            return;
        }

        $registered[$searchdir.'-'.$namespace] = true;

        spl_autoload_register(function($classname) use ($searchdir, $namespace) {
            if (!empty($namespace)) {
                $classname = preg_replace('/^'.preg_quote($namespace.'\\').'/i', '', $classname);
            }

            $cachedpath = '';

            if (self::hasCachedClassPath($classname)) {
                $cachedpath = self::getCachedClassPath($classname);
            } else {
                if (preg_match('/^DataObject_(.*)$/i', $classname, $matches)) {
                    $path = $searchdir."/table/".$matches[1].".php";
                } else if (preg_match('/(Controller)$/i', $classname)) {
                    $path = $searchdir."/controller/$classname.php";
                } else if (preg_match('/(Helper)$/i', $classname)) {
                    $path = $searchdir."/helper/$classname.php";
                } else if (preg_match('/Api$/i', $classname)) {
                    $path = $searchdir."/api/$classname.php";
                } else if (preg_match('/Model$/i', $classname)) {
                    $path = $searchdir."/model/$classname.php";
                } else if (preg_match('/(^Widget|Module$)/i', $classname)) {
                    $path = $searchdir."/module/$classname.php";
                } else {
                    $path = $searchdir."/library/$classname.php";
                }

                if (file_exists($path)) {
                    $cachedpath = $path;
                } else {
                    $path = self::getObfuscatedFileName($path);

                    if (file_exists($path)) {
                        $cachedpath = $path;
                    }
                }

                if (!empty($cachedpath)) {
                    self::setCachedClassPath($classname, $cachedpath);
                }
            }

            if (!empty($cachedpath)) {
                require_once($cachedpath);
            }
        });
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
        $cache = Cache::context('Framework::hasModule');

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
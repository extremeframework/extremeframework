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

    static function registerClassSearchDir($searchdir, $namespace = '') {
        spl_autoload_register(function($classname) use ($searchdir, $namespace) {
            if (!empty($namespace)) {
                $classname = preg_replace('/^'.preg_quote($namespace.'\\').'/i', '', $classname);
            }
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
                require_once($path);
            } else {
                $path = self::getObfuscatedFileName($path);

                if (file_exists($path)) {
                    require_once($path);
                }
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

    static function loadPackages($appdir) {
        $packagesdir = $appdir.'/packages';

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
        return class_exists($name.'Model');
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
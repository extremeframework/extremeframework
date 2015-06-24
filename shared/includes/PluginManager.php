<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PluginManager {
    public static $actions = array();
    public static $modifiers = array();

    public static function add_action($key, $function) {
        self::$actions[$key][] = array('function' => $function);
    }

    public static function do_action($key, $args = null) {
        $actions = isset(self::$actions[$key])? self::$actions[$key] : array();

        $args = func_get_args();
        array_shift($args);

        $output = '';

        foreach ($actions as $action) {
            $function = $action['function'];

            $output .= call_user_func_array($function, $args);
        }

        return trim($output);
    }

    public static function add_modifier($key, $function) {
        self::$modifiers[$key][] = array('function' => $function);
    }

    public static function do_modifier($key, $content, $args = null) {
        $modifiers = isset(self::$modifiers[$key])? self::$modifiers[$key] : array();

        $output = $content;

        foreach ($modifiers as $modifier) {
            $function = $modifier['function'];

            $output = call_user_func_array($function, array($output, $args));
        }

        return trim($output);
    }


    private static function parse_plugin_info($file) {
        $info = array();

        $infomap = array(
            'name' => 'Plugin Name',
            'author' => 'Author',
            'version' => 'Version',
            'description' => 'Description',
            'plugin_url' => 'Plugin URL',
            'author_url' => 'Author URL'
        );

        $content = file_get_contents($file);

        foreach ($infomap as $key => $label) {
            if (preg_match('/^[\s\*\/]*'.$label.'\s*:\s*(.*)$/im', $content, $match)) {
                $info[$key] = trim($match[1]);
            } else {
                $info[$key] = '';
            }
        }

        return $info;
    }

    public static function sync_plugins() {
        if (!Framework::hasModule('AdminPlugin')) {
            return;
        }

        $app_plugins = self::read_plugin_files(APPLICATION_DIR.'/plugins');
        $shared_plugins = self::read_plugin_files(SHARED_DIR.'/plugins');

        $plugins = array_merge($shared_plugins, $app_plugins);

        foreach ($plugins as $plugin_path => $file) {
            $info = self::parse_plugin_info($file);

            if (!empty($info['name'])) {
                $model = new AdminPluginModel();

                $model->PLUGIN_PATH = $plugin_path;

                $model->find();
                $model->fetch();

                $model->NAME = $info['name'];
                $model->AUTHOR = $info['author'];
                $model->VERSION = $info['version'];
                $model->DESCRIPTION = $info['description'];
                $model->PLUGIN_URL = $info['plugin_url'];
                $model->AUTHOR_URL = $info['author_url'];

                if (empty($model->REFID)) {
                    $model->REFID = AdminPluginController::nextRefid();
                }

                if ($model->ID) {
                    $model->update();
                } else {
                    $model->insert();
                }
            }
        }
    }

    private static function read_plugin_files($dir) {
    	$plugins = array();

    	if (!is_dir($dir) || ! $dh = opendir($dir)) {
    		return $plugins;
        }

    	while (($plugin = readdir($dh)) !== false) {
    	    if ($plugin != '.' && $plugin != '..') {
        		if (substr($plugin, -4) == '.php') {
        			$plugins[$plugin] = $dir.'/'.$plugin;
                } else {
                    if (is_dir($dir.'/'.$plugin) && file_exists($dir.'/'.$plugin.'/'.$plugin.'.php')) {
                        $plugins[$plugin.'/'.$plugin.'.php'] = $dir.'/'.$plugin.'/'.$plugin.'.php';
                    }
                }
            }
    	}

    	closedir( $dh );

    	return $plugins;
    }

    private static function get_plugins() {
        if (!Framework::hasModule('AdminPlugin')) {
            return array();
        }

        if (!isset($_SESSION['system.plugins'])) {
            $model = new AdminPluginModel();

            $model->IS_ENABLED = true;

            $model->orderBy('ORDERING ASC');

            $model->find();

            $plugins = array();

            while ($model->fetch()) {
                if (file_exists(APPLICATION_DIR.'/plugins/'.$model->PLUGIN_PATH)) {
                    $plugins[] = APPLICATION_DIR.'/plugins/'.$model->PLUGIN_PATH;
                } else if (file_exists(SHARED_DIR.'/plugins/'.$model->PLUGIN_PATH)) {
                    $plugins[] = SHARED_DIR.'/plugins/'.$model->PLUGIN_PATH;
                }
            }

            $_SESSION['system.plugins'] = $plugins;
        }

    	return isset($_SESSION['system.plugins'])? $_SESSION['system.plugins'] : array();
    }

    public static function load_plugins() {
        $plugins = self::get_plugins();

        foreach ($plugins as $path) {
            if (file_exists($path)) {
                include_once($path);
            }
        }
    }
}
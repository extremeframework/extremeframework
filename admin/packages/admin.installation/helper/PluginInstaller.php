<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PluginInstaller extends BaseInstaller {
    function check_package_content($package_root, &$packagename) {
        // x. The plugin root should contain only one directory
        $files = array_diff(scandir($package_root), array('.', '..'));

        if (count($files) != 1) {
            return 'Invalid plugin structure: all plugin content should be put in a single plugin directory';
        }

        $plugin_name = array_shift($files);

        $dir = $package_root.'/'.$plugin_name;

        if (!is_dir($dir)) {
            return 'Invalid plugin structure: all plugin content should be put in a single directory';
        }

        // x. Should have a plugin entry file
        if (!file_exists($dir.'/'.$plugin_name.'.php')) {
            return "Invalid plugin structure :: it should contain a plugin entry file '$plugin_name.php'";
        }

        // x. Parse plugin info
        $info = $this->parse_plugin_info($dir.'/'.$plugin_name.'.php');

        if (empty($info['name'])) {
            return "Invalid plugin structure :: plugin information not found (expected to be in $plugin_name.php)";
        }
    }

    function install_package_content($package_root, $packagename) {
        $dir = realpath(APPLICATION_DIR.'/plugins');

        self::recursive_copy($package_root, $dir, true);
    }

    function parse_plugin_info($file) {
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
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PackageInstaller extends BaseInstaller {
    function check_package_content($package_root, &$packagename) {
        // x. The package root should contain only one directory
        $files = array_diff(scandir($package_root), array('.', '..'));

        if (count($files) != 1) {
            return 'Invalid package structure: all package content should be put in a single package directory';
        }

        $packagename = array_shift($files);

        $dir = $package_root.'/'.$packagename;

        if (!is_dir($dir)) {
            return 'Invalid package structure: all package content should be put in a single package directory';
        }

        // x. Should have a autoload file
        if (!file_exists($dir.'/autoload.php')) {
            return "Invalid package structure :: it should contain an autoload file 'autoload.php'";
        }

//        // x. Parse plugin info
//        $info = $this->parse_plugin_info($dir.'/'.$packagename.'.php');
//
//        if (empty($info['name'])) {
//            return "Invalid package structure :: plugin information not found (expected to be in $packagename.php)";
//        }
    }

    function install_package_content($package_root, $packagename) {
        $dir = realpath(APPLICATION_DIR.'/../packages');

        // x. Copy package files
        self::recursive_copy($package_root, $dir, true);

        $packagedir = $dir.'/'.$packagename;

        // x. Copy schema files
        if (is_dir($packagedir.'/schema')) {
            $schemadir = realpath(APPLICATION_DIR.'/../schema');

            self::recursive_copy($packagedir.'/schema', $schemadir, true);
        }

        // x. Execute db script files
        if (file_exists($packagedir.'/install/database.sql')) {
            $error = $this->install_db_script($packagedir.'/install/database.sql');

            if (!empty($error)) {
                return $error;
            }

            // x. Sync language files
            AdminLanguageController::sync();
        }
    }

    function parse_plugin_info($file) {
        $info = array();

        $infomap = array(
            'name' => 'Package Name',
            'author' => 'Author',
            'version' => 'Version',
            'description' => 'Description',
            'package_url' => 'Package URL',
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
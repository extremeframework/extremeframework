<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ThemeInstaller extends BaseInstaller {
    function check_package_content($package_root, &$packagename) {
        // x. The theme root should contain only one directory
        $files = array_diff(scandir($package_root), array('.', '..'));

        if (count($files) != 1) {
            return 'Invalid theme structure';
        }

        $dir = $package_root.'/'.array_shift($files);

        if (!is_dir($dir)) {
            return 'Invalid theme structure';
        }

        // x. Should have a template directory
        if (!is_dir($dir.'/templates')) {
            return "Invalid theme structure :: it should contain a directory 'templates'";
        }

        // x. Should have a file 'functions.php'
        if (!file_exists($dir.'/functions.php')) {
            return "Invalid theme structure :: it should contain a file 'functions.php'";
        }

        // x. Should have a autoload file
        if (!file_exists($dir.'/autoload.php')) {
            return "Invalid theme structure :: it should contain an autoload file 'autoload.php'";
        }

        // x. Parse theme info
        $info = $this->parse_theme_info($dir.'/functions.php');

//        if (empty($info['name'])) {
//            return "Invalid theme structure :: theme information not found (expected to be in functions.php)";
//        }
    }

    function install_package_content($package_root, $packagename) {
        $dir = realpath(APPLICATION_DIR.'/../front/themes');

        // x. Copy package files
        self::recursive_copy($package_root, $dir, true);

        $packagedir = $dir.'/'.$packagename;

        // x. Execute db script files
        if (file_exists($packagedir.'/install/database.sql')) {
            $error = $this->install_db_script($packagedir.'/install/database.sql');

            if (!empty($error)) {
                return $error;
            }
        }
    }

    function parse_theme_info($file) {
        $info = array();

        $infomap = array(
            'name' => 'Theme Name',
            'author' => 'Author',
            'version' => 'Version',
            'description' => 'Description',
            'theme_url' => 'Theme URL',
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
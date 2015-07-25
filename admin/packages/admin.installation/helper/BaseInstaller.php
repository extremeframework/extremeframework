<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class BaseInstaller {
    function install($package, &$error) {
        // x. Download package
        $downloaded_package = $this->download_package($package);

        // x. Check package extension
        $error = $this->check_package_extension($downloaded_package);

        if (!empty($error)) {
            return false;
        }

        // x. Extract package
        $package_root = $this->extract_package($downloaded_package);

        // x. Check package content
        $error = $this->check_package_content($package_root, $packagename);

        if (!empty($error)) {
            return false;
        }

        // x. Install package content
        $error = $this->install_package_content($package_root, $packagename);

        if (!empty($error)) {
            return false;
        }

        // x. Notify new package installed
        NotificationHelper::notifyNewPackageInstalled();
    }

    function check_package_extension($downloaded_package) {
        $zip = new ZipArchive;

        $res = $zip->open($downloaded_package);

        if ($res !== TRUE) {
            return "Package file should be a valid .zip file";
        }
    }

    function download_package($package) {
		if (!preg_match('!^(http|https|ftp)://!i', $package) && file_exists($package)) {
			return $package;
        }

        $dest = $this->get_temp_dir().'/'.basename($package);

    	$this->download($package, $dest);

        return $dest;
    }

    function extract_package($package) {
        $package_root = $this->get_temp_dir().'/'.substr(basename($package), 0, -4);

        if (!is_dir($package_root)) {
            mkdir($package_root);
        } else {
            $this->delete_dir($package_root);
        }

        $zip = new ZipArchive;

        $res = $zip->open($package);
        if ($res !== TRUE) {
            return false;
        }

        $zip->extractTo($package_root);
        $zip->close();

        return $package_root;
    }

    // To be overrided
    function check_package_content($package_root, &$packagename) {
        return null;
    }

    // To be overrided
    function install_package_content($package_root, $packagename) {
        return null;
    }

    function install_db_script($file) {
        $handle = fopen($file, "r");
        $query = '';

        TransactionHelper::begin();

        $db = new DB_DataObject();

        while(!feof($handle)) {
            $line = fgets($handle);
            if (trim($line) != "" && strpos($line, "--") === false) {
                $query .= $line;

                if (preg_match('/;\s*$/', $line)) {
                    $query = trim($query);

                    if (preg_match('/^(CREATE|INSERT|UPDATE)/is', $query)) {
                        $result = $db->query($query);

                        if (is_object($result)) {
                            return "An error happens while importing database script file";
                        }
                    }

                    $query = '';
                }
            }
        }

        TransactionHelper::end();
    }

    function download($url, $dest) {
        // open file
        $fp = @fopen($dest, 'w+');
        if ($fp == false) {
            echo ("ERROR: Cannot open $dest\n");

            return;
        }

        // create a new cURL resource
        $ch = curl_init();

        // set URL and other appropriate options
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 50);
        curl_setopt($ch, CURLOPT_FILE, $fp);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt($ch, CURLOPT_REFERER, $url); // Important
	    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.142 Safari/535.19');

	    // SSL
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

        // grab URL
        curl_exec($ch);

        // close cURL resource, and free up system resources
        curl_close($ch);

        // close file
        fclose($fp);
    }

    function get_temp_dir() {
    	static $temp = null;

    	if ($temp != null) {
    	    return $this->safe_path($temp);
        }

    	if (function_exists('sys_get_temp_dir')) {
    		$temp = sys_get_temp_dir();

    		if (@is_dir($temp)) {
    			return $this->safe_path($temp);
            }
    	}

    	$temp = ini_get('upload_tmp_dir');

		if (@is_dir($temp)) {
			return $this->safe_path($temp);
        }

    	return $temp;
    }

    function safe_path($path) {
        return rtrim(str_replace('\\', '/', $path), '/\\');
    }

    function delete_dir($dir) {
        $dir = $this->safe_path($dir);

        if (!is_dir($dir)) {
            return;
        }

        $files = scandir($dir);

        foreach ($files as $file) {
            if ($file != '.' && $file != '..') {
                if (is_dir($dir . '/' . $file)) {
                    $this->delete_dir($dir . '/' . $file);
                } else {
                    unlink($dir . '/' . $file);
                }
            }
        }

        rmdir($dir);
    }

    function recursive_copy($src, $dst, $overwrite = false) {
        $dir = opendir($src);
        @mkdir($dst);
        while(false !== ( $file = readdir($dir)) ) {
            if (( $file != '.' ) && ( $file != '..' ) && ( $file != '.svn' )) {
                if ( is_dir($src . '/' . $file) ) {
                    $this->recursive_copy($src . '/' . $file,$dst . '/' . $file, $overwrite);
                }
                else {
                    if ($overwrite || !file_exists($dst . '/' . $file)) {
                        $extension = pathinfo($dst . '/' . $file, PATHINFO_EXTENSION);

                        copy($src . '/' . $file,$dst . '/' . $file);
                    }
                }
            }
        }
        closedir($dir);
    }
}
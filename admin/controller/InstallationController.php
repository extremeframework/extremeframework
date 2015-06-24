<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class InstallationController extends __AppController
{
    var $module = 'installation';
    var $type = 'controller';

    function indexAction() {
		$messages = $this->getMessages();

		$smarty = Framework::getSmarty();
		$smarty->assign('messages', $messages);

		$smarty->display('install.tpl');
    }

    function installAction() {
        if (isset($_FILES['installation_file'])) {
        	if (!$_FILES['installation_file']['error']) {
	            $filepath = $_FILES['installation_file']['tmp_name'];
        		$original = $_FILES['installation_file']['name'];

                if (preg_match('/(\.zip)$/i', $original)) {
                    $error = $this->performInstall($filepath, $original);
                } else {
                    $error = "Invalid installation ZIP file";
                }

	            if (!empty($error)) {
	                $this->setMessages(array($error));
	        		$this->indexAction();
	            } else {
	                $this->setMessages(array("Installation complete"));
	        		$this->indexAction();
	            }
            }
        } else {
            $this->indexAction();
        }
    }

    function performInstall($filepath, $original) {
        $zip = new ZipArchive;

        $res = $zip->open($filepath);

        if ($res === FALSE) {
            return "Cannot open the input file";
        }

        $tempdir = UPLOAD_DIR.DIRECTORY_SEPARATOR.uniqid();
        mkdir($tempdir, 0777);

        $zip->extractTo($tempdir);
        $zip->close();

        $this->recurse_copy($tempdir, APPLICATION_DIR.DIRECTORY_SEPARATOR.'application');
    }

    function recurse_copy($src,$dst) {
        $dir = opendir($src);
        @mkdir($dst);
        while(false !== ( $file = readdir($dir)) ) {
            if (( $file != '.' ) && ( $file != '..' )) {
                if ( is_dir($src . '/' . $file) ) {
                    $this->recurse_copy($src . '/' . $file,$dst . '/' . $file);
                }
                else {
                    copy($src . '/' . $file,$dst . '/' . $file);
                }
            }
        }
        closedir($dir);
    }
}
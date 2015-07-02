<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class PackageController extends __AppController
{
    public function settingsAction() {
        AuthenticationController::authenticate();

        $a = get_theme_option('PAYPAL_API_URL');

        $packagecode = get_request_param('package');
        $app = get_request_param('app');

        if (empty($packagecode)) {
            $this->pagenotfound("Parameter 'package' missing");
        }

        // x. Package directory
        if (!empty($app)) {
            $packagedir = realpath(APPLICATION_DIR.'/../'.$app.'/packages/'.$packagecode);
        } else {
            $packagedir = realpath(APPLICATION_DIR.'/../packages/'.$packagecode);
        }

        if (!is_dir($packagedir)) {
            $this->pagenotfound('Package not found');
        }

        // x. Check package options file
        $file = $packagedir.'/config/options.php';

        if (!file_exists($file)) {
            $this->pagenotfound('Package options file not found (options.php)');
        }

        // x. Get package options registration
        $groups = include $file;

        // x. Load option values
        $values = $this->getPackageOptionValues($packagecode);

        // x. Ensure its registration in the database
        foreach ($groups as $group) {
            $options = $group['options'];

            foreach ($options as $option) {
                if (!isset($values[$option['code']])) {
                    $model = new OptionModel();

                    $model->NAME = $option['title'];
                    $model->CODE = $option['code'];
                    $model->VALUE = isset($option['default'])? $option['default'] : '';
                    $model->CONTEXT = $packagecode;

                    $model->insert();

                    $values[$model->CODE] = array('uuid' => $model->VALUE, 'value' => $model->VALUE);
                }
            }
        }

        // x. Render
		$smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('packagecode', $packagecode);
        $smarty->assign('app', $app);
		$smarty->assign('groups', $groups);
		$smarty->assign('values', $values);

	    $this->display($smarty, 'package.settings.tpl');
    }

    public function saveSettingsAction() {
        $packagecode = get_request_param('packagecode');
        $app = get_request_param('app', 'front');

        $this->handleFileUploads($packagecode);

        foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^formdata-(.*)/is', $name, $match)) {
                $code = $match[1];

                $model = new OptionModel();
                $model->VALUE = $value;

                $model->whereAdd("CODE = '$code' AND CONTEXT = '$packagecode'");
                $model->update(true);
            }
        }

        header('Location:'.APPLICATION_URL.'/package/settings?package='.$packagecode.'&app='.$app);
    }

    private function getPackageOptionValues($packagecode) {
        $model = new OptionModel();

        $model->selectAdd();
        $model->selectAdd("`UUID`, `CODE`, `VALUE`");

        $model->CONTEXT = $packagecode;

        $model->find();

        $values = array();

        while($model->fetch()) {
            $values[$model->CODE] = array('uuid' => $model->UUID, 'value' => $model->VALUE);
        }

        return $values;
    }

    private function handleFileUploads($packagecode) {
	    if (isset($_FILES) && !empty($_FILES)) {
            foreach ($_FILES as $column => $file) {
                if (preg_match('/^formdata_(.*)/', $column, $matches)) {
                    $column = $matches[1];
                }

                if (!empty($file['name'])) {
                	$basename = basename($file['name']);

                	preg_match('/^(.*)(\.[a-z09]*)$/i', $basename, $matches);
                	$name = $matches[1];
                	$extension = $matches[2];

                    $rel = 'packages/'.$packagecode;

                    $dir = UPLOAD_DIR."/".$rel;
                    if (!is_dir($dir)) {
                        mkdir($dir, 0777, true);
                    }

                    $uploadfile = $dir.'/'.$basename;

                    if (move_uploaded_file($file['tmp_name'], $uploadfile)) {
                        $filepath = $rel."/".$basename;

                        $_REQUEST[$column] = $filepath;
                    }

                    // x. Trim & resize images
                    if (in_array(strtolower($extension), array('.gif', '.jpg', '.jpeg', '.png'))) {
                        $tc = new ThumbController();

                        // Resize
                        $width = isset($_REQUEST[$column]['width'])? intval($_REQUEST[$column]['width']) : 0;
                        $height = isset($_REQUEST[$column]['height'])? intval($_REQUEST[$column]['height']) : 0;

                        if ($width > 0 || $height > 0) {
                            $tc->resize($uploadfile, $width, $height, false);
                        }
                    }
                }
            }
        }
	}
}
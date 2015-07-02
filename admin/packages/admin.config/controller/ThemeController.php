<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class ThemeController extends __AppController
{
    public function settingsAction() {
        AuthenticationController::authenticate();

        $themecode = get_request_param('theme');
        $app = get_request_param('app', 'front');

        if (empty($themecode)) {
            $this->pagenotfound("Parameter 'theme' missing");
        }

        // x. Theme directory
        $themedir = realpath(APPLICATION_DIR.'/../'.$app.'/themes/'.$themecode);

        if (!is_dir($themedir)) {
            $this->pagenotfound('Theme not found');
        }

        // x. Include theme entry file
        $file = $themedir.'/functions.php';

        if (!file_exists($file)) {
            $this->pagenotfound('Theme entry file not found (functions.php)');
        }

        require_once($file);

        // x. Get theme options registration
        $groups = get_theme_options_registration();

        // x. Load option values
        $values = $this->getThemeOptionValues($themecode);

        // x. Ensure its registration in the database
        foreach ($groups as $group) {
            $options = $group['options'];

            foreach ($options as $option) {
                if (!isset($values[$option['code']])) {
                    $model = new OptionModel();

                    $model->NAME = $option['title'];
                    $model->CODE = $option['code'];
                    $model->VALUE = isset($option['default'])? $option['default'] : '';
                    $model->CONTEXT = $themecode;

                    $model->insert();

                    $values[$model->CODE] = array('uuid' => $model->VALUE, 'value' => $model->VALUE);
                }
            }
        }

        // x. Render
		$smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('themecode', $themecode);
        $smarty->assign('app', $app);
		$smarty->assign('groups', $groups);
		$smarty->assign('values', $values);

	    $this->display($smarty, 'theme.settings.tpl');
    }

    public function saveSettingsAction() {
        $themecode = get_request_param('themecode');
        $app = get_request_param('app', 'front');

        $this->handleFileUploads($themecode);

        foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^formdata-(.*)/is', $name, $match)) {
                $code = $match[1];

                $model = new OptionModel();
                $model->VALUE = $value;

                $model->whereAdd("CODE = '$code' AND CONTEXT = '$themecode'");
                $model->update(true);
            }
        }

        header('Location:'.APPLICATION_URL.'/theme/settings?theme='.$themecode.'&app='.$app);
    }

    private function getThemeOptionValues($themecode) {
        $model = new OptionModel();

        $model->selectAdd();
        $model->selectAdd("`UUID`, `CODE`, `VALUE`");

        $model->CONTEXT = $themecode;

        $model->find();

        $values = array();

        while($model->fetch()) {
            $values[$model->CODE] = array('uuid' => $model->UUID, 'value' => $model->VALUE);
        }

        return $values;
    }

    private function handleFileUploads($themecode) {
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

                    $rel = 'themes/'.$themecode;

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
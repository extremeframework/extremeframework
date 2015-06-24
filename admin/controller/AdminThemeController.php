<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminThemeController extends _AdminThemeController
{
    function uploadAction() {
        // x. Ensure additional data
        $this->ensure_additional_data(
            'Upload a Theme',
            'THEME_PACKAGE_ZIP',
            'THEME_PACKAGE_ZIP',
            array(
                'Install' => APPLICATION_URL.'/admintheme/upload'
            ),
            $formdata,
            array(
                'THEME_PACKAGE_ZIP' => new ColumnSettings('file', 'Theme package file (.zip)', 'theme-package-zip')
            )
        );

        if ($formdata['THEME_PACKAGE_ZIP']['error'] == 1) {
            die("File upload failed");
        }

        // x. Package file
        $tmp_name = $formdata['THEME_PACKAGE_ZIP']['tmp_name'];
    	$name = $formdata['THEME_PACKAGE_ZIP']['name'];

        // x. Installation
        $installer = new ThemeInstaller();

        $package = $installer->get_temp_dir().'/'.basename($name);

        if (move_uploaded_file($tmp_name, $package)) {
            $installer->install($package, $error);
        } else {
            $error = "Cannot move uploaded file to $package";
        }

        if (!empty($error)) {
            echo('ERROR: '.$error);
        } else {
            $this->syncAction();
        }
    }

    function syncAction() {
        self::sync_themes();

        ContextStack::back(0);
    }

    function activateAction() {
		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            // x. Enable
            $model = new AdminthemeModel();

            $model->ID = $id;
            $model->IS_ENABLED = 1;

            $model->update();

            // x. Disable others
            $model = new AdminthemeModel();

            $model->IS_ENABLED = 0;
            $model->whereAdd("ID != $id");

            $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        }

        ContextStack::back(0);
    }

    public static function sync_themes() {
        $themes = self::read_theme_files();

        foreach ($themes as $theme_path => $file) {
            $info = self::parse_theme_info($file);

            if (!empty($info['name'])) {
                $model = new AdminThemeModel();

                $model->THEME_PATH = $theme_path;

                $model->find();
                $model->fetch();

                $model->NAME = $info['name'];
                $model->AUTHOR = $info['author'];
                $model->VERSION = $info['version'];
                $model->DESCRIPTION = $info['description'];
                $model->THEME_URL = $info['theme_url'];
                $model->AUTHOR_URL = $info['author_url'];

                if (empty($model->REFID)) {
                    $model->REFID = AdminThemeController::nextRefid();
                }

                if ($model->ID) {
                    $model->update();
                } else {
                    $model->insert();
                }
            }
        }
    }

    private static function read_theme_files() {
    	$themes = array();

        $dir = realpath(APPLICATION_DIR.'/../front/themes');

    	if (!is_dir($dir) || ! $dh = opendir($dir)) {
    		return $themes;
        }

    	while (($theme = readdir($dh)) !== false) {
    	    if ($theme != '.' && $theme != '..') {
                if (is_dir($dir.'/'.$theme) && is_dir($dir.'/'.$theme.'/templates')) {
                    if (file_exists($dir.'/'.$theme.'/functions.php')) {
                        $themes[$theme] = $dir.'/'.$theme.'/functions.php';
                    } else if (file_exists($dir.'/'.$theme.'/style.css')) {
                        $themes[$theme] = $dir.'/'.$theme.'/style.css';
                    }
                }
            }
    	}

    	closedir( $dh );

    	return $themes;
    }

    private static function parse_theme_info($file) {
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
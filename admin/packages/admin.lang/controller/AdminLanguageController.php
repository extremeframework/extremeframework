<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminLanguageController extends _AdminLanguageController
{
    function onInsertSuccess($model) {
        $alm = new AdminLabelModel();

        $alm->find();

	    $values = array();

        while($alm->fetch()) {
            $values[] = "({$model->ID}, {$alm->ID})";
        }

        $alim = new AdminLanguageItemModel();

        $query = "INSERT IGNORE INTO ".TABLE_PREFIX."ADMIN_LANGUAGE_ITEM (ID_ADMIN_LANGUAGE, ID_ADMIN_LABEL) VALUES ".implode(', ', $values);

        $alim->query($query);
    }

    function syncAction() {
		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

        $this->sync();

        ContextStack::back(0);
    }

    static function sync($id = '') {
        $dir = SHARED_DIR.'/locales';

        if (!is_writable($dir)) {
            return "No permission: the directory $dir should be writable";
        }

        // Details
		$model = new AdminLanguageModel();

        if (!empty($id)) {
		    $model->ID = $id;
        }

		$model->find();

     	while ($model->fetch()) {
    		$filepath = $dir.'/app_lang_'.$model->CODE.'.php';

            // x. File header
            $header = "<?php\n";

            $header .= "global \$_L;\n";
            $header .= "\$_L = array();\n\n";

            if (!file_exists($filepath)) {
                file_put_contents($filepath, $header);
            }

            // x. Current labels
            global $_L;

            include ($filepath);

            $current = array_keys($_L);

            // Language item lines
            $alim = new AdminLanguageItemModel();

            $alim->selectAdd();
            $alim->selectAdd('LABEL, TRANSLATION');

            $alim->joinAdd(new AdminLabelModel());
            $alim->ID_ADMIN_LANGUAGE = $model->ID;

            $alim->orderBy('LABEL ASC');
            $alim->find();

            while($alim->fetch()) {
                $label = $alim->LABEL;
                $translation = $alim->TRANSLATION;

                $_L[$label] = addslashes($translation);
            }

            ksort($_L);

            $s = $header;

            foreach ($_L as $label => $translation) {
                if (!empty($translation)) {
                    $s .= "\$_L['$label'] = '".trim($translation)."';\n";
                }
            }

            file_put_contents($filepath, $s);
        }
    }

    function quickSelectAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminlanguage');

        $model = new AdminLanguageModel();
        $model->find();

        $rows = array();

        while($model->fetch()) {
            $rows[] = clone $model;
        }

		$smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('rows', $rows);

		$smarty->display('quick-select.adminlanguage.tpl');
    }
}
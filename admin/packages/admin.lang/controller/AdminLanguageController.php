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

    static function sync($id) {
        // Details
		$model = new AdminLanguageModel();

		$model->ID = $id;
		$model->find();

     	if (!$model->fetch()) {
		    $this->pagenotfound();
     	}

        // Language item lines
        $alim = new AdminLanguageItemModel();

        $alim->selectAdd();
        $alim->selectAdd('LABEL, TRANSLATION');

        $alim->joinAdd(new AdminLabelModel());
        $alim->ID_ADMIN_LANGUAGE = $id;

        $alim->orderBy('LABEL ASC');
        $alim->find();

	    $lines = array('<?php');

	    $lines[] = 'global $_L;';
	    $lines[] = '$_L = array();';
	    $lines[] = '';
	    $lines[] = '/* Labels */';

        while($alim->fetch()) {
            $lines[] = "\$_L['{$alim->LABEL}'] = '{$alim->TRANSLATION}';";
        }

	    $lines[] = '';
	    $lines[] = '/* Constants map */';
	    $lines[] = 'foreach ($_L as $key => $value) {';
	    $lines[] = '    if (preg_match(\'/^L_[A-Z0-9_]+$/\', $key)) {';
	    $lines[] = '        define($key, $value);';
	    $lines[] = '    }';
	    $lines[] = '}';

        // Write to file
        file_put_contents(SHARED_DIR.'/locales/app_lang_'.$model->CODE.'.php', implode("\n", $lines));
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

		$smarty = Framework::getSmarty();

        $smarty->assign('rows', $rows);

		$smarty->display('quick-select.adminlanguage.tpl');
    }
}
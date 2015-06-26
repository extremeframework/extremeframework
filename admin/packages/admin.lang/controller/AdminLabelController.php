<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminLabelController extends _AdminLabelController
{
    function onInsertSuccess($model) {
        // All language ids
        $alm = new AdminLanguageModel();

        $alm->find();

        $languageids = array();
        while($alm->fetch()) {
            $languageids[] = $alm->ID;
        }

        // Insert new language item
	    $values = array();
        foreach ($languageids as $languageid) {
            $translation = $this->friendlyDef($model->LABEL);

            $values[] = "({$languageid}, {$model->ID}, '{$translation}')";
        }

        $alim = new AdminLanguageItemModel();

        $query = "INSERT IGNORE INTO ".TABLE_PREFIX."ADMIN_LANGUAGE_ITEM (ID_ADMIN_LANGUAGE, ID_ADMIN_LABEL, TRANSLATION) VALUES ".implode(', ', $values);

        $alim->query($query);
    }

	function friendlyDef($label) {
        $result = str_replace('_', ' ', strtolower(preg_replace('/_ID_/i', '_', preg_replace('/(^L_|^ID_|_ID$)/', '', $label))));

        if (!preg_match('/_lc$/i', $label)) {
            $result = ucfirst($result);
        }

        if (preg_match('/^L_(IS|HAS|DOES|CAN)_/', $label)) {
            $result .= '?';
        }

        return $result;
	}
}
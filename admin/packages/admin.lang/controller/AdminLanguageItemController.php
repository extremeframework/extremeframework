<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminLanguageItemController extends _AdminLanguageItemController
{
    function updateAction() {
        $key = isset($_REQUEST['key'])? $_REQUEST['key'] : false;
        $lang = isset($_REQUEST['lang'])? $_REQUEST['lang'] : false;
        $value = isset($_REQUEST['value'])? $_REQUEST['value'] : false;

        // x. Find language
        $alm = new AdminLanguageModel();
        $alm->CODE = $lang;
        $alm->find();
        if (!$alm->fetch()) {
            return false;
        }

        $ID_ADMIN_LANGUAGE = $alm->ID;

        // x. Find label
        $lm = new AdminLabelModel();
        $lm->LABEL = $key;
        $lm->find();
        if (!$lm->fetch()) {
            return false;
        }
        $ID_ADMIN_LABEL = $lm->ID;

        // x. Find translation
        $alim = new AdminLanguageItemModel();
        $alim->ID_ADMIN_LANGUAGE = $ID_ADMIN_LANGUAGE;
        $alim->ID_ADMIN_LABEL = $ID_ADMIN_LABEL;
        $alim->find();
        if (!$alim->fetch()) {
            return false;
        }

        // x. Update if needed
        if ($alim->TRANSLATION != $value) {
            $alim->TRANSLATION = $value;
            $alim->update();

            // Synchronize
            $url = APPLICATION_URL.'/adminlanguage/sync/'.$ID_ADMIN_LANGUAGE;
            header('Location:'.$url);
        }
    }

    function updateTranslationAction() {
        $key = isset($_REQUEST['key'])? $_REQUEST['key'] : false;
        $text = isset($_REQUEST['text'])? $_REQUEST['text'] : false;
        $lang = isset($_SESSION['lang'])? $_SESSION['lang'] : 'en';

        // x. Find language
        $alm = new AdminLanguageModel();
        $alm->CODE = $lang;
        $alm->find();
        if (!$alm->fetch()) {
            return false;
        }

        $ID_ADMIN_LANGUAGE = $alm->ID;

        // x. Find label
        $lm = new AdminLabelModel();
        $lm->LABEL = $key;
        $lm->find();
        if (!$lm->fetch()) {
            return false;
        }
        $ID_ADMIN_LABEL = $lm->ID;

        // x. Find translation
        $alim = new AdminLanguageItemModel();
        $alim->ID_ADMIN_LANGUAGE = $ID_ADMIN_LANGUAGE;
        $alim->ID_ADMIN_LABEL = $ID_ADMIN_LABEL;
        $alim->find();
        if (!$alim->fetch()) {
            return false;
        }

        // x. Update if needed
        if ($alim->TRANSLATION != $text) {
            $alim->TRANSLATION = $text;
            $alim->update();

            // Synchronize
            AdminLanguageController::sync($ID_ADMIN_LANGUAGE);
        }
    }
}
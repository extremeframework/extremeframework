<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminStyleController extends _AdminStyleController
{
    function changeAction() {
        $curid = isset($_SESSION['user.preferences.style'])? $_SESSION['user.preferences.style'] : 0;
        $model = $this->next($curid);

        if (!$model->ID) {
            $model = $this->next(0);
        }

        $_SESSION['user.preferences.style'] = $model->ID;
        $_SESSION['user.preferences.wallpaper'] = null;

        $upm = new UserPreferenceModel();

        $upm->ID_ADMIN_STYLE = $model->ID;
        $upm->ID_WALLPAPER = 'null';

        $upm->whereAdd("ID_USER = '".$_SESSION['user']->ID."'");

        $upm->update(DB_DATAOBJECT_WHEREADD_ONLY);

        echo self::get_css($model);
    }

    function loadStyle($id) {
        $model = new AdminStyleModel();

        $model->whereAdd("ID = '$id'");

        $model->find();

        if ($model->fetch()) {
            echo self::get_css($model);
        }
    }

    function next($curid) {
        $model = new AdminStyleModel();

        $model->whereAdd('ID > '.$curid);

        $model->limit(0, 1);
        $model->find();

        $model->fetch();

        return $model;
    }

    function get_css($model) {
        $css = '';

        if ($model->PARENT > 0) {
            $parent = new AdminStyleModel();

            $parent->ID = $model->PARENT;

            $parent->find();
            $parent->fetch();

            $css = $parent->CSS."\n".$model->CSS;
        } else {
            $css = $model->CSS;
        }

        $css = str_replace('{APPLICATION_URL}', APPLICATION_URL, $css);

        return $css;
    }
}
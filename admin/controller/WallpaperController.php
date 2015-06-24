<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class WallpaperController extends _WallpaperController
{
    function changeAction() {
        $curid = isset($_SESSION['user.preferences.wallpaper'])? $_SESSION['user.preferences.wallpaper'] : 0;
        $model = $this->next($curid);

        if (!$model->ID) {
            $model = $this->next(0);
        }

        $_SESSION['user.preferences.wallpaper'] = $model->ID;

        $upm = new UserPreferenceModel();

        $upm->ID_WALLPAPER = $model->ID;

        $upm->whereAdd("ID_USER = '".$_SESSION['user']->ID."'");

        $upm->update(DB_DATAOBJECT_WHEREADD_ONLY);

        echo self::get_css($model);
    }

    function loadStyle($id) {
        $model = new WallpaperModel();

        $model->whereAdd("ID = '$id'");

        $model->find();

        if ($model->fetch()) {
            echo self::get_css($model);
        }
    }

    function next($curid) {
        $model = new WallpaperModel();

        $model->whereAdd('ID > '.$curid);

        $model->limit(0, 1);
        $model->find();

        $model->fetch();

        return $model;
    }

    function get_css($model) {
        $background_color = !empty($model->BACKGROUND_COLOR)? $model->BACKGROUND_COLOR : 'rgb(125, 156, 173)';
        $background_url = !empty($model->BACKGROUND_IMAGE)? UPLOAD_URL.'/'.$model->BACKGROUND_IMAGE : $model->BACKGROUND_URL;

        $background_image = !empty($background_url)? "url({$background_url}) no-repeat fixed" : '';

        $css = "body {
            background: $background_image $background_color;
        }";

        return $css;
    }
}
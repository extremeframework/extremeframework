<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class DraftController extends _DraftController
{
    static function saveDraft($module, $key, $data) {
        $model = new DraftModel();

        $model->MODULE = $module;
        $model->KEY = !empty($key)? $key : -1;

        $model->find();
        $exists = $model->fetch();

        $model->DATA = json_encode($data);

        if ($exists) {
            $model->update();
        } else {
            $model->insert();
        }
    }

    static function tryRestoreDraft($module, $key, &$target) {
        $model = new DraftModel();

        $model->MODULE = $module;
        $model->KEY = !empty($key)? $key : -1;

        $model->find();

        if ($model->fetch()) {
            $data = json_decode($model->DATA);

            foreach ($data as $key => $value) {
                $target->$key = $value;
            }
        }
    }

    static function clearAllDrafts($module) {
        $model = new DraftModel();

        $model->whereAdd("MODULE = '$module'");

        $model->delete(true);
    }
}
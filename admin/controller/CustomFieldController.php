<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class CustomFieldController extends _CustomFieldController
{
    function onInitialization(&$model) {
        parent::onInitialization($model);

        if (!$model->ID_CUSTOM_FIELD_TYPE) {
            return;
        }

        $cftm = new CustomFieldTypeModel();
        $cftm->ID = $model->ID_CUSTOM_FIELD_TYPE;

        $cftm->find();

        if (!$cftm->fetch()) {
            return;
        }

        $params = $cftm->SETTING_PARAMS;

        if (!empty($params)) {
            $names = explode(',', $params);

            $model->FIELD_SETTINGS = implode('=&', $names).'=';
        }
    }

    function checkConstraint(&$model, &$errors, $columns2check) {
        if (!parent::checkConstraint($model, $errors, $columns2check)) {
            return false;
        }

        if (!$model->ID_CUSTOM_FIELD_TYPE) {
            return true;
        }

        $cftm = new CustomFieldTypeModel();

        $cftm->ID = $model->ID_CUSTOM_FIELD_TYPE;

        $cftm->find();

        if ($cftm->fetch()) {
            $params = $cftm->SETTING_PARAMS;

            if (!empty($params)) {
                $names = explode(',', $params);

                $settings = CustomFieldHelper::parseFieldSettings($model->FIELD_SETTINGS);

                foreach ($names as $name) {
                    if (!isset($settings[$name]) || empty($settings[$name])) {
                        $errors['field-settings'] = "Please specify the required field settings ($params). Format: ".str_replace(',', '=&lt;value&gt;&', $params).'=&lt;value&gt;';

                        return false;
                    }
                }
            }
        }
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class CustomFieldHelper {
    static function getCustomFields($module, $target_object = null) {
        if (!Framework::hasModule('CustomField')) {
            return array();
        }

        $key = 'system.customfields';

        // x. Load ALL custom fields in the system
        if (!Cache::has($key)) {
            $model = new CustomFieldModel();

            $model->selectAdd();
            $model->selectAdd('CUSTOM_FIELD.*');
            $model->selectAdd('CUSTOM_FIELD_TYPE.CODE AS TYPE');
            $model->selectAdd('CUSTOM_FIELD_SET.MODULE, CUSTOM_FIELD_SET.TARGET_COLUMN, CUSTOM_FIELD_SET.TARGET_VALUE');

            $model->joinAdd(new CustomFieldTypeModel());
            $model->joinAdd(new CustomFieldSetModel());

            $model->find();

            $customfields = array();

            while ($model->fetch()) {
                $model->COLUMN_CODE = strtolower(str_replace('_', '-', $model->COLUMN));
                $model->SETTINGS = CustomFieldHelper::parseFieldSettings($model->FIELD_SETTINGS);

                $customfields[$model->MODULE][] = clone $model;
            }

            Cache::set($key, $customfields);
        }

        $customfields = Cache::get($key);

        return isset($customfields[$module])? $customfields[$module] : array();
    }

    static function getObjectCustomFields($module, $object) {
        $customfields = CustomFieldHelper::getCustomFields($module);

        $fields = array();

        if (!empty($object) && is_object($object)) {
            foreach ($customfields as $field) {
                $target_column = $field->TARGET_COLUMN;
                $target_value = $field->TARGET_VALUE;

                if ((empty($target_column) && empty($target_value)) || property_exists($object, $target_column) && $object->$target_column == $target_value) {
                    $fields[] = $field;
                }
            }
        }

        return $fields;

    }

    static function getListCustomFields($module, $preset = null, $presetvalue = null) {
        $customfields = CustomFieldHelper::getCustomFields($module);

        $fields = array();

        foreach ($customfields as $field) {
            $target_column = $field->TARGET_COLUMN;
            $target_value = $field->TARGET_VALUE;

            if ($target_column == $preset && $target_value == $presetvalue) {
                if ($field->SHOW_IN_LIST) {
                    $fields[] = $field;
                }
            }
        }

        return $fields;
    }

    static function parseFieldSettings($string) {
        parse_str($string, $settings);

        return $settings;
    }

    static function getCustomFieldValue($model, $customfieldcolumn) {
        if (!property_exists($model, 'JSON')) {
            return;
        }

        $json = json_decode($model->JSON);

        if (empty($json)) {
            $json = new stdClass();
        }

        if (!property_exists($json, 'CUSTOM_FIELDS')) {
            $json->CUSTOM_FIELDS = array();
        }

        $values = (array) $json->CUSTOM_FIELDS;

        return isset($values[$customfieldcolumn])? $values[$customfieldcolumn] : '';
    }

    static function forceCustomFieldValuesExposed(&$model) {
        if (!property_exists($model, 'JSON')) {
            return;
        }

        $json = json_decode($model->JSON);

        if (empty($json)) {
            return;
        }

        if (!property_exists($json, 'CUSTOM_FIELDS')) {
            return;
        }

        $customfields = (array) $json->CUSTOM_FIELDS;

        foreach ($customfields as $colum => $value) {
            $model->$colum = $value;
        }
    }

    static function getCustomFieldColumns($module) {
        $customfields = CustomFieldHelper::getCustomFields($module);

        $columns = array();

        foreach ($customfields as $field) {
            $columns[] = $field->COLUMN;
        }

        return $columns;
    }

    static function checkCustomFieldConstraint($module, $model, &$errors) {
        $customfields = CustomFieldHelper::getObjectCustomFields($module, $model);

        foreach ($customfields as $field) {
            $name = $field->NAME;
            $column = $field->COLUMN;
            $columncode = $field->COLUMN_CODE;

            if ($field->IS_REQUIRED && (!property_exists($model, $column) || trim($model->$column) == '')) {
                $errors[$columncode] = sprintf(L_VALIDATION_NOT_EMPTY, $name);

                return false;
            }
        }

        return true;
    }

    static function updateCustomFieldValues($module, &$model) {
        $customfields = CustomFieldHelper::getObjectCustomFields($module, $model);

        if (!empty($customfields)) {
            $values = array();

            foreach ($customfields as $field) {
                $column = $field->COLUMN;

                $values[$column] = $model->$column;
            }

            $json = json_decode($model->JSON);

            if (empty($json)) {
                $json = new stdClass();
            }

            $json->CUSTOM_FIELDS = $values;

            $model->JSON = json_encode($json);
        }
    }

    static function applyCustomFieldValues(&$model, $customfieldvalues) {
        $json = json_decode($model->JSON);

        if (empty($json)) {
            $json = new stdClass();
        }

        $json->CUSTOM_FIELDS = $customfieldvalues;

        $model->JSON = json_encode($json);
    }
}
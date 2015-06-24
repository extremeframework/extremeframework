<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class FilterHelper {
    static function getProperFilters($model, $rawparams) {
        $filters = array();

        foreach ($rawparams as $key => $value) {
            if (property_exists($model, $key) && $key != 'ID') {
                if (trim($value) == '') {
                    $value = '0';
                }

                $filters[$key] = $value;
            }
        }

        return $filters;
    }
}
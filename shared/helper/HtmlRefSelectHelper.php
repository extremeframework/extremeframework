<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class HtmlRefSelectHelper {
    private static $filters = array();

    static function registerAdditionalFilters($html_select_name, $filters) {
        if (isset(self::$filters[$html_select_name])) {
            self::$filters[$html_select_name] = array_merge(self::$filters[$html_select_name], $filters);
        } else {
            self::$filters[$html_select_name] = $filters;
        }
    }

    static function getAdditionalFilters($html_select_name) {
        return isset(self::$filters[$html_select_name])? self::$filters[$html_select_name] : array();
    }
}
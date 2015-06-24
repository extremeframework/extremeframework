<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class StringHelper {
    static function htmlspecialchars($content) {
        return htmlspecialchars($content, ENT_QUOTES, 'UTF-8');
    }

    static function htmlentities($content) {
        return htmlentities($content, ENT_QUOTES, 'UTF-8');
    }
}
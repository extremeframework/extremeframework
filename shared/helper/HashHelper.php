<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class HashHelper {
    static function jenkins_hash($key, $max_value = 999999) {
        $key = (string)$key;
        $len = strlen($key);

        for($hash = $i = 0; $i < $len; ++$i) {
            $hash += ord($key[$i]);
            $hash += ($hash << 10);
            $hash ^= ($hash >> 6);
        }

        $hash += ($hash << 3);
        $hash ^= ($hash >> 11);
        $hash += ($hash << 15);

        return abs($hash % $max_value);
    }
}
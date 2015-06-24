<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class TransactionHelper {
    static function begin() {
        (new DB_DataObject())->query("BEGIN");
    }

    static function rollback() {
        (new DB_DataObject())->query("ROLLBACK");
    }

    static function end() {
        (new DB_DataObject())->query("COMMIT");
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class SystemLogController extends _SystemLogController
{
    function addLog($source, $type, $message, $details = '') {
        $slm = new SystemLogModel();

        $slm->SOURCE = $source;
        $slm->TYPE = $type;
        $slm->MESSAGE = $message;
        $slm->DETAILS = $details;
        $slm->TIME = date('Y-m-d H:i:s');

        $slm->insert();
    }
}

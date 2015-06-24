<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AclApi extends Api
{
    function checkPermission($module, $action) {
        if (!AclController::hasPermission($module, $action)) {
            echo json_encode(array('success' => false, 'code' => 'PERM', 'message' => 'No permission'));

            exit;
        }
    }
}

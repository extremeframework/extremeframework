<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class UserGroupController extends _UserGroupController
{
    function enforceCustomAclCheck(&$model) {
        if (isset($_SESSION['user']) && $_SESSION['user']->ID != 1) {
            $group_ids = $_SESSION['memberships.groups'];

            $model->whereAdd("USER_GROUP.ID = '".implode("' OR USER_GROUP.ID = '", $group_ids)."'");
        }
    }
}
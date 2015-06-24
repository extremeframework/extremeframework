<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminMenuHelper {
	function getSettingsMenuItemsAsGroups() {
        if (!Framework::hasModule('AdminMenu')) {
            return array();
        }

	    if (!isset($_SESSION['settings-menu'])) {
            $model = new AdminMenuItemModel();
            $model->ENABLE_SETTINGS = 1;

            $model->orderBy('PARENT, ORDERING');
            $model->find();

            $groups = array();
            while ($model->fetch()) {
                $groupname = 'Settings';

                $groups[$groupname][] = clone $model;
            }

            $_SESSION['settings-menu'] = $groups;
        } else {
            $groups = $_SESSION['settings-menu'];
        }

        return $groups;
    }
}
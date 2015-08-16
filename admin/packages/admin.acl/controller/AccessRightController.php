<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class AccessRightController extends _AccessRightController
{
	function jsonAddPermissionAction() {
 		list($encode, $module, $action) = explode('/', $_REQUEST['args']);

		$success = true;
		$message = '';

        list($id_user_group, $id_user_role) = explode(',', base64_decode($encode));

		if ((empty($id_user_group) && empty($id_user_role)) || empty($module) || trim($action) == '') {
			$success = false;
			$message = 'Parameter missing';
		} else {
			$am = new AccessRightModel();

            if ($id_user_group) {
			    $am->ID_USER_GROUP = $id_user_group;
            }

            if ($id_user_role) {
			    $am->ID_USER_ROLE = $id_user_role;
            }

			$am->MODULE = $module;

			$am->find();

			if ($am->fetch()) {
				$actions = explode(' ', $am->ACTIONS);

				if (!in_array($action, $actions)) {
					$actions[] = $action;

					$am->ACTIONS = implode(' ', $actions);

					$am->update();
				}
			} else {
				$am = new AccessRightModel();

                if ($id_user_group) {
    			    $am->ID_USER_GROUP = $id_user_group;
                }

                if ($id_user_role) {
    			    $am->ID_USER_ROLE = $id_user_role;
                }

				$am->MODULE = $module;
				$am->ACTIONS = $action;

				$am->insert();
			}
		}

		echo json_encode(array('success' => $success, 'message' => $message));
	}

	function jsonRemovePermissionAction() {
 		list($encode, $module, $action) = explode('/', $_REQUEST['args']);

		$success = true;
		$message = '';

        list($id_user_group, $id_user_role) = explode(',', base64_decode($encode));

		if ((empty($id_user_group) && empty($id_user_role)) || empty($module) || trim($action) == '') {
			$success = false;
			$message = 'Parameter missing';
		} else {
			$am = new AccessRightModel();

            if ($id_user_group) {
			    $am->ID_USER_GROUP = $id_user_group;
            }

            if ($id_user_role) {
			    $am->ID_USER_ROLE = $id_user_role;
            }
			$am->MODULE = $module;

			$am->find();

			if ($am->fetch()) {
				$actions = explode(' ', $am->ACTIONS);

				if (in_array($action, $actions)) {
					$actions = array_diff($actions, array($action));

					$am->ACTIONS = implode(' ', $actions);

					if (!empty($am->ACTIONS)) {
						$am->update();
					} else {
						$am->delete();
					}
				}
			}
		}

		echo json_encode(array('success' => $success, 'message' => $message));
	}
}
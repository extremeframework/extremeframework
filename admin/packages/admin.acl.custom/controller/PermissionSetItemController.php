<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class PermissionSetItemController extends _PermissionSetItemController
{
	function jsonAddPermissionAction() {
 		list($id_permission_set, $module, $action) = explode('/', $_REQUEST['args']);

		$success = true;
		$message = '';

		if (empty($id_permission_set) || empty($module) || trim($action) == '') {
			$success = false;
			$message = 'Parameter missing';
		} else {
			$am = new PermissionSetItemModel();

			$am->ID_PERMISSION_SET = $id_permission_set;
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
				$am = new PermissionSetItemModel();

				$am->ID_PERMISSION_SET = $id_permission_set;
				$am->MODULE = $module;
				$am->ACTIONS = $action;

				$am->insert();
			}
		}

		echo json_encode(array('success' => $success, 'message' => $message));
	}

	function jsonRemovePermissionAction() {
 		list($id_permission_set, $module, $action) = explode('/', $_REQUEST['args']);

		$success = true;
		$message = '';

		if (empty($id_permission_set) || empty($module) || trim($action) == '') {
			$success = false;
			$message = 'Parameter missing';
		} else {
			$am = new PermissionSetItemModel();

			$am->ID_PERMISSION_SET = $id_permission_set;
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
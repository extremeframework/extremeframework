<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class AccessRightApi extends AccessRightController
{
    var $module = 'accessright';
    var $type = 'api';

	function searchAction() {
	    AclApi::checkPermission('accessright', 'list');

		$keyword = isset($_REQUEST['keyword'])? $_REQUEST['keyword'] : '';

		$model = new AccessRightModel();

		$model->selectAdd();
		$model->selectAdd('ID, MODULE');

		if (!empty($keyword)) {
			$model->whereAdd("MODULE LIKE '%$keyword%'");
		}

        $model->orderBy('MODULE');
        $model->limit(10);

		$model->find();

		$rows = array();
		while ($model->fetch()) {
			$rows[] = $model->MODULE;
		}

		echo json_encode($rows);
	}

    function listAction() {
	    AclApi::checkPermission('accessright', 'list');

        if (isset($_REQUEST['page'])) {
            $this->updatePageNumber($_REQUEST['page']);
        }

        if (!isset($_REQUEST['limit'])) {
            $_REQUEST['limit'] = '*';
        }

        $this->updatePageSize($_REQUEST['limit']);

        $this->updatePageNumber(1);

        if (isset($_REQUEST['sort'])) {
            $this->updateOrderBy(strtoupper($_REQUEST['sort']));
        }

        $orderby = $this->getRealOrderBy();
        $limit = $this->getPageSize();
        $page = $this->getPageNumber();

        $items = $this->getList($_REQUEST, array(), $orderby, $limit, $page, $pagination);

	    $result = array(
	        'success' => true,
	        'items' => $this->model_sanitize($items),
	        'pagination' => $pagination
	    );

		$this->json_response($result);
	}

    function saveAction() {
        AclApi::checkPermission('accessright', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->json_response(array('success' => false, 'message' => $errors[0]));
        } else {
            $model = $this->saveform();

            $this->json_response(array('success' => true, 'data' => $this->model_sanitize($model)));
        }
    }

    function deleteAction() {
        AclApi::checkPermission('accessright', 'delete');

	    list($id) = explode('/', $_REQUEST['args']);

		$model = new AccessRightModel();
		$model->UUID = $id;

		$model->delete();

		$this->json_response($id);
	}

    function viewAction() {
	    AclApi::checkPermission('accessright', 'view');

		@list($id) = explode('/', $_REQUEST['args']);

        $model = new AccessRightModel();

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters($model, $_REQUEST);
        }

        $this->applyFilters($filters, $model);

        $model->find();

        if ($model->fetch()) {
            $this->json_response(array('success' => true, 'data' => $this->model_sanitize($model), 'title' => $model->MODULE));
        } else {
            $this->json_response(array('success' => false));
        }
	}

    function updateAction() {
	    AclApi::checkPermission('accessright', 'edit');

 		@list($id, $col, $val) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    echo json_encode(array('success' => false, 'message' => 'Parameter missing'));

		    return;
        }

        if (!empty($col)) {
            $_REQUEST[$col] = $val;
        }

		$model = new AccessRightModel();
		$model->UUID = $id;

        $updatable = false;

		foreach($_REQUEST as $key => $value) {
		    if (property_exists($model, $key) && strtoupper($key) != 'ID') {
		        $updatable = true;

    		    $value = $this->field_sanitize($key, $value);

                if (is_array($value)) {
                    $model->$key = implode(',', $value);
                } else {
                    $model->$key = trim($value);
                }
            }
		}

		if (!$updatable) {
		    echo json_encode(array('success' => false, 'message' => 'Parameter missing'));

		    return;
        }

        $this->save(array($model));

        echo json_encode(array('success' => true, 'message' => ''));
	}

	function addAction() {
 		list($id_user_group, $module, $action) = explode('/', $_REQUEST['args']);

		$success = true;
		$message = '';

		if (empty($id_user_group) || empty($module) || trim($action) == '') {
			$success = false;
			$message = 'Parameter missing';
		} else {
			$am = new AccessRightModel();

			$am->ID_USER_GROUP = $id_user_group;
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

				$am->ID_USER_GROUP = $id_user_group;
				$am->MODULE = $module;
				$am->ACTIONS = $action;

				$am->insert();
			}
		}

		echo json_encode(array('success' => $success, 'message' => $message));
	}

	function removeAction() {
 		list($id_user_group, $module, $action) = explode('/', $_REQUEST['args']);

		$success = true;
		$message = '';

		if (empty($id_user_group) || empty($module) || trim($action) == '') {
			$success = false;
			$message = 'Parameter missing';
		} else {
			$am = new AccessRightModel();

			$am->ID_USER_GROUP = $id_user_group;
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
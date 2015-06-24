<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AccessRightApi extends Api
{
	function searchAction() {
		$keyword = isset($_REQUEST['keyword'])? $_REQUEST['keyword'] : '';

		$model = new AccessRightModel();

		if (!empty($keyword)) {
			$model->whereAdd("NAME LIKE '%$keyword%'");
		}

		$model->find();

		$rows = array();
		while ($model->fetch()) {
			$rows[] = $model->NAME;
		}

		echo json_encode($rows);
	}

    function getFormData() {
		$formdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^accessright_formdata_(.*)/', $name, $matches)) {
                $formdata[$matches[1]] = $value;
            }
		}

        return $formdata;
    }

    function listAction() {
		$model = new AccessRightModel();

$model->selectAdd();
$model->selectAdd('`ACCESS_RIGHT`.*');
$model->selectAdd('A.NAME as reftext_ID_USER_GROUP');

$model->joinAdd(array('ID_USER_GROUP','USER_GROUP:ID'), 'LEFT', 'A');

		$model->find();

		$items = array();
     	while ($model->fetch()) {
     		$items[] = clone $model;
		}

		$this->model_sanitize($items);

		$this->json_response($items);
	}

    function deleteAction() {
	    list($id) = explode('/', $_REQUEST['args']);

		$model = new AccessRightModel();
		$model->ID = $id;

		$model->delete();

		$this->json_response($id);
	}

    function viewAction() {
		@list($id) = explode('/', $_REQUEST['args']);

		$model = new AccessRightModel();

$model->selectAdd();
$model->selectAdd('`ACCESS_RIGHT`.*');
$model->selectAdd('A.NAME as reftext_ID_USER_GROUP');

$model->joinAdd(array('ID_USER_GROUP','USER_GROUP:ID'), 'LEFT', 'A');

		$model->ID = $id;
		$model->find();

        $item = null;
     	if ($model->fetch()) {
    		$item = clone $model;
     	}

		$this->model_sanitize($item);

		$this->json_response($item);
	}

    function saveAction($datacheck = true) {
        $columns2edit = array('ID_USER_GROUP', 'MODULE', 'ACTIONS', 'ID');

		$formdata = $this->getFormData();

        $htmlenabledcolumns = array();

		$model = new AccessRightModel();

		foreach($formdata as $key => $value) {
		    if (!in_array($key, $columns2edit)) {
                continue;
		    }
            if (is_array($value)) {
                $model->$key = implode(',', $value);
            } else {
                $model->$key = trim($value);
            }
		}

        if ($datacheck && !$this->checkConstraints($model, $errors)) {
            $this->setMessages($errors);

    		$this->_edit(null, $model);

    		return false;
        } else {
    		if ($model->ID > 0) {
    		    $model->update();

    		    $model->_isnew = false;
            } else {
                $model->ID = null;

    		    $model->insert();

    		    $model->_isnew = true;
            }
        }

		$this->model_sanitize($model);

		$this->json_response($model);
    }

    function updateAction() {
 		list($id, $col, $val) = explode('/', $_REQUEST['args']);

		$success = true;
		$message = '';

		if (empty($id) || empty($col) || trim($val) == '') {
			$success = false;
			$message = 'Parameter missing';
		} else {
			$model = new AccessRightModel();

	        $model->$col = $val;
	        $model->whereAdd("ID = $id");

	        $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
		}

		echo json_encode(array('success' => $success, 'message' => $message));
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
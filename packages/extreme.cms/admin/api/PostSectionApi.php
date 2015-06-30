<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class PostSectionApi extends PostSectionController
{
    var $module = 'postsection';
    var $type = 'api';

	function searchAction() {
	    AclApi::checkPermission('postsection', 'list');

		$keyword = isset($_REQUEST['keyword'])? $_REQUEST['keyword'] : '';

		$model = new PostSectionModel();

		$model->selectAdd();
		$model->selectAdd('ID, TITLE');

		if (!empty($keyword)) {
			$model->whereAdd("TITLE LIKE '%$keyword%'");
		}

        $model->orderBy('TITLE');
        $model->limit(10);

		$model->find();

		$rows = array();
		while ($model->fetch()) {
			$rows[] = $model->TITLE;
		}

		echo json_encode($rows);
	}

    function listAction() {
	    AclApi::checkPermission('postsection', 'list');

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
        AclApi::checkPermission('postsection', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->json_response(array('success' => false, 'message' => $errors[0]));
        } else {
            $model = $this->saveform();

            $this->json_response(array('success' => true, 'data' => $this->model_sanitize($model)));
        }
    }

    function deleteAction() {
        AclApi::checkPermission('postsection', 'delete');

	    list($id) = explode('/', $_REQUEST['args']);

		$model = new PostSectionModel();
		$model->UUID = $id;

		$model->delete();

		$this->json_response($id);
	}

    function viewAction() {
	    AclApi::checkPermission('postsection', 'view');

		@list($id) = explode('/', $_REQUEST['args']);

        $model = new PostSectionModel();

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters($model, $_REQUEST);
        }

        $this->applyFilters($filters, $model);

        $model->find();

        if ($model->fetch()) {
            $this->json_response(array('success' => true, 'data' => $this->model_sanitize($model), 'title' => $model->TITLE));
        } else {
            $this->json_response(array('success' => false));
        }
	}

    function updateAction() {
	    AclApi::checkPermission('postsection', 'edit');

 		@list($id, $col, $val) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    echo json_encode(array('success' => false, 'message' => 'Parameter missing'));

		    return;
        }

        if (!empty($col)) {
            $_REQUEST[$col] = $val;
        }

		$model = new PostSectionModel();
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
}
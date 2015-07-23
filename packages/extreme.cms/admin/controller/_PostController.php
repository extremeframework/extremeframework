<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class _PostController extends __AppController
{
    var $module = 'post';
    var $type = 'controller';
    var $__FILE__ = __FILE__;

    public function __construct() {
        parent::__construct();

        PluginManager::do_action('post_init');
    }

    protected function checkConstraint($model, &$errors, $columns2check) {
        
       if (in_array('TITLE', $columns2check) && trim($model->TITLE) == '') {
           $errors['title'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Title'));
           return false;
       }
       if (in_array('SLUG', $columns2check) && trim($model->SLUG) == '') {
           $errors['slug'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Slug'));
           return false;
       }
       if (in_array('ID_POST_TYPE', $columns2check) && trim($model->ID_POST_TYPE) == '') {
           $errors['id-post-type'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Post type'));
           return false;
       }
       if (in_array('ID_TEMPLATE', $columns2check) && trim($model->ID_TEMPLATE) == '') {
           $errors['id-template'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Template'));
           return false;
       }
       if (in_array('EXTERNAL_LINK', $columns2check) && !empty($model->EXTERNAL_LINK) && !preg_match('/^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.?[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?/i', $model->EXTERNAL_LINK)) {
           $errors['external-link'] = sprintf(_t('L_VALIDATION_URL'), _t('External link'));
           return false;
       }
       if (in_array('NBR_VIEWS', $columns2check) && !empty($model->NBR_VIEWS) && !is_numeric($model->NBR_VIEWS)) {
           $errors['nbr-views'] = sprintf(_t('L_VALIDATION_NUMBER'), _t('# views'));
           return false;
       }


        if (!CustomFieldHelper::checkCustomFieldConstraint('post', $model, $errors)) {
            return false;
        }

        return true;
    }

    protected function checkConstraints($models, &$errors, $columns2check) {
        if (!is_array($models)) {
            $models = array($models);
        }

        foreach ($models as $model) {
			if (!$this->checkConstraint($model, $errors, $columns2check)) {
				return false;
			}
        }

        return true;
    }

    protected function handleFileUploads(&$model) {
	    if (isset($_FILES) && !empty($_FILES)) {
            foreach ($_FILES as $column => $file) {
                if (preg_match('/^post_formdata_(.*)/', $column, $matches)) {
                    $column = $matches[1];
                }

                if (!empty($file['name'])) {
                	$basename = basename($file['name']);

                	preg_match('/^(.*)(\.[a-z09]*)$/i', $basename, $matches);
                	$name = $matches[1];
                	$extension = $matches[2];

                    $rel = 'post/'.strtolower(str_replace('_', '-', $column));

                    $dir = UPLOAD_DIR."/".$rel;
                    if (!is_dir($dir)) {
                        mkdir($dir, 0777, true);
                    }

                    $uploadfile = $dir.'/'.$basename;

                    PluginManager::do_action("{$this->module}_before_upload", array($file['tmp_name'], $uploadfile));

                    if (move_uploaded_file($file['tmp_name'], $uploadfile)) {
                        $filepath = $rel."/".$basename;

                        if (in_array($column, array())) {
                            if (stripos($model->$column, $filepath) === false) {
                                $model->$column .= "|$filepath";
                            }
                        } else {
                            $model->$column = $filepath;
                        }
                    }

                    // x. Trim & resize images
                    if (in_array(strtolower($extension), array('.gif', '.jpg', '.jpeg', '.png'))) {
                        $tc = new ThumbController();

                        // Trim border white spaces
                        //$tc->trim_border_white_spaces($uploadfile, 0xEE0000);

                        // Resize
                        $width = isset($_REQUEST[$column]['width'])? intval($_REQUEST[$column]['width']) : 0;
                        $height = isset($_REQUEST[$column]['height'])? intval($_REQUEST[$column]['height']) : 0;

                        if (!($width > 0 || $height > 0) && AdminImageConfigHelper::hasImageConfig('post', $column)) {
                            $config = AdminImageConfigHelper::getImageConfig('post', $column);

                            $width = isset($config['width'])? $config['width'] : 0;
                            $height = isset($config['height'])? $config['height'] : 0;
                        }

                        if ($width > 0 || $height > 0) {
                            $tc->resize($uploadfile, $width, $height, false);
                        }
                    }

                    PluginManager::do_action("{$this->module}_after_upload", $uploadfile);
                }
            }
        }
	}

    public function getFormData() {
		$formdata = array();

        $raw = array_merge($_REQUEST, $_FILES);

		foreach ($raw as $name => $value) {
            if (preg_match('/^post_formdata_(.*)/', $name, $matches)) {
                $formdata[$matches[1]] = is_array($value)? $value : trim($value);
            }
		}

        return $formdata;
    }

    protected function getSearchFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^post_searchdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    protected function getFilterFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^post_filterdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    public function listAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        ContextStack::check2redirect('post');

        AclController::checkPermission('post', 'list');

		ContextStack::register(APPLICATION_URL.'/post/list/');
        
        $this->setPresetData(null);

		$this->_list();
	}

    public function sortAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

		list($orderby) = explode('/', $_REQUEST['args']);

        $this->updateOrderBy(strtoupper($orderby));

        if ($this->caller == 'ajax') {
            $this->_list();
        } else {
            ContextStack::back(0);
        }
    }

    public function searchAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

		$searchdata = $this->getSearchFormData();

        $this->updateSearchData($searchdata);
        $this->updateFilterData(array());

        ContextStack::back(0);
    }

    public function filterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

		$filterdata = $this->getFilterFormData();

        $this->updateFilterData($filterdata);

        ContextStack::back(0);
    }

    public function customFilterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id) && Framework::hasModule('AdminFilter')) {
            $afm = new AdminFilterModel();

            $afm->UUID = $id;
            $afm->MODULE = 'post';

            $afm->find();

            if ($afm->fetch()) {
                $this->updateCustomFilterModel($afm);

                $afcc = new AdminFilterConditionController();
                $items = $afcc->getList(true, array('ID_ADMIN_FILTER' => $afm->id()));

                $conditions = array();

                foreach ($items as $item) {
                    $field = $item->reftext_FIELD_COLUMN;
                    $operator = $item->reftext_VALUE_OPERATOR_OPERATOR;
                    $value = $item->VALUE;
                    $condition = $item->reftext_CONDITION_OPERATOR_OPERATOR;

                    if (empty($operator)) {
                        $operator = '=';
                    }

                    if (empty($condition)) {
                        $condition = 'AND';
                    }

                    if ($operator == 'like') {
                        $value = "%$value%";
                    }

                    $conditions[$condition][] = "(".TABLE_PREFIX."POST.$field $operator '$value')";
                }

                $and_or = array();

                if (isset($conditions['AND'])) {
                    $and_or[] = "(".implode(' AND ', $conditions['AND']).")";
                }

                if (isset($conditions['OR'])) {
                    $and_or[] = "(".implode(' OR ', $conditions['OR']).")";
                }

                $and_or_string = implode(' AND ', $and_or);

                $data = array('custom_filter' => $and_or_string);

                $this->updateCustomFilterData($data);
            }
        } else {
            $this->updateCustomFilterModel(null);
            $this->updateCustomFilterData(null);
        }

        ContextStack::back(0);
    }

    public function jsonSearchByTermAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        $columns2return = array('ID' => 'id', 'TITLE' => 'name');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';

		$model = new PostModel();
		if (!empty($term)) {
            $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR TITLE LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");
		}
		$model->find();

		$rows = array();
     	while ($model->fetch()) {
            $row = array();

     	    foreach ($columns2return as $column => $ascolumn) {
     	        $row[$ascolumn] = $model->$column;
     	    }

     		$rows[] = $row;
		}

        echo json_encode($rows);
    }

    public function liveSelectAction() {
        $this->liveSearchAction(true);
    }

    public function liveSearchAction($liveselect = false) {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';
        $mode = isset($_REQUEST['mode'])? $_REQUEST['mode'] : 'view';

        if (empty($term)) {
            return;
        }

		$model = new PostModel();
        $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR TITLE LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");

		$model->orderBy('TITLE');
		$model->limit(0, 10);
		$model->find();

		$rows = array();
     	while ($model->fetch()) {
     		$rows[] = array('id' => $model->UUID, 'eid' => $model->ID, 'title' => $model->TITLE);
		}

		$smarty = Framework::getSmarty(__FILE__);

		$smarty->assign('rows', $rows);
		$smarty->assign('module', 'post');
		$smarty->assign('liveselect', $liveselect);
		$smarty->assign('mode', $mode);

	    $this->display($smarty, 'livesearch.results.tpl');
    }

    public function pageAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

		@list($pagenumber) = explode('/', $_REQUEST['args']);

        $this->updatePageNumber($pagenumber);

        if ($this->caller == 'ajax') {
            $this->_list();
        } else {
            ContextStack::back(0);
        }
    }

    public function limitAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

		@list($pagesize) = explode('/', $_REQUEST['args']);

        $this->updatePageSize($pagesize);
        $this->updatePageNumber(1);

        if ($this->caller == 'ajax') {
            $this->_list();
        } else {
            ContextStack::back(0);
        }
    }

    public function delete($target_column, $target_values, &$_ids = null) {
        $_models = array();
        $_ids = array();

		$_model = new PostModel();
		$_model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');
        $_model->find();

        while ($_model->fetch()) {
            $_models[] = clone $_model;

            $_ids[] = $_model->ID;
        }

        foreach ($_models as $_model) {
            $this->onBeforeDelete($_model);
            PluginManager::do_action('post_before_delete', $_model);
        }

		$model = new PostModel();
		$model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');

		if (!AclController::hasPermission('post', 'deletepeer')) {
		    $model->whereAdd(TABLE_PREFIX."POST.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('post', $model);
		
		$model->delete();

        foreach ($_models as $_model) {
            $this->onDeleteSuccess($_model);
            PluginManager::do_action('post_deleted', $_model);
        }
    }

    public function deleteAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'delete');

	    list($id) = explode('/', $_REQUEST['args']);

        TransactionHelper::begin();

	    if (!empty($id)) {
	        $selection = array($id);
        } else {
			$selectall = isset($_REQUEST['postlist_selection_selectall']) && $_REQUEST['postlist_selection_selectall'];

			if ($selectall) {
				if (isset($_SESSION['post.list.model']) && is_object($_SESSION['post.list.model'])) {
					$model = clone $_SESSION['post.list.model'];
				} else {
		        	$model = new PostModel();
				}

				$model->find();

				$selection = array();
		        while ($model->fetch()) {
		        	$selection[] = $model->UUID;
		        }
			} else {
    			$selection = isset($_REQUEST['postlist_selection'])? $_REQUEST['postlist_selection'] : '';
			}
        }

		$relations = isset($_REQUEST['deleterelations'])? $_REQUEST['deleterelations'] : '';

		if (!empty($selection)) {
		    $this->delete('UUID', $selection, $_ids);

            if (!empty($relations)) {
                foreach ($relations as $module) {
                    switch ($module) {
                        case 'menuitem': 
                            (new MenuItemController())->delete('ID_POST', $_ids);
                            break;

                        case 'postgallery': 
                            (new PostGalleryController())->delete('ID_POST', $_ids);
                            break;

                        case 'postrelation': 
                            (new PostRelationController())->delete('ID_POST', $_ids);
                            break;

                        case 'postsection': 
                            (new PostSectionController())->delete('ID_POST', $_ids);
                            break;

                        default:
                            break;
                    }
                }
            }
        }

        TransactionHelper::end();

        ContextStack::getCurrentScreenContext($module, $action);
        if ($module != 'post' || in_array($action, array('list', 'page'))) {
		    ContextStack::back(0);
        } else {
		    ContextStack::back(1);
        }
	}

    public function newAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

		ContextStack::register(APPLICATION_URL.'/post/new/');

        $this->_edit(0);
	}

    public function viewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'view');

		@list($id, $templatecode) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new PostModel(), $_REQUEST);
        }

        if (empty($filters)) {
            $this->pagenotfound();
        }

        $model = $this->getItem($filters, false);

		if (!$model->UUID) {
		    $this->pagenotfound();
		}

		$id = $model->UUID;

        if (!empty($templatecode)) {
            $adminview = AdminViewHelper::getAdminView('post', $templatecode);

            if (empty($adminview)) {
                $this->pagenotfound();
            }

            $template = $adminview->TEMPLATE;

            $smarty = Framework::getSmarty(__FILE__);

            if (!$smarty->template_exists($template)) {
        	    $this->pagenotfound("Template not found ($template)");
        	}

            $contenttype = isset($_REQUEST['content-type'])? $_REQUEST['content-type'] : '';
            $download = isset($_REQUEST['download'])? $_REQUEST['download'] : false;

            if (!empty($contenttype)) {
                header("Content-Type: ".$contenttype."; charset=UTF-8");
                header("Expires: 0");
                header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
            }

            if ($download) {
                header("Content-Disposition: attachment;filename=$templatecode");
            }

        	$this->_view($id, null, $template);
        } else {
		    ContextStack::register(APPLICATION_URL.'/post/view/'.$id);
    		$this->_view($id);
        }
	}

    public function editAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new PostModel(), $_REQUEST);
        }

        if (empty($filters)) {
            $this->pagenotfound();
        }

        $model = $this->getItem($filters, false);

		if (!$model->UUID) {
		    $this->pagenotfound();
		}

		$id = $model->UUID;

		ContextStack::register(APPLICATION_URL.'/post/edit/'.$id);
		$this->_edit($id);
	}

    

    

    

	

    
    static function update_json($id, $property, $value) {
        $model = new PostModel();
        $model->ID = $id;

        $model->find();
        $model->fetch();

        $json = json_decode($model->JSON);

        if (empty($json)) {
            $json = new stdClass();
        }
        $json->$property = $value;

        $model->JSON = json_encode($json);
        $model->update();
    }

    static function sync_JSON_MENU_ITEMS($id) {
        $model = new MenuItemModel();
        $model->ID_POST = $id;

        $model->find();

        $items = array();

        while($model->fetch()) {
            $item = clone $model;

            $items[] = ModelHelper::sanitize($item);
        }

        PostController::update_json($id, 'MENU_ITEM', $items);
    }

    static function sync_JSON_POST_GALLERYS($id) {
        $model = new PostGalleryModel();
        $model->ID_POST = $id;

        $model->find();

        $items = array();

        while($model->fetch()) {
            $item = clone $model;

            $items[] = ModelHelper::sanitize($item);
        }

        PostController::update_json($id, 'POST_GALLERY', $items);
    }

    static function sync_JSON_POST_SECTIONS($id) {
        $model = new PostSectionModel();
        $model->ID_POST = $id;

        $model->find();

        $items = array();

        while($model->fetch()) {
            $item = clone $model;

            $items[] = ModelHelper::sanitize($item);
        }

        PostController::update_json($id, 'POST_SECTION', $items);
    }

    protected function onSaveSuccess($model) {
        
        parent::onSaveSuccess($model);
    }

    protected function onDeleteSuccess($model) {
        
        parent::onDeleteSuccess($model);
    }

    protected function formmode($prefix = null) {
        $multiple = false;

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^'.$prefix.'post_formdata_(.+)/', $name)) {
                return 'single'; // the single mode has a higher priority
            }

            if (!$multiple && preg_match('/^'.$prefix.'post_multiformdata_(.+)/', $name)) {
                $multiple = true;
            }
        }

        return $multiple? 'multiple' : 'single';
    }

    protected function field_sanitize($column, $value) {
		if ($column == 'CREATION_DATE' && !preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$/', $value)) {
            $format = DATE_FORMAT;
            $format = str_ireplace(array('yy', 'mm', 'dd'), array('Y', 'm', 'd'), $format);

            $info = date_parse_from_format($format, $value);

            if ($info['error_count'] == 0) {
                $year = substr('20'.$info['year'], -4);
                $month = substr('00'.$info['month'], -2);
                $day = substr('00'.$info['day'], -2);

                $hour = substr('00'.$info['hour'], -2);
                $minute = substr('00'.$info['minute'], -2);
                $second = substr('00'.$info['second'], -2);

                $value = "$year-$month-$day $hour:$minute:$second";
            } else {
                $value = '';
            }
        } elseif ($column == 'LATEST_UPDATE' && !preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$/', $value)) {
            $format = DATE_FORMAT;
            $format = str_ireplace(array('yy', 'mm', 'dd'), array('Y', 'm', 'd'), $format);

            $info = date_parse_from_format($format, $value);

            if ($info['error_count'] == 0) {
                $year = substr('20'.$info['year'], -4);
                $month = substr('00'.$info['month'], -2);
                $day = substr('00'.$info['day'], -2);

                $hour = substr('00'.$info['hour'], -2);
                $minute = substr('00'.$info['minute'], -2);
                $second = substr('00'.$info['second'], -2);

                $value = "$year-$month-$day $hour:$minute:$second";
            } else {
                $value = '';
            }
        }
		return $value;
	}

    protected function form2model($prefix = null, &$columns2check = null) {
        $customfieldcolumns = CustomFieldHelper::getCustomFieldColumns('post');
        $customfieldvalues = array();

        $columns2edit = array('UUID', 'TITLE', 'SLUG', 'ID_POST_TYPE', 'ID_POST_CATEGORY', 'IMAGE', 'META_KEYWORDS', 'META_DESCRIPTION', 'EXCERPT', 'CONTENT', 'TAGS', 'AUTHOR', 'EXTERNAL_LINK', 'ID_TEMPLATE', 'CREATION_DATE', 'LATEST_UPDATE', 'IS_FEATURED');
        $columns2edit = array_merge($columns2edit, $customfieldcolumns);

		$model = new PostModel();
        $matched = false;
		$columns2check = array();

		$raw = $_REQUEST;
		foreach ($_FILES as $key => $value) {
		    $raw[$key] = $value['name'];
		}

		foreach ($raw as $name => $value) {
            if (preg_match('/^'.$prefix.'post_formdata_(.*)/', $name, $matches)) {
                $matched = true;
                $key = $matches[1];

    		    if (!in_array($key, $columns2edit)) {
                    continue;
    		    }

    		    $columns2check[] = $key;
    		    $value = $this->field_sanitize($key, $value);

    		    if (in_array($key, $customfieldcolumns)) {
    		        $customfieldvalues[$key] = $value;
    		    }

    		    
            if ($key == 'EXCERPT' || $key == 'CONTENT') {
                $model->$key = trim($value);
            } else {
                if (is_array($value)) {
                    $model->$key = implode(',', $value);
                } else {
                    $model->$key = trim($value);
                }
            }
            }
		}

		if (!empty($customfieldvalues)) {
		    CustomFieldHelper::applyCustomFieldValues($model, $customfieldvalues);
		}

        if (!$matched) {
		    $model = null;
        }

        return $model;
    }

    protected function form2models($prefix = null, &$columns2check = null) {
        $columns2edit = array('UUID', 'TITLE', 'SLUG', 'ID_POST_TYPE', 'ID_POST_CATEGORY', 'IMAGE', 'META_KEYWORDS', 'META_DESCRIPTION', 'EXCERPT', 'CONTENT', 'TAGS', 'AUTHOR', 'EXTERNAL_LINK', 'ID_TEMPLATE', 'CREATION_DATE', 'LATEST_UPDATE', 'IS_FEATURED');
        $columns2edit = array_merge($columns2edit, CustomFieldHelper::getCustomFieldColumns('post'));

        $rows = array();
		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^'.$prefix.'post_multiformdata_(.+)/', $name, $matches)) {
                $column = $matches[1];
    		    if (!in_array($column, $columns2edit)) {
                    continue;
    		    }

                $value = array_values($value);

                foreach ($value as $k => $v) {
                    $rows[$k][$column] = trim($v);
                }
            }
		}

        $models = array();

		foreach ($rows as $row) {
            $model = new PostModel();

		    foreach ($row as $column => $value) {
		    	$value = $this->field_sanitize($column, $value);
                $model->$column = $value;
		    }

            $models[] = $model;
		}

		$columns2check = array();

		foreach ($rows as $row) {
		    foreach ($row as $column => $value) {
		    	$columns2check[] = $column;
		    }

            break;
		}

		return $models;
    }

    protected function checkform(&$errors, $prefix = null) {
        $formmode = $this->formmode($prefix);

        if ($formmode == 'multiple') {
            $models = $this->form2models($prefix, $columns2check);

            $result = $this->checkConstraints($models, $errors, $columns2check);
        } else {
            $model = $this->form2model($prefix, $columns2check);

            $result = $this->checkConstraints($model, $errors, $columns2check);
        }

        return $result;
    }

    protected function saveform($prefix = null, $refobject = null) {
        $formmode = $this->formmode($prefix);

        TransactionHelper::begin();

        if ($formmode == 'multiple') {
            $models = $this->form2models($prefix);

            $result = $this->save($models, $refobject);

            $deleteditems = isset($_REQUEST[$prefix.'post_multiformdata_deleteditems'])? $_REQUEST[$prefix.'post_multiformdata_deleteditems'] : '';
            $deleteditems = explode(',', trim($deleteditems, ','));

    		if (!empty($deleteditems)) {
                $_models = array();

        		$_model = new PostModel();
        		$_model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');
                $_model->find();

                while ($_model->fetch()) {
                    $_models[] = clone $_model;
                }

                foreach ($_models as $_model) {
                    $this->onBeforeDelete($_model);
                    PluginManager::do_action('post_before_delete', $_model);
                }

        		$model = new PostModel();
        		$model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');

        		$model->delete();

                foreach ($_models as $_model) {
                    $this->onDeleteSuccess($_model);
                    PluginManager::do_action('post_deleted', $_model);
                }
            }
        } else {
            $model = $this->form2model($prefix);

            $this->handleFileUploads($model);

            $result = $this->save(array($model), $refobject);
        }

        TransactionHelper::end();

        return $result;
    }

    protected function save($models = array(), $refobject = null) {
        if (!is_array($models)) {
            $models = array($models);
        }

        foreach ($models as $model) {
            CustomFieldHelper::updateCustomFieldValues('post', $model);
            
            $this->bind2refobject($model, $refobject);
            $this->onBeforeSave($model);
            PluginManager::do_action('post_before_save', $model);

    		if ($model->UUID) {
				$model->LATEST_UPDATE = date('Y-m-d H:i:s');
				$old = new PostModel();
				$old->UUID = $model->UUID;
				$old->find();
				$old->fetch();

                $this->onBeforeUpdate($model, $old);
                PluginManager::do_action('post_before_update', $model, $old);

        		if (!AclController::hasPermission('post', 'editpeer')) {
        		    $model->whereAdd(TABLE_PREFIX."POST.UUID = '".$model->UUID."' AND ".TABLE_PREFIX."POST.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		} else {
        		    $model->whereAdd(TABLE_PREFIX."POST.UUID = '".$model->UUID."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		}

    		    //$model->find();
    		    //$model->fetch();
    		    $model->_isnew = false;
    		    $this->onUpdateSuccess($model, $old);
    		    PluginManager::do_action('post_updated', $model, $old);
            } else {
                $model->ID = null;
                $model->CREATION_DATE = date('Y-m-d H:i:s');
                $model->LATEST_UPDATE = date('Y-m-d H:i:s');
                $this->onBeforeInsert($model);
                PluginManager::do_action('post_before_create', $model);

    		    $model->insert();
    		    $model->_isnew = true;

    		    $this->onInsertSuccess($model);
    		    PluginManager::do_action('post_created', $model);
            }

            $this->onSaveSuccess($model);
        }

        DraftHelper::clearAllDrafts('post');

        if (count($models) == 1) {
            return $model;
        }

        return true;
    }

    protected function bind2refobject(&$model, $refobject = null) {
        if ($refobject != null) {
            $refclass = get_class($refobject);
            
            if ($refclass == 'PostTypeModel' && empty($model->ID_POST_TYPE)) {
                $model->ID_POST_TYPE = $refobject->CODE;
            }
            if ($refclass == 'PostCategoryModel' && empty($model->ID_POST_CATEGORY)) {
                $model->ID_POST_CATEGORY = $refobject->ID;
            }
            if ($refclass == 'TemplateModel' && empty($model->ID_TEMPLATE)) {
                $model->ID_TEMPLATE = $refobject->CODE;
            }

        }
    }

    public function saveDraftAction() {
        LicenseController::enforceLicenseCheck('post');

        $formdata = $this->getFormData();

        DraftHelper::saveDraft('post', isset($formdata['UUID'])? $formdata['UUID'] : '', $formdata);
    }

    public function saveAction($datacheck = true, $addmore = false) {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 0;
        $otherhandlers = isset($_REQUEST['otherhandlers'])? $_REQUEST['otherhandlers'] : array();
        $viewtype = isset($_REQUEST['view-type'])? $_REQUEST['view-type'] : 'edit';

        // x. Check form
        $errors = null;
        if ($datacheck) {
            if ($this->checkform($errors)) {
                foreach ($otherhandlers as $prefix => $name) {
                    $classname = $name.'Controller';
                    $handler = new $classname();

                    if (!$handler->checkform($errors, $prefix)) {
                        break;
                    }
                }
            }
        }

        // x. Save form
        if (!empty($errors)) {
	        $formmode = $this->formmode();

            $this->setMessages($errors);

	        if ($formmode == 'single') {
	            $this->_edit(null, $this->form2model(), "$viewtype.post.tpl");
			} else {
				ContextStack::back(0);
			}
        } else {
            $model = $this->saveform();

            foreach ($otherhandlers as $prefix => $name) {
                $classname = $name.'Controller';
                $handler = new $classname();

                $handler->saveform($prefix, $model);
            }
            
            
            if ($this->source != 'modal') {
                if ($addmore) {
                    $this->newAction();
                } else {
                    ContextStack::back($back);
                }
            }
        }
    }

    public function saveAddNewAction() {
		$this->saveAction(true, true);
    }

    public function importAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'import');

        if (isset($_FILES['post_importfile'])) {
        	if (!$_FILES['post_importfile']['error']) {
	            $filepath = $_FILES['post_importfile']['tmp_name'];
        		$original = $_FILES['post_importfile']['name'];

                TransactionHelper::begin();

                if (preg_match('/(\.zip)$/i', $original)) {
                    $error = $this->performZipImport($filepath, $original);
                } else {
	    		    $error = $this->performImport($filepath, $original);
                }

                if (!empty($error)) {
                    TransactionHelper::rollbackTransaction();
                } else {
                    TransactionHelper::end();
                }

	            if (!empty($error)) {
	                $this->setMessages(array($error));
	        		$this->_import();
	            } else {
	        		ContextStack::back(1);
	            }
			} else {
			    $post_max_size = ini_get('post_max_size');
			    $upload_max_filesize = ini_get('upload_max_filesize');

                $this->setMessages(array("File upload failed (upload max filesize = $upload_max_filesize, post max size = $post_max_size)"));
        		$this->_import();
			}
        } else {
    		ContextStack::register(APPLICATION_URL.'/post/import/');
    		$this->_import();
        }
    }

    protected function performZipImport($filepath, $original) {
        $zip = new ZipArchive;

        $res = $zip->open($filepath);

        if ($res === FALSE) {
            return "Cannot open the input file";
        }

        $tempdir = $this->truepath(UPLOAD_DIR.'/'.uniqid());
        mkdir($tempdir, 0777);

        $zip->extractTo($tempdir);
        $zip->close();

        $dir = opendir($tempdir);
        while(false !== ( $file = readdir($dir)) ) {
            if (( $file != '.' ) && ( $file != '..' )) {
                $this->performImport($tempdir.'/'.$file, basename($file));
            }
        }
        closedir($dir);
    }

    protected function performImport($filepath, $original) {
		$is_excel = preg_match('/(\.xls|\.xlsx)$/i', $original);

    	if ($is_excel) {
    		$this->_importxls($filepath, $error);
    	} else {
    	    $this->_importcsv($filepath, $error);
    	}

        return $error;
    }

    public function exportAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

    	set_time_limit(0);

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');

        $columns2export = array('TITLE','SLUG','ID_POST_TYPE','ID_POST_CATEGORY','IMAGE','META_KEYWORDS','META_DESCRIPTION','EXCERPT','CONTENT','TAGS','AUTHOR','EXTERNAL_LINK','ID_TEMPLATE','CREATION_DATE','LATEST_UPDATE','IS_FEATURED','NBR_VIEWS');

        $header = '';
        $isref = array();
 	    foreach ($columns2export as $i => $column) {
 	        $header .= ($i? CSV_SEPARATOR : '').$this->_encodecsv($column);

 	        $isref[$column] = preg_match('/^id_|_id_|_id$/i', $column);
        }

		if (empty($preset) && empty($presetvalue) && isset($_SESSION['post.list.model']) && is_object($_SESSION['post.list.model'])) {
			$model = clone $_SESSION['post.list.model'];
		} else {
        	$model = new PostModel();
		}

        $vars = array_keys(get_object_vars($model));

        if (in_array($preset, $vars)) {
            $model->whereAdd(TABLE_PREFIX."POST.$preset = '$presetvalue'");
        } elseif (preg_match('/(.*)___(.*)/is', $preset, $matches)) {
            $reftable = $matches[1];
            $refcolumn = $matches[2];

            $classname = str_replace(' ', '', ucwords(str_replace('_', ' ', strtolower($reftable)))).'Model';
            $model->joinAdd(new $classname());

            $model->whereAdd(TABLE_PREFIX."$reftable.$refcolumn = '$presetvalue'");
        }

        $model->find();

    	$splitsize = isset($_REQUEST['splitsize'])? intval($_REQUEST['splitsize']) : '';

    	if ($splitsize && $splitsize < 100) {
    		$splitsize = 100;
    	}

		if (!$splitsize || $model->N < $splitsize) {
	        $filename = 'post_'.date('Ymd').'.csv';

	        header("Content-type: application/csv");
	        header("Content-Disposition: attachment; filename=".$filename);
	        header("Pragma: no-cache");
	        header("Expires: 0");

			echo $header."\n";

	        while ($model->fetch()) {
	     	    foreach ($columns2export as $i => $column) {
	     	        if ($isref[$column]) {
	     	            if (isset($model->{'reftext_'.$column})) {
	     	                $cell = $model->{'reftext_'.$column};
	     	            } else {
    	     	            $cell = $this->_refval2label($column, $model->$column);
	     	            }
	     	        } else {
	         	        $cell = $model->$column;
	     	        }
	     	        echo ($i? CSV_SEPARATOR : '').$this->_encodecsv($cell);
	            }
	            echo "\n";
	        }

		    exit;
		} else {
	    	$count = ceil($model->N / $splitsize);
			$pad_length = $count >= 100? 3 : ($count >= 10? 2 : 1);

	    	$filenumber = 1;
			$current_file_size = 0;

			$filepaths = array();

	        while ($model->fetch()) {
	        	$filepath = UPLOAD_DIR.'/post_'.date('Ymd').'_part_'.str_pad($filenumber, $pad_length, '0', STR_PAD_LEFT).'.csv';

				if (!in_array($filepath, $filepaths)) {
	        		$filepaths[] = $filepath;
				}

	        	if ($current_file_size == 0) {
	        		file_put_contents($filepath, $header."\n");
	        	}

				$line = '';

	     	    foreach ($columns2export as $i => $column) {
	     	        if ($isref[$column]) {
	     	            if (isset($model->{'reftext_'.$column})) {
	     	                $cell = $model->{'reftext_'.$column};
	     	            } else {
    	     	            $cell = $this->_refval2label($column, $model->$column);
	     	            }
	     	        } else {
	         	        $cell = $model->$column;
	     	        }

	     	        $line .= ($i? CSV_SEPARATOR : '').$this->_encodecsv($cell);
	            }

	            file_put_contents($filepath, $line."\n", FILE_APPEND);

	            $current_file_size += 1;

	            if ($current_file_size == $splitsize) {
	            	$filenumber += 1;

					$current_file_size = 0;
	            }
	        }

	        // Compress the files
			$zip = new ZipArchive();

	        $zipfile = UPLOAD_DIR.'/post_'.date('Ymd').'.zip';

			if ($zip->open($zipfile, ZIPARCHIVE::CREATE) !== true) {
		  		die('ERROR: Cannot create file');
			}

			foreach($filepaths as $filepath) {
				$zip->addFile($filepath, basename($filepath));
			}

			$zip->close();

			// Delete the files
			foreach($filepaths as $filepath) {
				unlink($filepath);
			}

			// Output
	        header("Content-type: application/zip");
	        header("Content-Disposition: attachment; filename=".basename($zipfile));
	        header("Content-Transfer-Encoding: binary");
	        header("Content-Length: ".filesize($zipfile));
	        header("Pragma: no-cache");
	        header("Expires: 0");

			ob_clean();
		    flush();
	        readfile($zipfile);
	        unlink($zipfile);

		    exit;
		}
    }

    public function exportXlsAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

    	set_time_limit(0);

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');

        $columns2export = array('TITLE','SLUG','ID_POST_TYPE','ID_POST_CATEGORY','IMAGE','META_KEYWORDS','META_DESCRIPTION','EXCERPT','CONTENT','TAGS','AUTHOR','EXTERNAL_LINK','ID_TEMPLATE','CREATION_DATE','LATEST_UPDATE','IS_FEATURED','NBR_VIEWS');
        $filename = 'post_'.date('Ymd').'.xls';

		set_include_path(implode(PATH_SEPARATOR, array(dirname(__FILE__).'/../library/PEAR/', get_include_path())));

		require_once ('Spreadsheet/Excel/Writer.php');

		$workbook = new Spreadsheet_Excel_Writer();

		// Support UTF-8
		$workbook->setVersion(8);

		// Sending HTTP headers
		$workbook->send($filename);

		// Creating a worksheet
		$worksheet =& $workbook->addWorksheet('Post');

		// Support UTF-8
		$worksheet->setInputEncoding('utf-8');

		// Header row
        $isref = array();
 	    foreach ($columns2export as $j => $column) {
 	        $isref[$column] = preg_match('/^id_|_id_|_id$/i', $column);

			$worksheet->write(0, $j, $column);
        }

		// Data rows

		if (empty($preset) && empty($presetvalue) && isset($_SESSION['post.list.model']) && is_object($_SESSION['post.list.model'])) {
			$model = clone $_SESSION['post.list.model'];
		} else {
        	$model = new PostModel();
		}

        $vars = array_keys(get_object_vars($model));

        if (in_array($preset, $vars)) {
            $model->whereAdd(TABLE_PREFIX."POST.$preset = '$presetvalue'");
        } elseif (preg_match('/(.*)___(.*)/is', $preset, $matches)) {
            $reftable = $matches[1];
            $refcolumn = $matches[2];

            $classname = str_replace(' ', '', ucwords(str_replace('_', ' ', strtolower($reftable)))).'Model';
            $model->joinAdd(new $classname());

            $model->whereAdd(TABLE_PREFIX."$reftable.$refcolumn = '$presetvalue'");
        }

        $model->find();

		$rowcount = 1;

        while ($model->fetch()) {
     	    foreach ($columns2export as $j => $column) {
     	        if ($isref[$column]) {
     	            if (isset($model->{'reftext_'.$column})) {
     	                $cell = $model->{'reftext_'.$column};
     	            } else {
	     	            $cell = $this->_refval2label($column, $model->$column);
     	            }
     	        } else {
         	        $cell = $model->$column;
     	        }

				$worksheet->write($rowcount, $j, $cell);
            }

			$rowcount += 1;
        }

		// Let's send the file
		$workbook->close();
    }

    function _save($datacheck = true) {
	    $model = $this->form2model();

        $this->handleFileUploads($model);
        if ($datacheck && !$this->checkConstraints($model, $errors)) {
            $this->setMessages($errors);

    		$this->_edit(null, $model);

    		return false;
        } else {
    		if ($model->UUID) {
    		    $model->LATEST_UPDATE = date('Y-m-d H:i:s');
    		    $model->update();

    		    $model->_isnew = false;
            } else {
                $model->CREATION_DATE = date('Y-m-d H:i:s');
                $model->LATEST_UPDATE = date('Y-m-d H:i:s');
    		    $model->insert();

    		    $model->_isnew = true;
            }
        }

        return $model;
	}

    public function updateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

		list($id, $col, $val) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$model = new PostModel();

        $model->$col = $val;
        $model->whereAdd("UUID = $id");
        $model->update(DB_DATAOBJECT_WHEREADD_ONLY);

		ContextStack::back(0);
	}

    public function cancelAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        $returnurl = isset($_REQUEST['return'])? $_REQUEST['return'] : '';
        
        DraftHelper::clearAllDrafts('post');
        
        
		ContextStack::back($back, $returnurl);
	}

    public function closeAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        $returnurl = isset($_REQUEST['return'])? $_REQUEST['return'] : '';
        
        DraftHelper::clearAllDrafts('post');
        
		ContextStack::back($back, $returnurl);
	}

    public function quickCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

		$this->_edit(0, null, 'quick-create.post.tpl', false);
    }

    public function preCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

		$this->_edit(0, null, 'pre-create.post.tpl', false);
    }

    public function rowNewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

		$this->_edit(0, null, 'row-edit.post.tpl', false);
    }

    public function rowEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-edit.post.tpl', false);
    }

    public function rowExpandedEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-expanded-edit.post.tpl', false);
    }

    public function rowViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-view.post.tpl');
    }

    public function rowSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-edit.post.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-view.post.tpl');
        }
    }

    public function rowExpandedSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-expanded-edit.post.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-expanded.post.tpl');
        }
    }

    public function rowExpandedViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-expanded.post.tpl');
    }

    public function fieldSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('post');

        AclController::checkPermission('post', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            echo json_encode(array('success' => false, 'message' => $errors[0]));
        } else {
            $model = $this->saveform();
            echo json_encode(array('success' => true, 'message' => ''));
        }
    }

    protected function getCustomFilterColumns($module, &$filter = null) {
        if (!Framework::hasModule('AdminFilter')) {
            return array('TITLE', 'IMAGE', 'ID_POST_CATEGORY', 'ID_TEMPLATE');
        }

        $filter = $this->getCustomFilterModel($module);

        if ($filter == null || empty($filter->COLUMNS)) {
            $filter = new AdminFilterModel();

            $filter->IS_DEFAULT = 1;
            $filter->MODULE = $module;

            $filter->find();
            $filter->fetch();

            $this->updateCustomFilterModel($filter, $module);
        }

        return !empty($filter->COLUMNS)? explode(',', $filter->COLUMNS) : array();
    }

    protected function initCustomView(&$customview, &$customtemplate) {
        if (!Framework::hasModule('AdminView')) {
            return;
        }

        if (isset($_REQUEST['customview'])) {
            $_SESSION['post.customview'] = $_REQUEST['customview'];
        }

        $customview = isset($_SESSION['post.customview'])? $_SESSION['post.customview'] : '';

        if (!empty($customview)) {
            $avm = new AdminViewModel();

            $avm->UUID = $customview;
            $avm->find();

            if ($avm->fetch()) {
                $customtemplate = $avm->TPL;
            }
        }
    }

    protected function _list() {
        $filtercolumns = $this->getCustomFilterColumns('post', $filter);

        $aclviewablecolumns = AclController::getAclEnabledColumns('post', 'view');

        if (empty($aclviewablecolumns) || (!isset($aclviewablecolumns['*']) && !in_array(true, $aclviewablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $excludedcolumns = AclController::getSystemExcludedColumns('post');
        
        $presetdata = $this->getPresetData();
        $searchdata = $this->getSearchData();
        $filterdata = $this->getFilterData();
        $customfilterdata = $this->getCustomFilterData();
        $orderby = $this->getRealOrderBy('ID');
        $limit = $this->getPageSize();
        $page = $this->getPageNumber();

        $rows = $this->getList(true, $searchdata + $customfilterdata + $presetdata, $filterdata, $orderby, $limit, $page, $pagination);
        

        $ids = array();
        foreach ($rows as $row) {
            $ids[] = $row->UUID;
        }
        $_SESSION['post.list.ids'] = $ids;

        $total = $pagination['total'];
        $page = $pagination['page'];
        $limit = $pagination['pagesize'];
        $limit_from = $pagination['from'];
        $limit_to = $pagination['to'];

        $pagination = new Pagination($pagination['total'], ($pagination['page']-1)*$pagination['pagesize'], $pagination['pagesize']);
        $pagination = $pagination->getPageLinks();

        $this->initPlugins();

        $this->initCustomView($customview, $customtemplate);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('rows', $rows);
		$smarty->assign('pagination', $pagination);
        $smarty->assign('total', $total);
		$smarty->assign('limit', $limit);
		$smarty->assign('limit_from', $limit_from);
		$smarty->assign('limit_to', $limit_to);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'post');
		$smarty->assign('filter', $filter);
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getListCustomFields('post'));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('formdata', $searchdata);
		$smarty->assign('searchdata', $searchdata);
		$smarty->assign('additional_list_buttons', $this->setupAdditionalListButtons());
		$smarty->assign('admin_list_actions', AdminActionHelper::getAdminActions('post', 'list'));
		$smarty->assign('admin_listitem_actions', AdminActionHelper::getAdminActions('post', 'listitem'));
		$smarty->assign('customview', $customview);
		$smarty->assign('customtemplate', $customtemplate);
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('post', 'view'));
		

        $templatetype = !empty($this->templatetype)? $this->templatetype : 'list';
	    $this->display($smarty, $templatetype.'.post.tpl');
    }

    protected function _view($id, $details = null, $templatecode = 'view.post.tpl') {
        $filtercolumns = $this->getCustomFilterColumns('post');

        $aclviewablecolumns = AclController::getAclEnabledColumns('post', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('post', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('post', 'new');
        }

        if (empty($aclviewablecolumns) || (!isset($aclviewablecolumns['*']) && !in_array(true, $aclviewablecolumns))) {
            $this->pagenotfound('No view available');
        }

        if (empty($details)) {
            $model = $this->getItem($id, true);

         	if ($model) {
        		$details = $model;
         	} else {
    		    $this->pagenotfound();
         	}
        }

        $excludedcolumns = AclController::getSystemExcludedColumns('post');

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');
        if (!empty($preset)) {
            $aclviewablecolumns[$preset] = false;
        }

        $ids = isset($_SESSION['post.list.ids'])? $_SESSION['post.list.ids'] : array();
        $key = array_search($details->UUID, $ids);
        $previd = isset($ids[$key - 1])? $ids[$key - 1] : 0;
        $nextid = isset($ids[$key + 1])? $ids[$key + 1] : 0;

        $this->setupAdditionalData($details);

        $this->initPlugins();

        $this->onBeforeView($details);
        PluginManager::do_action('post_before_view', $details);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('previd', $previd);
		$smarty->assign('nextid', $nextid);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'post');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('post', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('currentvalue', $details->UUID);
		$smarty->assign('additional_view_fields', $this->setupAdditionalViewFields($details));
		$smarty->assign('additional_view_buttons', $this->setupAdditionalViewButtons($details));
		$smarty->assign('admin_view_actions', AdminActionHelper::getAdminActions('post', 'view'));
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('post', 'view'));
        $smarty->assign('readonly', isset($_REQUEST['readonly']) && $_REQUEST['readonly']);

	    $this->display($smarty, $templatecode);

        $this->onViewSuccess($details);
        PluginManager::do_action('post_viewed', $details);
	}

    protected function _edit($id, $details = null, $templatecode = 'edit.post.tpl', $restoredraft = true) {
        $filtercolumns = $this->getCustomFilterColumns('post');

        $aclviewablecolumns = AclController::getAclEnabledColumns('post', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('post', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('post', 'new');
        }

        if (empty($acleditablecolumns) || (!isset($acleditablecolumns['*']) && !in_array(true, $acleditablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $acleditablecolumns['UUID'] = true;

        $excludedcolumns = AclController::getSystemExcludedColumns('post');

        $roweditablecolumns = array('TITLE', 'ID_POST_TYPE', 'ID_POST_CATEGORY', 'META_KEYWORDS', 'AUTHOR', 'ID_TEMPLATE', 'CREATION_DATE', 'LATEST_UPDATE', 'IS_FEATURED', 'NBR_VIEWS');

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');

        $presets = !empty($preset)? explode(',', $preset) : array();
        $presetvalues = !empty($presetvalue)? explode(',', $presetvalue) : array();

        foreach ($_REQUEST as $param => $value) {
            if (preg_match('/^preset_(.*)/i', $param, $match)) {
                $presets[] = $match[1];
                $presetvalues[] = $value;
            }
        }

        $presetparams = array();
        foreach ($presets as $i => $column) {
            $presetparams[$column] = $presetvalues[$i];

            $aclviewablecolumns[$column] = false;
            $acleditablecolumns[$column] = false;
        }

        

        if (empty($details)) {
    		$model = new PostModel();

            if ($id) {
                $model = $this->getItem($id, true);

             	if (!$model) {
        		    $this->pagenotfound();
             	}

                if ($model->GUID != $_SESSION['user']->ID) {
             	    AclController::checkPermission('post', 'editpeer');
                }
            } else {
                // Set default values here
                
                $this->onInitialization($model);
                PluginManager::do_action('post_new', $model);
            }
            
            if ($restoredraft) {
                DraftHelper::tryRestoreDraft('post', $model->UUID, $model);
            }
            
    		$details = $model;
        }

        if (!$details->UUID) {
            foreach ($presetparams as $column => $value) {
                $details->$column = $value;
            }
        }

        

        WorkflowHelper::ensureEditable($details->WFID);
        
        $this->initPlugins();

        $this->onBeforeEdit($details);
        PluginManager::do_action('post_before_edit', $details);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('preset', $preset);
		$smarty->assign('presetvalue', $presetvalue);
		$smarty->assign('presetparams', $presetparams);
		
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'post');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('post', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('columntooltips', FieldHelper::getColumnTooltips('post'));
		$smarty->assign('roweditablecolumns', $roweditablecolumns);
        $smarty->assign('fielddependencies', FieldHelper::getFieldDependencies('post'));

	    $this->display($smarty, $templatecode);
	}

    protected function getLayoutColumns() {
        return array('TITLE', 'SLUG', 'ID_POST_TYPE', 'ID_POST_CATEGORY', 'IMAGE', 'META_KEYWORDS', 'META_DESCRIPTION', 'EXCERPT', 'CONTENT', 'TAGS', 'AUTHOR', 'EXTERNAL_LINK', 'ID_TEMPLATE', 'CREATION_DATE', 'LATEST_UPDATE', 'IS_FEATURED', 'NBR_VIEWS');
    }

    public function getItem($id_or_filters, $join = false, $check_acl = true, $additional_select_fields = '') {
		$model = new PostModel();

        $this->initViewModel($model, $join);

        if (!empty($additional_select_fields)) {
            $model->selectAdd($additional_select_fields);
        }

        if (is_array($id_or_filters)) {
            $this->applyFilters($id_or_filters, $model);
        } else {
		    $model->UUID = $id_or_filters;
        }

		if ($check_acl && !AclController::hasPermission('post', 'viewpeer')) {
		    // UDID: 0 - public
		    $model->whereAdd(TABLE_PREFIX."POST.UDID = 0 OR ".TABLE_PREFIX."POST.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('post', $model);

		$model->find();

        $item = null;
     	if ($model->fetch()) {
		    PostController::setupAdditionalData($model);

    		$item = clone $model;
     	}

        return $item;
	}

    public function getItemById($id, $join = false, $check_acl = true, $additional_select_fields = '') {
        return $this->getItem(array('ID' => $id), $join, $check_acl, $additional_select_fields);
    }

    public function getList($join = false, $filters = array(), $aftersearchfilters = array(), $orderby = 'ID DESC', $limit = 0, $page = 0, &$pagination = null, $checkguid = true, $additional_wheres = array()) {
		$model = new PostModel();

        $this->initListModel($model, $join);

        $this->enforceObjectAclCheck('post', $model);

        if (!empty($additional_wheres)) {
            foreach ($additional_wheres as $where) {
                $model->whereAdd($where);
            }
        }

        $this->applyFilters($filters, $model);

		$_SESSION['post.list.model'] = clone $model;

		$this->applyFilters($aftersearchfilters, $model);

        $model->orderBy($orderby);

		if ($limit == '*' || $limit <= 0 || $limit > 500) {
			$limit = 500;
		}

        if ($limit != '*') {
    		$model->find();
    		$total = $model->N;

            if (($page-1)*$limit >= $total) {
                $page = floor($total/$limit) + 1;
            }

		    $model->limit(($page-1)*$limit, $limit);
            $model->find();

            $curtotal = $model->N;

            $limit_from = ($page-1)*$limit + 1;
            $limit_to = $limit_from + $curtotal - 1;
        } else {
    		$pagination = null;

            $model->find();
    		$total = $model->N;

    		$curtotal = $model->N;

            $limit_from = 1;
            $limit_to = $curtotal;
        }

		$items = array();
     	while ($model->fetch()) {
		    $this->setupAdditionalData($model);

     		$items[] = clone $model;
		}

        $pagination = array(
            'from' => $limit_from,
            'to' => $limit_to,
            'total' => $total,
            'page' => $page,
            'pagesize' => $limit
        );

        return $items;
    }

    protected function applyFilters($filters, &$model) {
        foreach($filters as $key => $value) {
            $value = trim($value);

            if ($value != '') {
                switch ($key) {
                    case '__QUICKSEARCH__':
                        $this->setupQuickSearchModel($model, StringHelper::htmlspecialchars($value));

                        break;

                    case 'TITLE':
                        $model->whereAdd(TABLE_PREFIX."POST.TITLE LIKE '%".$model->escape(StringHelper::htmlspecialchars($value))."%'");

                        break;

                    case 'ID_POST_TYPE':
                        if ($value == '__NULL__') {
                            $model->whereAdd(TABLE_PREFIX."POST.ID_POST_TYPE IS NULL");
                        } else {
                            $model->whereAdd(TABLE_PREFIX."POST.ID_POST_TYPE = '$value'");
                        }

                        break;

                    case 'ID_POST_CATEGORY':
                        if ($value == '__NULL__') {
                            $model->whereAdd(TABLE_PREFIX."POST.ID_POST_CATEGORY IS NULL");
                        } else {
                            $model->whereAdd(TABLE_PREFIX."POST.ID_POST_CATEGORY = '$value'");
                        }

                        break;

                    case 'ID_TEMPLATE':
                        if ($value == '__NULL__') {
                            $model->whereAdd(TABLE_PREFIX."POST.ID_TEMPLATE IS NULL");
                        } else {
                            $model->whereAdd(TABLE_PREFIX."POST.ID_TEMPLATE = '$value'");
                        }

                        break;

                    case 'CREATION_DATE__FROM':
                        $model->whereAdd(TABLE_PREFIX."POST.CREATION_DATE >= '".$this->field_sanitize('CREATION_DATE', $value)."'");

                        break;

                    case 'CREATION_DATE__TO':
                        $model->whereAdd(TABLE_PREFIX."POST.CREATION_DATE IS NULL OR ".TABLE_PREFIX."POST.CREATION_DATE <= '".$this->field_sanitize('CREATION_DATE', $value)."')");

                        break;

                    case 'LATEST_UPDATE__FROM':
                        $model->whereAdd(TABLE_PREFIX."POST.LATEST_UPDATE >= '".$this->field_sanitize('LATEST_UPDATE', $value)."'");

                        break;

                    case 'LATEST_UPDATE__TO':
                        $model->whereAdd(TABLE_PREFIX."POST.LATEST_UPDATE IS NULL OR ".TABLE_PREFIX."POST.LATEST_UPDATE <= '".$this->field_sanitize('LATEST_UPDATE', $value)."')");

                        break;

                    case 'NBR_VIEWS__FROM':
                        $model->whereAdd(TABLE_PREFIX."POST.NBR_VIEWS >= '".$this->field_sanitize('NBR_VIEWS', $value)."'");

                        break;

                    case 'NBR_VIEWS__TO':
                        $model->whereAdd(TABLE_PREFIX."POST.NBR_VIEWS IS NULL OR ".TABLE_PREFIX."POST.NBR_VIEWS <= '".$this->field_sanitize('NBR_VIEWS', $value)."')");

                        break;

                    default:
                        if (preg_match('/^custom.*/i', $key)) {
                            $model->whereAdd($value);
                        } else {
                            if (property_exists($model, $key)) {
                                if ($value == '__EMPTY__') {
                                    $model->whereAdd(TABLE_PREFIX."POST.$key IS NULL OR ".TABLE_PREFIX.".POST.$key = ''");
                                } else {
                                    $model->whereAdd(TABLE_PREFIX."POST.$key = '".$model->escape($value)."'");
                                }
                            }
                        }

                        break;
                }
            }
        }
    }

    protected function initViewModel(&$model, $join = false) {
        $model->selectAdd();
        $model->selectAdd('`'.TABLE_PREFIX.'POST`.TITLE, `'.TABLE_PREFIX.'POST`.SLUG, `'.TABLE_PREFIX.'POST`.ID_POST_TYPE, `'.TABLE_PREFIX.'POST`.ID_POST_CATEGORY, `'.TABLE_PREFIX.'POST`.IMAGE, `'.TABLE_PREFIX.'POST`.META_KEYWORDS, `'.TABLE_PREFIX.'POST`.META_DESCRIPTION, `'.TABLE_PREFIX.'POST`.EXCERPT, `'.TABLE_PREFIX.'POST`.CONTENT, `'.TABLE_PREFIX.'POST`.TAGS, `'.TABLE_PREFIX.'POST`.AUTHOR, `'.TABLE_PREFIX.'POST`.EXTERNAL_LINK, `'.TABLE_PREFIX.'POST`.ID_TEMPLATE, `'.TABLE_PREFIX.'POST`.CREATION_DATE, `'.TABLE_PREFIX.'POST`.LATEST_UPDATE, `'.TABLE_PREFIX.'POST`.IS_FEATURED, `'.TABLE_PREFIX.'POST`.NBR_VIEWS, `'.TABLE_PREFIX.'POST`.ID, `'.TABLE_PREFIX.'POST`.JSON, `'.TABLE_PREFIX.'POST`.UUID, `'.TABLE_PREFIX.'POST`.WFID');
    
        if ($join) {
            if (Framework::hasModule('PostType')) {
                $model->selectAdd('reftable_ID_POST_TYPE.NAME as reftext_ID_POST_TYPE');
                $model->selectAdd('reftable_ID_POST_TYPE.UUID as refuuid_ID_POST_TYPE');
            }
            if (Framework::hasModule('PostCategory')) {
                $model->selectAdd('reftable_ID_POST_CATEGORY.NAME as reftext_ID_POST_CATEGORY');
                $model->selectAdd('reftable_ID_POST_CATEGORY.UUID as refuuid_ID_POST_CATEGORY');
            }
            if (Framework::hasModule('Template')) {
                $model->selectAdd('reftable_ID_TEMPLATE.NAME as reftext_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.UUID as refuuid_ID_TEMPLATE');
            }
        }
    
        if ($join) {
            if (Framework::hasModule('PostType')) {
                $model->joinAdd(array('ID_POST_TYPE',TABLE_PREFIX.'POST_TYPE:CODE'), 'LEFT', 'reftable_ID_POST_TYPE');
            }
            if (Framework::hasModule('PostCategory')) {
                $model->joinAdd(array('ID_POST_CATEGORY',TABLE_PREFIX.'POST_CATEGORY:ID'), 'LEFT', 'reftable_ID_POST_CATEGORY');
            }
            if (Framework::hasModule('Template')) {
                $model->joinAdd(array('ID_TEMPLATE',TABLE_PREFIX.'TEMPLATE:CODE'), 'LEFT', 'reftable_ID_TEMPLATE');
            }
        }
    }

    protected function initListModel(&$model, $join = false) {
        $model->selectAdd();
        $model->selectAdd('`'.TABLE_PREFIX.'POST`.TITLE, `'.TABLE_PREFIX.'POST`.ID_POST_TYPE, `'.TABLE_PREFIX.'POST`.ID_POST_CATEGORY, `'.TABLE_PREFIX.'POST`.IMAGE, `'.TABLE_PREFIX.'POST`.META_KEYWORDS, `'.TABLE_PREFIX.'POST`.AUTHOR, `'.TABLE_PREFIX.'POST`.ID_TEMPLATE, `'.TABLE_PREFIX.'POST`.CREATION_DATE, `'.TABLE_PREFIX.'POST`.LATEST_UPDATE, `'.TABLE_PREFIX.'POST`.IS_FEATURED, `'.TABLE_PREFIX.'POST`.NBR_VIEWS, `'.TABLE_PREFIX.'POST`.ID, `'.TABLE_PREFIX.'POST`.JSON, `'.TABLE_PREFIX.'POST`.UUID, `'.TABLE_PREFIX.'POST`.WFID');
    
        if ($join) {
            if (Framework::hasModule('PostType')) {
                $model->selectAdd('reftable_ID_POST_TYPE.NAME as reftext_ID_POST_TYPE');
                $model->selectAdd('reftable_ID_POST_TYPE.UUID as refuuid_ID_POST_TYPE');
            }
            if (Framework::hasModule('PostCategory')) {
                $model->selectAdd('reftable_ID_POST_CATEGORY.NAME as reftext_ID_POST_CATEGORY');
                $model->selectAdd('reftable_ID_POST_CATEGORY.UUID as refuuid_ID_POST_CATEGORY');
            }
            if (Framework::hasModule('Template')) {
                $model->selectAdd('reftable_ID_TEMPLATE.NAME as reftext_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.UUID as refuuid_ID_TEMPLATE');
            }
        }
    
        if ($join) {
            if (Framework::hasModule('PostType')) {
                $model->joinAdd(array('ID_POST_TYPE',TABLE_PREFIX.'POST_TYPE:CODE'), 'LEFT', 'reftable_ID_POST_TYPE');
            }
            if (Framework::hasModule('PostCategory')) {
                $model->joinAdd(array('ID_POST_CATEGORY',TABLE_PREFIX.'POST_CATEGORY:ID'), 'LEFT', 'reftable_ID_POST_CATEGORY');
            }
            if (Framework::hasModule('Template')) {
                $model->joinAdd(array('ID_TEMPLATE',TABLE_PREFIX.'TEMPLATE:CODE'), 'LEFT', 'reftable_ID_TEMPLATE');
            }
        }
    }

    public function getAclEnabledIds() {
		$model = new PostModel();

        $this->enforceObjectAclCheck('post', $model);

        $model->find();

        $ids = array();

        while ($model->fetch()) {
            $ids[] = $model->ID;
        }

        return $ids;
    }

    protected function setupQuickSearchModel(&$model, $searchstring) {
        $keywords = explode(' ', $searchstring);

        foreach ($keywords as $keyword) {
            $conds = array();

            $conds[] = TABLE_PREFIX."POST.REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.TITLE LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.SLUG LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.META_KEYWORDS LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.META_DESCRIPTION LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.EXCERPT LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.CONTENT LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.TAGS LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.AUTHOR LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."POST.JSON LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";

            $model->whereAdd(implode(' OR ', $conds));
        }
    }

    protected function _import($templatecode = 'import.post.tpl') {
        $preset = isset($_REQUEST['preset'])? $_REQUEST['preset'] : RequestHelper::get('preset');
        $presetvalue = isset($_REQUEST['presetvalue'])? $_REQUEST['presetvalue'] : RequestHelper::get('presetvalue');

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('preset', $preset);
		$smarty->assign('presetvalue', $presetvalue);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'post');

	    $this->display($smarty, $templatecode);
	}

    protected function _importxls($filepath, &$error) {
        require_once ('Spreadsheet_Excel_Reader.php');

        $preset = isset($_REQUEST['preset'])? $_REQUEST['preset'] : '';
        $presetvalue = isset($_REQUEST['presetvalue'])? $_REQUEST['presetvalue'] : '';

		set_time_limit(0);

        $columns2import = array('TITLE','SLUG','ID_POST_TYPE','ID_POST_CATEGORY','IMAGE','META_KEYWORDS','META_DESCRIPTION','EXCERPT','CONTENT','TAGS','AUTHOR','EXTERNAL_LINK','ID_TEMPLATE','CREATION_DATE','LATEST_UPDATE','IS_FEATURED','NBR_VIEWS');

		$xls = new Spreadsheet_Excel_Reader($filepath, false, 'UTF-8');

        if ($xls->error) {
            $error = L_INVALID_IMPORT_FILE_FORMAT;
            return false;
        }

		$rowcount = $xls->rowcount();
		$colcount =  $xls->colcount();

		$headerrow = array();
		for ($j = 1; $j <= $colcount; $j++) {
			$headerrow[$j] = trim($this->_ensure_encoding($xls->value(1, $j)));
		}

        $matchcolumns = array();
 	    foreach ($headerrow as $column) {
            if (in_array($column, $columns2import)) {
                $matchcolumns[] = $column;
            }
        }

        $custom_import_exists = method_exists($this, 'customImport');

        if (empty($matchcolumns) && !$custom_import_exists) {
            $error = L_NO_VALID_COLUMN_IN_IMPORT_FILE;
            return false;
        }

        $isref = array();
 	    foreach ($headerrow as $column) {
 	        $isref[$column] = preg_match('/^id_|_id_|_id$/i', $column);
        }

		for ($i = 2; $i <= $rowcount; $i++) {
            $model = new PostModel();
            $rawdata = array();

			for ($j = 1; $j <= $colcount; $j++) {
				$column = $headerrow[$j];
				$label = trim($this->_ensure_encoding($xls->value($i, $j)));

				$rawdata[$column] = $label;

                if (!in_array($column, $matchcolumns)) {
                    continue;
                }

     	        if ($isref[$column]) {
     	            $cell = $this->_label2refval($column, $label);
     	        } else {
         	        $cell = $label;
     	        }

                $model->$column = $cell;
			}

            if ($custom_import_exists && $this->customImport($rawdata)) {
                continue;
            }

			if (!empty($preset) && !empty($presetvalue) && in_array($preset, $columns2import) && !in_array($preset, $matchcolumns)) {
				$model->$preset = $presetvalue;
			}

			$this->onBeforeImport($model, $rawdata);
            PluginManager::do_action('post_before_import', $model, $rawdata);

			if (empty($model->ID)) {
		        $model->insert();
            } else {
                if ($model->find(1)) {
    		        $model->update();
                } else {
    		        $model->insert();
                }
            }

            $this->onImportSuccess($model);
            PluginManager::do_action('post_imported', $model);
		}

        return true;
	}

    protected function _importcsv($filepath, &$error) {
        $preset = isset($_REQUEST['preset'])? $_REQUEST['preset'] : '';
        $presetvalue = isset($_REQUEST['presetvalue'])? $_REQUEST['presetvalue'] : '';

		set_time_limit(0);

        $columns2import = array('TITLE','SLUG','ID_POST_TYPE','ID_POST_CATEGORY','IMAGE','META_KEYWORDS','META_DESCRIPTION','EXCERPT','CONTENT','TAGS','AUTHOR','EXTERNAL_LINK','ID_TEMPLATE','CREATION_DATE','LATEST_UPDATE','IS_FEATURED','NBR_VIEWS');
        $handle = fopen($filepath, "r");

        if (!$handle) {
            $error = L_CANNOT_OPEN_IMPORT_FILE;
            return false;
        }

        if (($headerrow = fgetcsv($handle, 1000, CSV_SEPARATOR)) === false) {
            $error = L_INVALID_IMPORT_FILE_FORMAT;
            return false;
        }

        $matchcolumns = array();
 	    foreach ($headerrow as $column) {
            if (in_array($column, $columns2import)) {
                $matchcolumns[] = $column;
            }
        }

        $custom_import_exists = method_exists($this, 'customImport');

        if (empty($matchcolumns) && !$custom_import_exists) {
            $error = L_NO_VALID_COLUMN_IN_IMPORT_FILE;
            return false;
        }

        $isref = array();
 	    foreach ($headerrow as $column) {
 	        $isref[$column] = preg_match('/^id_|_id_|_id$/i', $column);
        }

        while (($row = fgetcsv($handle, 1000, CSV_SEPARATOR)) !== false) {
            $model = new PostModel();
            $rawdata = array();

            foreach ($row as $i => $label) {
                $column = $headerrow[$j];

                $rawdata[$column] = $label;

                if (!in_array($column, $matchcolumns)) {
                    continue;
                }

     	        if ($isref[$headerrow[$i]]) {
     	            $cell = $this->_label2refval($column, $label);
     	        } else {
         	        $cell = $label;
     	        }

                $model->$column = $cell;
            }

            if ($custom_import_exists && $this->customImport($rawdata)) {
                continue;
            }

			if (!empty($preset) && !empty($presetvalue) && in_array($preset, $columns2import) && !in_array($preset, $matchcolumns)) {
				$model->$preset = $presetvalue;
			}

			if (empty($model->ID)) {
		        $model->insert();
            } else {
                if ($model->find(1)) {
    		        $model->update();
                } else {
    		        $model->insert();
                }
            }
        }

        fclose($handle);

        return true;
	}

    protected function _ensure_encoding($content) {
        return mb_convert_encoding($content, 'UTF-8', mb_detect_encoding($content, "UTF-8, ISO-8859-1, ISO-8859-15", true));
    }

    protected function _label2refval($refcolumn, $reflabel) {
        static $valuecache = array();

        if (is_numeric($reflabel)) {
            return $reflabel;
        }

        if (isset($valuecache[$refcolumn][$reflabel])) {
            $value = $valuecache[$refcolumn][$reflabel];
        } else {
            switch ($refcolumn) {
                case 'ID_POST_TYPE':
                    $model = new PostTypeModel();
                    $model->NAME = $reflabel;
                    if ($model->find(1)) {
                        $value = $model->CODE;
                    } else {
                        $model->insert();
                        $value = $model->CODE;
                    }
                    break;

                case 'ID_POST_CATEGORY':
                    $model = new PostCategoryModel();
                    $model->NAME = $reflabel;
                    if ($model->find(1)) {
                        $value = $model->ID;
                    } else {
                        $model->insert();
                        $value = $model->ID;
                    }
                    break;

                case 'ID_TEMPLATE':
                    $model = new TemplateModel();
                    $model->NAME = $reflabel;
                    if ($model->find(1)) {
                        $value = $model->CODE;
                    } else {
                        $model->insert();
                        $value = $model->CODE;
                    }
                    break;

                default:
                    $value = $reflabel;
                    break;
            }
            $valuecache[$refcolumn][$reflabel] = $value;
        }

        return $value;
    }

    protected function _encodecsv($text) {
		$tmp = mb_convert_encoding($text, 'ISO-8859-1', 'UTF-8');

		if (stripos($tmp, '?')) {
			$tmp = mb_convert_encoding($text, 'ISO-8859-1', 'auto');
		}

        return '"'.str_replace('"', '""', $tmp).'"';
    }

    protected function _refval2label($refcolumn, $refvalue) {
        static $labelcache = array();

        if (isset($labelcache[$refcolumn][$refvalue])) {
            $label = $labelcache[$refcolumn][$refvalue];
        } else {
            $label = null;
            if (!empty($refvalue)) {
                switch ($refcolumn) {
                    case 'ID_POST_TYPE':
                        $model = new PostTypeModel();
                        $model->CODE = $refvalue;
                        $model->find();
                        $label = $model->fetch()? $model->NAME : $refvalue;
                        break;

                    case 'ID_POST_CATEGORY':
                        $model = new PostCategoryModel();
                        $model->ID = $refvalue;
                        $model->find();
                        $label = $model->fetch()? $model->NAME : $refvalue;
                        break;

                    case 'ID_TEMPLATE':
                        $model = new TemplateModel();
                        $model->CODE = $refvalue;
                        $model->find();
                        $label = $model->fetch()? $model->NAME : $refvalue;
                        break;

                    default:
                        $label = $refvalue;
                        break;
                }
            }
            $labelcache[$refcolumn][$refvalue] = $label;
        }

        return $label;
    }

    
}
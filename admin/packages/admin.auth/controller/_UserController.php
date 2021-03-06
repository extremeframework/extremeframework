<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class _UserController extends __AppController
{
    var $module = 'user';
    var $type = 'controller';
    var $__FILE__ = __FILE__;

    public function __construct() {
        parent::__construct();

        PluginManager::do_action('user_init');

        $this->initialize();
    }

    protected function checkConstraint($model, &$errors, $columns2check) {
        
       if (in_array('FIRST_NAME', $columns2check) && trim($model->FIRST_NAME) == '') {
           $errors['first-name'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('First name'));
           return false;
       }
       if (in_array('EMAIL', $columns2check) && trim($model->EMAIL) == '') {
           $errors['email'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Email'));
           return false;
       }
       if (in_array('LOGIN', $columns2check) && trim($model->LOGIN) == '') {
           $errors['login'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Login'));
           return false;
       }
       if (in_array('PASSWORD', $columns2check) && trim($model->PASSWORD) == '') {
           $errors['password'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Password'));
           return false;
       }
       if (in_array('EMAIL', $columns2check) && !preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', $model->EMAIL)) {
           $errors['email'] = sprintf(_t('L_VALIDATION_EMAIL'), _t('Email'));
           return false;
       }
       if (in_array('LOGIN', $columns2check) && !preg_match('/^[a-z0-9@_\-\.\/#$]+$/i', $model->LOGIN)) {
           $errors['login'] = sprintf(_t('L_VALIDATION_CODE'), _t('Login'));
           return false;
       }
       if (in_array('PHONE', $columns2check) && !empty($model->PHONE) && !preg_match('/^[0-9 +-\.\(\)]*$/i', $model->PHONE)) {
           $errors['phone'] = sprintf(_t('L_VALIDATION_PHONE'), _t('Phone'));
           return false;
       }


        if (!CustomFieldHelper::checkCustomFieldConstraint('user', $model, $errors)) {
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
                if (preg_match('/^user_formdata_(.*)/', $column, $matches)) {
                    $column = $matches[1];
                }

                if (!empty($file['name'])) {
                	$basename = basename($file['name']);

                	preg_match('/^(.*)(\.[a-z09]*)$/i', $basename, $matches);
                	$name = $matches[1];
                	$extension = $matches[2];

                    $rel = 'user/'.strtolower(str_replace('_', '-', $column));

                    $dir = UPLOAD_DIR."/".$rel;
                    if (!is_dir($dir)) {
                        $old = umask(0);
                        mkdir($dir, 0755, true);
                        umask($old);
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

                        if (!($width > 0 || $height > 0) && AdminImageConfigHelper::hasImageConfig('user', $column)) {
                            $config = AdminImageConfigHelper::getImageConfig('user', $column);

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
            if (preg_match('/^user_formdata_(.*)/', $name, $matches)) {
                $formdata[$matches[1]] = is_array($value)? $value : trim($value);
            }
		}

        return $formdata;
    }

    protected function getSearchFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^user_searchdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    protected function getFilterFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^user_filterdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    public function listAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        ContextStack::check2redirect('user');

        AclController::checkPermission('user', 'list');

		ContextStack::register(APPLICATION_URL.'/user/list/');
        
        $this->setPresetData(null);

		$this->_list();
	}

    public function sortAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

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

        LicenseController::enforceLicenseCheck('user');

		$searchdata = $this->getSearchFormData();

        $this->updateSearchData($searchdata);
        $this->updateFilterData(array());

        ContextStack::back(0);
    }

    public function filterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

		$filterdata = $this->getFilterFormData();

        $this->updateFilterData($filterdata);

        ContextStack::back(0);
    }

    public function customFilterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id) && Framework::hasModule('AdminFilter')) {
            $afm = new AdminFilterModel();

            $afm->UUID = $id;
            $afm->MODULE = 'user';

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

                    $conditions[$condition][] = "(".TABLE_PREFIX."USER.$field $operator '$value')";
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

        LicenseController::enforceLicenseCheck('user');

        $columns2return = array('ID' => 'id', 'FIRST_NAME' => 'name');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';

		$model = new UserModel();
		if (!empty($term)) {
            $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR FIRST_NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR LAST_NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");
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

        LicenseController::enforceLicenseCheck('user');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';
        $mode = isset($_REQUEST['mode'])? $_REQUEST['mode'] : 'view';

        if (empty($term)) {
            return;
        }

		$model = new UserModel();
        $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR FIRST_NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR LAST_NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");

		$model->orderBy('FIRST_NAME');
		$model->limit(0, 10);
		$model->find();

		$rows = array();
     	while ($model->fetch()) {
     		$rows[] = array('id' => $model->UUID, 'eid' => $model->ID, 'title' => $model->FIRST_NAME);
		}

		$smarty = Framework::getSmarty(__FILE__);

		$smarty->assign('rows', $rows);
		$smarty->assign('module', 'user');
		$smarty->assign('liveselect', $liveselect);
		$smarty->assign('mode', $mode);

	    $this->display($smarty, 'livesearch.results.tpl');
    }

    public function pageAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

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

        LicenseController::enforceLicenseCheck('user');

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

		$_model = new UserModel();
		$_model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');
        $_model->find();

        while ($_model->fetch()) {
            $_models[] = clone $_model;

            $_ids[] = $_model->ID;
        }

        foreach ($_models as $_model) {
            $this->onBeforeDelete($_model);
            PluginManager::do_action('user_before_delete', $_model);
        }

		$model = new UserModel();
		$model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');

		if (!AclController::hasPermission('user', 'deletepeer')) {
		    $model->whereAdd(TABLE_PREFIX."USER.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('user', $model);
		
		$model->delete();

        foreach ($_models as $_model) {
            $this->onDeleteSuccess($_model);
            PluginManager::do_action('user_deleted', $_model);
        }
    }

    public function deleteAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'delete');

	    list($id) = explode('/', $_REQUEST['args']);

        TransactionHelper::begin();

	    if (!empty($id)) {
	        $selection = array($id);
        } else {
			$selectall = isset($_REQUEST['userlist_selection_selectall']) && $_REQUEST['userlist_selection_selectall'];

			if ($selectall) {
				if (isset($_SESSION['user.list.model']) && is_object($_SESSION['user.list.model'])) {
					$model = clone $_SESSION['user.list.model'];
				} else {
		        	$model = new UserModel();
				}

				$model->find();

				$selection = array();
		        while ($model->fetch()) {
		        	$selection[] = $model->UUID;
		        }
			} else {
    			$selection = isset($_REQUEST['userlist_selection'])? $_REQUEST['userlist_selection'] : '';
			}
        }

		$relations = isset($_REQUEST['deleterelations'])? $_REQUEST['deleterelations'] : '';

		if (!empty($selection)) {
		    $this->delete('UUID', $selection, $_ids);
        }

        TransactionHelper::end();

        ContextStack::getCurrentScreenContext($module, $action);
        if ($module != 'user' || in_array($action, array('list', 'page'))) {
		    ContextStack::back(0);
        } else {
		    ContextStack::back(1);
        }
	}

    public function newAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'new');

		ContextStack::register(APPLICATION_URL.'/user/new/');

        $this->_edit(0);
	}

    public function viewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'view');

		@list($id, $templatecode) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new UserModel(), $_REQUEST);
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
            $adminview = AdminViewHelper::getAdminView('user', $templatecode);

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
		    ContextStack::register(APPLICATION_URL.'/user/view/'.$id);
    		$this->_view($id);
        }
	}

    public function editAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new UserModel(), $_REQUEST);
        }

        if (empty($filters)) {
            $this->pagenotfound();
        }

        $model = $this->getItem($filters, false);

		if (!$model->UUID) {
		    $this->pagenotfound();
		}

		$id = $model->UUID;

		ContextStack::register(APPLICATION_URL.'/user/edit/'.$id);
		$this->_edit($id);
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
            if (preg_match('/^'.$prefix.'user_formdata_(.+)/', $name)) {
                return 'single'; // the single mode has a higher priority
            }

            if (!$multiple && preg_match('/^'.$prefix.'user_multiformdata_(.+)/', $name)) {
                $multiple = true;
            }
        }

        return $multiple? 'multiple' : 'single';
    }

    protected function field_sanitize($column, $value) {
		if ($column == 'DATE_OF_BIRTH' && !preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/', $value)) {
            $format = DATE_FORMAT;
            $format = str_ireplace(array('yy', 'mm', 'dd'), array('Y', 'm', 'd'), $format);

            $info = date_parse_from_format($format, $value);

            if ($info['error_count'] == 0) {
                $year = substr('20'.$info['year'], -4);
                $month = substr('00'.$info['month'], -2);
                $day = substr('00'.$info['day'], -2);

                $value = "$year-$month-$day";
            } else {
                $value = '';
            }
        } elseif ($column == 'CREATION_DATE' && !preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/', $value)) {
            $format = DATE_FORMAT;
            $format = str_ireplace(array('yy', 'mm', 'dd'), array('Y', 'm', 'd'), $format);

            $info = date_parse_from_format($format, $value);

            if ($info['error_count'] == 0) {
                $year = substr('20'.$info['year'], -4);
                $month = substr('00'.$info['month'], -2);
                $day = substr('00'.$info['day'], -2);

                $value = "$year-$month-$day";
            } else {
                $value = '';
            }
        } elseif ($column == 'LATEST_LOGIN' && !preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$/', $value)) {
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
        $customfieldcolumns = CustomFieldHelper::getCustomFieldColumns('user');
        $customfieldvalues = array();

        $columns2edit = array('UUID', 'FIRST_NAME', 'LAST_NAME', 'PHOTO', 'EMAIL', 'LOGIN', 'PASSWORD', 'PHONE', 'GENDER', 'DATE_OF_BIRTH', 'FORCE_PASSWORD_CHANGE', 'IS_EMAIL_VERIFIED', 'LOCALE', 'CURRENCY', 'FACEBOOK_ID', 'FACEBOOK_OAUTH_ID', 'GOOGLE_ID', 'GOOGLE_OAUTH_ID', 'YAHOO_ID', 'YAHOO_OAUTH_ID', 'IS_ENABLED', 'CREATION_DATE', 'LATEST_LOGIN');
        $columns2edit = array_merge($columns2edit, $customfieldcolumns);

		$model = new UserModel();
        $matched = false;
		$columns2check = array();

		$raw = $_REQUEST;
		foreach ($_FILES as $key => $value) {
		    $raw[$key] = $value['name'];
		}

		foreach ($raw as $name => $value) {
            if (preg_match('/^'.$prefix.'user_formdata_(.*)/', $name, $matches)) {
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

    		    
            if (is_array($value)) {
                $model->$key = implode(',', $value);
            } else {
                $model->$key = trim($value);
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
        $columns2edit = array('UUID', 'FIRST_NAME', 'LAST_NAME', 'PHOTO', 'EMAIL', 'LOGIN', 'PASSWORD', 'PHONE', 'GENDER', 'DATE_OF_BIRTH', 'FORCE_PASSWORD_CHANGE', 'IS_EMAIL_VERIFIED', 'LOCALE', 'CURRENCY', 'FACEBOOK_ID', 'FACEBOOK_OAUTH_ID', 'GOOGLE_ID', 'GOOGLE_OAUTH_ID', 'YAHOO_ID', 'YAHOO_OAUTH_ID', 'IS_ENABLED', 'CREATION_DATE', 'LATEST_LOGIN');
        $columns2edit = array_merge($columns2edit, CustomFieldHelper::getCustomFieldColumns('user'));

        $rows = array();
		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^'.$prefix.'user_multiformdata_(.+)/', $name, $matches)) {
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
            $model = new UserModel();

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

    protected function saveform($prefix = null) {
        $formmode = $this->formmode($prefix);

        TransactionHelper::begin();

        if ($formmode == 'multiple') {
            $models = $this->form2models($prefix);

            $result = $this->save($models);

            $deleteditems = isset($_REQUEST[$prefix.'user_multiformdata_deleteditems'])? $_REQUEST[$prefix.'user_multiformdata_deleteditems'] : '';
            $deleteditems = explode(',', trim($deleteditems, ','));

    		if (!empty($deleteditems)) {
                $_models = array();

        		$_model = new UserModel();
        		$_model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');
                $_model->find();

                while ($_model->fetch()) {
                    $_models[] = clone $_model;
                }

                foreach ($_models as $_model) {
                    $this->onBeforeDelete($_model);
                    PluginManager::do_action('user_before_delete', $_model);
                }

        		$model = new UserModel();
        		$model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');

        		$model->delete();

                foreach ($_models as $_model) {
                    $this->onDeleteSuccess($_model);
                    PluginManager::do_action('user_deleted', $_model);
                }
            }
        } else {
            $model = $this->form2model($prefix);

            $this->handleFileUploads($model);

            $result = $this->save(array($model));
        }

        TransactionHelper::end();

        return $result;
    }

    protected function save($models = array()) {
        if (!is_array($models)) {
            $models = array($models);
        }

        foreach ($models as $model) {
    		if ($model->UUID) {
                AclController::checkPermission('user', 'edit');
            } else {
                AclController::checkPermission('user', 'new');
            }

            CustomFieldHelper::updateCustomFieldValues('user', $model);
            
            
            if (preg_match('/^[\*]*$/', $model->PASSWORD)) {
                $model->PASSWORD = null;
            }
            if (!empty($model->PASSWORD)) {
                $model->PASSWORD = md5($model->PASSWORD);
            }

            $this->onBeforeSave($model);
            PluginManager::do_action('user_before_save', $model);

    		if ($model->UUID) {
				
				$old = new UserModel();
				$old->UUID = $model->UUID;
				$old->find();
				$old->fetch();

                $this->onBeforeUpdate($model, $old);
                PluginManager::do_action('user_before_update', $model, $old);

        		if (!AclController::hasPermission('user', 'editpeer')) {
        		    $model->whereAdd(TABLE_PREFIX."USER.UUID = '".$model->UUID."' AND ".TABLE_PREFIX."USER.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		} else {
        		    $model->whereAdd(TABLE_PREFIX."USER.UUID = '".$model->UUID."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		}

    		    //$model->find();
    		    //$model->fetch();
    		    $model->_isnew = false;
    		    $this->onUpdateSuccess($model, $old);
    		    PluginManager::do_action('user_updated', $model, $old);
            } else {
                $model->ID = null;
                $model->CREATION_DATE = date('Y-m-d H:i:s');
                $this->onBeforeInsert($model);
                PluginManager::do_action('user_before_create', $model);

    		    $model->insert();
    		    $model->_isnew = true;

    		    $this->onInsertSuccess($model);
    		    PluginManager::do_action('user_created', $model);
            }

            $this->onSaveSuccess($model);
        }

        DraftHelper::clearAllDrafts('user');

        if (count($models) == 1) {
            return $model;
        }

        return true;
    }

    public function saveDraftAction() {
        LicenseController::enforceLicenseCheck('user');

        $formdata = $this->getFormData();

        DraftHelper::saveDraft('user', isset($formdata['UUID'])? $formdata['UUID'] : '', $formdata);
    }

    public function saveAction($datacheck = true, $addmore = false) {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

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
	            $this->_edit(null, $this->form2model(), "$viewtype.user.tpl");
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
            
            
		    ContextStack::replace(APPLICATION_URL.'/user/view/'.$model->UUID);

    		$this->_view($model->UUID);
        }
    }

    public function saveAddNewAction() {
		$this->saveAction(true, true);
    }

    function _save($datacheck = true) {
	    $model = $this->form2model();

        $this->handleFileUploads($model);
        if ($datacheck && !$this->checkConstraints($model, $errors)) {
            $this->setMessages($errors);

    		$this->_edit(null, $model);

    		return false;
        } else {
            if (preg_match('/^[\*]*$/', $model->PASSWORD)) {
                $model->PASSWORD = null;
            }
            if (!empty($model->PASSWORD)) {
                $model->PASSWORD = md5($model->PASSWORD);
            }

    		if ($model->UUID) {
    		    
    		    $model->update();

    		    $model->_isnew = false;
            } else {
                $model->CREATION_DATE = date('Y-m-d H:i:s');
    		    $model->insert();

    		    $model->_isnew = true;
            }
        }

        return $model;
	}

    public function updateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'edit');

		list($id, $col, $val) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$model = new UserModel();

        $model->$col = $val;
        $model->whereAdd("UUID = $id");
        $model->update(DB_DATAOBJECT_WHEREADD_ONLY);

		ContextStack::back(0);
	}

    public function cancelAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        $returnurl = isset($_REQUEST['return'])? $_REQUEST['return'] : '';
        
        DraftHelper::clearAllDrafts('user');
        
        
		ContextStack::back($back, $returnurl);
	}

    public function closeAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        $returnurl = isset($_REQUEST['return'])? $_REQUEST['return'] : '';
        
        DraftHelper::clearAllDrafts('user');
        
		ContextStack::back($back, $returnurl);
	}

    public function quickCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'new');

		$this->_edit(0, null, 'quick-create.user.tpl', false);
    }

    public function preCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'new');

		$this->_edit(0, null, 'pre-create.user.tpl', false);
    }

    public function rowNewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'new');

		$this->_edit(0, null, 'row-edit.user.tpl', false);
    }

    public function rowEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-edit.user.tpl', false);
    }

    public function rowExpandedEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-expanded-edit.user.tpl', false);
    }

    public function rowViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-view.user.tpl');
    }

    public function rowSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-edit.user.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-view.user.tpl');
        }
    }

    public function rowExpandedSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-expanded-edit.user.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-expanded.user.tpl');
        }
    }

    public function rowExpandedViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

        AclController::checkPermission('user', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-expanded.user.tpl');
    }

    public function fieldSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

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
            return array('FIRST_NAME', 'LAST_NAME', 'PHOTO', 'EMAIL', 'LOGIN', 'PHONE', 'IS_ENABLED');
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
            $_SESSION['user.customview'] = $_REQUEST['customview'];
        }

        $customview = isset($_SESSION['user.customview'])? $_SESSION['user.customview'] : '';

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
        $filtercolumns = $this->getCustomFilterColumns('user', $filter);

        $aclviewablecolumns = AclController::getAclEnabledColumns('user', 'view');

        if (empty($aclviewablecolumns) || (!isset($aclviewablecolumns['*']) && !in_array(true, $aclviewablecolumns))) {
            $this->pagenotfound('No view available');
        }

        
        $presetdata = $this->getPresetData();
        $searchdata = $this->getSearchData();
        $filterdata = $this->getFilterData();
        $customfilterdata = $this->getCustomFilterData();
        $orderby = $this->getRealOrderBy('ID');
        $limit = $this->getPageSize();
        $page = $this->getPageNumber();

        $excludedcolumns = AclController::getSystemExcludedColumns('user');
        foreach ($presetdata as $column => $value) {
            $excludedcolumns[$column] = true;
        }

        $rows = $this->getList(true, $searchdata + $customfilterdata + $presetdata, $filterdata, $orderby, $limit, $page, $pagination);
        

        $ids = array();
        foreach ($rows as $row) {
            $ids[] = $row->UUID;
        }
        $_SESSION['user.list.ids'] = $ids;

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
		$smarty->assign('module', 'user');
		$smarty->assign('filter', $filter);
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getListCustomFields('user'));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('formdata', $searchdata);
		$smarty->assign('searchdata', $searchdata);
		$smarty->assign('additional_list_buttons', $this->setupAdditionalListButtons());
		$smarty->assign('admin_list_actions', AdminActionHelper::getAdminActions('user', 'list'));
		$smarty->assign('admin_listitem_actions', AdminActionHelper::getAdminActions('user', 'listitem'));
		$smarty->assign('customview', $customview);
		$smarty->assign('customtemplate', $customtemplate);
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('user', 'view'));
		

        $templatetype = !empty($this->templatetype)? $this->templatetype : 'list';
	    $this->display($smarty, $templatetype.'.user.tpl');
    }

    protected function _view($id, $details = null, $templatecode = 'view.user.tpl') {
        $filtercolumns = $this->getCustomFilterColumns('user');

        $aclviewablecolumns = AclController::getAclEnabledColumns('user', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('user', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('user', 'new');
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

        $excludedcolumns = AclController::getSystemExcludedColumns('user');

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');
        if (!empty($preset) && !empty($presetvalue)) {
            $aclviewablecolumns[$preset] = false;
        }

        $presetdata = $this->getPresetData();
        foreach ($presetdata as $column => $value) {
            $aclviewablecolumns[$column] = true;
        }

        $ids = isset($_SESSION['user.list.ids'])? $_SESSION['user.list.ids'] : array();
        $key = array_search($details->UUID, $ids);
        $previd = isset($ids[$key - 1])? $ids[$key - 1] : 0;
        $nextid = isset($ids[$key + 1])? $ids[$key + 1] : 0;

        $this->setupAdditionalData($details);

        $this->initPlugins();

        $this->onBeforeView($details);
        PluginManager::do_action('user_before_view', $details);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('previd', $previd);
		$smarty->assign('nextid', $nextid);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'user');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('user', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('currentvalue', $details->UUID);
		$smarty->assign('additional_view_fields', $this->setupAdditionalViewFields($details));
		$smarty->assign('additional_view_buttons', $this->setupAdditionalViewButtons($details));
		$smarty->assign('admin_view_actions', AdminActionHelper::getAdminActions('user', 'view'));
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('user', 'view'));
        $smarty->assign('readonly', isset($_REQUEST['readonly']) && $_REQUEST['readonly']);

	    $this->display($smarty, $templatecode);

        $this->onViewSuccess($details);
        PluginManager::do_action('user_viewed', $details);
	}

    protected function _edit($id, $details = null, $templatecode = 'edit.user.tpl', $restoredraft = true) {
        $filtercolumns = $this->getCustomFilterColumns('user');

        $aclviewablecolumns = AclController::getAclEnabledColumns('user', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('user', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('user', 'new');
        }

        if (empty($acleditablecolumns) || (!isset($acleditablecolumns['*']) && !in_array(true, $acleditablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $acleditablecolumns['UUID'] = true;

        $excludedcolumns = AclController::getSystemExcludedColumns('user');

        $roweditablecolumns = array('FIRST_NAME', 'LAST_NAME', 'EMAIL', 'LOGIN', 'PHONE', 'GENDER', 'DATE_OF_BIRTH', 'FORCE_PASSWORD_CHANGE', 'IS_EMAIL_VERIFIED', 'LOCALE', 'CURRENCY', 'FACEBOOK_ID', 'FACEBOOK_OAUTH_ID', 'GOOGLE_ID', 'GOOGLE_OAUTH_ID', 'YAHOO_ID', 'YAHOO_OAUTH_ID', 'IS_ENABLED', 'CREATION_DATE', 'LATEST_LOGIN');

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');

        $presets = !empty($preset)? explode(',', $preset) : array();
        $presetvalues = !empty($presetvalue)? explode(',', $presetvalue) : array();

        $presetdata = $this->getPresetData();
        foreach ($presetdata as $column => $value) {
            $presets[] = $column;
            $presetvalues[] = $value;
        }

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
    		$model = new UserModel();

            if ($id) {
                $model = $this->getItem($id, true);

             	if (!$model) {
        		    $this->pagenotfound();
             	}

                if ($model->GUID != $_SESSION['user']->ID) {
             	    AclController::checkPermission('user', 'editpeer');
                }
            } else {
                // Set default values here
                if ($recent = $this->getRecentModel()) {
                    $model->FACEBOOK_ID = $recent->FACEBOOK_ID;
                    $model->FACEBOOK_OAUTH_ID = $recent->FACEBOOK_OAUTH_ID;
                    $model->GOOGLE_ID = $recent->GOOGLE_ID;
                    $model->GOOGLE_OAUTH_ID = $recent->GOOGLE_OAUTH_ID;
                    $model->YAHOO_ID = $recent->YAHOO_ID;
                    $model->YAHOO_OAUTH_ID = $recent->YAHOO_OAUTH_ID;
                }

                $this->onInitialization($model);
                PluginManager::do_action('user_new', $model);
            }
            
            if ($restoredraft) {
                DraftHelper::tryRestoreDraft('user', $model->UUID, $model);
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
        PluginManager::do_action('user_before_edit', $details);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('preset', $preset);
		$smarty->assign('presetvalue', $presetvalue);
		$smarty->assign('presetparams', $presetparams);
		
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'user');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('user', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('columntooltips', FieldHelper::getColumnTooltips('user'));
		$smarty->assign('roweditablecolumns', $roweditablecolumns);
        $smarty->assign('fielddependencies', FieldHelper::getFieldDependencies('user'));

	    $this->display($smarty, $templatecode);
	}

    protected function getLayoutColumns() {
        return array('FIRST_NAME', 'LAST_NAME', 'PHOTO', 'EMAIL', 'LOGIN', 'PASSWORD', 'PHONE', 'GENDER', 'DATE_OF_BIRTH', 'FORCE_PASSWORD_CHANGE', 'IS_EMAIL_VERIFIED', 'LOCALE', 'CURRENCY', 'FACEBOOK_ID', 'FACEBOOK_OAUTH_ID', 'GOOGLE_ID', 'GOOGLE_OAUTH_ID', 'YAHOO_ID', 'YAHOO_OAUTH_ID', 'IS_ENABLED', 'CREATION_DATE', 'LATEST_LOGIN');
    }

    public function getItem($id_or_filters, $join = false, $check_acl = true, $additional_select_fields = '') {
		$model = new UserModel();

        $this->initViewModel($model, $join);

        if (!empty($additional_select_fields)) {
            $model->selectAdd($additional_select_fields);
        }

        if (is_array($id_or_filters)) {
            $this->applyFilters($id_or_filters, $model);
        } else {
		    $model->UUID = $id_or_filters;
        }

		if ($check_acl && !AclController::hasPermission('user', 'viewpeer')) {
		    // UDID: 0 - public
		    $model->whereAdd(TABLE_PREFIX."USER.UDID = 0 OR ".TABLE_PREFIX."USER.UDID IN ('".implode("','", AclController::getExtraUDIDs())."') OR ".TABLE_PREFIX."USER.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        if ($check_acl) {
            $this->enforceObjectAclCheck('user', $model);
        }

		$model->find();

        $item = null;
     	if ($model->fetch()) {
		    UserController::setupAdditionalData($model);

    		$item = clone $model;
     	}

        return $item;
	}

    public function getItemById($id, $join = false, $check_acl = true, $additional_select_fields = '') {
        return $this->getItem(array('ID' => $id), $join, $check_acl, $additional_select_fields);
    }

    public function getList($join = false, $filters = array(), $aftersearchfilters = array(), $orderby = 'ID DESC', $limit = 0, $page = 0, &$pagination = null, $checkguid = true, $additional_wheres = array()) {
		$model = new UserModel();

        $this->initListModel($model, $join);

        $this->enforceObjectAclCheck('user', $model);

        if (!empty($additional_wheres)) {
            foreach ($additional_wheres as $where) {
                $model->whereAdd($where);
            }
        }

        $this->applyFilters($filters, $model);

		$_SESSION['user.list.model'] = clone $model;

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

                    case 'LATEST_LOGIN__FROM':
                        $model->whereAdd(TABLE_PREFIX."USER.LATEST_LOGIN >= '".$this->field_sanitize('LATEST_LOGIN', $value)."'");

                        break;

                    case 'LATEST_LOGIN__TO':
                        $model->whereAdd(TABLE_PREFIX."USER.LATEST_LOGIN IS NULL OR ".TABLE_PREFIX."USER.LATEST_LOGIN <= '".$this->field_sanitize('LATEST_LOGIN', $value)."')");

                        break;

                    default:
                        if (preg_match('/^custom.*/i', $key)) {
                            $model->whereAdd($value);
                        } else {
                            if (property_exists($model, $key)) {
                                if ($value == '__EMPTY__') {
                                    $model->whereAdd(TABLE_PREFIX."USER.$key IS NULL OR ".TABLE_PREFIX.".USER.$key = ''");
                                } else {
                                    $model->whereAdd(TABLE_PREFIX."USER.$key = '".$model->escape($value)."'");
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
        $model->selectAdd('`'.TABLE_PREFIX.'USER`.FIRST_NAME, `'.TABLE_PREFIX.'USER`.LAST_NAME, `'.TABLE_PREFIX.'USER`.PHOTO, `'.TABLE_PREFIX.'USER`.EMAIL, `'.TABLE_PREFIX.'USER`.LOGIN, `'.TABLE_PREFIX.'USER`.PASSWORD, `'.TABLE_PREFIX.'USER`.PHONE, `'.TABLE_PREFIX.'USER`.GENDER, `'.TABLE_PREFIX.'USER`.DATE_OF_BIRTH, `'.TABLE_PREFIX.'USER`.FORCE_PASSWORD_CHANGE, `'.TABLE_PREFIX.'USER`.IS_EMAIL_VERIFIED, `'.TABLE_PREFIX.'USER`.LOCALE, `'.TABLE_PREFIX.'USER`.CURRENCY, `'.TABLE_PREFIX.'USER`.FACEBOOK_ID, `'.TABLE_PREFIX.'USER`.FACEBOOK_OAUTH_ID, `'.TABLE_PREFIX.'USER`.GOOGLE_ID, `'.TABLE_PREFIX.'USER`.GOOGLE_OAUTH_ID, `'.TABLE_PREFIX.'USER`.YAHOO_ID, `'.TABLE_PREFIX.'USER`.YAHOO_OAUTH_ID, `'.TABLE_PREFIX.'USER`.IS_ENABLED, `'.TABLE_PREFIX.'USER`.CREATION_DATE, `'.TABLE_PREFIX.'USER`.LATEST_LOGIN, `'.TABLE_PREFIX.'USER`.ID, `'.TABLE_PREFIX.'USER`.JSON, `'.TABLE_PREFIX.'USER`.UUID, `'.TABLE_PREFIX.'USER`.WFID');
    }

    protected function initListModel(&$model, $join = false) {
        $model->selectAdd();
        $model->selectAdd('`'.TABLE_PREFIX.'USER`.FIRST_NAME, `'.TABLE_PREFIX.'USER`.LAST_NAME, `'.TABLE_PREFIX.'USER`.PHOTO, `'.TABLE_PREFIX.'USER`.EMAIL, `'.TABLE_PREFIX.'USER`.LOGIN, `'.TABLE_PREFIX.'USER`.PHONE, `'.TABLE_PREFIX.'USER`.GENDER, `'.TABLE_PREFIX.'USER`.DATE_OF_BIRTH, `'.TABLE_PREFIX.'USER`.FORCE_PASSWORD_CHANGE, `'.TABLE_PREFIX.'USER`.IS_EMAIL_VERIFIED, `'.TABLE_PREFIX.'USER`.LOCALE, `'.TABLE_PREFIX.'USER`.CURRENCY, `'.TABLE_PREFIX.'USER`.FACEBOOK_ID, `'.TABLE_PREFIX.'USER`.FACEBOOK_OAUTH_ID, `'.TABLE_PREFIX.'USER`.GOOGLE_ID, `'.TABLE_PREFIX.'USER`.GOOGLE_OAUTH_ID, `'.TABLE_PREFIX.'USER`.YAHOO_ID, `'.TABLE_PREFIX.'USER`.YAHOO_OAUTH_ID, `'.TABLE_PREFIX.'USER`.IS_ENABLED, `'.TABLE_PREFIX.'USER`.CREATION_DATE, `'.TABLE_PREFIX.'USER`.LATEST_LOGIN, `'.TABLE_PREFIX.'USER`.ID, `'.TABLE_PREFIX.'USER`.JSON, `'.TABLE_PREFIX.'USER`.UUID, `'.TABLE_PREFIX.'USER`.WFID');
    }

    public function getAclEnabledIds() {
		$model = new UserModel();

        $this->enforceObjectAclCheck('user', $model);

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

            $conds[] = TABLE_PREFIX."USER.REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."USER.FIRST_NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."USER.LAST_NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."USER.LOCALE LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."USER.CURRENCY LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."USER.JSON LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";

            $model->whereAdd(implode(' OR ', $conds));
        }
    }

	

	

	

	

	

	

	

    

    
}
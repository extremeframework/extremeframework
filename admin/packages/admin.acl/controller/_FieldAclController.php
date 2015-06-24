<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class _FieldAclController extends __AppController
{
    var $module = 'fieldacl';
    var $type = 'controller';

    public function __construct() {
        parent::__construct();

        PluginManager::do_action('fieldacl_init');
    }

    private function checkConstraint($model, &$errors, $columns2check) {
        
       if (in_array('MODULE', $columns2check) && trim($model->MODULE) == '') {
           $errors['module'] = sprintf(L_VALIDATION_NOT_EMPTY, L_MODULE);
           return false;
       }
       if (in_array('ID_ACL_TYPE', $columns2check) && trim($model->ID_ACL_TYPE) == '') {
           $errors['id-acl-type'] = sprintf(L_VALIDATION_NOT_EMPTY, L_ACL_TYPE);
           return false;
       }


        if (!CustomFieldHelper::checkCustomFieldConstraint('fieldacl', $model, $errors)) {
            return false;
        }

        return true;
    }

    private function checkConstraints($models, &$errors, $columns2check) {
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

    public function getFormData() {
		$formdata = array();

        $raw = array_merge($_REQUEST, $_FILES);

		foreach ($raw as $name => $value) {
            if (preg_match('/^fieldacl_formdata_(.*)/', $name, $matches)) {
                $formdata[$matches[1]] = is_array($value)? $value : trim($value);
            }
		}

        return $formdata;
    }

    private function getSearchFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^fieldacl_searchdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    private function getFilterFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^fieldacl_filterdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    public function listAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        ContextStack::check2redirect('fieldacl');

        AclController::checkPermission('fieldacl', 'list');

		ContextStack::register(APPLICATION_URL.'/fieldacl/list/');
        
        $this->setPresetData(null);

		$this->_list();
	}

    public function sortAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

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

        LicenseController::enforceLicenseCheck('fieldacl');

		$searchdata = $this->getSearchFormData();

        $this->updateSearchData($searchdata);
        $this->updateFilterData(array());

        ContextStack::back(0);
    }

    public function filterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

		$filterdata = $this->getFilterFormData();

        $this->updateFilterData($filterdata);

        ContextStack::back(0);
    }

    public function customFilterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id) && Framework::hasModule('AdminFilter')) {
            $afm = new AdminFilterModel();

            $afm->UUID = $id;
            $afm->MODULE = 'fieldacl';

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

                    $conditions[$condition][] = "(".TABLE_PREFIX."FIELD_ACL.$field $operator '$value')";
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

        LicenseController::enforceLicenseCheck('fieldacl');

        $columns2return = array('ID' => 'id', 'MODULE' => 'name');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';

		$model = new FieldAclModel();
		if (!empty($term)) {
            $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");
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

        LicenseController::enforceLicenseCheck('fieldacl');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';
        $mode = isset($_REQUEST['mode'])? $_REQUEST['mode'] : 'view';

        if (empty($term)) {
            return;
        }

		$model = new FieldAclModel();
        $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");

		$model->orderBy('MODULE');
		$model->limit(0, 10);
		$model->find();

		$rows = array();
     	while ($model->fetch()) {
     		$rows[] = array('id' => $model->UUID, 'eid' => $model->ID, 'title' => $model->MODULE);
		}

		$smarty = Framework::getSmarty();

		$smarty->assign('rows', $rows);
		$smarty->assign('module', 'fieldacl');
		$smarty->assign('liveselect', $liveselect);
		$smarty->assign('mode', $mode);

	    $this->display($smarty, 'livesearch.results.tpl');
    }

    public function pageAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

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

        LicenseController::enforceLicenseCheck('fieldacl');

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

		$_model = new FieldAclModel();
		$_model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');
        $_model->find();

        while ($_model->fetch()) {
            $_models[] = clone $_model;

            $_ids[] = $_model->ID;
        }

        foreach ($_models as $_model) {
            $this->onBeforeDelete($_model);
            PluginManager::do_action('fieldacl_before_delete', $_model);
        }

		$model = new FieldAclModel();
		$model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');

		if (!AclController::hasPermission('fieldacl', 'deletepeer')) {
		    $model->whereAdd(TABLE_PREFIX."FIELD_ACL.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('fieldacl', $model);
		
		$model->delete();

        foreach ($_models as $_model) {
            $this->onDeleteSuccess($_model);
            PluginManager::do_action('fieldacl_deleted', $_model);
        }
    }

    public function deleteAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'delete');

	    list($id) = explode('/', $_REQUEST['args']);

        TransactionHelper::begin();

	    if (!empty($id)) {
	        $selection = array($id);
        } else {
			$selectall = isset($_REQUEST['fieldacllist_selection_selectall']) && $_REQUEST['fieldacllist_selection_selectall'];

			if ($selectall) {
				if (isset($_SESSION['fieldacl.list.model']) && is_object($_SESSION['fieldacl.list.model'])) {
					$model = clone $_SESSION['fieldacl.list.model'];
				} else {
		        	$model = new FieldAclModel();
				}

				$model->find();

				$selection = array();
		        while ($model->fetch()) {
		        	$selection[] = $model->UUID;
		        }
			} else {
    			$selection = isset($_REQUEST['fieldacllist_selection'])? $_REQUEST['fieldacllist_selection'] : '';
			}
        }

		$relations = isset($_REQUEST['deleterelations'])? $_REQUEST['deleterelations'] : '';

		if (!empty($selection)) {
		    $this->delete('UUID', $selection, $_ids);
        }

        TransactionHelper::end();

        ContextStack::getCurrentScreenContext($module, $action);
        if ($module != 'fieldacl' || in_array($action, array('list', 'page'))) {
		    ContextStack::back(0);
        } else {
		    ContextStack::back(1);
        }
	}

    public function newAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

		ContextStack::register(APPLICATION_URL.'/fieldacl/new/');

        $this->_edit(0);
	}

    public function viewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'view');

		@list($id, $templatecode) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new FieldAclModel(), $_REQUEST);
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
            $adminview = AdminViewHelper::getAdminView('fieldacl', $templatecode);

            if (empty($adminview)) {
                $this->pagenotfound();
            }

            $template = $adminview->TEMPLATE;

            $smarty = Framework::getSmarty();

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
		    ContextStack::register(APPLICATION_URL.'/fieldacl/view/'.$id);
    		$this->_view($id);
        }
	}

    public function editAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new FieldAclModel(), $_REQUEST);
        }

        if (empty($filters)) {
            $this->pagenotfound();
        }

        $model = $this->getItem($filters, false);

		if (!$model->UUID) {
		    $this->pagenotfound();
		}

		$id = $model->UUID;

		ContextStack::register(APPLICATION_URL.'/fieldacl/edit/'.$id);
		$this->_edit($id);
	}

    protected function onSaveSuccess($model) {
        
        parent::onSaveSuccess($model);
    }

    protected function onDeleteSuccess($model) {
        
        parent::onDeleteSuccess($model);
    }

    private function formmode($prefix = null) {
        $multiple = false;

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^'.$prefix.'fieldacl_formdata_(.+)/', $name)) {
                return 'single'; // the single mode has a higher priority
            }

            if (!$multiple && preg_match('/^'.$prefix.'fieldacl_multiformdata_(.+)/', $name)) {
                $multiple = true;
            }
        }

        return $multiple? 'multiple' : 'single';
    }

    protected function field_sanitize($column, $value) {
		
		return $value;
	}

    private function form2model($prefix = null, &$columns2check = null) {
        $customfieldcolumns = CustomFieldHelper::getCustomFieldColumns('fieldacl');
        $customfieldvalues = array();

        $columns2edit = array('UUID', 'MODULE', 'ACTION', 'ID_USER_GROUP', 'ID_USER', 'FIELDS', 'ID_ACL_TYPE');
        $columns2edit = array_merge($columns2edit, $customfieldcolumns);

		$model = new FieldAclModel();
        $matched = false;
		$columns2check = array();

		$raw = $_REQUEST;
		foreach ($_FILES as $key => $value) {
		    $raw[$key] = $value['name'];
		}

		foreach ($raw as $name => $value) {
            if (preg_match('/^'.$prefix.'fieldacl_formdata_(.*)/', $name, $matches)) {
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

    		    
            if ($key == 'FIELDS') {
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

    private function form2models($prefix = null, &$columns2check = null) {
        $columns2edit = array('UUID', 'MODULE', 'ACTION', 'ID_USER_GROUP', 'ID_USER', 'FIELDS', 'ID_ACL_TYPE');
        $columns2edit = array_merge($columns2edit, CustomFieldHelper::getCustomFieldColumns('fieldacl'));

        $rows = array();
		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^'.$prefix.'fieldacl_multiformdata_(.+)/', $name, $matches)) {
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
            $model = new FieldAclModel();

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

    private function checkform(&$errors, $prefix = null) {
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

    private function saveform($prefix = null, $refobject = null) {
        $formmode = $this->formmode($prefix);

        TransactionHelper::begin();

        if ($formmode == 'multiple') {
            $models = $this->form2models($prefix);

            $result = $this->save($models, $refobject);

            $deleteditems = isset($_REQUEST[$prefix.'fieldacl_multiformdata_deleteditems'])? $_REQUEST[$prefix.'fieldacl_multiformdata_deleteditems'] : '';
            $deleteditems = explode(',', trim($deleteditems, ','));

    		if (!empty($deleteditems)) {
                $_models = array();

        		$_model = new FieldAclModel();
        		$_model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');
                $_model->find();

                while ($_model->fetch()) {
                    $_models[] = clone $_model;
                }

                foreach ($_models as $_model) {
                    $this->onBeforeDelete($_model);
                    PluginManager::do_action('fieldacl_before_delete', $_model);
                }

        		$model = new FieldAclModel();
        		$model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');

        		$model->delete();

                foreach ($_models as $_model) {
                    $this->onDeleteSuccess($_model);
                    PluginManager::do_action('fieldacl_deleted', $_model);
                }
            }
        } else {
            $model = $this->form2model($prefix);

            

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
            CustomFieldHelper::updateCustomFieldValues('fieldacl', $model);
            
            $this->bind2refobject($model, $refobject);
            $this->onBeforeSave($model);
            PluginManager::do_action('fieldacl_before_save', $model);

    		if ($model->UUID) {
				
				$old = new FieldAclModel();
				$old->UUID = $model->UUID;
				$old->find();
				$old->fetch();

                $this->onBeforeUpdate($model, $old);
                PluginManager::do_action('fieldacl_before_update', $model, $old);

        		if (!AclController::hasPermission('fieldacl', 'editpeer')) {
        		    $model->whereAdd(TABLE_PREFIX."FIELD_ACL.UUID = '".$model->UUID."' AND ".TABLE_PREFIX."FIELD_ACL.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		} else {
        		    $model->whereAdd(TABLE_PREFIX."FIELD_ACL.UUID = '".$model->UUID."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		}

    		    //$model->find();
    		    //$model->fetch();
    		    $model->_isnew = false;
    		    $this->onUpdateSuccess($model, $old);
    		    PluginManager::do_action('fieldacl_updated', $model, $old);
            } else {
                $model->ID = null;
                
                $this->onBeforeInsert($model);
                PluginManager::do_action('fieldacl_before_create', $model);

    		    $model->insert();
    		    $model->_isnew = true;

    		    $this->onInsertSuccess($model);
    		    PluginManager::do_action('fieldacl_created', $model);
            }

            $this->onSaveSuccess($model);
        }

        DraftHelper::clearAllDrafts('fieldacl');

        if (count($models) == 1) {
            return $model;
        }

        return true;
    }

    private function bind2refobject(&$model, $refobject = null) {
        if ($refobject != null) {
            $refclass = get_class($refobject);
            
            if ($refclass == 'AdminModuleModel' && empty($model->MODULE)) {
                $model->MODULE = $refobject->MODULE;
            }
            if ($refclass == 'UserGroupModel' && empty($model->ID_USER_GROUP)) {
                $model->ID_USER_GROUP = $refobject->ID;
            }
            if ($refclass == 'UserModel' && empty($model->ID_USER)) {
                $model->ID_USER = $refobject->ID;
            }
            if ($refclass == 'AclTypeModel' && empty($model->ID_ACL_TYPE)) {
                $model->ID_ACL_TYPE = $refobject->ID;
            }

        }
    }

    public function saveDraftAction() {
        LicenseController::enforceLicenseCheck('fieldacl');

        $formdata = $this->getFormData();

        DraftHelper::saveDraft('fieldacl', isset($formdata['UUID'])? $formdata['UUID'] : '', $formdata);
    }

    public function saveAction($datacheck = true, $addmore = false) {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

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
	            $this->_edit(null, $this->form2model(), "$viewtype.fieldacl.tpl");
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

    function _save($datacheck = true) {
	    $model = $this->form2model();

        
        if ($datacheck && !$this->checkConstraints($model, $errors)) {
            $this->setMessages($errors);

    		$this->_edit(null, $model);

    		return false;
        } else {
    		if ($model->UUID) {
    		    
    		    $model->update();

    		    $model->_isnew = false;
            } else {
                
    		    $model->insert();

    		    $model->_isnew = true;
            }
        }

        return $model;
	}

    public function updateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

		list($id, $col, $val) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$model = new FieldAclModel();

        $model->$col = $val;
        $model->whereAdd("UUID = $id");
        $model->update(DB_DATAOBJECT_WHEREADD_ONLY);

		ContextStack::back(0);
	}

    public function cancelAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        
        DraftHelper::clearAllDrafts('fieldacl');
        
        
		ContextStack::back($back);
	}

    public function closeAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        
        DraftHelper::clearAllDrafts('fieldacl');
        
		ContextStack::back($back);
	}

    public function quickCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

		$this->_edit(0, null, 'quick-create.fieldacl.tpl', false);
    }

    public function preCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

		$this->_edit(0, null, 'pre-create.fieldacl.tpl', false);
    }

    public function rowNewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

		$this->_edit(0, null, 'row-edit.fieldacl.tpl', false);
    }

    public function rowEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-edit.fieldacl.tpl', false);
    }

    public function rowExpandedEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-expanded-edit.fieldacl.tpl', false);
    }

    public function rowViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-view.fieldacl.tpl');
    }

    public function rowSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-edit.fieldacl.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-view.fieldacl.tpl');
        }
    }

    public function rowExpandedSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-expanded-edit.fieldacl.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-expanded.fieldacl.tpl');
        }
    }

    public function rowExpandedViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-expanded.fieldacl.tpl');
    }

    public function fieldSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('fieldacl');

        AclController::checkPermission('fieldacl', 'edit');

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
            return array('MODULE', 'ACTION', 'ID_USER_GROUP', 'ID_USER', 'ID_ACL_TYPE');
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

    private function initCustomView(&$customview, &$customtemplate) {
        if (!Framework::hasModule('AdminView')) {
            return;
        }

        if (isset($_REQUEST['customview'])) {
            $_SESSION['fieldacl.customview'] = $_REQUEST['customview'];
        }

        $customview = isset($_SESSION['fieldacl.customview'])? $_SESSION['fieldacl.customview'] : '';

        if (!empty($customview)) {
            $avm = new AdminViewModel();

            $avm->UUID = $customview;
            $avm->find();

            if ($avm->fetch()) {
                $customtemplate = $avm->TPL;
            }
        }
    }

    private function _list() {
        $filtercolumns = $this->getCustomFilterColumns('fieldacl', $filter);

        $aclviewablecolumns = AclController::getAclEnabledColumns('fieldacl', 'view');

        if (empty($aclviewablecolumns) || (!isset($aclviewablecolumns['*']) && !in_array(true, $aclviewablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $excludedcolumns = AclController::getSystemExcludedColumns('fieldacl');
        
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
        $_SESSION['fieldacl.list.ids'] = $ids;

        $total = $pagination['total'];
        $page = $pagination['page'];
        $limit = $pagination['pagesize'];
        $limit_from = $pagination['from'];
        $limit_to = $pagination['to'];

        $pagination = new Pagination($pagination['total'], ($pagination['page']-1)*$pagination['pagesize'], $pagination['pagesize']);
        $pagination = $pagination->getPageLinks();

        $this->initPlugins();

        $this->initCustomView($customview, $customtemplate);

		$messages = $this->getMessages();

		$smarty = Framework::getSmarty();
		$smarty->assign('rows', $rows);
		$smarty->assign('pagination', $pagination);
        $smarty->assign('total', $total);
		$smarty->assign('limit', $limit);
		$smarty->assign('limit_from', $limit_from);
		$smarty->assign('limit_to', $limit_to);
		$smarty->assign('messages', $messages);
		$smarty->assign('module', 'fieldacl');
		$smarty->assign('filter', $filter);
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getListCustomFields('fieldacl'));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('formdata', $searchdata);
		$smarty->assign('searchdata', $searchdata);
		$smarty->assign('additional_list_buttons', $this->setupAdditionalListButtons());
		$smarty->assign('admin_list_actions', AdminActionHelper::getAdminActions('fieldacl', 'list'));
		$smarty->assign('admin_listitem_actions', AdminActionHelper::getAdminActions('fieldacl', 'listitem'));
		$smarty->assign('customview', $customview);
		$smarty->assign('customtemplate', $customtemplate);
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('fieldacl', 'view'));
		

        $templatetype = !empty($this->templatetype)? $this->templatetype : 'list';
	    $this->display($smarty, $templatetype.'.fieldacl.tpl');
    }

    private function _view($id, $details = null, $templatecode = 'view.fieldacl.tpl') {
        $filtercolumns = $this->getCustomFilterColumns('fieldacl');

        $aclviewablecolumns = AclController::getAclEnabledColumns('fieldacl', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('fieldacl', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('fieldacl', 'new');
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

        $excludedcolumns = AclController::getSystemExcludedColumns('fieldacl');

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');
        if (!empty($preset)) {
            $aclviewablecolumns[$preset] = false;
        }

        $ids = isset($_SESSION['fieldacl.list.ids'])? $_SESSION['fieldacl.list.ids'] : array();
        $key = array_search($details->UUID, $ids);
        $previd = isset($ids[$key - 1])? $ids[$key - 1] : 0;
        $nextid = isset($ids[$key + 1])? $ids[$key + 1] : 0;

        $this->setupAdditionalData($details);

        $this->initPlugins();

        $this->onBeforeView($details);
        PluginManager::do_action('fieldacl_before_view', $details);

		$messages = $this->getMessages();

		$smarty = Framework::getSmarty();
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('previd', $previd);
		$smarty->assign('nextid', $nextid);
		$smarty->assign('messages', $messages);
		$smarty->assign('module', 'fieldacl');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('fieldacl', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('currentvalue', $details->UUID);
		$smarty->assign('additional_view_fields', $this->setupAdditionalViewFields($details));
		$smarty->assign('additional_view_buttons', $this->setupAdditionalViewButtons($details));
		$smarty->assign('admin_view_actions', AdminActionHelper::getAdminActions('fieldacl', 'view'));
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('fieldacl', 'view'));
        $smarty->assign('readonly', isset($_REQUEST['readonly']) && $_REQUEST['readonly']);

	    $this->display($smarty, $templatecode);

        $this->onViewSuccess($details);
        PluginManager::do_action('fieldacl_viewed', $details);
	}

    private function _edit($id, $details = null, $templatecode = 'edit.fieldacl.tpl', $restoredraft = true) {
        $filtercolumns = $this->getCustomFilterColumns('fieldacl');

        $aclviewablecolumns = AclController::getAclEnabledColumns('fieldacl', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('fieldacl', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('fieldacl', 'new');
        }

        if (empty($acleditablecolumns) || (!isset($acleditablecolumns['*']) && !in_array(true, $acleditablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $acleditablecolumns['UUID'] = true;

        $excludedcolumns = AclController::getSystemExcludedColumns('fieldacl');

        $roweditablecolumns = array('MODULE', 'ACTION', 'ID_USER_GROUP', 'ID_USER', 'ID_ACL_TYPE');

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
    		$model = new FieldAclModel();

            if ($id) {
                $model = $this->getItem($id, true);

             	if (!$model) {
        		    $this->pagenotfound();
             	}

                if ($model->GUID != $_SESSION['user']->ID) {
             	    AclController::checkPermission('fieldacl', 'editpeer');
                }
            } else {
                // Set default values here
                $model->ID_USER = $_SESSION['user']->ID;

                if ($recent = $this->getRecentModel()) {
                    $model->ID_USER_GROUP = $recent->ID_USER_GROUP;
                    $model->ID_ACL_TYPE = $recent->ID_ACL_TYPE;
                }

                $this->onInitialization($model);
                PluginManager::do_action('fieldacl_new', $model);
            }
            
            if ($restoredraft) {
                DraftHelper::tryRestoreDraft('fieldacl', $model->UUID, $model);
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
        PluginManager::do_action('fieldacl_before_edit', $details);

		$messages = $this->getMessages();

		$smarty = Framework::getSmarty();
		$smarty->assign('preset', $preset);
		$smarty->assign('presetvalue', $presetvalue);
		$smarty->assign('presetparams', $presetparams);
		
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('messages', $messages);
		$smarty->assign('module', 'fieldacl');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('fieldacl', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('columntooltips', FieldHelper::getColumnTooltips('fieldacl'));
		$smarty->assign('roweditablecolumns', $roweditablecolumns);
        $smarty->assign('fielddependencies', FieldHelper::getFieldDependencies('fieldacl'));

	    $this->display($smarty, $templatecode);
	}

    private function getLayoutColumns() {
        return array('MODULE', 'ACTION', 'ID_USER_GROUP', 'ID_USER', 'FIELDS', 'ID_ACL_TYPE');
    }

    public function getItem($id_or_filters, $join = false, $check_acl = true, $additional_select_fields = '') {
		$model = new FieldAclModel();

        $this->initViewModel($model, $join);

        if (!empty($additional_select_fields)) {
            $model->selectAdd($additional_select_fields);
        }

        if (is_array($id_or_filters)) {
            $this->applyFilters($id_or_filters, $model);
        } else {
		    $model->UUID = $id_or_filters;
        }

		if ($check_acl && !AclController::hasPermission('fieldacl', 'viewpeer')) {
		    // UDID: 0 - public
		    $model->whereAdd(TABLE_PREFIX."FIELD_ACL.UDID = 0 OR ".TABLE_PREFIX."FIELD_ACL.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('fieldacl', $model);

		$model->find();

        $item = null;
     	if ($model->fetch()) {
		    FieldAclController::setupAdditionalData($model);

    		$item = clone $model;
     	}

        return $item;
	}

    public function getItemById($id, $join = false, $check_acl = true, $additional_select_fields = '') {
        return $this->getItem(array('ID' => $id), $join, $check_acl, $additional_select_fields);
    }

    public function getList($join = false, $filters = array(), $aftersearchfilters = array(), $orderby = 'ID DESC', $limit = 0, $page = 0, &$pagination = null, $checkguid = true, $additional_wheres = array()) {
		$model = new FieldAclModel();

        $this->initListModel($model, $join);

        $this->enforceObjectAclCheck('fieldacl', $model);

        if (!empty($additional_wheres)) {
            foreach ($additional_wheres as $where) {
                $model->whereAdd($where);
            }
        }

        $this->applyFilters($filters, $model);

		$_SESSION['fieldacl.list.model'] = clone $model;

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

    private function applyFilters($filters, &$model) {
        foreach($filters as $key => $value) {
            $value = trim($value);

            if ($value != '') {
                switch ($key) {
                    case '__QUICKSEARCH__':
                        $this->setupQuickSearchModel($model, StringHelper::htmlspecialchars($value));

                        break;

                    case 'ID_USER_GROUP':
                        if ($value == '__NULL__') {
                            $model->whereAdd(TABLE_PREFIX."FIELD_ACL.ID_USER_GROUP IS NULL");
                        } else {
                            $model->whereAdd(TABLE_PREFIX."FIELD_ACL.ID_USER_GROUP = '$value'");
                        }

                        break;

                    case 'ID_USER':
                        if ($value == '__NULL__') {
                            $model->whereAdd(TABLE_PREFIX."FIELD_ACL.ID_USER IS NULL");
                        } else {
                            $model->whereAdd(TABLE_PREFIX."FIELD_ACL.ID_USER = '$value'");
                        }

                        break;

                    case 'ID_ACL_TYPE':
                        if ($value == '__NULL__') {
                            $model->whereAdd(TABLE_PREFIX."FIELD_ACL.ID_ACL_TYPE IS NULL");
                        } else {
                            $model->whereAdd(TABLE_PREFIX."FIELD_ACL.ID_ACL_TYPE = '$value'");
                        }

                        break;

                    case 'MODULE':
                        $model->whereAdd(TABLE_PREFIX."FIELD_ACL.MODULE LIKE '%".$model->escape(StringHelper::htmlspecialchars($value))."%'");

                        break;

                    case 'WFID':
                        $model->whereAdd(TABLE_PREFIX."FIELD_ACL.WFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($value))."%'");

                        break;

                    default:
                        if (preg_match('/^custom.*/i', $key)) {
                            $model->whereAdd($value);
                        } else {
                            if (property_exists($model, $key)) {
                                if ($value == '__EMPTY__') {
                                    $model->whereAdd(TABLE_PREFIX."FIELD_ACL.$key IS NULL OR ".TABLE_PREFIX.".FIELD_ACL.$key = ''");
                                } else {
                                    $model->whereAdd(TABLE_PREFIX."FIELD_ACL.$key = '".$model->escape($value)."'");
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
        $model->selectAdd('`'.TABLE_PREFIX.'FIELD_ACL`.MODULE, `'.TABLE_PREFIX.'FIELD_ACL`.ACTION, `'.TABLE_PREFIX.'FIELD_ACL`.ID_USER_GROUP, `'.TABLE_PREFIX.'FIELD_ACL`.ID_USER, `'.TABLE_PREFIX.'FIELD_ACL`.FIELDS, `'.TABLE_PREFIX.'FIELD_ACL`.ID_ACL_TYPE, `'.TABLE_PREFIX.'FIELD_ACL`.ID, `'.TABLE_PREFIX.'FIELD_ACL`.JSON, `'.TABLE_PREFIX.'FIELD_ACL`.UUID, `'.TABLE_PREFIX.'FIELD_ACL`.WFID');
    
        if ($join) {
            $model->selectAdd('reftable_MODULE.NAME as reftext_MODULE');
            $model->selectAdd('reftable_MODULE.UUID as refuuid_MODULE');
            $model->selectAdd('reftable_ID_USER_GROUP.NAME as reftext_ID_USER_GROUP');
            $model->selectAdd('reftable_ID_USER_GROUP.UUID as refuuid_ID_USER_GROUP');
            $model->selectAdd('reftable_ID_USER.FIRST_NAME as reftext_ID_USER');
            $model->selectAdd('reftable_ID_USER.UUID as refuuid_ID_USER');
            $model->selectAdd('reftable_ID_ACL_TYPE.NAME as reftext_ID_ACL_TYPE');
            $model->selectAdd('reftable_ID_ACL_TYPE.UUID as refuuid_ID_ACL_TYPE');
        }
    
        if ($join) {
            $model->joinAdd(array('MODULE',TABLE_PREFIX.'ADMIN_MODULE:MODULE'), 'LEFT', 'reftable_MODULE');
            $model->joinAdd(array('ID_USER_GROUP',TABLE_PREFIX.'USER_GROUP:ID'), 'LEFT', 'reftable_ID_USER_GROUP');
            $model->joinAdd(array('ID_USER',TABLE_PREFIX.'USER:ID'), 'LEFT', 'reftable_ID_USER');
            $model->joinAdd(array('ID_ACL_TYPE',TABLE_PREFIX.'ACL_TYPE:ID'), 'LEFT', 'reftable_ID_ACL_TYPE');
        }
    }

    protected function initListModel(&$model, $join = false) {
        $model->selectAdd();
        $model->selectAdd('`'.TABLE_PREFIX.'FIELD_ACL`.MODULE, `'.TABLE_PREFIX.'FIELD_ACL`.ACTION, `'.TABLE_PREFIX.'FIELD_ACL`.ID_USER_GROUP, `'.TABLE_PREFIX.'FIELD_ACL`.ID_USER, `'.TABLE_PREFIX.'FIELD_ACL`.ID_ACL_TYPE, `'.TABLE_PREFIX.'FIELD_ACL`.ID, `'.TABLE_PREFIX.'FIELD_ACL`.JSON, `'.TABLE_PREFIX.'FIELD_ACL`.UUID, `'.TABLE_PREFIX.'FIELD_ACL`.WFID');
    
        if ($join) {
            $model->selectAdd('reftable_ID_USER_GROUP.NAME as reftext_ID_USER_GROUP');
            $model->selectAdd('reftable_ID_USER_GROUP.UUID as refuuid_ID_USER_GROUP');
            $model->selectAdd('reftable_ID_USER.FIRST_NAME as reftext_ID_USER');
            $model->selectAdd('reftable_ID_USER.UUID as refuuid_ID_USER');
            $model->selectAdd('reftable_ID_ACL_TYPE.NAME as reftext_ID_ACL_TYPE');
            $model->selectAdd('reftable_ID_ACL_TYPE.UUID as refuuid_ID_ACL_TYPE');
        }
    
        if ($join) {
            $model->joinAdd(array('ID_USER_GROUP',TABLE_PREFIX.'USER_GROUP:ID'), 'LEFT', 'reftable_ID_USER_GROUP');
            $model->joinAdd(array('ID_USER',TABLE_PREFIX.'USER:ID'), 'LEFT', 'reftable_ID_USER');
            $model->joinAdd(array('ID_ACL_TYPE',TABLE_PREFIX.'ACL_TYPE:ID'), 'LEFT', 'reftable_ID_ACL_TYPE');
        }
    }

    private function getAclEnabledIds() {
		$model = new FieldAclModel();

        $this->enforceObjectAclCheck('fieldacl', $model);

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

            $conds[] = TABLE_PREFIX."FIELD_ACL.REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."FIELD_ACL.MODULE LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."FIELD_ACL.ACTION LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."FIELD_ACL.FIELDS LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."FIELD_ACL.JSON LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";

            $model->whereAdd(implode(' OR ', $conds));
        }
    }

	

	

	

	

	

	

	

    

    
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class _AdminMenuItemController extends __AppController
{
    var $module = 'adminmenuitem';
    var $type = 'controller';
    var $__FILE__ = __FILE__;

    public function __construct() {
        parent::__construct();

        PluginManager::do_action('adminmenuitem_init');

        $this->initialize();
    }

    protected function checkConstraint($model, &$errors, $columns2check) {
        
       if (in_array('NAME', $columns2check) && trim($model->NAME) == '') {
           $errors['name'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Name'));
           return false;
       }
       if (in_array('ORDERING', $columns2check) && !empty($model->ORDERING) && !is_numeric($model->ORDERING)) {
           $errors['ordering'] = sprintf(_t('L_VALIDATION_NUMBER'), _t('Ordering'));
           return false;
       }


        if (!CustomFieldHelper::checkCustomFieldConstraint('adminmenuitem', $model, $errors)) {
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

    public function getFormData() {
		$formdata = array();

        $raw = array_merge($_REQUEST, $_FILES);

		foreach ($raw as $name => $value) {
            if (preg_match('/^adminmenuitem_formdata_(.*)/', $name, $matches)) {
                $formdata[$matches[1]] = is_array($value)? $value : trim($value);
            }
		}

        return $formdata;
    }

    protected function getSearchFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^adminmenuitem_searchdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    protected function getFilterFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^adminmenuitem_filterdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    public function listAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        ContextStack::check2redirect('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'list');

		ContextStack::register(APPLICATION_URL.'/adminmenuitem/list/');
        
        $this->setPresetData(null);

		$this->_list();
	}

    public function updateOrderAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

	    $items = isset($_REQUEST['item'])? $_REQUEST['item'] : array();

        if (is_array($items) && !empty($items)) {
    		$model = new AdminMenuItemModel();

            foreach ($items as $ordering => $id) {
                $query = "update ".$model->tableName().
                        " set ORDERING = '".($ordering+1)."'".
                        " where UUID = '$id'";

                $model->query($query);
            }
        }
    }

    public function sortAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

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

        LicenseController::enforceLicenseCheck('adminmenuitem');

		$searchdata = $this->getSearchFormData();

        $this->updateSearchData($searchdata);
        $this->updateFilterData(array());

        ContextStack::back(0);
    }

    public function filterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

		$filterdata = $this->getFilterFormData();

        $this->updateFilterData($filterdata);

        ContextStack::back(0);
    }

    public function customFilterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id) && Framework::hasModule('AdminFilter')) {
            $afm = new AdminFilterModel();

            $afm->UUID = $id;
            $afm->MODULE = 'adminmenuitem';

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

                    $conditions[$condition][] = "(".TABLE_PREFIX."ADMIN_MENU_ITEM.$field $operator '$value')";
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

        LicenseController::enforceLicenseCheck('adminmenuitem');

        $columns2return = array('ID' => 'id', 'NAME' => 'name');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';

		$model = new AdminMenuItemModel();
		if (!empty($term)) {
            $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");
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

        LicenseController::enforceLicenseCheck('adminmenuitem');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';
        $mode = isset($_REQUEST['mode'])? $_REQUEST['mode'] : 'view';

        if (empty($term)) {
            return;
        }

		$model = new AdminMenuItemModel();
        $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");

		$model->orderBy('NAME');
		$model->limit(0, 10);
		$model->find();

		$rows = array();
     	while ($model->fetch()) {
     		$rows[] = array('id' => $model->UUID, 'eid' => $model->ID, 'title' => $model->NAME);
		}

		$smarty = Framework::getSmarty(__FILE__);

		$smarty->assign('rows', $rows);
		$smarty->assign('module', 'adminmenuitem');
		$smarty->assign('liveselect', $liveselect);
		$smarty->assign('mode', $mode);

	    $this->display($smarty, 'livesearch.results.tpl');
    }

    public function pageAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

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

        LicenseController::enforceLicenseCheck('adminmenuitem');

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

		$_model = new AdminMenuItemModel();
		$_model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');
        $_model->find();

        while ($_model->fetch()) {
            $_models[] = clone $_model;

            $_ids[] = $_model->ID;
        }

        foreach ($_models as $_model) {
            $this->onBeforeDelete($_model);
            PluginManager::do_action('adminmenuitem_before_delete', $_model);
        }

		$model = new AdminMenuItemModel();
		$model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');

		if (!AclController::hasPermission('adminmenuitem', 'deletepeer')) {
		    $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('adminmenuitem', $model);
		
		$model->delete();

        foreach ($_models as $_model) {
            $this->onDeleteSuccess($_model);
            PluginManager::do_action('adminmenuitem_deleted', $_model);
        }
    }

    public function deleteAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'delete');

	    list($id) = explode('/', $_REQUEST['args']);

        TransactionHelper::begin();

	    if (!empty($id)) {
	        $selection = array($id);
        } else {
			$selectall = isset($_REQUEST['adminmenuitemlist_selection_selectall']) && $_REQUEST['adminmenuitemlist_selection_selectall'];

			if ($selectall) {
				if (isset($_SESSION['adminmenuitem.list.model']) && is_object($_SESSION['adminmenuitem.list.model'])) {
					$model = clone $_SESSION['adminmenuitem.list.model'];
				} else {
		        	$model = new AdminMenuItemModel();
				}

				$model->find();

				$selection = array();
		        while ($model->fetch()) {
		        	$selection[] = $model->UUID;
		        }
			} else {
    			$selection = isset($_REQUEST['adminmenuitemlist_selection'])? $_REQUEST['adminmenuitemlist_selection'] : '';
			}
        }

		$relations = isset($_REQUEST['deleterelations'])? $_REQUEST['deleterelations'] : '';

		if (!empty($selection)) {
		    $this->delete('UUID', $selection, $_ids);

            if (!empty($relations)) {
                foreach ($relations as $module) {
                    switch ($module) {
                        case 'adminmenuitem': 
                            (new AdminMenuItemController())->delete('PARENT', $_ids);
                            break;

                        default:
                            break;
                    }
                }
            }
        }

        TransactionHelper::end();

        ContextStack::getCurrentScreenContext($module, $action);
        if ($module != 'adminmenuitem' || in_array($action, array('list', 'page'))) {
		    ContextStack::back(0);
        } else {
		    ContextStack::back(1);
        }
	}

    public function newAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

		ContextStack::register(APPLICATION_URL.'/adminmenuitem/new/');

        $this->_edit(0);
	}

    public function viewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'view');

		@list($id, $templatecode) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new AdminMenuItemModel(), $_REQUEST);
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
            $adminview = AdminViewHelper::getAdminView('adminmenuitem', $templatecode);

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
		    ContextStack::register(APPLICATION_URL.'/adminmenuitem/view/'.$id);
    		$this->_view($id);
        }
	}

    public function editAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new AdminMenuItemModel(), $_REQUEST);
        }

        if (empty($filters)) {
            $this->pagenotfound();
        }

        $model = $this->getItem($filters, false);

		if (!$model->UUID) {
		    $this->pagenotfound();
		}

		$id = $model->UUID;

		ContextStack::register(APPLICATION_URL.'/adminmenuitem/edit/'.$id);
		$this->_edit($id);
	}

    function onBeforeInsert($model) {
        if (trim($model->PARENT) != '') {
        	if ($model->PARENT) {
    			$parent = new AdminMenuItemModel();
    			$parent->ID = $model->PARENT;
    			$parent->find();
    			$parent->fetch();

    			$model->HIERACHY = (!empty($parent->HIERACHY)? $parent->HIERACHY : '-').$model->PARENT.'-';
    		} else {
    			$model->HIERACHY = '';
    		}
        }

        parent::onBeforeInsert($model);
    }

    function onBeforeUpdate($model, $old) {
        if (trim($model->PARENT) != '') {
        	if ($model->PARENT) {
    			$parent = new AdminMenuItemModel();
    			$parent->ID = $model->PARENT;
    			$parent->find();
    			$parent->fetch();

    			$model->HIERACHY = (!empty($parent->HIERACHY)? $parent->HIERACHY : '-').$model->PARENT.'-';
    		} else {
    			$model->HIERACHY = '';
    		}
        }

        parent::onBeforeUpdate($model, $old);
    }

    function onUpdateSuccess($model, $old) {
    	if ($model->HIERACHY != $old->HIERACHY) {
	    	$search = (!empty($old->HIERACHY)? $old->HIERACHY : '-').$old->ID.'-';
			$replace = (!empty($model->HIERACHY)? $model->HIERACHY : '-').$model->ID.'-';

			$sql = "UPDATE ".TABLE_PREFIX."ADMIN_MENU_ITEM SET HIERACHY = REPLACE(HIERACHY, '$search', '$replace') WHERE HIERACHY LIKE '%$search%'";

			$parent = new AdminMenuItemModel();
			$parent->query($sql);
		}

		parent::onUpdateSuccess($model, $old);
	}

    public function rebuildHierachyAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

		$model = new AdminMenuItemModel();

		$sql = 'UPDATE '.TABLE_PREFIX.'ADMIN_MENU_ITEM SET HIERACHY = NULL';

		$model->query($sql);

    	do {
			$model = new AdminMenuItemModel();

    		$sql = 'SELECT CHILD.ID, CHILD.PARENT, PARENT.HIERACHY AS PARENT_HIERACHY'.
    				' FROM '.TABLE_PREFIX.'ADMIN_MENU_ITEM CHILD'.
    				' JOIN '.TABLE_PREFIX.'ADMIN_MENU_ITEM PARENT ON CHILD.PARENT = PARENT.ID'.
    				' WHERE CHILD.HIERACHY IS NULL AND (PARENT.PARENT IS NULL OR PARENT.HIERACHY IS NOT NULL)';

			$model->query($sql);

			while ($model->fetch()) {
				$tmp = new AdminMenuItemModel();

				$tmp->ID = $model->ID;
				$tmp->HIERACHY = (!empty($model->PARENT_HIERACHY)? $model->PARENT_HIERACHY : '-').$model->PARENT.'-';

				$tmp->update();
			}
		} while ($model->N > 0);

		ContextStack::back(0);
	}

    protected function onSaveSuccess($model) {
        AdminMenuController::sync_JSON_ADMIN_MENU_ITEMS($model->ID_ADMIN_MENU);
        parent::onSaveSuccess($model);
    }

    protected function onDeleteSuccess($model) {
        AdminMenuController::sync_JSON_ADMIN_MENU_ITEMS($model->ID_ADMIN_MENU);
        parent::onDeleteSuccess($model);
    }

    protected function formmode($prefix = null) {
        $multiple = false;

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^'.$prefix.'adminmenuitem_formdata_(.+)/', $name)) {
                return 'single'; // the single mode has a higher priority
            }

            if (!$multiple && preg_match('/^'.$prefix.'adminmenuitem_multiformdata_(.+)/', $name)) {
                $multiple = true;
            }
        }

        return $multiple? 'multiple' : 'single';
    }

    protected function field_sanitize($column, $value) {
		if ($column == 'ORDERING') {
            $value = preg_replace('/[^0-9\.]/is', '', $value);
        }
		return $value;
	}

    protected function form2model($prefix = null, &$columns2check = null) {
        $customfieldcolumns = CustomFieldHelper::getCustomFieldColumns('adminmenuitem');
        $customfieldvalues = array();

        $columns2edit = array('UUID', 'NAME', 'ID_ADMIN_MENU', 'PARENT', 'MODULE', 'PATH', 'FONT_AWESOME_ICON', 'ENABLE_LEFT', 'ENABLE_TOP', 'ENABLE_QUICK', 'ENABLE_ALL', 'ENABLE_SETTINGS', 'OPEN_IN_NEW_WINDOW', 'IS_STARRED', 'ORDERING');
        $columns2edit = array_merge($columns2edit, $customfieldcolumns);

		$model = new AdminMenuItemModel();
        $matched = false;
		$columns2check = array();

		$raw = $_REQUEST;
		foreach ($_FILES as $key => $value) {
		    $raw[$key] = $value['name'];
		}

		foreach ($raw as $name => $value) {
            if (preg_match('/^'.$prefix.'adminmenuitem_formdata_(.*)/', $name, $matches)) {
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
        $columns2edit = array('UUID', 'NAME', 'ID_ADMIN_MENU', 'PARENT', 'MODULE', 'PATH', 'FONT_AWESOME_ICON', 'ENABLE_LEFT', 'ENABLE_TOP', 'ENABLE_QUICK', 'ENABLE_ALL', 'ENABLE_SETTINGS', 'OPEN_IN_NEW_WINDOW', 'IS_STARRED', 'ORDERING');
        $columns2edit = array_merge($columns2edit, CustomFieldHelper::getCustomFieldColumns('adminmenuitem'));

        $rows = array();
		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^'.$prefix.'adminmenuitem_multiformdata_(.+)/', $name, $matches)) {
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
            $model = new AdminMenuItemModel();

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

            $deleteditems = isset($_REQUEST[$prefix.'adminmenuitem_multiformdata_deleteditems'])? $_REQUEST[$prefix.'adminmenuitem_multiformdata_deleteditems'] : '';
            $deleteditems = explode(',', trim($deleteditems, ','));

    		if (!empty($deleteditems)) {
                $_models = array();

        		$_model = new AdminMenuItemModel();
        		$_model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');
                $_model->find();

                while ($_model->fetch()) {
                    $_models[] = clone $_model;
                }

                foreach ($_models as $_model) {
                    $this->onBeforeDelete($_model);
                    PluginManager::do_action('adminmenuitem_before_delete', $_model);
                }

        		$model = new AdminMenuItemModel();
        		$model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');

        		$model->delete();

                foreach ($_models as $_model) {
                    $this->onDeleteSuccess($_model);
                    PluginManager::do_action('adminmenuitem_deleted', $_model);
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
            CustomFieldHelper::updateCustomFieldValues('adminmenuitem', $model);
            
            $this->bind2refobject($model, $refobject);
            $this->onBeforeSave($model);
            PluginManager::do_action('adminmenuitem_before_save', $model);

    		if ($model->UUID) {
				
				$old = new AdminMenuItemModel();
				$old->UUID = $model->UUID;
				$old->find();
				$old->fetch();

                $this->onBeforeUpdate($model, $old);
                PluginManager::do_action('adminmenuitem_before_update', $model, $old);

        		if (!AclController::hasPermission('adminmenuitem', 'editpeer')) {
        		    $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.UUID = '".$model->UUID."' AND ".TABLE_PREFIX."ADMIN_MENU_ITEM.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		} else {
        		    $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.UUID = '".$model->UUID."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		}

    		    //$model->find();
    		    //$model->fetch();
    		    $model->_isnew = false;
    		    $this->onUpdateSuccess($model, $old);
    		    PluginManager::do_action('adminmenuitem_updated', $model, $old);
            } else {
                $model->ID = null;
                
                $this->onBeforeInsert($model);
                PluginManager::do_action('adminmenuitem_before_create', $model);

    		    $model->insert();
    		    $model->_isnew = true;

    		    $this->onInsertSuccess($model);
    		    PluginManager::do_action('adminmenuitem_created', $model);
            }

            $this->onSaveSuccess($model);
        }

        DraftHelper::clearAllDrafts('adminmenuitem');

        if (count($models) == 1) {
            return $model;
        }

        return true;
    }

    protected function bind2refobject(&$model, $refobject = null) {
        if ($refobject != null) {
            $refclass = get_class($refobject);
            
            if ($refclass == 'AdminMenuModel' && empty($model->ID_ADMIN_MENU)) {
                $model->ID_ADMIN_MENU = $refobject->ID;
            }
            if ($refclass == 'AdminMenuItemModel' && empty($model->PARENT)) {
                $model->PARENT = $refobject->ID;
            }
            if ($refclass == 'AdminModuleModel' && empty($model->MODULE)) {
                $model->MODULE = $refobject->MODULE;
            }

        }
    }

    public function saveDraftAction() {
        LicenseController::enforceLicenseCheck('adminmenuitem');

        $formdata = $this->getFormData();

        DraftHelper::saveDraft('adminmenuitem', isset($formdata['UUID'])? $formdata['UUID'] : '', $formdata);
    }

    public function saveAction($datacheck = true, $addmore = false) {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

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
	            $this->_edit(null, $this->form2model(), "$viewtype.adminmenuitem.tpl");
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

    protected function multiupdate($models, &$errors) {
        if (!$this->checkConstraints($models, $errors)) {
    		return false;
        }

        foreach($models as $model) {
    		if ($model->UUID) {
    		    
    		    $model->update();
            } else {
                
    		    $model->insert();
            }
        }

        return true;
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

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

		list($id, $col, $val) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$model = new AdminMenuItemModel();

        $model->$col = $val;
        $model->whereAdd("UUID = $id");
        $model->update(DB_DATAOBJECT_WHEREADD_ONLY);

		ContextStack::back(0);
	}

    public function cancelAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        $returnurl = isset($_REQUEST['return'])? $_REQUEST['return'] : '';
        
        DraftHelper::clearAllDrafts('adminmenuitem');
        
        
		ContextStack::back($back, $returnurl);
	}

    public function closeAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        $returnurl = isset($_REQUEST['return'])? $_REQUEST['return'] : '';
        
        DraftHelper::clearAllDrafts('adminmenuitem');
        
		ContextStack::back($back, $returnurl);
	}

    public function quickCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

		$this->_edit(0, null, 'quick-create.adminmenuitem.tpl', false);
    }

    public function preCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

		$this->_edit(0, null, 'pre-create.adminmenuitem.tpl', false);
    }

    public function rowNewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

		$this->_edit(0, null, 'row-edit.adminmenuitem.tpl', false);
    }

    public function rowEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-edit.adminmenuitem.tpl', false);
    }

    public function rowExpandedEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-expanded-edit.adminmenuitem.tpl', false);
    }

    public function rowViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-view.adminmenuitem.tpl');
    }

    public function rowSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-edit.adminmenuitem.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-view.adminmenuitem.tpl');
        }
    }

    public function rowExpandedSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-expanded-edit.adminmenuitem.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-expanded.adminmenuitem.tpl');
        }
    }

    public function rowExpandedViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-expanded.adminmenuitem.tpl');
    }

    public function fieldSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminmenuitem');

        AclController::checkPermission('adminmenuitem', 'edit');

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
            return array('NAME', 'MODULE', 'ORDERING', 'ENABLE_LEFT', 'ENABLE_TOP', 'ENABLE_QUICK', 'ENABLE_ALL');
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
            $_SESSION['adminmenuitem.customview'] = $_REQUEST['customview'];
        }

        $customview = isset($_SESSION['adminmenuitem.customview'])? $_SESSION['adminmenuitem.customview'] : '';

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
        $filtercolumns = $this->getCustomFilterColumns('adminmenuitem', $filter);

        $aclviewablecolumns = AclController::getAclEnabledColumns('adminmenuitem', 'view');

        if (empty($aclviewablecolumns) || (!isset($aclviewablecolumns['*']) && !in_array(true, $aclviewablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $excludedcolumns = AclController::getSystemExcludedColumns('adminmenuitem');
        
        $presetdata = $this->getPresetData();
        $searchdata = $this->getSearchData();
        $filterdata = $this->getFilterData();
        $customfilterdata = $this->getCustomFilterData();
        $orderby = $this->getRealOrderBy('ORDERING');
        $limit = $this->getPageSize();
        $page = $this->getPageNumber();

        $rows = $this->getList(true, $searchdata + $customfilterdata + $presetdata, $filterdata, $orderby, $limit, $page, $pagination);
        

        $ids = array();
        foreach ($rows as $row) {
            $ids[] = $row->UUID;
        }
        $_SESSION['adminmenuitem.list.ids'] = $ids;

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
		$smarty->assign('module', 'adminmenuitem');
		$smarty->assign('filter', $filter);
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getListCustomFields('adminmenuitem'));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('formdata', $searchdata);
		$smarty->assign('searchdata', $searchdata);
		$smarty->assign('additional_list_buttons', $this->setupAdditionalListButtons());
		$smarty->assign('admin_list_actions', AdminActionHelper::getAdminActions('adminmenuitem', 'list'));
		$smarty->assign('admin_listitem_actions', AdminActionHelper::getAdminActions('adminmenuitem', 'listitem'));
		$smarty->assign('customview', $customview);
		$smarty->assign('customtemplate', $customtemplate);
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('adminmenuitem', 'view'));
		

        $templatetype = !empty($this->templatetype)? $this->templatetype : 'list';
	    $this->display($smarty, $templatetype.'.adminmenuitem.tpl');
    }

    protected function _view($id, $details = null, $templatecode = 'view.adminmenuitem.tpl') {
        $filtercolumns = $this->getCustomFilterColumns('adminmenuitem');

        $aclviewablecolumns = AclController::getAclEnabledColumns('adminmenuitem', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('adminmenuitem', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('adminmenuitem', 'new');
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

        $excludedcolumns = AclController::getSystemExcludedColumns('adminmenuitem');

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');
        if (!empty($preset)) {
            $aclviewablecolumns[$preset] = false;
        }

        $ids = isset($_SESSION['adminmenuitem.list.ids'])? $_SESSION['adminmenuitem.list.ids'] : array();
        $key = array_search($details->UUID, $ids);
        $previd = isset($ids[$key - 1])? $ids[$key - 1] : 0;
        $nextid = isset($ids[$key + 1])? $ids[$key + 1] : 0;

        $this->setupAdditionalData($details);

        $this->initPlugins();

        $this->onBeforeView($details);
        PluginManager::do_action('adminmenuitem_before_view', $details);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('previd', $previd);
		$smarty->assign('nextid', $nextid);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'adminmenuitem');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('adminmenuitem', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('currentvalue', $details->UUID);
		$smarty->assign('additional_view_fields', $this->setupAdditionalViewFields($details));
		$smarty->assign('additional_view_buttons', $this->setupAdditionalViewButtons($details));
		$smarty->assign('admin_view_actions', AdminActionHelper::getAdminActions('adminmenuitem', 'view'));
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('adminmenuitem', 'view'));
        $smarty->assign('readonly', isset($_REQUEST['readonly']) && $_REQUEST['readonly']);

	    $this->display($smarty, $templatecode);

        $this->onViewSuccess($details);
        PluginManager::do_action('adminmenuitem_viewed', $details);
	}

    protected function _edit($id, $details = null, $templatecode = 'edit.adminmenuitem.tpl', $restoredraft = true) {
        $filtercolumns = $this->getCustomFilterColumns('adminmenuitem');

        $aclviewablecolumns = AclController::getAclEnabledColumns('adminmenuitem', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('adminmenuitem', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('adminmenuitem', 'new');
        }

        if (empty($acleditablecolumns) || (!isset($acleditablecolumns['*']) && !in_array(true, $acleditablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $acleditablecolumns['UUID'] = true;

        $excludedcolumns = AclController::getSystemExcludedColumns('adminmenuitem');

        $roweditablecolumns = array('NAME', 'ID_ADMIN_MENU', 'MODULE', 'PATH', 'FONT_AWESOME_ICON', 'ENABLE_LEFT', 'ENABLE_TOP', 'ENABLE_QUICK', 'ENABLE_ALL', 'ENABLE_SETTINGS', 'OPEN_IN_NEW_WINDOW', 'IS_STARRED', 'ORDERING');

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
    		$model = new AdminMenuItemModel();

            if ($id) {
                $model = $this->getItem($id, true);

             	if (!$model) {
        		    $this->pagenotfound();
             	}

                if ($model->GUID != $_SESSION['user']->ID) {
             	    AclController::checkPermission('adminmenuitem', 'editpeer');
                }
            } else {
                // Set default values here
                if ($recent = $this->getRecentModel()) {
                    $model->ID_ADMIN_MENU = $recent->ID_ADMIN_MENU;
                    $model->PARENT = $recent->PARENT;
                }

                $this->onInitialization($model);
                PluginManager::do_action('adminmenuitem_new', $model);
            }
            
            if ($restoredraft) {
                DraftHelper::tryRestoreDraft('adminmenuitem', $model->UUID, $model);
            }
            
    		$details = $model;
        }

        if (!$details->UUID) {
            foreach ($presetparams as $column => $value) {
                $details->$column = $value;
            }
        }

        if ($details->UUID) {
            if (isset($details->ID_ADMIN_MENU) && $details->ID_ADMIN_MENU) {
                $acleditablecolumns['ID_ADMIN_MENU'] = false;

                $roweditablecolumns = array_diff($roweditablecolumns, array('ID_ADMIN_MENU'));
            }
        }

        WorkflowHelper::ensureEditable($details->WFID);
        
        $this->initPlugins();

        $this->onBeforeEdit($details);
        PluginManager::do_action('adminmenuitem_before_edit', $details);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('preset', $preset);
		$smarty->assign('presetvalue', $presetvalue);
		$smarty->assign('presetparams', $presetparams);
		
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'adminmenuitem');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('adminmenuitem', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('columntooltips', FieldHelper::getColumnTooltips('adminmenuitem'));
		$smarty->assign('roweditablecolumns', $roweditablecolumns);
        $smarty->assign('fielddependencies', FieldHelper::getFieldDependencies('adminmenuitem'));

	    $this->display($smarty, $templatecode);
	}

    protected function getLayoutColumns() {
        return array('NAME', 'ID_ADMIN_MENU', 'PARENT', 'MODULE', 'PATH', 'FONT_AWESOME_ICON', 'ENABLE_LEFT', 'ENABLE_TOP', 'ENABLE_QUICK', 'ENABLE_ALL', 'ENABLE_SETTINGS', 'OPEN_IN_NEW_WINDOW', 'IS_STARRED');
    }

    public function getItem($id_or_filters, $join = false, $check_acl = true, $additional_select_fields = '') {
		$model = new AdminMenuItemModel();

        $this->initViewModel($model, $join);

        if (!empty($additional_select_fields)) {
            $model->selectAdd($additional_select_fields);
        }

        if (is_array($id_or_filters)) {
            $this->applyFilters($id_or_filters, $model);
        } else {
		    $model->UUID = $id_or_filters;
        }

		if ($check_acl && !AclController::hasPermission('adminmenuitem', 'viewpeer')) {
		    // UDID: 0 - public
		    $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.UDID = 0 OR ".TABLE_PREFIX."ADMIN_MENU_ITEM.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('adminmenuitem', $model);

		$model->find();

        $item = null;
     	if ($model->fetch()) {
		    AdminMenuItemController::setupAdditionalData($model);

    		$item = clone $model;
     	}

        return $item;
	}

    public function getItemById($id, $join = false, $check_acl = true, $additional_select_fields = '') {
        return $this->getItem(array('ID' => $id), $join, $check_acl, $additional_select_fields);
    }

    public function getList($join = false, $filters = array(), $aftersearchfilters = array(), $orderby = 'ID DESC', $limit = 0, $page = 0, &$pagination = null, $checkguid = true, $additional_wheres = array()) {
		$model = new AdminMenuItemModel();

        $this->initListModel($model, $join);

        $this->enforceObjectAclCheck('adminmenuitem', $model);

        if (!empty($additional_wheres)) {
            foreach ($additional_wheres as $where) {
                $model->whereAdd($where);
            }
        }

        $this->applyFilters($filters, $model);

		$_SESSION['adminmenuitem.list.model'] = clone $model;

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
		}        $items = UiHelper::hierachical($items, 'ID', 'NAME', 'PARENT', '10');


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

                    case 'NAME':
                        $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($value))."%'");

                        break;

                    case 'ID_ADMIN_MENU':
                        if ($value == '__NULL__') {
                            $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.ID_ADMIN_MENU IS NULL");
                        } else {
                            $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.ID_ADMIN_MENU = '$value'");
                        }

                        break;

                    case 'PARENT':
                        if ($value == '__NULL__') {
                            $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.PARENT IS NULL");
                        } else {
                            $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.ID = $value OR ".TABLE_PREFIX."ADMIN_MENU_ITEM.PARENT = $value OR ADMIN_MENU_ITEM.HIERACHY LIKE '%-$value-%'");
                        }

                        break;

                    case 'MODULE':
                        $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.MODULE LIKE '%".$model->escape(StringHelper::htmlspecialchars($value))."%'");

                        break;

                    default:
                        if (preg_match('/^custom.*/i', $key)) {
                            $model->whereAdd($value);
                        } else {
                            if (property_exists($model, $key)) {
                                if ($value == '__EMPTY__') {
                                    $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.$key IS NULL OR ".TABLE_PREFIX.".ADMIN_MENU_ITEM.$key = ''");
                                } else {
                                    $model->whereAdd(TABLE_PREFIX."ADMIN_MENU_ITEM.$key = '".$model->escape($value)."'");
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
        $model->selectAdd('`'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.NAME, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ID_ADMIN_MENU, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.PARENT, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.MODULE, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.PATH, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.FONT_AWESOME_ICON, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_LEFT, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_TOP, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_QUICK, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_ALL, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_SETTINGS, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.OPEN_IN_NEW_WINDOW, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.IS_STARRED, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ID, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.JSON, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.UUID, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.WFID, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.HIERACHY');
    
        if ($join) {
            if (Framework::hasModule('AdminMenu')) {
                $model->selectAdd('reftable_ID_ADMIN_MENU.NAME as reftext_ID_ADMIN_MENU');
                $model->selectAdd('reftable_ID_ADMIN_MENU.UUID as refuuid_ID_ADMIN_MENU');
            }
            if (Framework::hasModule('AdminMenuItem')) {
                $model->selectAdd('reftable_PARENT.NAME as reftext_PARENT');
                $model->selectAdd('reftable_PARENT.UUID as refuuid_PARENT');
            }
            if (Framework::hasModule('AdminModule')) {
                $model->selectAdd('reftable_MODULE.NAME as reftext_MODULE');
                $model->selectAdd('reftable_MODULE.UUID as refuuid_MODULE');
            }
        }
    
        if ($join) {
            if (Framework::hasModule('AdminMenu')) {
                $model->joinAdd(array('ID_ADMIN_MENU',TABLE_PREFIX.'ADMIN_MENU:ID'), 'LEFT', 'reftable_ID_ADMIN_MENU');
            }
            if (Framework::hasModule('AdminMenuItem')) {
                $model->joinAdd(array('PARENT,ID_ADMIN_MENU',TABLE_PREFIX.'ADMIN_MENU_ITEM:ID,ID_ADMIN_MENU'), 'LEFT', 'reftable_PARENT');
            }
            if (Framework::hasModule('AdminModule')) {
                $model->joinAdd(array('MODULE',TABLE_PREFIX.'ADMIN_MODULE:MODULE'), 'LEFT', 'reftable_MODULE');
            }
        }
    }

    protected function initListModel(&$model, $join = false) {
        $model->selectAdd();
        $model->selectAdd('`'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.NAME, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ID_ADMIN_MENU, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.MODULE, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.PATH, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.FONT_AWESOME_ICON, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_LEFT, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_TOP, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_QUICK, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_ALL, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ENABLE_SETTINGS, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.OPEN_IN_NEW_WINDOW, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.IS_STARRED, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ORDERING, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.ID, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.JSON, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.UUID, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.WFID, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.PARENT, `'.TABLE_PREFIX.'ADMIN_MENU_ITEM`.HIERACHY');
    
        if ($join) {
            if (Framework::hasModule('AdminMenu')) {
                $model->selectAdd('reftable_ID_ADMIN_MENU.NAME as reftext_ID_ADMIN_MENU');
                $model->selectAdd('reftable_ID_ADMIN_MENU.UUID as refuuid_ID_ADMIN_MENU');
            }
            if (Framework::hasModule('AdminModule')) {
                $model->selectAdd('reftable_MODULE.NAME as reftext_MODULE');
                $model->selectAdd('reftable_MODULE.UUID as refuuid_MODULE');
            }
        }
    
        if ($join) {
            if (Framework::hasModule('AdminMenu')) {
                $model->joinAdd(array('ID_ADMIN_MENU',TABLE_PREFIX.'ADMIN_MENU:ID'), 'LEFT', 'reftable_ID_ADMIN_MENU');
            }
            if (Framework::hasModule('AdminModule')) {
                $model->joinAdd(array('MODULE',TABLE_PREFIX.'ADMIN_MODULE:MODULE'), 'LEFT', 'reftable_MODULE');
            }
        }
    }

    public function getAclEnabledIds() {
		$model = new AdminMenuItemModel();

        $this->enforceObjectAclCheck('adminmenuitem', $model);

        $model->find();

        $ids = array();

        while ($model->fetch()) {
            $ids[] = $model->ID;
        }

        return $ids;
    }

    protected function getParentWiseAclCheckString() {
        // Parent ids
        $pc = new AdminMenuController();

        $ids = $pc->getAclEnabledIds();

        // Inherited where string
        $where = '';

        if (!empty($ids)) {
            $where = TABLE_PREFIX."ADMIN_MENU_ITEM.ID_ADMIN_MENU IN (".implode(',', $ids).")";
        }

        return $where;
    }

    protected function setupQuickSearchModel(&$model, $searchstring) {
        $keywords = explode(' ', $searchstring);

        foreach ($keywords as $keyword) {
            $conds = array();

            $conds[] = TABLE_PREFIX."ADMIN_MENU_ITEM.REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."ADMIN_MENU_ITEM.NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."ADMIN_MENU_ITEM.MODULE LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."ADMIN_MENU_ITEM.PATH LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."ADMIN_MENU_ITEM.FONT_AWESOME_ICON LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."ADMIN_MENU_ITEM.JSON LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";

            $model->whereAdd(implode(' OR ', $conds));
        }
    }

	

	

	

	

	

	

	

    

    
}
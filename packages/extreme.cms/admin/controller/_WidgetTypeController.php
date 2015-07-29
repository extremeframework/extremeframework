<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class _WidgetTypeController extends __AppController
{
    var $module = 'widgettype';
    var $type = 'controller';
    var $__FILE__ = __FILE__;

    public function __construct() {
        parent::__construct();

        PluginManager::do_action('widgettype_init');

        $this->initialize();
    }

    protected function checkConstraint($model, &$errors, $columns2check) {
        
       if (in_array('NAME', $columns2check) && trim($model->NAME) == '') {
           $errors['name'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Name'));
           return false;
       }
       if (in_array('CODE', $columns2check) && trim($model->CODE) == '') {
           $errors['code'] = sprintf(_t('L_VALIDATION_NOT_EMPTY'), _t('Code'));
           return false;
       }
       if (in_array('CODE', $columns2check)) {
           $_model = new WidgetTypeModel();
           $_model->CODE = $model->CODE;

           if ($model->UUID) {
               $_model->whereAdd('UUID != '.$model->UUID);
           }

           $_model->find();
           if ($_model->N) {
               $errors['code'] = sprintf(L_VALIDATION_ALREADY_EXISTS, '{'.L_CODE.'}');
               return false;
           }
       }


        if (!CustomFieldHelper::checkCustomFieldConstraint('widgettype', $model, $errors)) {
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
            if (preg_match('/^widgettype_formdata_(.*)/', $name, $matches)) {
                $formdata[$matches[1]] = is_array($value)? $value : trim($value);
            }
		}

        return $formdata;
    }

    protected function getSearchFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^widgettype_searchdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    protected function getFilterFormData() {
		$searchdata = array();

		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^widgettype_filterdata_(.*)/', $name, $matches)) {
                $searchdata[$matches[1]] = trim($value);
            }
		}

        return $searchdata;
    }

    public function listAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        ContextStack::check2redirect('widgettype');

        AclController::checkPermission('widgettype', 'list');

		ContextStack::register(APPLICATION_URL.'/widgettype/list/');
        
        $this->setPresetData(null);

		$this->_list();
	}

    public function sortAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

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

        LicenseController::enforceLicenseCheck('widgettype');

		$searchdata = $this->getSearchFormData();

        $this->updateSearchData($searchdata);
        $this->updateFilterData(array());

        ContextStack::back(0);
    }

    public function filterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

		$filterdata = $this->getFilterFormData();

        $this->updateFilterData($filterdata);

        ContextStack::back(0);
    }

    public function customFilterAction() {
	    AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id) && Framework::hasModule('AdminFilter')) {
            $afm = new AdminFilterModel();

            $afm->UUID = $id;
            $afm->MODULE = 'widgettype';

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

                    $conditions[$condition][] = "(".TABLE_PREFIX."WIDGET_TYPE.$field $operator '$value')";
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

        LicenseController::enforceLicenseCheck('widgettype');

        $columns2return = array('CODE' => 'id', 'NAME' => 'name');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';

		$model = new WidgetTypeModel();
		if (!empty($term)) {
            $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR CODE LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");
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

        LicenseController::enforceLicenseCheck('widgettype');

        $term = isset($_REQUEST['term'])? $_REQUEST['term'] : '';
        $mode = isset($_REQUEST['mode'])? $_REQUEST['mode'] : 'view';

        if (empty($term)) {
            return;
        }

		$model = new WidgetTypeModel();
        $model->whereAdd("REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%' OR CODE LIKE '%".$model->escape(StringHelper::htmlspecialchars($term))."%'");

		$model->orderBy('NAME');
		$model->limit(0, 10);
		$model->find();

		$rows = array();
     	while ($model->fetch()) {
     		$rows[] = array('id' => $model->UUID, 'eid' => $model->CODE, 'title' => $model->NAME);
		}

		$smarty = Framework::getSmarty(__FILE__);

		$smarty->assign('rows', $rows);
		$smarty->assign('module', 'widgettype');
		$smarty->assign('liveselect', $liveselect);
		$smarty->assign('mode', $mode);

	    $this->display($smarty, 'livesearch.results.tpl');
    }

    public function pageAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

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

        LicenseController::enforceLicenseCheck('widgettype');

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

		$_model = new WidgetTypeModel();
		$_model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');
        $_model->find();

        while ($_model->fetch()) {
            $_models[] = clone $_model;

            $_ids[] = $_model->CODE;
        }

        foreach ($_models as $_model) {
            $this->onBeforeDelete($_model);
            PluginManager::do_action('widgettype_before_delete', $_model);
        }

		$model = new WidgetTypeModel();
		$model->whereAdd($target_column.' = "'.implode('" or '.$target_column.' = "', $target_values).'"');

		if (!AclController::hasPermission('widgettype', 'deletepeer')) {
		    $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('widgettype', $model);
		
		$model->delete();

        foreach ($_models as $_model) {
            $this->onDeleteSuccess($_model);
            PluginManager::do_action('widgettype_deleted', $_model);
        }
    }

    public function deleteAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'delete');

	    list($id) = explode('/', $_REQUEST['args']);

        TransactionHelper::begin();

	    if (!empty($id)) {
	        $selection = array($id);
        } else {
			$selectall = isset($_REQUEST['widgettypelist_selection_selectall']) && $_REQUEST['widgettypelist_selection_selectall'];

			if ($selectall) {
				if (isset($_SESSION['widgettype.list.model']) && is_object($_SESSION['widgettype.list.model'])) {
					$model = clone $_SESSION['widgettype.list.model'];
				} else {
		        	$model = new WidgetTypeModel();
				}

				$model->find();

				$selection = array();
		        while ($model->fetch()) {
		        	$selection[] = $model->UUID;
		        }
			} else {
    			$selection = isset($_REQUEST['widgettypelist_selection'])? $_REQUEST['widgettypelist_selection'] : '';
			}
        }

		$relations = isset($_REQUEST['deleterelations'])? $_REQUEST['deleterelations'] : '';

		if (!empty($selection)) {
		    $this->delete('UUID', $selection, $_ids);

            if (!empty($relations)) {
                foreach ($relations as $module) {
                    switch ($module) {
                        case 'pagewidget': 
                            (new PageWidgetController())->delete('ID_WIDGET_TYPE', $_ids);
                            break;

                        default:
                            break;
                    }
                }
            }
        }

        TransactionHelper::end();

        ContextStack::getCurrentScreenContext($module, $action);
        if ($module != 'widgettype' || in_array($action, array('list', 'page'))) {
		    ContextStack::back(0);
        } else {
		    ContextStack::back(1);
        }
	}

    public function newAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

		ContextStack::register(APPLICATION_URL.'/widgettype/new/');

        $this->_edit(0);
	}

    public function viewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'view');

		@list($id, $templatecode) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new WidgetTypeModel(), $_REQUEST);
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
            $adminview = AdminViewHelper::getAdminView('widgettype', $templatecode);

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
		    ContextStack::register(APPLICATION_URL.'/widgettype/view/'.$id);
    		$this->_view($id);
        }
	}

    public function editAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $filters = array('UUID' => $id);
        } else {
            $filters = FilterHelper::getProperFilters(new WidgetTypeModel(), $_REQUEST);
        }

        if (empty($filters)) {
            $this->pagenotfound();
        }

        $model = $this->getItem($filters, false);

		if (!$model->UUID) {
		    $this->pagenotfound();
		}

		$id = $model->UUID;

		ContextStack::register(APPLICATION_URL.'/widgettype/edit/'.$id);
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
            if (preg_match('/^'.$prefix.'widgettype_formdata_(.+)/', $name)) {
                return 'single'; // the single mode has a higher priority
            }

            if (!$multiple && preg_match('/^'.$prefix.'widgettype_multiformdata_(.+)/', $name)) {
                $multiple = true;
            }
        }

        return $multiple? 'multiple' : 'single';
    }

    protected function field_sanitize($column, $value) {
		
		return $value;
	}

    protected function form2model($prefix = null, &$columns2check = null) {
        $customfieldcolumns = CustomFieldHelper::getCustomFieldColumns('widgettype');
        $customfieldvalues = array();

        $columns2edit = array('UUID', 'NAME', 'CODE');
        $columns2edit = array_merge($columns2edit, $customfieldcolumns);

		$model = new WidgetTypeModel();
        $matched = false;
		$columns2check = array();

		$raw = $_REQUEST;
		foreach ($_FILES as $key => $value) {
		    $raw[$key] = $value['name'];
		}

		foreach ($raw as $name => $value) {
            if (preg_match('/^'.$prefix.'widgettype_formdata_(.*)/', $name, $matches)) {
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
        $columns2edit = array('UUID', 'NAME', 'CODE');
        $columns2edit = array_merge($columns2edit, CustomFieldHelper::getCustomFieldColumns('widgettype'));

        $rows = array();
		foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^'.$prefix.'widgettype_multiformdata_(.+)/', $name, $matches)) {
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
            $model = new WidgetTypeModel();

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

            $deleteditems = isset($_REQUEST[$prefix.'widgettype_multiformdata_deleteditems'])? $_REQUEST[$prefix.'widgettype_multiformdata_deleteditems'] : '';
            $deleteditems = explode(',', trim($deleteditems, ','));

    		if (!empty($deleteditems)) {
                $_models = array();

        		$_model = new WidgetTypeModel();
        		$_model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');
                $_model->find();

                while ($_model->fetch()) {
                    $_models[] = clone $_model;
                }

                foreach ($_models as $_model) {
                    $this->onBeforeDelete($_model);
                    PluginManager::do_action('widgettype_before_delete', $_model);
                }

        		$model = new WidgetTypeModel();
        		$model->whereAdd('UUID = "'.implode('" or UUID = "', $deleteditems).'"');

        		$model->delete();

                foreach ($_models as $_model) {
                    $this->onDeleteSuccess($_model);
                    PluginManager::do_action('widgettype_deleted', $_model);
                }
            }
        } else {
            $model = $this->form2model($prefix);

            

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
            CustomFieldHelper::updateCustomFieldValues('widgettype', $model);
            
            
            $this->onBeforeSave($model);
            PluginManager::do_action('widgettype_before_save', $model);

    		if ($model->UUID) {
				
				$old = new WidgetTypeModel();
				$old->UUID = $model->UUID;
				$old->find();
				$old->fetch();

                $this->onBeforeUpdate($model, $old);
                PluginManager::do_action('widgettype_before_update', $model, $old);

        		if (!AclController::hasPermission('widgettype', 'editpeer')) {
        		    $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.UUID = '".$model->UUID."' AND ".TABLE_PREFIX."WIDGET_TYPE.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		} else {
        		    $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.UUID = '".$model->UUID."'");
        		    $model->update(DB_DATAOBJECT_WHEREADD_ONLY);
        		}

    		    //$model->find();
    		    //$model->fetch();
    		    $model->_isnew = false;
    		    $this->onUpdateSuccess($model, $old);
    		    PluginManager::do_action('widgettype_updated', $model, $old);
            } else {
                $model->ID = null;
                
                $this->onBeforeInsert($model);
                PluginManager::do_action('widgettype_before_create', $model);

    		    $model->insert();
    		    $model->_isnew = true;

    		    $this->onInsertSuccess($model);
    		    PluginManager::do_action('widgettype_created', $model);
            }

            $this->onSaveSuccess($model);
        }

        DraftHelper::clearAllDrafts('widgettype');

        if (count($models) == 1) {
            return $model;
        }

        return true;
    }

    public function saveDraftAction() {
        LicenseController::enforceLicenseCheck('widgettype');

        $formdata = $this->getFormData();

        DraftHelper::saveDraft('widgettype', isset($formdata['UUID'])? $formdata['UUID'] : '', $formdata);
    }

    public function saveAction($datacheck = true, $addmore = false) {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

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
	            $this->_edit(null, $this->form2model(), "$viewtype.widgettype.tpl");
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

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'import');

        if (isset($_FILES['widgettype_importfile'])) {
        	if (!$_FILES['widgettype_importfile']['error']) {
	            $filepath = $_FILES['widgettype_importfile']['tmp_name'];
        		$original = $_FILES['widgettype_importfile']['name'];

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
    		ContextStack::register(APPLICATION_URL.'/widgettype/import/');
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

        $old = umask(0);
        mkdir($tempdir, 0755, true);
        umask($old);

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

        LicenseController::enforceLicenseCheck('widgettype');

    	set_time_limit(0);

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');

        $columns2export = array('NAME','CODE');

        $header = '';
        $isref = array();
 	    foreach ($columns2export as $i => $column) {
 	        $header .= ($i? CSV_SEPARATOR : '').$this->_encodecsv($column);

 	        $isref[$column] = preg_match('/^id_|_id_|_id$/i', $column);
        }

		if (empty($preset) && empty($presetvalue) && isset($_SESSION['widgettype.list.model']) && is_object($_SESSION['widgettype.list.model'])) {
			$model = clone $_SESSION['widgettype.list.model'];
		} else {
        	$model = new WidgetTypeModel();
		}

        $vars = array_keys(get_object_vars($model));

        if (in_array($preset, $vars)) {
            $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.$preset = '$presetvalue'");
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
	        $filename = 'widgettype_'.date('Ymd').'.csv';

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
	        	$filepath = UPLOAD_DIR.'/widgettype_'.date('Ymd').'_part_'.str_pad($filenumber, $pad_length, '0', STR_PAD_LEFT).'.csv';

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

	        $zipfile = UPLOAD_DIR.'/widgettype_'.date('Ymd').'.zip';

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

        LicenseController::enforceLicenseCheck('widgettype');

    	set_time_limit(0);

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');

        $columns2export = array('NAME','CODE');
        $filename = 'widgettype_'.date('Ymd').'.xls';

		set_include_path(implode(PATH_SEPARATOR, array(dirname(__FILE__).'/../library/PEAR/', get_include_path())));

		require_once ('Spreadsheet/Excel/Writer.php');

		$workbook = new Spreadsheet_Excel_Writer();

		// Support UTF-8
		$workbook->setVersion(8);

		// Sending HTTP headers
		$workbook->send($filename);

		// Creating a worksheet
		$worksheet =& $workbook->addWorksheet('WidgetType');

		// Support UTF-8
		$worksheet->setInputEncoding('utf-8');

		// Header row
        $isref = array();
 	    foreach ($columns2export as $j => $column) {
 	        $isref[$column] = preg_match('/^id_|_id_|_id$/i', $column);

			$worksheet->write(0, $j, $column);
        }

		// Data rows

		if (empty($preset) && empty($presetvalue) && isset($_SESSION['widgettype.list.model']) && is_object($_SESSION['widgettype.list.model'])) {
			$model = clone $_SESSION['widgettype.list.model'];
		} else {
        	$model = new WidgetTypeModel();
		}

        $vars = array_keys(get_object_vars($model));

        if (in_array($preset, $vars)) {
            $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.$preset = '$presetvalue'");
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

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

		list($id, $col, $val) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$model = new WidgetTypeModel();

        $model->$col = $val;
        $model->whereAdd("UUID = $id");
        $model->update(DB_DATAOBJECT_WHEREADD_ONLY);

		ContextStack::back(0);
	}

    public function cancelAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        $returnurl = isset($_REQUEST['return'])? $_REQUEST['return'] : '';
        
        DraftHelper::clearAllDrafts('widgettype');
        
        
		ContextStack::back($back, $returnurl);
	}

    public function closeAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        $back = isset($_REQUEST['back'])? $_REQUEST['back'] : 1;
        $returnurl = isset($_REQUEST['return'])? $_REQUEST['return'] : '';
        
        DraftHelper::clearAllDrafts('widgettype');
        
		ContextStack::back($back, $returnurl);
	}

    public function quickCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

		$this->_edit(0, null, 'quick-create.widgettype.tpl', false);
    }

    public function preCreateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

		$this->_edit(0, null, 'pre-create.widgettype.tpl', false);
    }

    public function rowNewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

		$this->_edit(0, null, 'row-edit.widgettype.tpl', false);
    }

    public function rowEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-edit.widgettype.tpl', false);
    }

    public function rowExpandedEditAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_edit($id, null, 'row-expanded-edit.widgettype.tpl', false);
    }

    public function rowViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-view.widgettype.tpl');
    }

    public function rowSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-edit.widgettype.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-view.widgettype.tpl');
        }
    }

    public function rowExpandedSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->setMessages($errors);

            $this->_edit(null, $this->form2model(), 'row-expanded-edit.widgettype.tpl', false);
        } else {
            $model = $this->saveform();

            $this->_view($model->UUID, null, 'row-expanded.widgettype.tpl');
        }
    }

    public function rowExpandedViewAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$this->_view($id, null, 'row-expanded.widgettype.tpl');
    }

    public function fieldSaveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('widgettype');

        AclController::checkPermission('widgettype', 'edit');

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
            return array('NAME', 'CODE');
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
            $_SESSION['widgettype.customview'] = $_REQUEST['customview'];
        }

        $customview = isset($_SESSION['widgettype.customview'])? $_SESSION['widgettype.customview'] : '';

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
        $filtercolumns = $this->getCustomFilterColumns('widgettype', $filter);

        $aclviewablecolumns = AclController::getAclEnabledColumns('widgettype', 'view');

        if (empty($aclviewablecolumns) || (!isset($aclviewablecolumns['*']) && !in_array(true, $aclviewablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $excludedcolumns = AclController::getSystemExcludedColumns('widgettype');
        
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
        $_SESSION['widgettype.list.ids'] = $ids;

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
		$smarty->assign('module', 'widgettype');
		$smarty->assign('filter', $filter);
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getListCustomFields('widgettype'));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('formdata', $searchdata);
		$smarty->assign('searchdata', $searchdata);
		$smarty->assign('additional_list_buttons', $this->setupAdditionalListButtons());
		$smarty->assign('admin_list_actions', AdminActionHelper::getAdminActions('widgettype', 'list'));
		$smarty->assign('admin_listitem_actions', AdminActionHelper::getAdminActions('widgettype', 'listitem'));
		$smarty->assign('customview', $customview);
		$smarty->assign('customtemplate', $customtemplate);
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('widgettype', 'view'));
		

        $templatetype = !empty($this->templatetype)? $this->templatetype : 'list';
	    $this->display($smarty, $templatetype.'.widgettype.tpl');
    }

    protected function _view($id, $details = null, $templatecode = 'view.widgettype.tpl') {
        $filtercolumns = $this->getCustomFilterColumns('widgettype');

        $aclviewablecolumns = AclController::getAclEnabledColumns('widgettype', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('widgettype', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('widgettype', 'new');
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

        $excludedcolumns = AclController::getSystemExcludedColumns('widgettype');

        $preset = RequestHelper::get('preset');
        $presetvalue = RequestHelper::get('presetvalue');
        if (!empty($preset)) {
            $aclviewablecolumns[$preset] = false;
        }

        $ids = isset($_SESSION['widgettype.list.ids'])? $_SESSION['widgettype.list.ids'] : array();
        $key = array_search($details->UUID, $ids);
        $previd = isset($ids[$key - 1])? $ids[$key - 1] : 0;
        $nextid = isset($ids[$key + 1])? $ids[$key + 1] : 0;

        $this->setupAdditionalData($details);

        $this->initPlugins();

        $this->onBeforeView($details);
        PluginManager::do_action('widgettype_before_view', $details);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('previd', $previd);
		$smarty->assign('nextid', $nextid);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'widgettype');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('widgettype', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('currentvalue', $details->UUID);
		$smarty->assign('additional_view_fields', $this->setupAdditionalViewFields($details));
		$smarty->assign('additional_view_buttons', $this->setupAdditionalViewButtons($details));
		$smarty->assign('admin_view_actions', AdminActionHelper::getAdminActions('widgettype', 'view'));
		$smarty->assign('admin_view_options', AdminViewHelper::getAdminViews('widgettype', 'view'));
        $smarty->assign('readonly', isset($_REQUEST['readonly']) && $_REQUEST['readonly']);

	    $this->display($smarty, $templatecode);

        $this->onViewSuccess($details);
        PluginManager::do_action('widgettype_viewed', $details);
	}

    protected function _edit($id, $details = null, $templatecode = 'edit.widgettype.tpl', $restoredraft = true) {
        $filtercolumns = $this->getCustomFilterColumns('widgettype');

        $aclviewablecolumns = AclController::getAclEnabledColumns('widgettype', 'view');

        if ($id || !empty($details) && $details->UUID) {
            $acleditablecolumns = AclController::getAclEnabledColumns('widgettype', 'edit');
        } else {
            $acleditablecolumns = AclController::getAclEnabledColumns('widgettype', 'new');
        }

        if (empty($acleditablecolumns) || (!isset($acleditablecolumns['*']) && !in_array(true, $acleditablecolumns))) {
            $this->pagenotfound('No view available');
        }

        $acleditablecolumns['UUID'] = true;

        $excludedcolumns = AclController::getSystemExcludedColumns('widgettype');

        $roweditablecolumns = array('NAME', 'CODE');

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
    		$model = new WidgetTypeModel();

            if ($id) {
                $model = $this->getItem($id, true);

             	if (!$model) {
        		    $this->pagenotfound();
             	}

                if ($model->GUID != $_SESSION['user']->ID) {
             	    AclController::checkPermission('widgettype', 'editpeer');
                }
            } else {
                // Set default values here
                
                $this->onInitialization($model);
                PluginManager::do_action('widgettype_new', $model);
            }
            
            if ($restoredraft) {
                DraftHelper::tryRestoreDraft('widgettype', $model->UUID, $model);
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
        PluginManager::do_action('widgettype_before_edit', $details);

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('preset', $preset);
		$smarty->assign('presetvalue', $presetvalue);
		$smarty->assign('presetparams', $presetparams);
		
		$smarty->assign('details', $details);
		$smarty->assign('row', $details);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'widgettype');
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('aclviewablecolumns', $aclviewablecolumns);
		$smarty->assign('acleditablecolumns', $acleditablecolumns);
		$smarty->assign('customfields', CustomFieldHelper::getObjectCustomFields('widgettype', $details));
		$smarty->assign('excludedcolumns', $excludedcolumns);
		$smarty->assign('columntooltips', FieldHelper::getColumnTooltips('widgettype'));
		$smarty->assign('roweditablecolumns', $roweditablecolumns);
        $smarty->assign('fielddependencies', FieldHelper::getFieldDependencies('widgettype'));

	    $this->display($smarty, $templatecode);
	}

    protected function getLayoutColumns() {
        return array('NAME', 'CODE');
    }

    public function getItem($id_or_filters, $join = false, $check_acl = true, $additional_select_fields = '') {
		$model = new WidgetTypeModel();

        $this->initViewModel($model, $join);

        if (!empty($additional_select_fields)) {
            $model->selectAdd($additional_select_fields);
        }

        if (is_array($id_or_filters)) {
            $this->applyFilters($id_or_filters, $model);
        } else {
		    $model->UUID = $id_or_filters;
        }

		if ($check_acl && !AclController::hasPermission('widgettype', 'viewpeer')) {
		    // UDID: 0 - public
		    $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.UDID = 0 OR ".TABLE_PREFIX."WIDGET_TYPE.GUID = '".(isset($_SESSION['user'])? $_SESSION['user']->ID : null)."'");
		}

        $this->enforceObjectAclCheck('widgettype', $model);

		$model->find();

        $item = null;
     	if ($model->fetch()) {
		    WidgetTypeController::setupAdditionalData($model);

    		$item = clone $model;
     	}

        return $item;
	}

    public function getItemById($id, $join = false, $check_acl = true, $additional_select_fields = '') {
        return $this->getItem(array('ID' => $id), $join, $check_acl, $additional_select_fields);
    }

    public function getList($join = false, $filters = array(), $aftersearchfilters = array(), $orderby = 'ID DESC', $limit = 0, $page = 0, &$pagination = null, $checkguid = true, $additional_wheres = array()) {
		$model = new WidgetTypeModel();

        $this->initListModel($model, $join);

        $this->enforceObjectAclCheck('widgettype', $model);

        if (!empty($additional_wheres)) {
            foreach ($additional_wheres as $where) {
                $model->whereAdd($where);
            }
        }

        $this->applyFilters($filters, $model);

		$_SESSION['widgettype.list.model'] = clone $model;

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

                    case 'NAME':
                        $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($value))."%'");

                        break;

                    default:
                        if (preg_match('/^custom.*/i', $key)) {
                            $model->whereAdd($value);
                        } else {
                            if (property_exists($model, $key)) {
                                if ($value == '__EMPTY__') {
                                    $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.$key IS NULL OR ".TABLE_PREFIX.".WIDGET_TYPE.$key = ''");
                                } else {
                                    $model->whereAdd(TABLE_PREFIX."WIDGET_TYPE.$key = '".$model->escape($value)."'");
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
        $model->selectAdd('`'.TABLE_PREFIX.'WIDGET_TYPE`.NAME, `'.TABLE_PREFIX.'WIDGET_TYPE`.CODE, `'.TABLE_PREFIX.'WIDGET_TYPE`.ID, `'.TABLE_PREFIX.'WIDGET_TYPE`.JSON, `'.TABLE_PREFIX.'WIDGET_TYPE`.UUID, `'.TABLE_PREFIX.'WIDGET_TYPE`.WFID');
    }

    protected function initListModel(&$model, $join = false) {
        $model->selectAdd();
        $model->selectAdd('`'.TABLE_PREFIX.'WIDGET_TYPE`.NAME, `'.TABLE_PREFIX.'WIDGET_TYPE`.CODE, `'.TABLE_PREFIX.'WIDGET_TYPE`.ID, `'.TABLE_PREFIX.'WIDGET_TYPE`.JSON, `'.TABLE_PREFIX.'WIDGET_TYPE`.UUID, `'.TABLE_PREFIX.'WIDGET_TYPE`.WFID');
    }

    public function getAclEnabledIds() {
		$model = new WidgetTypeModel();

        $this->enforceObjectAclCheck('widgettype', $model);

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

            $conds[] = TABLE_PREFIX."WIDGET_TYPE.REFID LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."WIDGET_TYPE.NAME LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."WIDGET_TYPE.CODE LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";
            $conds[] = TABLE_PREFIX."WIDGET_TYPE.JSON LIKE '%".$model->escape(StringHelper::htmlspecialchars($keyword))."%'";

            $model->whereAdd(implode(' OR ', $conds));
        }
    }

    protected function _import($templatecode = 'import.widgettype.tpl') {
        $preset = isset($_REQUEST['preset'])? $_REQUEST['preset'] : RequestHelper::get('preset');
        $presetvalue = isset($_REQUEST['presetvalue'])? $_REQUEST['presetvalue'] : RequestHelper::get('presetvalue');

		$smarty = Framework::getSmarty(__FILE__);
		$smarty->assign('preset', $preset);
		$smarty->assign('presetvalue', $presetvalue);
		$smarty->assign('messages', $this->getMessages());
		$smarty->assign('module', 'widgettype');

	    $this->display($smarty, $templatecode);
	}

    protected function _importxls($filepath, &$error) {
        require_once ('Spreadsheet_Excel_Reader.php');

        $preset = isset($_REQUEST['preset'])? $_REQUEST['preset'] : '';
        $presetvalue = isset($_REQUEST['presetvalue'])? $_REQUEST['presetvalue'] : '';

		set_time_limit(0);

        $columns2import = array('NAME','CODE');

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
            $model = new WidgetTypeModel();
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
            PluginManager::do_action('widgettype_before_import', $model, $rawdata);

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
            PluginManager::do_action('widgettype_imported', $model);
		}

        return true;
	}

    protected function _importcsv($filepath, &$error) {
        $preset = isset($_REQUEST['preset'])? $_REQUEST['preset'] : '';
        $presetvalue = isset($_REQUEST['presetvalue'])? $_REQUEST['presetvalue'] : '';

		set_time_limit(0);

        $columns2import = array('NAME','CODE');
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
            $model = new WidgetTypeModel();
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
            }
            $labelcache[$refcolumn][$refvalue] = $label;
        }

        return $label;
    }

    
}
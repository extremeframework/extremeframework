<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class __AppController {
    var $caller = null;
    var $source = null;
    var $templatetype = null;
    var $return = null;
    var $type = null;

    public function __construct() {
        $this->caller = isset($_REQUEST['__caller'])? $_REQUEST['__caller'] : '';
        $this->source = isset($_REQUEST['__source'])? $_REQUEST['__source'] : '';
        $this->templatetype = isset($_REQUEST['__templatetype'])? $_REQUEST['__templatetype'] : '';
        $this->return = isset($_REQUEST['__return'])? $_REQUEST['__return'] : '';
    }

	public function display(&$smarty, $template) {
        if ($this->caller == 'ajax') {
		    $content = $smarty->fetch($template);

            if (!empty($this->return)) {
                if (($beginpos = strpos($content, '<!--:'.$this->return.'begin:-->')) && ($endpos = strpos($content, '<!--:'.$this->return.'end:-->'))) {
                    $content = substr($content, $beginpos, $endpos - $beginpos);
                }
            }

		    echo $content;
        } else {
		    $smarty->display($template);
        }
	}

    public static function uuid($dashes = true) {
        if ($dashes) {
            $format = '%s-%s-%04x-%04x-%s';
        } else {
            $format = '%s%s%04x%04x%s';
        }

        return sprintf($format,
            // 8 hex characters
            bin2hex(openssl_random_pseudo_bytes(4)),

            // 4 hex characters
            bin2hex(openssl_random_pseudo_bytes(2)),

            // "4" for the UUID version + 3 hex characters
            mt_rand(0, 0x0fff) | 0x4000,

            // (8, 9, a, or b) for the UUID variant + 3 hex characters
            mt_rand(0, 0x3fff) | 0x8000,

            // 12 hex characters
            bin2hex(openssl_random_pseudo_bytes(6))
        );
    }

    public static function model_sanitize($model) {
        ModelHelper::sanitize($model);

        return $model;
    }

	public static function getStatusCodeMessage($status) {
		$codes = Array(
		    100 => 'Continue',
		    101 => 'Switching Protocols',
		    200 => 'OK',
		    201 => 'Created',
		    202 => 'Accepted',
		    203 => 'Non-Authoritative Information',
		    204 => 'No Content',
		    205 => 'Reset Content',
		    206 => 'Partial Content',
		    300 => 'Multiple Choices',
		    301 => 'Moved Permanently',
		    302 => 'Found',
		    303 => 'See Other',
		    304 => 'Not Modified',
		    305 => 'Use Proxy',
		    306 => '(Unused)',
		    307 => 'Temporary Redirect',
		    400 => 'Bad Request',
		    401 => 'Unauthorized',
		    402 => 'Payment Required',
		    403 => 'Forbidden',
		    404 => 'Not Found',
		    405 => 'Method Not Allowed',
		    406 => 'Not Acceptable',
		    407 => 'Proxy Authentication Required',
		    408 => 'Request Timeout',
		    409 => 'Conflict',
		    410 => 'Gone',
		    411 => 'Length Required',
		    412 => 'Precondition Failed',
		    413 => 'Request Entity Too Large',
		    414 => 'Request-URI Too Long',
		    415 => 'Unsupported Media Type',
		    416 => 'Requested Range Not Satisfiable',
		    417 => 'Expectation Failed',
		    500 => 'Internal Server Error',
		    501 => 'Not Implemented',
		    502 => 'Bad Gateway',
		    503 => 'Service Unavailable',
		    504 => 'Gateway Timeout',
		    505 => 'HTTP Version Not Supported'
		);

		return (isset($codes[$status])) ? $codes[$status] : '';
	}

	public static function json_response($data) {
		header('HTTP/1.1 200 OK');
		header('Content-type: application/json');
        header('Access-Control-Allow-Origin: *');

    	echo json_encode($data);
		exit;
	}

	public static function json_error($errorcode, $errormessage) {
		header('HTTP/1.1 ' . $errorcode . ' ' . self::getStatusCodeMessage($errorcode));
		header('Content-type: application/json');
        header('Access-Control-Allow-Origin: *');

    	echo json_encode(array('code' => $errorcode, 'message' => $errormessage));
		exit;
	}

    public function indexAction() {
        if ($this->type == 'controller') {
            $this->listAction();

            return;
        } else if ($this->type == 'api') {
            $method = $_SERVER['REQUEST_METHOD'];

            switch ($method) {
                case 'GET':
                    if (!empty($_REQUEST['args'])) {
                        $this->viewAction();
                    } else {
                        $this->listAction();
                    }
                    break;

                case 'PUT':
                    $this->saveAction();
                    break;

                case 'POST':
                    $this->saveAction();
                    break;

                case 'DELETE':
                    $this->deleteAction();
                    break;

                default:
                    break;
            }
        } else {
            $this->pagenotfound();
        }
    }

    public function listAction() {}

    public function viewAction() {}

    public function saveAction() {}

    public function deleteAction() {}

    public function getList() {}

	public function ajaxAction() {
	    $template = isset($_REQUEST['template'])? $_REQUEST['template'] : '<option value="{ID}">{NAME}</option>';
	    $sort = isset($_REQUEST['sort'])? $_REQUEST['sort'] : 'ID DESC';

	    $items = $this->getList($_REQUEST, array(), $sort);

        foreach ($items as $item) {
            echo $this->fill_template($template, $item);
        }
    }

    private function fill_template($template, $model) {
        if (preg_match_all('/{([a-z0-9_]*)}/i', $template, $matches)) {
            $columns = array_unique($matches[1]);

            foreach ($columns as $column) {
                if (property_exists($model, $column)) {
                    $value = $model->$column;

                    $template = str_replace('{'.$column.'}', $value, $template);
                }
            }
        }

        return $template;
    }

    //////////////////////////////////////////////////////////////////
    // EXAMPLE:
    //    $this->ensure_additional_data(
    //        'Resolve Issue',
    //        'ID_ISSUE_RESOLUTION, COMMENT',
    //        'ID_ISSUE_RESOLUTION, COMMENT',
    //        array(
    //            'Resolve' => APPLICATION_URL.'/issue/resolve/'.$id
    //        ),
    //        $formdata,
    //        array(
    //            'ID_ISSUE_RESOLUTION' => new ColumnSettings('refselect', 'Issue Resolution', 'issue-resolution', array('datasource' => 'ISSUE_RESOLUTION', 'valuecol' => 'ID', 'textcol' => 'NAME')),
    //            'COMMENT' => new ColumnSettings('textarea', 'Comment', 'comment')
    //        )
    //    );
    //////////////////////////////////////////////////////////////////
    protected function ensure_additional_data($formtitle, $columns, $mandatories, $formactions, &$formdata, $columnsettings = array(), $options = array()) {
        $template = isset($options['template'])? $options['template'] : "input.{$this->module}.tpl";

        if (!is_array($columns)) {
            $columns = !empty($columns) ? array_unique(preg_split('/[\s|,]+/i', $columns)) : array();
        }

        if (!is_array($mandatories)) {
            $mandatories = !empty($mandatories) ? array_unique(preg_split('/[\s|,]+/i', $mandatories)) : array();
        }

		$formdata = $this->getFormData();
        $firsttime = empty($formdata);

        $missing = false;
        if (!$firsttime) {
            foreach ($mandatories as $column) {
                if (!isset($formdata[$column]) || empty($formdata[$column])) {
                    $missing = true;

                    break;
                }
            }
        }

        if ($firsttime || $missing) {
            if (!empty($_POST)) {
                $messages = array('Please enter data for the required columns.');
            } else {
                $messages = array();
            }

    		$smarty = Framework::getSmarty();

            $smarty->assign('formtitle', $formtitle);
            $smarty->assign('messages', $messages);
    		$smarty->assign('formdata', $formdata);
            $smarty->assign('formactions', $formactions);
            $smarty->assign('columns', $columns);
            $smarty->assign('mandatories', $mandatories);
            $smarty->assign('columnsettings', $columnsettings);
            $smarty->assign('options', $options);
            $smarty->assign('module', $this->module);

            if ($this->caller == 'ajax') {
    		    $content = $smarty->fetch($template);

                if (!empty($this->return)) {
                    if (($beginpos = strpos($content, '<!--:'.$this->return.'begin:-->')) && ($endpos = strpos($content, '<!--:'.$this->return.'end:-->'))) {
                        $content = substr($content, $beginpos, $endpos - $beginpos);
                    }
                }

    		    echo $content;
            } else {
    		    $smarty->display($template);
            }

            exit(1);
        }
    }

    public function pagenotfound($error = '') {
        $this->simple_page('<p>The address is invalid, or the page has been moved or permission denied.</p>'.(!empty($error)? '<p style="color:gray">::'.$error.'::</p>' : ''), 'Access denied');

        die(-1);
    }

    protected function simple_page($message, $title) {
        $templatecode = 'simple.tpl';

		$smarty = Framework::getSmarty();

        $smarty->assign('title', $title);
		$smarty->assign('message', $message);

        if ($this->caller == 'ajax') {
		    $content = $smarty->fetch($templatecode);

            if (!empty($this->return)) {
                if (($beginpos = strpos($content, '<!--:'.$this->return.'begin:-->')) && ($endpos = strpos($content, '<!--:'.$this->return.'end:-->'))) {
                    $content = substr($content, $beginpos, $endpos - $beginpos);
                }
            }

		    echo $content;
        } else {
    	    $smarty->display($templatecode);
        }
    }

	protected function condString($val, $varname) {
	    $parts = preg_split('/ *([+\-\/\.=|&><!*]) */', trim($val), -1, PREG_SPLIT_DELIM_CAPTURE);

	    $cmd = '';
	    foreach ($parts as $part) {
	    	if(substr($part, 0, 1) != '') {
		        if (is_numeric($part) || in_array(substr($part, 0, 1), array('.','+','-','*','/',"'",'"','(',')',' ','|','&','!','>','<','='))) {
	                $cmd .= $part;
		        } else {
		            $cmd .= '$'.$varname.'->'.$part;
		        }
			}
	    }

	    return $cmd;
	}

    protected function object2placeholder($object, $content) {
        if (is_object($object)) {
            $vars = array_keys(get_object_vars($object));

            foreach ($vars as $var) {
                if ($var[0] != '_') {
                    $content = preg_replace('/{'.$var.'}/i', $object->$var, $content);
                }
            }
        }

        return $content;
    }

	protected function setMessages($messages, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

		$_SESSION['messages'][$module] = $messages;
	}

	protected function getMessages() {
		$key = 'messages';

		if (isset($_SESSION[$key])) {
			$messages = $_SESSION[$key];

			$_SESSION[$key] = array();

			return $messages;
		}

		return array();
	}

    protected function updateOrderBy($orderby, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $parts = explode('|', $orderby);

        if (count($parts) > 1) {
            $ordercol = $parts[0];
            $orderdir = $parts[1];
        } else {
            $ordercol = $orderby;

            $_ordercol = isset($_SESSION[$module.'.order.col'])? $_SESSION[$module.'.order.col'] : '';
            $_orderdir = isset($_SESSION[$module.'.order.dir'])? $_SESSION[$module.'.order.dir'] : '';

            if (empty($_ordercol)) {
                $orderdir = 'asc';
            } elseif ($_ordercol == $orderby) {
                $orderdir = ($_orderdir == 'asc'? 'desc' : 'asc');
            } else {
                $orderdir = 'asc';
            }
        }

        $_SESSION[$module.'.order.col'] = $ordercol;
        $_SESSION[$module.'.order.dir'] = $orderdir;
    }

    protected function getRealOrderBy($defaultcol = null, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $ordercol = isset($_SESSION[$module.'.order.col'])? $_SESSION[$module.'.order.col'] : '';
        $orderdir = isset($_SESSION[$module.'.order.dir'])? $_SESSION[$module.'.order.dir'] : '';

        if (preg_match('/^ID_/is', $ordercol)) {
            $ordercol = 'reftext_'.$ordercol;
        }

        if (!empty($ordercol)) {
            return "`$ordercol`".' '.$orderdir;
        } elseif (!empty($defaultcol)) {
            return "`$defaultcol`".(preg_match('/(^id$|^id_|_id_|_id$)/i', $defaultcol)? ' DESC' : ' ASC');
        }

        return null;
    }

    protected function updatePageNumber($pagenumber, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.pagination.pagenumber'] = $pagenumber;
    }

    protected function getPageNumber($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        return isset($_SESSION[$module.'.pagination.pagenumber'])? $_SESSION[$module.'.pagination.pagenumber'] : 1;
    }

    protected function updatePageSize($pagesize, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.pagination.pagesize'] = $pagesize;
    }

    protected function getPageSize($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        return isset($_SESSION[$module.'.pagination.pagesize'])? $_SESSION[$module.'.pagination.pagesize'] : 20;
    }

    protected function setSystemSeparationData($data, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.systemseparationdata'] = $data;
    }

    protected function getSystemSeparationData($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $data = isset($_SESSION[$module.'.systemseparationdata'])? $_SESSION[$module.'.systemseparationdata'] : array();

        return $data;
    }

    protected function setPresetData($presetdata, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.presetdata'] = $presetdata;
    }

    protected function getPresetData($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $presetdata = isset($_SESSION[$module.'.presetdata'])? $_SESSION[$module.'.presetdata'] : array();

        return $presetdata;
    }

    protected function updateSearchData($searchdata, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.searchdata'] = $searchdata;
    }

    protected function getSearchData($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $searchdata = isset($_SESSION[$module.'.searchdata'])? $_SESSION[$module.'.searchdata'] : array();

        if (isset($_SESSION[$module.'.searchdata']['__QUICKSEARCH__'])) {
            unset($_SESSION[$module.'.searchdata']['__QUICKSEARCH__']);
        }

        return $searchdata;
    }

    protected function updateFilterData($filterdata, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.filterdata'] = $filterdata;
    }

    protected function getFilterData($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $filterdata = isset($_SESSION[$module.'.filterdata'])? $_SESSION[$module.'.filterdata'] : array();

        return $filterdata;
    }

    protected function updateCustomFilterModel($filtermodel, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.customfiltermodel'] = $filtermodel;
    }

    protected function getCustomFilterModel($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $filtermodel = isset($_SESSION[$module.'.customfiltermodel'])? $_SESSION[$module.'.customfiltermodel'] : null;

        return $filtermodel;
    }

    protected function updateCustomFilterData($filterdata, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.customfilter'] = $filterdata;
    }

    protected function getCustomFilterData($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $filterdata = isset($_SESSION[$module.'.customfilterdata'])? $_SESSION[$module.'.customfilterdata'] : array();

        return $filterdata;
    }

    protected function setRecentModel($model, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.recent.model'] = clone $model;
    }

    protected function getRecentModel($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        return isset($_SESSION[$module.'.recent.model'])? $_SESSION[$module.'.recent.model'] : null;
    }

    protected function updateGroupCols($groupcol, $module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $_SESSION[$module.'.group.col'] = $groupcol;
    }

    protected function getGroupCols($module = null) {
        if (empty($module)) {
            $module = $this->module;
        }

        $groupcols = array();

        $groupcol = isset($_SESSION[$module.'.group.col'])? $_SESSION[$module.'.group.col'] : '';
        if (!empty($groupcol)) {
            $groupcols[] = $groupcol;
        }

        return $groupcols;
    }

    protected function getName($model) {
		// To be overrided if necessary
		return $model->ID;
    }

    protected function getModulePrefix($module) {
        if (!isset($_SESSION['system.modules'])) {
    		$model = new AdminModuleModel();
    		$model->find();

            $modules = array();

            while ($model->fetch()) {
            	$modules[$model->MODULE] = $model->PREFIX;
    		}

    		$_SESSION['system.modules'] = $modules;
        }

        return isset($_SESSION['system.modules'][$module])? $_SESSION['system.modules'][$module] : '';
    }

    protected function onBeforeWorkflowTransition($transition_code, $model, $formdata) {
        // To be overrided if necessary
    }

    protected function onWorkflowTransitionSuccess($transition_code, $model, $formdata) {
        // To be overrided if necessary
    }

    protected function onInitialization($model) {
		// To be overrided if necessary
    }

    protected function setupAdditionalData(&$model) {
		// To be overrided if necessary
    }

    protected function setupAdditionalViewFields($model) {
		// To be overrided if necessary
//        $fields = array();
//
//        $fields[] = array('label' => 'A new field', 'type' => 'text', 'value' => 'A certain field value');
//
//        return $fields;
    }

    protected function setupAdditionalViewButtons($model) {
		// To be overrided if necessary
        $buttons = array();

//        // x. Buttons
//        $myaction = array(
//            'code' => 'mybutton',
//            'title' => 'My action',
//            'link' => APPLICATION_URL.'/issue/myaction/'.$model->ID
//        );
//
//        $buttons[] = $myaction;

        // x. Workflow transitions
        $transitions = WorkflowHelper::getWorkflowTransitions($this->module, $model->WFID);

        foreach ($transitions as $transition) {
            $buttons[] = array(
                'code' => $transition->CODE,
                'title' => $transition->NAME,
                'link' => APPLICATION_URL.'/workflowtransition/perform/'.$transition->UUID.'/'.$this->module.'/'.$model->UUID
            );
        }

        return $buttons;
    }

    protected function setupAdditionalListButtons() {
		// To be overrided if necessary
//        $buttons = array();
//
//        // x. Buttons
//        $myaction = array(
//            'code' => 'mybutton',
//            'title' => 'My action',
//            'link' => APPLICATION_URL.'/issue/myaction/'
//        );
//
//        $buttons[] = $myaction;
//
//        return $buttons;
    }

    protected function setupQuickSearchModel(&$model, $searchstring) {
		// To be overrided if necessary
    }

    protected function getParentWiseAclCheckString() {
        // To be overrided if necessary
    }

    public function enforceObjectAclCheck($module, &$model, $require_non_empty_includes = true, $by_pass_self_check = false) {
        $this->getAccessGrantedItems($includes, $excludes, $all_details);

        if (empty($includes)) {
            if ($require_non_empty_includes) {
                $model->whereAdd('false');
            }
        } else {
            if (!in_array('*', $includes)) {
                $self_or_group_user_ids = array();

                // x. Self items
                foreach ($includes as $oacl_id => $oacl_object_id) {
                    if ($oacl_object_id == 'self') {
                        if ($all_details[$oacl_id]->ARG_ID_USER) {
                            $self_or_group_user_ids[] = $all_details[$oacl_id]->ARG_ID_USER;
                        } else {
                            $self_or_group_user_ids[] = $_SESSION['user']->ID;
                        }
                    }
                }

                // x. Group items
                $group_ids = array();

                foreach ($includes as $oacl_id => $oacl_object_id) {
                   if ($oacl_object_id == 'group') {
                        if ($all_details[$oacl_id]->ARG_ID_USER_GROUP) {
                            $group_ids[] = $all_details[$oacl_id]->ARG_ID_USER_GROUP;
                        } else {
                            $group_ids[] = $all_details[$oacl_id]->ID_USER_GROUP;
                        }
                    }
                }

                if (!empty($group_ids)) {
                    $umm = new UserMembershipModel();

                    $umm->selectAdd();
                    $umm->selectAdd('DISTINCT ID_USER');

                    $umm->whereAdd("ID_USER_GROUP IN ('".implode("','", $group_ids)."')");
                    $umm->find();

                    while($umm->fetch()) {
                        $self_or_group_user_ids[] = $umm->ID_USER;
                    }
                }

                // x. Self or group
                $self_or_group_where = '';

                if (!empty($self_or_group_user_ids)) {
                    $self_or_group_user_ids = array_unique($self_or_group_user_ids);

                    // UDID: 0 - public
                    $self_or_group_where = "{$model->__table}.UDID = 0 OR {$model->__table}.GUID IN (".implode(',', $self_or_group_user_ids).")";
                } else {
                    // UDID: 0 - public
                    $self_or_group_where = "{$model->__table}.UDID = 0 OR {$model->__table}.UDID = ".$_SESSION['user']->UDID;
                }

                // x. Inherited items
                $pm_ids = array();
                $pm_wheres = array();

                foreach ($includes as $oacl_id => $oacl_object_id) {
                   if ($oacl_object_id == 'inherited') {
                        $where = $this->getParentWiseAclCheckString();

                        if (!empty($where)) {
                            $pm_wheres[] = $where;
                        }
                    }
                }

                $inherited_where = '';

                if (!empty($pm_wheres)) {
                    $inherited_where = "((".implode(') OR (', $pm_wheres)."))";
                }

                // x. Specific items
                $specific_ids = array_diff($includes, array('self', 'group', '*'));

                $specific_where = '';
                if (!empty($specific_ids)) {
                    $specific_where = "{$model->__table}.ID IN ('".implode("','", $specific_ids)."')";
                }

                // x. Building whereAdd
                $or_wheres = array();

                if (!empty($self_or_group_where)) {
                    $or_wheres[] = $self_or_group_where;
                }

                if (!empty($specific_where)) {
                    $or_wheres[] = $specific_where;
                }

                if (!empty($inherited_where)) {
                    $or_wheres[] = $inherited_where;
                }

                if (!empty($or_wheres)) {
                    $model->whereAdd("((".implode(') OR (', $or_wheres)."))");
                }
            }
        }

        if (!empty($excludes)) {
            if (in_array('*', $excludes)) {
                $model->whereAdd('false');
            } else {
                $self_or_group_user_ids = array();

                // x. Self items
                foreach ($excludes as $oacl_id => $oacl_object_id) {
                    if ($oacl_object_id == 'self') {
                        if ($all_details[$oacl_id]->ARG_ID_USER) {
                            $self_or_group_user_ids[] = $all_details[$oacl_id]->ARG_ID_USER;
                        } else {
                            $self_or_group_user_ids[] = $_SESSION['user']->ID;
                        }
                    }
                }

                // x. Group items
                $group_ids = array();

                foreach ($excludes as $oacl_id => $oacl_object_id) {
                   if ($oacl_object_id == 'group') {
                        if ($all_details[$oacl_id]->ARG_ID_USER_GROUP) {
                            $group_ids[] = $all_details[$oacl_id]->ARG_ID_USER_GROUP;
                        } else {
                            $group_ids[] = $all_details[$oacl_id]->ID_USER_GROUP;
                        }
                    }
                }

                if (!empty($group_ids)) {
                    $umm = new UserMembershipModel();

                    $umm->selectAdd();
                    $umm->selectAdd('DISTINCT ID_USER');

                    $umm->whereAdd("ID_USER_GROUP IN ('".implode("','", $group_ids)."')");
                    $umm->find();

                    while($umm->fetch()) {
                        $self_or_group_user_ids[] = $umm->ID_USER;
                    }
                }

                // x. Self or group
                $self_or_group_where = '';

                if (!empty($self_or_group_user_ids)) {
                    $self_or_group_user_ids = array_unique($self_or_group_user_ids);

                    $self_or_group_where = "{$model->__table}.GUID NOT IN (".implode(',', $self_or_group_user_ids).")";
                }

                // x. Specific items
                $specific_ids = array_diff($excludes, array('self', 'group', '*'));

                $specific_where = '';
                if (!empty($specific_ids)) {
                    $specific_where = "{$model->__table}.ID NOT IN ('".implode("','", $specific_ids)."')";
                }

                // x. Building whereAdd
                $and_wheres = array();

                if (!empty($self_or_group_where)) {
                    $and_wheres[] = $self_or_group_where;
                }

                if (!empty($specific_where)) {
                    $and_wheres[] = $specific_where;
                }

                if (!empty($and_wheres)) {
                    $model->whereAdd("((".implode(') AND (', $and_wheres)."))");
                }
            }
        }
    }

    // Possible returns: * - all, empty - none, array - array of ids
    protected function getAccessGrantedItems(&$includes, &$excludes, &$all_details) {
        $includes = array('*');
        $excludes = array();
        $all_details = array();

        if (!Framework::hasModule('ObjectAcl')) {
            return;
        }

        $module = $this->module;

        $key = 'system.accessgranteditems.'.$module;

        if (!Cache::has($key)) {
    	    $user_id = $_SESSION['user']->ID;
    	    $group_ids = $_SESSION['memberships.groups'];

            $oacl = new ObjectAclModel();

            $oacl->MODULE = $module;
            $oacl->whereAdd("ID_USER = {$user_id} OR ID_USER_GROUP IN (".implode(',', $group_ids).")");

            $oacl->find();

            $all_details = array();
            $includes = array();
            $excludes = array();

            while ($oacl->fetch()) {
                $all_details[$oacl->ID] = clone $oacl;

                if ($oacl->ID_ACL_TYPE == 1) {
                    $includes[$oacl->ID] = $oacl->OBJECT_ID;
                } elseif ($oacl->ID_ACL_TYPE == 2) {
                    $excludes[$oacl->ID] = $oacl->OBJECT_ID;
                }
            }

            Cache::set($key, array('includes' => $includes, 'excludes' => $excludes, 'all_details' => $all_details));
        }

        $cache = Cache::get($key);

        $all_details = $cache['all_details'];
        $includes = $cache['includes'];
        $excludes = $cache['excludes'];
    }

    protected function initPlugins() {
//        PluginManager::add_action('key', function($args) {
//            // Anything
//        });
    }

    protected function onBeforeView(&$model) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_before_view", $model);
    }

    protected function onBeforeEdit(&$model) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_before_edit", $model);
    }

    protected function onBeforeCopy(&$model) {
		// To be overrided if necessary
    }

    protected function onBeforeSave(&$model) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_before_save", $model);
    }

    protected function onSaveSuccess($model) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_after_save", $model);
    }

    protected function onBeforeInsert(&$model) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_before_insert", $model);
    }

    protected function onInsertSuccess($model) {
	    ModelHelper::onInsertSuccess($model);

		$this->setRecentModel($model);

		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_after_insert", $model);
    }

    protected function onBeforeUpdate(&$model, $old) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_before_update", $model, $old);
    }

    protected function onUpdateSuccess($model, $old) {
        ModelHelper::onUpdateSuccess($model, $old);

		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_after_update", $model, $old);
    }

    protected function onViewSuccess($model) {
		$this->setRecentModel($model);

		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_after_view", $model);
    }

    protected function onBeforeDelete($model) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_before_delete", $model);
    }

    protected function onDeleteSuccess($model) {
        ModelHelper::onDeleteSuccess($model);

		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_after_delete", $model);
    }

    protected function onBeforeImport(&$model, $rawdata) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_before_import", $model, $rawdata);
    }

    protected function onImportSuccess($model) {
		// To be overrided if necessary
        PluginManager::do_action("{$this->module}_after_import", $model);
    }
}

//////////////////////////////////////////////////////////////////////////
// ColumnSettings
class ColumnSettings {
    var $type;
    var $text;
    var $code;
    var $settings;

    public function __construct($type, $text, $code, $settings = array()) {
        $this->type = $type;
        $this->text = $text;
        $this->code = $code;
        $this->settings = $settings;
    }
}

//////////////////////////////////////////////////////////////////////////
// ContextStack
class ContextStack {
    var $general_stacks = null;
    var $module_stacks = null;

	static function & getInstance() {
		if(!isset($_SESSION['_ContextStack'])) {
		    $instance = new stdClass();

		    $instance->general_stacks = array();
		    $instance->module_stacks = array();

			$_SESSION['_ContextStack'] = $instance;
		}

		return $_SESSION['_ContextStack'];
	}

	static function register($context) {
        ContextStack::parseContext($context, $module, $action);

		$stack = & ContextStack::getInstance();

        // General stack
		$count = count($stack->general_stacks);

        $derived_from_module_root = false;

        for ($i = $count - 1; $i > 0; $i--) {
            $con = $stack->general_stacks[$i];

            ContextStack::parseContext($con, $mod, $act);

            if (empty($act) || $act == 'list') {
                if ($mod == $module) {
                    $derived_from_module_root = true;
                }

                break;
            }
        }

		if ($count == 0) {
			$stack->general_stacks[] = $context;
		} else {
		    $last_context = $stack->general_stacks[$count - 1];
            ContextStack::parseContext($last_context, $last_module, $last_action);

		    if ($last_module != $module || $last_action != $action) {
    			$stack->general_stacks[] = $context;
		    } else {
    			$stack->general_stacks[$count - 1] = $context;
		    }
		}

        // Module stack
        if (!isset($stack->module_stacks[$module])) {
            $stack->module_stacks[$module] = array();
        }

        if ($derived_from_module_root) {
    		$count = count($stack->module_stacks[$module]);

    		if ($count == 0) {
    			$stack->module_stacks[$module][] = $context;
    		} else {
    		    $last_context = $stack->module_stacks[$module][$count - 1];
                ContextStack::parseContext($last_context, $last_module, $last_action);

    		    if ($last_module != $module || $last_action != $action) {
        			$stack->module_stacks[$module][] = $context;
    		    } else {
        			$stack->module_stacks[$module][$count - 1] = $context;
    		    }
    		}
        }
	}

	static function parseContext($context, &$module, &$action) {
	    $module = null;
	    $action = null;

        if (preg_match('/'.str_replace('/', '\/', APPLICATION_URL).'\/([^\/]+)\/([^\/]+)\/.*/i', $context, $matches)) {
            $module = $matches[1];
            $action = $matches[2];
        }
	}

	static function getCurrentScreenContext(&$module, &$action) {
	    $module = null;
	    $action = null;

		$stack = & ContextStack::getInstance();

		$count = count($stack->general_stacks);

		if ($count > 0) {
		    ContextStack::parseContext($stack->general_stacks[$count - 1], $module, $action);
        }
	}

	static function getRefererModule() {
	    ContextStack::getCurrentScreenContext($module, $action);

	    return $module;
    }

	static function back($step) {
        ContextStack::getCurrentScreenContext($module, $action);

		$stack = & ContextStack::getInstance();

		while($step > 0) {
			array_pop($stack->general_stacks);
			array_pop($stack->module_stacks[$module]);
			$step--;
		}

		$context = array_pop($stack->general_stacks);

		if (empty($context)) {
		    $context = APPLICATION_URL.'/'.$module;
        }

        $caller = isset($_REQUEST['__caller'])? $_REQUEST['__caller'] : '';
        $source = isset($_REQUEST['__source'])? $_REQUEST['__source'] : '';
        $return = isset($_REQUEST['__return'])? $_REQUEST['__return'] : '';

        if (!empty($caller) && !empty($return)) {
            $context .= '?__caller='.$caller.'&__return='.$return.'&__source='.$source;
        }

		application_route($context);
		exit(0);
	}

	static function replace($context) {
        ContextStack::getCurrentScreenContext($module, $action);

		$stack = & ContextStack::getInstance();

		array_pop($stack->general_stacks);
		array_pop($stack->module_stacks[$module]);

        // General stack
		$count = count($stack->general_stacks);

        if ($count > 0) {
            $stack->general_stacks[$count - 1] = $context;
        } else {
            $stack->general_stacks[] = $context;
        }

        // Module stack
		$count = count($stack->module_stacks[$module]);

        if ($count > 0) {
            $stack->module_stacks[$module][$count - 1] = $context;
        } else {
            $stack->module_stacks[$module][] = $context;
        }
	}

	static function check2redirect($module) {
	    ContextStack::getCurrentScreenContext($_module, $_action);

        if (!empty($_module) && !empty($_action) && $_module != $module) {
    		$stack = & ContextStack::getInstance();

            if (isset($stack->module_stacks[$module])) {
                $count = count($stack->module_stacks[$module]);

                if ($count) {
                    $context = $stack->module_stacks[$module][$count - 1];

                    if (!empty($context)) {
                        $stack->general_stacks = $stack->module_stacks[$module];

                        $caller = isset($_REQUEST['__caller'])? $_REQUEST['__caller'] : '';
                        $source = isset($_REQUEST['__source'])? $_REQUEST['__source'] : '';
                        $return = isset($_REQUEST['__return'])? $_REQUEST['__return'] : '';

                        if (!empty($caller) && !empty($return)) {
                            $context .= '?__caller='.$caller.'&__return='.$return.'&__source='.$source;
                        }

                		application_route($context);
                		exit(0);
                    }
                }
            }
        }
    }

	static function isEmpty() {
		$stack = & ContextStack::getInstance();

		return empty($stack->general_stacks);
	}

	static function reset() {
		$stack = & ContextStack::getInstance();

		$stack->general_stacks = array();
		$stack->module_stacks = array();
	}
}

//////////////////////////////////////////////////////////////////////////
// Object
class Object
{
	function get($property, $default=null)
	{
		if(isset($this->$property)) {
			return $this->$property;
		}
		return $default;
	}

	function set( $property, $value = null )
	{
		$previous = isset($this->$property) ? $this->$property : null;
		$this->$property = $value;
		return $previous;
	}
}

//////////////////////////////////////////////////////////////////////////
// Pagination
class Pagination extends Object
{
	var $total = null;
	var $limitstart = null;
	var $limit = null;
	var $_viewall = false;

	function __construct($total, $limitstart, $limit) {
		$this->total		= (int) $total;
		$this->limitstart	= (int) max($limitstart, 0);
		$this->limit		= (int) max($limit, 0);

		if ($this->limit > $this->total) {
			$this->limitstart = 0;
		}

		if (!$this->limit)
		{
			$this->limit = $total;
			$this->limitstart = 0;
		}

		if ($this->limitstart > $this->total) {
			$this->limitstart -= $this->limitstart % $this->limit;
		}

		// Set the total pages and current page values
		if($this->limit > 0) {
			$this->set( 'pages.total', ceil($this->total / $this->limit));
			$this->set( 'pages.current', ceil(($this->limitstart + 1) / $this->limit));
		}

		// Set the pagination iteration loop values
		$displayedPages	= 10;
		$this->set( 'pages.start', (floor(($this->get('pages.current') -1) / $displayedPages)) * $displayedPages +1);
		if ($this->get('pages.start') + $displayedPages -1 < $this->get('pages.total')) {
			$this->set( 'pages.stop', $this->get('pages.start') + $displayedPages -1);
		} else {
			$this->set( 'pages.stop', $this->get('pages.total'));
		}

		// If we are viewing all records set the view all flag to true
		if ($this->limit == $total) {
			$this->_viewall = true;
		}
	}

	function _getPageData() {
		// Initialize variables
		$data = new stdClass();

		$data->all	= new PaginationObject((L_PAGING_VIEW_ALL));
		if (!$this->_viewall) {
			$data->all->base	= '0';
		}

		// Set the start and previous data objects
		$data->start	= new PaginationObject((L_PAGING_START));
		$data->previous	= new PaginationObject((L_PAGING_PREV), null, null, 'pagination-prev');

		if ($this->get('pages.current') > 1)
		{
			$page = ($this->get('pages.current') - 1);

			$data->start->base = 1;
			$data->previous->base = $page;
		}

		// Set the next and end data objects
		$data->next	= new PaginationObject((L_PAGING_NEXT), null, null, 'pagination-next');
		$data->end	= new PaginationObject((L_PAGING_END));

		if ($this->get('pages.current') < $this->get('pages.total'))
		{
			$next = $this->get('pages.current') + 1;
			$end  = ($this->get('pages.total'));

			$data->next->base = $next;
			$data->end->base = $end;
		}

		$data->pages = array();
		$stop = $this->get('pages.stop');
		for ($i = $this->get('pages.start'); $i <= $stop; $i ++)
		{
			$offset = ($i);

			$offset = $offset == 1 ? 1 : $offset;  //set the empty for removal from route

			$data->pages[$i] = new PaginationObject($i);
			if ($i != $this->get('pages.current') || $this->_viewall)
			{
				$data->pages[$i]->base	= $offset;
			}
		}

		return $data;
	}

    function getPageLinks() {
		$links = array();

		$data = $this->_getPageData();

		if (count($data->pages) > 1) {
			$page = $data->previous;
			$links[] = $page;

			foreach($data->pages as $page) {
				$links[] = $page;
			}

			$page = $data->next;
			$links[] = $page;
		}

		return $links;
	}
}

//////////////////////////////////////////////////////////////////////////
// PaginationObject
class PaginationObject extends Object
{
	var $text;
	var $base;
	var $class;

	function __construct($text, $base=null, $link=null, $class=null)
	{
		$this->text = $text;
		$this->base = $base;
		$this->class = $class;
	}
}
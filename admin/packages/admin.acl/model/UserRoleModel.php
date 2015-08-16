<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class UserRoleModel extends DataObject_USER_ROLE {
    var $_module = 'userrole';

	function find($n = null) {
	    if (isset($_SESSION['user'])) {
	        $this->whereAdd(TABLE_PREFIX.$this->__table.".UDID = 0 OR ".TABLE_PREFIX.$this->__table.".UDID IN ('".implode("','", AclController::getUDIDs())."')");
        }

		return parent::find($n);
	}

    function insert($check = true, $notify = true) {
        AclController::ensureCreationQuota($this->_module);

        $this->REFID = SequenceHelper::nextRefid($this->_module);
        if (empty($this->GUID)) {
            $this->GUID = isset($_SESSION['user'])? $_SESSION['user']->ID : null;
        }
        if (empty($this->UDID)) {
            $this->UDID = isset($_SESSION['user'])? ($_SESSION['user']->ID != 1? $_SESSION['user']->UDID : 0) : null;
        }
        $this->UUID = IdHelper::uuid();
        if (empty($this->WFID)) {
            $this->WFID = WorkflowHelper::getDefaultWorkflowStage($this->_module);
        }

        $result = parent::insert();

	    if ($check && !$this->id()) {
            TransactionHelper::rollback();

            (new __AppController())->pagenotfound("[{$this->_module}] There is a record with an empty key");
        }

        if ($result && $notify) {
            NotificationHelper::notifyChange($this->_module, 'insert');
        }

        return $result;
    }

    function update($dataObject = false, $notify = true) {
        if (empty($this->WFID)) {
            $this->WFID = WorkflowHelper::getDefaultWorkflowStage($this->_module);
        }

        $result = parent::update($dataObject);

        if ($result && $notify) {
            NotificationHelper::notifyChange($this->_module, 'update');
        }

        return $result;
    }

    function delete($notify = true) {
		if (isset($_SESSION['user'])) {
		    $this->whereAdd(TABLE_PREFIX.$this->__table.".UDID = '".$_SESSION['user']->UDID."'".($_SESSION['user']->ID == 1? " OR ".TABLE_PREFIX.$this->__table.".UDID = 0" : ''));
        }

        $this->whereAdd(TABLE_PREFIX.$this->__table.".WFID IS NULL OR ".TABLE_PREFIX.$this->__table.".WFID = '".implode("' OR ".TABLE_PREFIX.$this->__table.".WFID = '", WorkflowHelper::getDeletableStages($this->_module))."'");

        $result = parent::delete(true);

        if ($result && $notify) {
            NotificationHelper::notifyChange($this->_module, 'delete');
        }
    }

	function id() {
	    return $this->ID;
	}

	function setId($value) {
        $this->ID = $value;
    }

	function name() {
	    return $this->NAME;
	}
}
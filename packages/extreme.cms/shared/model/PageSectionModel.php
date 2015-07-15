<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class PageSectionModel extends DataObject_PAGE_SECTION {
    var $_module = 'pagesection';

	function find($n = null) {
	    if (isset($_SESSION['user'])) {
	        $this->whereAdd(TABLE_PREFIX.$this->__table.".UDID = 0 OR ".TABLE_PREFIX.$this->__table.".UDID = '".$_SESSION['user']->UDID."'");
        }

		return parent::find($n);
	}

    function insert($check = true, $notify = true) {
        AclController::ensureCreationQuota($this->_module);

        $this->REFID = SequenceHelper::nextRefid($this->_module);
        $this->GUID = isset($_SESSION['user'])? $_SESSION['user']->ID : null;
        $this->UDID = isset($_SESSION['user'])? ($_SESSION['user']->ID != 1? $_SESSION['user']->UDID : 0) : null;
        $this->UUID = IdHelper::uuid();
        if (empty($this->WFID)) {
            $this->WFID = WorkflowHelper::getDefaultWorkflowStage($this->_module);
        }

	    parent::insert();

	    if ($check && !$this->id()) {
            TransactionHelper::rollback();

            (new __AppController())->pagenotfound("[{$this->_module}] There is a record with an empty key");
        }

        if ($notify) {
            NotificationHelper::notifyChange($this->_module, 'insert');
        }
    }

    function update($dataObject = false, $notify = true) {
        if (empty($this->WFID)) {
            $this->WFID = WorkflowHelper::getDefaultWorkflowStage($this->_module);
        }

        parent::update($dataObject);

        if ($notify) {
            NotificationHelper::notifyChange($this->_module, 'update');
        }
    }

    function delete($notify = true) {
		if (isset($_SESSION['user'])) {
		    $this->whereAdd(TABLE_PREFIX.$this->__table.".UDID = '".$_SESSION['user']->UDID."'".($_SESSION['user']->ID == 1? " OR ".TABLE_PREFIX.$this->__table.".UDID = 0" : ''));
        }

        $this->whereAdd(TABLE_PREFIX.$this->__table.".WFID IS NULL OR ".TABLE_PREFIX.$this->__table.".WFID = '".implode("' OR ".TABLE_PREFIX.$this->__table.".WFID = '", WorkflowHelper::getDeletableStages($this->_module))."'");

        parent::delete(true);

        if ($notify) {
            NotificationHelper::notifyChange($this->_module, 'delete');
        }
    }

	function id() {
	    return $this->CODE;
	}

	function name() {
	    return $this->TITLE;
	}
}
<?php
/**
 * Table Definition for WORKFLOW_APPLICATION
 */
require_once 'DB/DataObject.php';

class DataObject_WORKFLOW_APPLICATION extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'WORKFLOW_APPLICATION';    // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $MODULE;                          // varchar(32)  
    public $ID_WORKFLOW;                     // varchar(24)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // int(4)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

<?php
/**
 * Table Definition for WORKFLOW_LOG
 */
require_once 'DB/DataObject.php';

class DataObject_WORKFLOW_LOG extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'WORKFLOW_LOG';        // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_WORKFLOW;                     // varchar(11)  
    public $ID_WORKFLOW_TRANSITION;          // int(4)  
    public $MODULE;                          // varchar(32)  
    public $OBJECT_ID;                       // int(4)  
    public $DATE;                            // date  
    public $ID_USER;                         // int(4)  
    public $DETAILS;                         // varchar(128)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

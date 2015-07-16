<?php
/**
 * Table Definition for WORKFLOW_STAGE
 */
require_once 'DB/DataObject.php';

class DataObject_WORKFLOW_STAGE extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'WORKFLOW_STAGE';      // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_WORKFLOW;                     // varchar(24)  
    public $NAME;                            // varchar(128)  
    public $CODE;                            // varchar(24)  
    public $IS_DEFAULT;                      // tinyint(1)  
    public $IS_BINDING_OBJECT_EDITABLE;      // tinyint(1)  
    public $IS_BINDING_OBJECT_DELETABLE;     // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
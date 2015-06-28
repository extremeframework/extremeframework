<?php
/**
 * Table Definition for ADMIN_MODULE
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_MODULE extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_MODULE';        // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(32)  
    public $MODULE;                          // varchar(32)  unique_key
    public $PREFIX;                          // varchar(3)  
    public $AVAILABLE_ACTIONS;               // varchar(128)  
    public $IS_COMMENT_ENABLED;              // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

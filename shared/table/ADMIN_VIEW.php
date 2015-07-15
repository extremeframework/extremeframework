<?php
/**
 * Table Definition for ADMIN_VIEW
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_VIEW extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_VIEW';          // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $CODE;                            // varchar(11)  
    public $MODULE;                          // varchar(32)  
    public $SCREEN;                          // varchar(128)  
    public $CONDITION_FIELD;                 // varchar(128)  
    public $CONDITION_VALUE;                 // varchar(128)  
    public $TEMPLATE;                        // varchar(128)  
    public $IS_PRINT_VIEW;                   // tinyint(1)  
    public $ORDERING;                        // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

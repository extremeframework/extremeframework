<?php
/**
 * Table Definition for CUSTOM_PERMISSION_SET_ITEM
 */
require_once 'DB/DataObject.php';

class DataObject_CUSTOM_PERMISSION_SET_ITEM extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'CUSTOM_PERMISSION_SET_ITEM';    // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_CUSTOM_PERMISSION_SET;        // int(4)  
    public $MODULE;                          // text  
    public $ACTIONS;                         // text  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

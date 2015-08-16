<?php
/**
 * Table Definition for ACCESS_RIGHT
 */
require_once 'DB/DataObject.php';

class DataObject_ACCESS_RIGHT extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ACCESS_RIGHT';        // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_USER_GROUP;                   // int(4)  unique_key
    public $ID_USER_ROLE;                    // int(4)  unique_key
    public $MODULE;                          // varchar(32)  unique_key
    public $ACTIONS;                         // varchar(128)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

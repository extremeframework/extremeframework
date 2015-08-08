<?php
/**
 * Table Definition for ADMIN_PACKAGE_PERMISSION
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_PACKAGE_PERMISSION extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_PACKAGE_PERMISSION';    // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $NAME;                            // varchar(128)  
    public $REFID;                           // varchar(16)  
    public $ID_ADMIN_PACKAGE;                // varchar(32)  unique_key
    public $ID_PERMISSION_SET;               // int(4)  unique_key
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

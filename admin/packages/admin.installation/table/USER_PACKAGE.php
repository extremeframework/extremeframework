<?php
/**
 * Table Definition for USER_PACKAGE
 */
require_once 'DB/DataObject.php';

class DataObject_USER_PACKAGE extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'USER_PACKAGE';        // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_USER;                         // int(4)  unique_key
    public $ID_ADMIN_PACKAGE;                // varchar(32)  unique_key
    public $INSTALLATION_DATE;               // date  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

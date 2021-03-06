<?php
/**
 * Table Definition for DASHBOARD
 */
require_once 'DB/DataObject.php';

class DataObject_DASHBOARD extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'DASHBOARD';           // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(64)  
    public $TITLE;                           // varchar(128)  
    public $SUBTITLE;                        // varchar(128)  
    public $ID_ADMIN_PACKAGE;                // varchar(32)  
    public $ID_ADMIN_MENU;                   // int(4)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

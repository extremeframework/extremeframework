<?php
/**
 * Table Definition for DASHBOARD_ITEM
 */
require_once 'DB/DataObject.php';

class DataObject_DASHBOARD_ITEM extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'DASHBOARD_ITEM';      // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $ID_DASHBOARD;                    // int(4)  
    public $IMAGE;                           // varchar(255)  
    public $PATH;                            // varchar(128)  
    public $ID_DASHBOARD_ITEM_TYPE;          // varchar(24)  
    public $ORDERING;                        // smallint(2)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

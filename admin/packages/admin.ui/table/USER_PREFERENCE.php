<?php
/**
 * Table Definition for USER_PREFERENCE
 */
require_once 'DB/DataObject.php';

class DataObject_USER_PREFERENCE extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'USER_PREFERENCE';                 // table name
    public $_database = 'extremeframework-git';                 // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_USER;                         // int(4)  unique_key
    public $ID_DASHBOARD;                    // int(4)  
    public $ID_WALLPAPER;                    // int(4)  
    public $ID_ADMIN_STYLE;                  // int(4)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text()  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('DataObject_USER_PREFERENCE',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

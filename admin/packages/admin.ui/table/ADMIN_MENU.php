<?php
/**
 * Table Definition for ADMIN_MENU
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_MENU extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_MENU';                      // table name
    public $_database = 'extremeframework-git';                      // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(64)  
    public $ORDERING;                        // tinyint(1)  
    public $IS_ENABLED;                      // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text()  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('DataObject_ADMIN_MENU',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}
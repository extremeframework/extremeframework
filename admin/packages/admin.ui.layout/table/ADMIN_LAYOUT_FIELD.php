<?php
/**
 * Table Definition for ADMIN_LAYOUT_FIELD
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_LAYOUT_FIELD extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_LAYOUT_FIELD';              // table name
    public $_database = 'extremeframework-git';              // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $MODULE;                          // varchar(32)  unique_key
    public $ID_ADMIN_LAYOUT_SECTION;         // int(4)  
    public $COLUMN;                          // varchar(32)  unique_key
    public $POSITION;                        // varchar(16)  
    public $ORDERING;                        // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text()  
    public $WFID;                            // varchar(11)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('DataObject_ADMIN_LAYOUT_FIELD',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

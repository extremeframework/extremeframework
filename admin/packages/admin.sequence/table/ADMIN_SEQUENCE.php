<?php
/**
 * Table Definition for ADMIN_SEQUENCE
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_SEQUENCE extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_SEQUENCE';                  // table name
    public $_database = 'extremeframework-git';                  // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $MODULE;                          // varchar(32)  
    public $SEQUENCE_FORMAT;                 // varchar(128)  
    public $CURRENT_VALUE;                   // varchar(128)  
    public $SEQUENCE_STEP;                   // smallint(2)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text()  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('DataObject_ADMIN_SEQUENCE',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

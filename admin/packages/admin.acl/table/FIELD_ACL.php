<?php
/**
 * Table Definition for FIELD_ACL
 */
require_once 'DB/DataObject.php';

class DataObject_FIELD_ACL extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'FIELD_ACL';                       // table name
    public $_database = 'extremeframework-git';                       // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $MODULE;                          // varchar(32)  
    public $ACTION;                          // varchar(128)  
    public $ID_USER_GROUP;                   // int(4)  
    public $ID_USER;                         // int(4)  
    public $FIELDS;                          // text()  
    public $ID_ACL_TYPE;                     // int(4)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text()  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('DataObject_FIELD_ACL',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

<?php
/**
 * Table Definition for OBJECT_ACL
 */
require_once 'DB/DataObject.php';

class DataObject_OBJECT_ACL extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'OBJECT_ACL';          // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $MODULE;                          // varchar(32)  
    public $OBJECT_ID;                       // varchar(11)  
    public $ID_USER_GROUP;                   // int(4)  
    public $ID_USER;                         // int(4)  
    public $ARG_ID_USER_GROUP;               // int(4)  
    public $ARG_ID_USER;                     // int(4)  
    public $ID_ACL_TYPE;                     // int(4)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

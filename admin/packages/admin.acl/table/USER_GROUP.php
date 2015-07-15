<?php
/**
 * Table Definition for USER_GROUP
 */
require_once 'DB/DataObject.php';

class DataObject_USER_GROUP extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'USER_GROUP';          // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(32)  
    public $DEFAULT_ID_DASHBOARD;            // int(4)  
    public $PARENT;                          // int(4)  
    public $HIERACHY;                        // varchar(128)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

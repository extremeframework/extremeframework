<?php
/**
 * Table Definition for CUSTOM_ACCESS_RIGHT
 */
require_once 'DB/DataObject.php';

class DataObject_CUSTOM_ACCESS_RIGHT extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'CUSTOM_ACCESS_RIGHT';    // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_USER;                         // int(4)  
    public $ID_PERMISSION_SET;               // int(4)  
    public $VALID_FROM;                      // datetime  
    public $VALID_UNTIL;                     // datetime  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

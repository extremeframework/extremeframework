<?php
/**
 * Table Definition for USER_EXTRA_DOMAIN
 */
require_once 'DB/DataObject.php';

class DataObject_USER_EXTRA_DOMAIN extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'USER_EXTRA_DOMAIN';    // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_USER;                         // int(4)  unique_key
    public $EXTRA_UDID;                      // int(4)  unique_key
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

<?php
/**
 * Table Definition for PAYMENT_TYPE
 */
require_once 'DB/DataObject.php';

class DataObject_PAYMENT_TYPE extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'PAYMENT_TYPE';        // table name
    public $_database = 'admin.commerce';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(128)  
    public $CODE;                            // varchar(11)  
    public $IS_ENABLED;                      // tinyint(1)  
    public $INSTRUCTION;                     // text  
    public $ORDERING;                        // tinyint(1)  
    public $NOTE;                            // varchar(255)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

<?php
/**
 * Table Definition for OPTION
 */
require_once 'DB/DataObject.php';

class DataObject_OPTION extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'OPTION';              // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(128)  
    public $CODE;                            // varchar(32)  unique_key
    public $VALUE;                           // text  
    public $CONTEXT;                         // varchar(32)  unique_key
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

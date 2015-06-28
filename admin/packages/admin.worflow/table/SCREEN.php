<?php
/**
 * Table Definition for SCREEN
 */
require_once 'DB/DataObject.php';

class DataObject_SCREEN extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'SCREEN';              // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $ID_WORKFLOW;                     // varchar(11)  
    public $CODE;                            // varchar(11)  unique_key
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(11)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

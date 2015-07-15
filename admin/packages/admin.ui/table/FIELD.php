<?php
/**
 * Table Definition for FIELD
 */
require_once 'DB/DataObject.php';

class DataObject_FIELD extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'FIELD';               // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(128)  
    public $MODULE;                          // varchar(32)  unique_key
    public $COLUMN;                          // varchar(128)  unique_key
    public $TOOLTIP;                         // varchar(128)  
    public $IS_EXCLUDED;                     // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

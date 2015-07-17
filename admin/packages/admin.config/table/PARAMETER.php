<?php
/**
 * Table Definition for PARAMETER
 */
require_once 'DB/DataObject.php';

class DataObject_PARAMETER extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'PARAMETER';           // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(128)  
    public $CODE;                            // varchar(24)  unique_key
    public $ID_PARAMETER_GROUP;              // int(4)  
    public $ID_PARAMETER_TYPE;               // int(4)  
    public $VALUE;                           // varchar(255)  
    public $DESCRIPTION;                     // text  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

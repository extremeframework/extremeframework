<?php
/**
 * Table Definition for ADMIN_LANGUAGE_ITEM
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_LANGUAGE_ITEM extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_LANGUAGE_ITEM';    // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_ADMIN_LANGUAGE;               // int(4)  unique_key
    public $ID_ADMIN_LABEL;                  // int(4)  unique_key
    public $TRANSLATION;                     // text  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

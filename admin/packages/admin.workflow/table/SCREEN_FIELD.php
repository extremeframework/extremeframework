<?php
/**
 * Table Definition for SCREEN_FIELD
 */
require_once 'DB/DataObject.php';

class DataObject_SCREEN_FIELD extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'SCREEN_FIELD';        // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_SCREEN;                       // varchar(24)  
    public $TITLE;                           // varchar(128)  
    public $CODE;                            // varchar(24)  
    public $ID_VALUE_TYPE;                   // varchar(11)  
    public $DATASOURCE;                      // varchar(128)  
    public $CONDITION;                       // varchar(128)  
    public $VALUECOL;                        // varchar(128)  
    public $TEXTCOL;                         // varchar(128)  
    public $IS_MANDATORY;                    // tinyint(1)  
    public $ORDERING;                        // smallint(2)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

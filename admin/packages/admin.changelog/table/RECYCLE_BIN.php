<?php
/**
 * Table Definition for RECYCLE_BIN
 */
require_once 'DB/DataObject.php';

class DataObject_RECYCLE_BIN extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'RECYCLE_BIN';         // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ITEM;                            // varchar(128)  
    public $MODULE;                          // varchar(32)  
    public $DATE_TIME;                       // datetime  
    public $ID_USER;                         // int(4)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

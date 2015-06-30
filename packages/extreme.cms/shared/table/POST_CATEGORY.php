<?php
/**
 * Table Definition for POST_CATEGORY
 */
require_once 'DB/DataObject.php';

class DataObject_POST_CATEGORY extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'POST_CATEGORY';       // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(128)  
    public $SLUG;                            // varchar(128)  
    public $PARENT;                          // int(4)  
    public $DESCRIPTION;                     // text  
    public $ID_TEMPLATE;                     // varchar(32)  
    public $ORDERING;                        // tinyint(1)  
    public $HIERACHY;                        // varchar(128)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

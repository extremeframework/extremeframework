<?php
/**
 * Table Definition for MENU_ITEM
 */
require_once 'DB/DataObject.php';

class DataObject_MENU_ITEM extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'MENU_ITEM';           // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(64)  
    public $CLASS;                           // varchar(128)  
    public $TAG_LINE;                        // varchar(128)  
    public $ID_MENU;                         // varchar(32)  
    public $PARENT;                          // int(4)  
    public $ID_PAGE;                         // int(4)  
    public $ID_POST;                         // int(4)  
    public $ID_POST_CATEGORY;                // int(4)  
    public $PATH;                            // varchar(128)  
    public $CUSTOM_CONTENT;                  // text  
    public $HAS_BREAK_AFTER;                 // tinyint(1)  
    public $ORDERING;                        // tinyint(1)  
    public $ACL_ID_USER_GROUP;               // int(4)  
    public $HIERACHY;                        // varchar(128)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

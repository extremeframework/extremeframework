<?php
/**
 * Table Definition for ADMIN_MENU_ITEM
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_MENU_ITEM extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_MENU_ITEM';     // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(64)  
    public $ID_ADMIN_MENU;                   // int(4)  
    public $PARENT;                          // int(4)  
    public $MODULE;                          // varchar(32)  
    public $PATH;                            // varchar(128)  
    public $FONT_AWESOME_ICON;               // varchar(32)  
    public $ENABLE_LEFT;                     // tinyint(1)  
    public $ENABLE_TOP;                      // tinyint(1)  
    public $ENABLE_QUICK;                    // tinyint(1)  
    public $ENABLE_ALL;                      // tinyint(1)  
    public $ENABLE_SETTINGS;                 // tinyint(1)  
    public $OPEN_IN_NEW_WINDOW;              // tinyint(1)  
    public $IS_STARRED;                      // tinyint(1)  
    public $ORDERING;                        // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  
    public $HIERACHY;                        // varchar(128)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

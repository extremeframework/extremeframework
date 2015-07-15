<?php
/**
 * Table Definition for PAGE_SECTION
 */
require_once 'DB/DataObject.php';

class DataObject_PAGE_SECTION extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'PAGE_SECTION';        // table name
    public $_database = 'extreme.cms';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $ID_PAGE;                         // int(4)  
    public $CODE;                            // varchar(11)  
    public $PARENT;                          // varchar(11)  
    public $TAG_LINE;                        // varchar(128)  
    public $IMAGE;                           // varchar(128)  
    public $FONT_AWESOME_ICON;               // varchar(16)  
    public $BACKGROUND_IMAGE;                // varchar(128)  
    public $BACKGROUND_COLOR;                // varchar(32)  
    public $VIDEO;                           // varchar(128)  
    public $CONTENT;                         // text  
    public $TAGS;                            // varchar(128)  
    public $VIEW_MORE_TITLE;                 // varchar(64)  
    public $VIEW_MORE_ID_PAGE;               // int(4)  
    public $VIEW_MORE_LINK;                  // varchar(128)  
    public $HIDE_TITLE;                      // tinyint(1)  
    public $IS_TAB_ANCHOR_SECTION;           // tinyint(1)  
    public $TAB_ANCHOR_TITLE;                // varchar(64)  
    public $ORDERING;                        // tinyint(1)  
    public $HIERACHY;                        // varchar(128)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

<?php
/**
 * Table Definition for PAGE
 */
require_once 'DB/DataObject.php';

class DataObject_PAGE extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'PAGE';                // table name
    public $_database = 'extreme.cms';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(128)  
    public $TITLE;                           // varchar(128)  
    public $PARENT;                          // int(4)  
    public $SLUG;                            // varchar(128)  
    public $TAG_LINE;                        // varchar(128)  
    public $THUMB;                           // varchar(255)  
    public $BACKGROUND_IMAGE;                // varchar(128)  
    public $IMAGE;                           // varchar(255)  
    public $VIDEO;                           // varchar(255)  
    public $META_KEYWORDS;                   // varchar(255)  
    public $META_DESCRIPTION;                // varchar(255)  
    public $INTRODUCTION;                    // text  
    public $CONTENT;                         // text  
    public $FOOTER;                          // text  
    public $ID_TEMPLATE;                     // varchar(32)  
    public $ADDITIONAL_CSS;                  // text  
    public $CUSTOM_TOP_ID_MENU;              // varchar(32)  
    public $CUSTOM_SIDE_ID_MENU;             // varchar(32)  
    public $VIEW_MORE_TITLE;                 // varchar(64)  
    public $VIEW_MORE_ID_PAGE;               // int(4)  
    public $VIEW_MORE_LINK;                  // varchar(128)  
    public $LATEST_UPDATE;                   // datetime  
    public $NBR_VIEWS;                       // double(10)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  
    public $HIERACHY;                        // varchar(128)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

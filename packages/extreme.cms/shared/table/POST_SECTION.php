<?php
/**
 * Table Definition for POST_SECTION
 */
require_once 'DB/DataObject.php';

class DataObject_POST_SECTION extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'POST_SECTION';        // table name
    public $_database = 'extreme.cms';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $ID_POST;                         // int(4)  
    public $TAG_LINE;                        // varchar(128)  
    public $IMAGE;                           // varchar(128)  
    public $BACKGROUND_IMAGE;                // varchar(128)  
    public $BACKGROUND_COLOR;                // varchar(32)  
    public $VIDEO;                           // varchar(128)  
    public $CONTENT;                         // text  
    public $LINK_PATH;                       // varchar(128)  
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

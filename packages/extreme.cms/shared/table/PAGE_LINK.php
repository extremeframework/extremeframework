<?php
/**
 * Table Definition for PAGE_LINK
 */
require_once 'DB/DataObject.php';

class DataObject_PAGE_LINK extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'PAGE_LINK';           // table name
    public $_database = 'extreme.cms';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $ID_PAGE;                         // int(4)  
    public $FONT_AWESOME_ICON;               // varchar(32)  
    public $LINK_ID_PAGE;                    // int(4)  
    public $LINK_PATH;                       // varchar(128)  
    public $ID_PAGE_LINK_TYPE;               // varchar(11)  
    public $ORDERING;                        // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

<?php
/**
 * Table Definition for POST
 */
require_once 'DB/DataObject.php';

class DataObject_POST extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'POST';                // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $SLUG;                            // varchar(128)  
    public $ID_POST_TYPE;                    // varchar(11)  
    public $ID_POST_CATEGORY;                // int(4)  
    public $IMAGE;                           // varchar(255)  
    public $META_KEYWORDS;                   // varchar(255)  
    public $META_DESCRIPTION;                // varchar(255)  
    public $EXCERPT;                         // text  
    public $CONTENT;                         // text  
    public $TAGS;                            // varchar(128)  
    public $AUTHOR;                          // varchar(128)  
    public $EXTERNAL_LINK;                   // varchar(128)  
    public $ID_TEMPLATE;                     // varchar(32)  
    public $CREATION_DATE;                   // datetime  
    public $LATEST_UPDATE;                   // datetime  
    public $IS_FEATURED;                     // tinyint(1)  
    public $NBR_VIEWS;                       // double(10)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

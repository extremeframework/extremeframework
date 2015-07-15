<?php
/**
 * Table Definition for POST_GALLERY
 */
require_once 'DB/DataObject.php';

class DataObject_POST_GALLERY extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'POST_GALLERY';        // table name
    public $_database = 'extreme.cms';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $ID_POST;                         // int(4)  
    public $IMAGE;                           // varchar(255)  
    public $DESCRIPTION;                     // text  
    public $ORDERING;                        // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

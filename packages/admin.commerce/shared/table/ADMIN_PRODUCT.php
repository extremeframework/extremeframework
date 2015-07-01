<?php
/**
 * Table Definition for ADMIN_PRODUCT
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_PRODUCT extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_PRODUCT';       // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $TITLE;                           // varchar(128)  
    public $TAG_LINE;                        // varchar(128)  
    public $IMAGE;                           // varchar(255)  
    public $LIST_PRICE;                      // double(10)  
    public $PRICE;                           // double(10)  
    public $DESCRIPTION;                     // text  
    public $PRODUCT_ID_PAGE;                 // int(4)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

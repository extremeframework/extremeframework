<?php
/**
 * Table Definition for ADMIN_ORDER_ITEM
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_ORDER_ITEM extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_ORDER_ITEM';    // table name
    public $_database = 'admin.commerce';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_ADMIN_ORDER;                  // int(4)  
    public $ID_ADMIN_PRODUCT;                // int(4)  
    public $QUANTITY;                        // smallint(2)  
    public $PRICE;                           // double(10)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

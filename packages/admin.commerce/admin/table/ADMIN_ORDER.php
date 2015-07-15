<?php
/**
 * Table Definition for ADMIN_ORDER
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_ORDER extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_ORDER';         // table name
    public $_database = 'admin.commerce';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $CUSTOMER_ID_COUNTRY;             // varchar(128)  
    public $CUSTOMER_FIRST_NAME;             // varchar(128)  
    public $CUSTOMER_LAST_NAME;              // varchar(128)  
    public $CUSTOMER_ADDRESS;                // varchar(128)  
    public $CUSTOMER_CITY;                   // varchar(128)  
    public $CUSTOMER_STATE;                  // varchar(128)  
    public $CUSTOMER_ZIP_CODE;               // varchar(128)  
    public $CUSTOMER_EMAIL;                  // varchar(255)  
    public $CUSTOMER_PHONE;                  // varchar(16)  
    public $TOTAL_VALUE;                     // double(10)  
    public $COUPON_CODE;                     // varchar(16)  
    public $COUPON_DISCOUNT;                 // double(10)  
    public $ID_PAYMENT_TYPE;                 // varchar(11)  
    public $CREATION_DATE;                   // datetime  
    public $PAYMENT_DATE;                    // datetime  
    public $PAYMENT_REF;                     // varchar(32)  
    public $REFUND_DATE;                     // datetime  
    public $REFUND_REF;                      // varchar(32)  
    public $PROCESSED_DATE;                  // datetime  
    public $ID_ADMIN_ORDER_STATUS;           // varchar(11)  
    public $NOTE;                            // varchar(255)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

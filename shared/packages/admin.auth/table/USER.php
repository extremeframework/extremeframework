<?php
/**
 * Table Definition for USER
 */
require_once 'DB/DataObject.php';

class DataObject_USER extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'USER';                            // table name
    public $_database = 'extremeframework-git';                            // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $FIRST_NAME;                      // varchar(64)  
    public $LAST_NAME;                       // varchar(64)  
    public $PHOTO;                           // varchar(128)  
    public $EMAIL;                           // varchar(64)  
    public $LOGIN;                           // varchar(64)  
    public $PASSWORD;                        // varchar(32)  
    public $PHONE;                           // varchar(32)  
    public $GENDER;                          // tinyint(1)  
    public $DATE_OF_BIRTH;                   // date()  
    public $FORCE_PASSWORD_CHANGE;           // tinyint(1)  
    public $IS_EMAIL_VERIFIED;               // tinyint(1)  
    public $FACEBOOK_ID;                     // varchar(128)  
    public $FACEBOOK_OAUTH_ID;               // varchar(128)  
    public $GOOGLE_ID;                       // varchar(128)  
    public $GOOGLE_OAUTH_ID;                 // varchar(128)  
    public $YAHOO_ID;                        // varchar(128)  
    public $YAHOO_OAUTH_ID;                  // varchar(128)  
    public $IS_ENABLED;                      // tinyint(1)  
    public $CREATION_DATE;                   // datetime()  
    public $LATEST_LOGIN;                    // datetime()  
    public $GUID;                            // int(4)  
    public $JSON;                            // text()  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(11)  
    public $UUID;                            // char(36)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('DataObject_USER',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

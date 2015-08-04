<?php
/**
 * Table Definition for ADMIN_PACKAGE
 */
require_once 'DB/DataObject.php';

class DataObject_ADMIN_PACKAGE extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'ADMIN_PACKAGE';       // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $NAME;                            // varchar(128)  
    public $CODE;                            // varchar(32)  
    public $ID_ADMIN_PACKAGE_CATEGORY;       // int(4)  
    public $IMAGE;                           // varchar(128)  
    public $DESCRIPTION;                     // text  
    public $ENTRY_PATH;                      // varchar(128)  
    public $AUTHOR;                          // varchar(128)  
    public $VERSION;                         // varchar(128)  
    public $PACKAGE_URL;                     // varchar(255)  
    public $AUTHOR_URL;                      // varchar(255)  
    public $PACKAGE_PATH;                    // varchar(128)  
    public $INSTALLATION_DATE;               // date  
    public $LATEST_UPDATE;                   // date  
    public $IS_USER_PACKAGE;                 // tinyint(1)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $UDID;                            // int(4)  
    public $WFID;                            // varchar(24)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

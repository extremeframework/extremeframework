<?php
/**
 * Table Definition for USER_INVITATION
 */
require_once 'DB/DataObject.php';

class DataObject_USER_INVITATION extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'USER_INVITATION';     // table name
    public $_database = 'extremeframework-git';    // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $INVITEE_NAME;                    // varchar(128)  
    public $INVITEE_EMAIL;                   // varchar(255)  
    public $ID_USER_GROUP;                   // int(4)  
    public $ID_USER_ROLE;                    // int(4)  
    public $VALID_FROM;                      // datetime  
    public $VALID_UNTIL;                     // datetime  
    public $ID_USER_INVITATION_STATUS;       // varchar(24)  
    public $DATE_SENT;                       // datetime  
    public $DATE_ACCEPTED;                   // datetime  
    public $GUID;                            // int(4)  
    public $JSON;                            // text  
    public $WFID;                            // varchar(24)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

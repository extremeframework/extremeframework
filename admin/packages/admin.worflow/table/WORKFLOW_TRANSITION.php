<?php
/**
 * Table Definition for WORKFLOW_TRANSITION
 */
require_once 'DB/DataObject.php';

class DataObject_WORKFLOW_TRANSITION extends DB_DataObject 
{
    ###START_AUTOCODE
    /* the code below is auto generated do not remove the above tag */

    public $__table = 'WORKFLOW_TRANSITION';             // table name
    public $_database = 'extremeframework-git';             // database name (used with database_{*} config)
    public $ID;                              // int(4)  primary_key not_null
    public $REFID;                           // varchar(16)  
    public $ID_WORKFLOW;                     // varchar(11)  
    public $NAME;                            // varchar(128)  
    public $START_ID_WORKFLOW_STAGE;         // varchar(11)  
    public $END_ID_WORKFLOW_STAGE;           // varchar(11)  
    public $ACTION;                          // varchar(128)  
    public $ID_USER_GROUP;                   // int(4)  
    public $ID_USER_ROLE;                    // int(4)  
    public $TRANSITION_ID_SCREEN;            // varchar(11)  
    public $GUID;                            // int(4)  
    public $JSON;                            // text()  
    public $WFID;                            // varchar(11)  
    public $UDID;                            // int(4)  
    public $UUID;                            // char(36)  

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('DataObject_WORKFLOW_TRANSITION',$k,$v); }

    /* the code above is auto generated do not remove the tag below */
    ###END_AUTOCODE
}

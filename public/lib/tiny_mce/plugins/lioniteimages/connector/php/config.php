<?php
require_once (realpath(dirname(__FILE__).'/../../../../../../../admin/app_config.php'));
require_once (realpath(dirname(__FILE__).'/../../../../../../../shared/app_config.php'));

$uploads_url = UPLOAD_URL.'/';
$uploads_dir = UPLOAD_DIR.'/';
$thumbs_url = APPLICATION_URL.'/thumb/96x96/';

function isAuth() {
    //Perform your own authrization to make sure user is allowed to upload
    //Use session ID is inside $_POST['SESSID'] to load sessions
    return true; //Return true when authenticated, false when denied
}
<?php
require_once(dirname(__FILE__).'/config.php');

$url = isset($_REQUEST['url'])? $_REQUEST['url'] : '';

$filename = basename($_REQUEST['url']);

$filepath = $uploads_dir.'/'.$filename;
@unlink($filepath);

$filepath = $uploads_dir.'/thumbs/'.$filename;
@unlink($filepath);
?>
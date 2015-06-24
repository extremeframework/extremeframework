<?php
require_once(dirname(__FILE__).'/qquploader.php');
require_once(dirname(__FILE__).'/config.php');

// list of valid extensions, ex. array("jpeg", "xml", "bmp")
$allowedExtensions = array();
// max file size in bytes
$sizeLimit = 10 * 1024 * 1024;

$uploader = new qqFileUploader($allowedExtensions, $sizeLimit);
$result = $uploader->handleUpload($uploads_dir);

$result['image'] = $uploads_url.$result['filename'];
$result['thumb'] = $thumbs_url.$result['filename'];

// to pass data through iframe you will need to encode all html tags
echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);

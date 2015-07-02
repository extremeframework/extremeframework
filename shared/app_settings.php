<?php
///////////////////////////////////////////////////////////
// Include paths
$paths = array(
    LIBRARY_DIR.'/external/',
    LIBRARY_DIR.'/external/PEAR/',
    LIBRARY_DIR.'/internal/',
    SHARED_DIR.'/library/',
    SHARED_DIR.'/library/PEAR/',
);
set_include_path(implode(PATH_SEPARATOR, $paths));

require_once('PEAR.php');
require_once('DB/DataObject.php');
require_once('Smarty/libs/SmartyBC.class.php');
require_once('Framework.php');
require_once('Route.php');
require_once('Cache.php');

///////////////////////////////////////////////////////////
// DB_DataObject configuration
global $database_dsn;

$options = &PEAR::getStaticProperty( 'DB_DataObject', 'options' );
$options = array(
	'schema_location' 		 => SCHEMA_DIR,
	'class_prefix'           => 'DataObject_',
	'quote_identifiers'      => true,
	'db_driver'			     => 'MDB2'
);
$options = array_merge($options, $database_dsn);

///////////////////////////////////////////////////////////
// MDB2 configuration
require_once('MDB2.php');
$mdb2_options = &PEAR::getStaticProperty('MDB2', 'options');
$mdb2_options = array();
$mdb2_options['quote_identifier'] = true;
$mdb2_options['portability'] = MDB2_PORTABILITY_ALL ^ MDB2_PORTABILITY_FIX_CASE ^ MDB2_PORTABILITY_EMPTY_TO_NULL;

ini_set("default_charset","utf8");

///////////////////////////////////////////////////////////
// Autoload
include(THEME_DIR.'/autoload.php');
include(APPLICATION_DIR.'/autoload.php');
include(SHARED_DIR.'/autoload.php');

///////////////////////////////////////////////////////////
// External packages
Framework::loadPackages(realpath(dirname(__FILE__).'/../packages'));

///////////////////////////////////////////////////////////
// Start session
if (defined('APPLICATION_NAME')) {
	session_name(md5(APPLICATION_NAME));
}

session_start();

///////////////////////////////////////////////////////////
// Include core functions
require_once(SHARED_DIR.'/includes/shortcodes.php');
require_once(SHARED_DIR.'/includes/PluginManager.php');

///////////////////////////////////////////////////////////
// Load plugins
PluginManager::load_plugins();

///////////////////////////////////////////////////////////
// Theme specific
if (file_exists(THEME_DIR.'/functions.php')) {
    include(THEME_DIR.'/functions.php');
}

//////////////////////////////////////////////////////////////////
// Custom error handler to log PEAR errors
PEAR::setErrorHandling(PEAR_ERROR_CALLBACK, function ($error) {
	if (is_a($error,'PEAR_Error')) {
		$message = $error->getUserInfo();
	} else {
		$message = $error;
	}
	$log = '';
	$log .= "-------------------\n";
	$log .= date('Y-m-d H:i:s')."\n";
	$log .= "-------------------\n";
	$log .= $message."\n";
    file_put_contents(APPLICATION_DIR.'/errors.log', $log, FILE_APPEND);
});


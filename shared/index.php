<?php
include(dirname(__FILE__)."/compatibility.php");
include(dirname(__FILE__)."/loader.php");

header('Access-Control-Allow-Origin: *');
date_default_timezone_set('UTC');

///////////////////////////////////////////////////////////
// Magic quotes
///////////////////////////////////////////////////////////
if (get_magic_quotes_gpc()) {
    function stripslashes_gpc(&$value)
    {
        $value = stripslashes($value);
    }
    array_walk_recursive($_GET, 'stripslashes_gpc');
    array_walk_recursive($_POST, 'stripslashes_gpc');
    array_walk_recursive($_COOKIE, 'stripslashes_gpc');
    array_walk_recursive($_REQUEST, 'stripslashes_gpc');
}

///////////////////////////////////////////////////////////
// Composer packages
///////////////////////////////////////////////////////////
include(dirname(__FILE__)."/../vendor/autoload.php");

///////////////////////////////////////////////////////////
// Configuration & settings
///////////////////////////////////////////////////////////
include(dirname(__FILE__)."/app_config.php");
include(dirname(__FILE__)."/app_settings.php");
include(dirname(__FILE__)."/app_constant.php");
include(dirname(__FILE__)."/app_common.php");

//////////////////////////////////////////////////////////////////
// Check config mode
//////////////////////////////////////////////////////////////////
if (isset($_REQUEST['config'])) {
    $_SESSION['config'] = $_REQUEST['config'];
} else {
    if (!isset($_SESSION['config'])) {
        $_SESSION['config'] = false;
    }
}

//////////////////////////////////////////////////////////////////
// Load language file
//////////////////////////////////////////////////////////////////
if (isset($_REQUEST['lang']) && !empty($_REQUEST['lang'])) {
    $lang = $_REQUEST['lang'];
} else {
    $lang = isset($_SESSION['lang'])? $_SESSION['lang'] : 'en';
}
$_SESSION['lang'] = $lang;

include(SHARED_DIR."/locales/app_lang_{$lang}.php");

//////////////////////////////////////////////////////////////////
// Main processing
//////////////////////////////////////////////////////////////////
function application_route($url = null) {
    static $rewrited = false;

    if (!empty($url)) {
        @list($main, $querystring) = explode('?', $url);

        parse_str($querystring, $params);

        $_REQUEST = array_merge($_REQUEST, $params);
        $_REQUEST['p'] = trim(str_replace(APPLICATION_URL, '', $main), '/');
    }

    // Automatically convert something like sitemap.xml to sitemap/xml
    $_REQUEST['p'] = preg_replace('/(index\.php)$/i', '', $_REQUEST['p']);
    $_REQUEST['p'] = str_replace('.xml', '/xml', $_REQUEST['p']);

    //////////////////////////////////////////////////////////////////
    // Identify the right controller and action method
    $p = !empty($_REQUEST['p'])? explode('/', $_REQUEST['p']) : array();

    $controller = isset($p[0])? $p[0] : 'index';
    $action = isset($p[1])? $p[1] : 'index';

    $controller = ucfirst(Route::translateControllerName($controller));
    $controllername = Framework::getControllerName($controller);
    $actionmethod = Framework::getActionName($action);

    $ok = false;
    if (class_exists($controllername)) {
    	$handler = new $controllername();

        if (!method_exists($handler, $actionmethod)) {
            $action = 'index';
            $actionmethod = Framework::getActionName($action);
        }

        if (method_exists($handler, $actionmethod)) {
            $ok = true;
        }
    }

    if (!$ok) {
        if (!$rewrited && defined('ENABLE_REWRITE') && ENABLE_REWRITE) {
            $_REQUEST['p'] = Route::translate($_REQUEST['p']);
            $rewrited = true;

            return application_route();
        } else {
            $controller = 'index';
            $action = 'index';

            $controllername = Framework::getControllerName($controller);
            $actionmethod = Framework::getActionName($action);

            $handler = new $controllername();
        }
    }

    //////////////////////////////////////////////////////////////////
    // Request arguments
    $args = preg_replace('/^'.$controller.'\/?/i', '', $_REQUEST['p']);
    $args = preg_replace('/^\/?'.$action.'\/?/i', '', $args);
    $_REQUEST['args'] = $args;

    //////////////////////////////////////////////////////////////////
    // Execute
    $handler->$actionmethod();

    exit(0);
}

// Apply handshake plugin
LicenseCheckHelper::apply_handshake_plugin();

// Route application
application_route();
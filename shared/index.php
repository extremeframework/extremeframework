<?php
include(dirname(__FILE__)."/compatibility.php");
include(dirname(__FILE__)."/loader.php");
include(dirname(__FILE__)."/app_config.php");

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

//////////////////////////////////////////////////////////////////
// Main processing
//////////////////////////////////////////////////////////////////
global $cachepath;
global $dont_load_cache;

function get_cache_path($request) {
    global $dont_load_cache;

    $p = isset($_GET['p'])? $_GET['p'] : '';

    // x. Get cache config
    $config = include(CONFIG_DIR.'/html-cache.php');

    // x. Return if HTML cache is not enabled
    $enabled = isset($config['enabled'])? $config['enabled'] : false;

    if (!$enabled) {
        return;
    }

    // x. Don't use cache for POST type
    if (!empty($_POST)) {
        $dont_load_cache = true;

        return null;
    }

    // x. Don't use cache for some cases
    $excludes = isset($config['excludes'])? $config['excludes'] : array();

    foreach ($excludes as $pattern) {
        if (preg_match('/'.$pattern.'/is', $p)) {
            $dont_load_cache = true;

            return null;
        }
    }

    // x. Determine a cache directory
    @list($controller, $action) = explode('/', $p);

    $dirname = $controller;

    if ($controller == 'ajax' && $action == 'widget') {
        if (isset($_REQUEST['q']) && !empty($_REQUEST['q'])) {
            $querystring = base64_decode($_REQUEST['q']);

            if (!empty($querystring)) {
                parse_str($querystring, $params);

        		$class = isset($params['class'])? $params['class'] : '';

                if (!empty($class)) {
                    $module = strtolower($class);

                    $module = preg_replace('/(widgetlist|widgetview)/is', '', $module);

                    $dirname = $module;
                }
            }
        }
    }

    $cachedir = APPLICATION_DIR.'/cache/html/'.strtolower($dirname);

    // x. Construct a cache file path
    $query = http_build_query($request);

    $filename = md5(session_id()).'-'.md5($query).'-'.get_lang().'.html';
    $filepath = $cachedir.'/'.$filename;

    return $filepath;
}

function is_auth_required($request) {
    $p = isset($_GET['p'])? $_GET['p'] : '';

    // x. Get cache config
    $config = include(CONFIG_DIR.'/html-cache.php');

    // x. Check auth-required paths
    $auth_required_paths = isset($config['auth_required_paths'])? $config['auth_required_paths'] : array();

    foreach ($auth_required_paths as $pattern) {
        if (preg_match('/'.$pattern.'/is', $p)) {
            return true;
        }
    }

    return false;
}

function get_lang() {
    if (isset($_REQUEST['lang']) && !empty($_REQUEST['lang'])) {
        $lang = $_REQUEST['lang'];
    } else if (isset($_SESSION['lang']) && !empty($_SESSION['lang'])) {
        $lang = $_SESSION['lang'];
    } else if (isset($_COOKIE['lang']) && !empty($_COOKIE['lang'])) {
        $lang = $_COOKIE['lang'];
    } else {
        $lang = 'en';
    }

    return $lang;
};

function application_route($url = null) {
    global $cachepath;
    global $dont_load_cache;
    static $rewrited = false;
    static $thin_session_checked = false;
    static $thin_session_started = false;
    static $is_auth_required = false;
    static $is_user_authed = false;

    if (!empty($url)) {
        @list($main, $querystring) = explode('?', $url);

        parse_str($querystring, $params);

        $_GET = $params;
        $_GET['p'] = trim(str_replace(APPLICATION_URL, '', $main), '/');
    }

    // Automatically convert something like sitemap.xml to sitemap/xml
    $_GET['p'] = preg_replace('/(index\.php)$/i', '', $_GET['p']);
    $_GET['p'] = str_replace('.xml', '/xml', $_GET['p']);

    ///////////////////////////////////////////////////////////
    // Pre-start session to check if user is authenticated so
    // that we can consider applying HTML cache or not
    ///////////////////////////////////////////////////////////
    $is_auth_required = is_auth_required($_GET);

    if ($is_auth_required) {
        if (!$thin_session_checked) {
            if (defined('APPLICATION_NAME')) {
            	session_name(md5(APPLICATION_NAME));
            }

            session_start();

            $is_user_authed = isset($_SESSION['user']);

            $thin_session_checked = true;
            $thin_session_started = true;
        }
    }

    ///////////////////////////////////////////////////////////
    // Use cache if applicable
    ///////////////////////////////////////////////////////////
    if (empty($cachepath) || $rewrited) {
        $cachepath = get_cache_path($_GET);
    }

    $cachetime = 86400; // 1 day cache

    if ((!$is_auth_required || $is_user_authed) && !$dont_load_cache && !empty($cachepath) && is_file($cachepath) && time() - $cachetime < filemtime($cachepath)) {
        echo file_get_contents($cachepath);

        exit(0);
    }

    ///////////////////////////////////////////////////////////
    // Here, we dont use cache, so we need to perform the full
    // processing. So, we need to close the pre-session (with
    // no class definition loaded) so it can be re-openned later
    // with class definition loaded or with autoloads defined
    ///////////////////////////////////////////////////////////
    if ($thin_session_checked && $thin_session_started) {
        session_write_close();

        $thin_session_started = false;
    }

    ///////////////////////////////////////////////////////////
    // Composer packages
    ///////////////////////////////////////////////////////////
    require_once(dirname(__FILE__)."/../vendor/autoload.php");

    ///////////////////////////////////////////////////////////
    // Configuration & settings
    ///////////////////////////////////////////////////////////
    require_once(dirname(__FILE__)."/app_settings.php");
    require_once(dirname(__FILE__)."/app_constant.php");
    require_once(dirname(__FILE__)."/app_common.php");

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
    $lang = get_lang();

    setcookie('lang', $lang, time() + 86400, '/'); // 10 days for the entire domain
    $_SESSION['lang'] = $lang;

    require_once(SHARED_DIR."/locales/app_lang_{$lang}.php");

    //////////////////////////////////////////////////////////////////
    // Identify the right controller and action method
    $_GET['p'] = Route::translate($_GET['p']);

    $p = !empty($_GET['p'])? explode('/', $_GET['p']) : array();

    $old_controller = isset($p[0])? $p[0] : 'index';
    $action = isset($p[1])? $p[1] : 'index';

    $controller = ucfirst(Route::translateControllerName($old_controller));
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
            $_GET['p'] = Route::translate($_GET['p']);
            $rewrited = true;

            return application_route();
        } else {
            $old_controller = 'index';
            $action = 'index';

            $controllername = Framework::getControllerName($old_controller);
            $actionmethod = Framework::getActionName($action);

            $handler = new $controllername();
        }
    }

    //////////////////////////////////////////////////////////////////
    // Request arguments
    $args = preg_replace('/^'.$old_controller.'\/?/i', '', $_GET['p']);
    $args = preg_replace('/^\/?'.$action.'\/?/i', '', $args);
    $_REQUEST['args'] = $args;

    //////////////////////////////////////////////////////////////////
    // Execute
    Framework::register('controller', $controller);
    Framework::register('action', $action);

    $handler->$actionmethod();
}

function application_enter() {
    ob_start();
}

function application_exit($code = 0) {
    global $cachepath;

    if (!empty($cachepath)) {
        // x. Ensure cache directory
        $dir = dirname($cachepath);

        if (!is_dir($dir)) {
            $old = umask(0);
            mkdir($dir, 0755, true);
            umask($old);
        }

        // x. Write cache file
        if (is_writable($dir)) {
            $contents = ob_get_contents();

            file_put_contents($cachepath, $contents);
        } else {
            MessageHelper::setAppMessage("The directory $dir should be writable");
        }
    }

    ob_end_flush();

    exit(0);
}

// Pre
application_enter();

// Route application
application_route();

// Post
application_exit();
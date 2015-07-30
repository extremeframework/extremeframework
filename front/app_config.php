<?php
$scheme = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on'? 'https:' : 'http:';

define('APPLICATION_NAME' 	                    , md5(__FILE__));
define('APPLICATION_TYPE' 	                    , 'front');
define('APPLICATION_DIR'						, realpath(dirname(__FILE__)));
define('APPLICATION_URL'						, $scheme.'//localhost/apps4clouds.com/apps/extremeframework-git');
define('THEME_NAME'						        , 'scholar');
define('THEME_DIR'						        , dirname(__FILE__).'/themes/'.THEME_NAME);
define('THEME_URL'						        , $scheme.'//localhost/apps4clouds.com/apps/extremeframework-git/front/themes/'.THEME_NAME);
define('TEMPLATE_DIR'							, THEME_DIR.'/templates');
define('ENABLE_REWRITE' 	                    , true);
define('MAINTENANCE_MODE' 	                    , false);
define('MAINTENANCE_START_TIME'                 , '');
define('MAINTENANCE_END_TIME'                   , '');
define('MAINTENANCE_IP'                         , '');
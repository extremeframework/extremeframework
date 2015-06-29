<?php
$scheme = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on'? 'https:' : 'http:';

define('APPLICATION_NAME' 	                    , '{APPLICATION_NAME}');
define('APPLICATION_TYPE' 	                    , 'front');
define('APPLICATION_DIR'						, realpath(dirname(__FILE__).'/../front/'));
define('APPLICATION_URL'						, $scheme.'{APPLICATION_URL}/blog');
define('THEME_NAME'						        , '{THEME_NAME}');
define('THEME_DIR'						        , dirname(__FILE__).'/themes/'.THEME_NAME);
define('THEME_URL'						        , $scheme.'{APPLICATION_URL}/blog/themes/'.THEME_NAME);
define('TEMPLATE_DIR'							, THEME_DIR.'/templates');
define('ENABLE_REWRITE' 	                    , true);
define('MAINTENANCE_MODE' 	                    , false);
define('MAINTENANCE_START_TIME'                 , '');
define('MAINTENANCE_END_TIME'                   , '');
define('MAINTENANCE_IP'                         , '');
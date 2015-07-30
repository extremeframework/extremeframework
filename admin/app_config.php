<?php
$scheme = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on'? 'https:' : 'http:';

define('APPLICATION_NAME' 	                    , '558a7607a2f58');
define('APPLICATION_TYPE' 	                    , 'admin');
define('APPLICATION_DIR'						, dirname(__FILE__));
define('APPLICATION_URL'						, '/apps4clouds.com/apps/extremeframework-git/admin');
define('THEME_NAME'						        , 'admin');
define('THEME_URL'						        , APPLICATION_URL);
define('THEME_DIR'						        , APPLICATION_DIR);
define('TEMPLATE_DIR'							, dirname(__FILE__).'/templates');
define('MAINTENANCE_MODE' 	                    , false);
define('MAINTENANCE_START_TIME'                 , '');
define('MAINTENANCE_END_TIME'                   , '');
define('MAINTENANCE_IP'                         , '');
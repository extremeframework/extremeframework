<?php
$scheme = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on'? 'https:' : 'http:';

define('APPLICATION_NAME' 	                    , '{APPLICATION_NAME}');
define('APPLICATION_DIR'						, dirname(__FILE__));
define('APPLICATION_URL'						, $scheme.'{APPLICATION_URL}');
define('THEME_URL'						        , APPLICATION_URL);
define('THEME_DIR'						        , APPLICATION_DIR);
define('TEMPLATE_DIR'							, dirname(__FILE__).'/templates');
define('MAINTENANCE_MODE' 	                    , false);
define('MAINTENANCE_START_TIME'                 , '');
define('MAINTENANCE_END_TIME'                   , '');
define('MAINTENANCE_IP'                         , '');
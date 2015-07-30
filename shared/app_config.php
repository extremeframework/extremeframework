<?php
// License settings
define('LICENSE_KEY'                            , '');

// Library
define('LIBRARY_DIR'                            , 'D:/wamp/www/apps4clouds.com/apps/extremeframework-git/library');

// Schema directory
define('SCHEMA_DIR'						        , realpath(dirname(__FILE__).'/../schema'));

// Configuration directory
define('CONFIG_DIR'						        , APPLICATION_DIR.'/config');

// Cache directory
define('CACHE_DIR'						        , APPLICATION_DIR.'/cache');

// Shared directory
define('SHARED_DIR'						        , realpath(dirname(__FILE__)));

// Upload settings
define('UPLOAD_DIR'                             , 'D:/wamp/www/apps4clouds.com/apps/extremeframework-git/public/uploads');
define('UPLOAD_URL'                             , '//localhost/apps4clouds.com/apps/extremeframework-git/uploads');

// Thumbnail settings
define('THUMBS_NOIMAGE'                         , 'no-image.png');
define('THUMBS_WIDTH'                           , 80);
define('THUMBS_HEIGHT'                          , 80);

// Smarty config
define('TEMPLATE_C_DIR'							, APPLICATION_DIR.'/cache/templates');
define('LEFT_DELIMITER'					        , '<{');
define('RIGHT_DELIMITER'					    , '}>');

// DB config
global $database_dsn;
$database_dsn['database']                       = 'mysql://root:@localhost/extremeframework-git';

// Table prefix
define('TABLE_PREFIX', 	                        '');
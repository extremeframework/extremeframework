<?php
// License settings
define('LICENSE_KEY'                            , '{LICENSE_KEY}');

// Library
define('LIBRARY_DIR'                            , '{LIBRARY_DIR}');

// Configuration directory
define('CONFIG_DIR'						        , realpath(dirname(__FILE__).'/../config'));

// Schema directory
define('SCHEMA_DIR'						        , realpath(dirname(__FILE__).'/../schema'));

// Cache directory
define('CACHE_DIR'						        , APPLICATION_DIR.'/cache');

// Shared directory
define('SHARED_DIR'						        , realpath(dirname(__FILE__)));

// Upload settings
define('UPLOAD_DIR'                             , '{UPLOAD_DIR}');
define('UPLOAD_URL'                             , '{UPLOAD_URL}');

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
$database_dsn['database']                       = 'mysql://{DATABASE_USERNAME}:{DATABASE_PASSWORD}@{DATABASE_HOST}/{DATABASE_NAME}';

// Table prefix
define('TABLE_PREFIX', 	                        '{TABLE_PREFIX}');
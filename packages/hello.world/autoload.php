<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

include(dirname(__FILE__).'/shared/autoload.php');

if (is_dir(dirname(__FILE__).'/'.APPLICATION_TYPE)) {
    include(dirname(__FILE__).'/'.APPLICATION_TYPE.'/autoload.php');
}
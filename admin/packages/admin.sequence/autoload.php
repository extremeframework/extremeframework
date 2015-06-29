<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

///////////////////////////////////////////////////////////
// Register class search path
Framework::registerClassSearchDir(dirname(__FILE__));

///////////////////////////////////////////////////////////
// Packages
Framework::loadPackages(dirname(__FILE__).'/packages');

///////////////////////////////////////////////////////////
// Register template directories
Framework::registerTemplateDir(dirname(__FILE__).'/templates');

///////////////////////////////////////////////////////////
// Routing
include(dirname(__FILE__).'/routing.php');
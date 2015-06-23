<?php
///////////////////////////////////////////////////////////
// Register class search path
Framework::registerClassSearchDir(dirname(__FILE__));

///////////////////////////////////////////////////////////
// Packages
Framework::loadPackages(dirname(__FILE__));

///////////////////////////////////////////////////////////
// Register template directories
Framework::registerTemplateDir(dirname(__FILE__).'/templates');

///////////////////////////////////////////////////////////
// Routing
include(dirname(__FILE__).'/routing.php');
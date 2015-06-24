<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class SorryController extends AppController {
    function __construct() {
        AuthenticationController::authenticate();
    }

	function indexAction() {
        $this->simple_page('<p>The address is invalid, or the page has been moved or permission denied.</p>', 'Page not found');
	}
}
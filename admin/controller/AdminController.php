<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminController extends IndexController {
	function indexAction() {
	    AuthenticationController::authenticate();

	    parent::indexAction();
	}
}
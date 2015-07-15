<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class MessageHelper {
	static function setAppMessage($message) {
		$_SESSION['appmessage'] = $message;
	}

	static function getAppMessage() {
	    $message = '';

	    if (isset($_SESSION['appmessage'])) {
	        $message = $_SESSION['appmessage'];

	        $_SESSION['appmessage'] = '';
	    }

	    return $message;
	}
}
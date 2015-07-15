<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class MessageHelper {
	static function setMessage($message, $context = '') {
		$_SESSION['messages'][$context][] = $messages;
	}

	static function getMessages($context = '') {
        $messages = isset($_SESSION['messages'][$context])? $_SESSION['messages'][$context] : array();

        $_SESSION['messages'][$context] = array();

        return $messages;
	}
}
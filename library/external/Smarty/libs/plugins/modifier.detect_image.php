<?php
/**
 * Copyright (c) 2006-2012 VIETMAI Solutions Corporation
 *
 * www.vietmaisolutions.com
 */
require_once(dirname(__FILE__).'/function.media.php');

function smarty_modifier_detect_image($content) {
	preg_match_all('/(http[^\s]+)/is', $content, $matches, PREG_SET_ORDER);

    foreach ($matches as $match) {
		$src = $match[1];

		$media = smarty_function_media(array('src' => $src), $ignored);

		$content = $content.'<br/>'.$media;
	}

    return $content;
}
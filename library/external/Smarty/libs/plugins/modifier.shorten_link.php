<?php
/**
 * Copyright (c) 2006-2012 VIETMAI Solutions Corporation
 *
 * www.vietmaisolutions.com
 */
require_once(dirname(__FILE__).'/function.media.php');

function smarty_modifier_shorten_link($link, $maxlen = 64) {
	$len = strlen($link);

	if ($len > $maxlen) {
		$shorten = substr($link, 0, $maxlen).'...';
	} else {
		$shorten = $link;
	}

    $content = '<a style="text-decoration:none;color:black;" href="'.$link.'" target="new">'.$shorten.'</a>';

    return $content;
}
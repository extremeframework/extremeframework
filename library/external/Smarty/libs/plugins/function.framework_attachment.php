<?php
function smarty_function_framework_attachment($params, &$smarty)
{
    $html = '';

	$attachment = isset($params['attachment'])? $params['attachment'] : '';
	$baseurl = isset($params['baseurl'])? $params['baseurl'] : '';

    $attachments = preg_split("/[\|]+/", $attachment, -1, PREG_SPLIT_NO_EMPTY);

    $html = '';

	foreach ($attachments as $name) {
		$html .= '<a href="'.$baseurl.'/'.$name.'" target="blank">'.basename($name).'</a><br/>';
    }

	return $html;
}
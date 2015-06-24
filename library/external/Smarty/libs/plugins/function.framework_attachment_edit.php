<?php
function smarty_function_framework_attachment_edit($params, &$smarty)
{
    $html = '';

	$prefix = isset($params['prefix'])? $params['prefix'] : '';
	$module = isset($params['module'])? $params['module'] : '';
	$column = isset($params['column'])? $params['column'] : '';
	$attachment = isset($params['attachment'])? $params['attachment'] : '';
	$baseurl = isset($params['baseurl'])? $params['baseurl'] : '';

    $attachments = preg_split("/[\|]+/", $attachment, -1, PREG_SPLIT_NO_EMPTY);

    $html = '<div style="clear:both"></div>';

	foreach ($attachments as $i => $name) {
	    $html .= '<span id="'.$prefix.$module.'_'.$column.'_'.$i.'"><a href="'.$baseurl.'/'.$name.'" target="blank">'.basename($name).'</a> [<a onclick="remove_attachment(document.'.$module.'form.'.$prefix.$module.'_formdata_'.$column.', \''.$name.'\', \''.$prefix.$module.'_'.$column.'_'.$i.'\')">X</a>]</span>';
    }

	return $html;
}
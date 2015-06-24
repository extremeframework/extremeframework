<?php
function smarty_function_link($params, &$smarty) {
	$module = $params['module'];
	$slug = $params['slug'];
	$id = $params['id'];

    return LinkHelper::friendly_link($module, $slug, $id);
}
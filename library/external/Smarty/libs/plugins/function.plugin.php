<?php
function smarty_function_plugin($params, &$smarty) {
	$key = isset($params['key'])? $params['key'] : '';
	$args = isset($params['args'])? $params['args'] : '';

    $html = '';

    if (!empty($key)) {
        $html = PluginManager::do_action($key, $args);
    }

	return $html;
}
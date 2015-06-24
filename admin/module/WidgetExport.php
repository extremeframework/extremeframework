<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */

/**
 * Usage: <{module class="WidgetExport" COLUMN=? REFTABLE___REFCOLUMN=? template='widget.export.tpl'}>
 */

class WidgetExport {
    function fetch($params, $smarty) {
        $template = isset($params['template'])? $params['template'] : 'widget.export.tpl';
        $module = isset($params['module'])? $params['module'] : '';

        $smarty = clone $smarty;

		$smarty->assign('module', $module);

    	return $smarty->fetch($template);
	}
}
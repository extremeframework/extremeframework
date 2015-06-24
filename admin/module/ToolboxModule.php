<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */

/**
 * Usage: <{module class="ToolboxModule" module=? screen=? details=? template='toolbox.tpl'}>
 */

class ToolboxModule extends AppController {
    function fetch($params, $smarty) {
        if (!Framework::hasModule('Toolbox')) {
            return;
        }

        $module = $params['module'];
        $screen = $params['screen'];
        $details = isset($params['details'])? $params['details'] : null;
        $template = $params['template'];

        $model = new ToolboxItemModel();
        $model->selectAdd();
        $model->selectAdd(TABLE_PREFIX.'TOOLBOX_ITEM.*');
        $model->selectAdd(TABLE_PREFIX.'TOOLBOX.TITLE AS TOOLBOX_TITLE');

        $tb = new ToolboxModel();
        $tb->SCREEN = $screen;
        $tb->MODULE = $module;
        $model->joinAdd($tb);

        $model->orderby('ORDERING asc');
        $model->find();

        $toolboxes = array();
        while ($model->fetch()) {
            $matched = true;

			if (!empty($model->ACL)) {
				if (!AclController::hasPermission($module, $model->ACL)) {
					$matched = false;
				}
			}

            if ($matched && trim($model->CONDSTRING) != '') {
                if (!empty($details)) {
                    eval ("\$matched = ".$this->condString(html_entity_decode($model->CONDSTRING), 'details').";");
                } else {
                    $matched = false;
                }
            }

            if ($matched) {
                $model->LINK = $this->object2placeholder($details, $model->LINK);

                $toolboxes[$model->ID_TOOLBOX]['title'] = !empty($model->TOOLBOX_TITLE)? $model->TOOLBOX_TITLE : L_TOOLBOX;
                $toolboxes[$model->ID_TOOLBOX]['items'][] = clone $model;
            }
        }

        $smarty = Framework::getSmarty();

        $smarty->assign('toolboxes', $toolboxes);
		return $smarty->fetch($template);
	}
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */

/**
 * Usage: <{module class="WidgetListPermissionSetItem" COLUMN=? REFTABLE___REFCOLUMN=? template='widgetlist.permissionsetitem.tpl'}>
 */

class WidgetListPermissionSetItem extends UserMembershipController {
    function fetch($params) {
        $template = isset($params['template'])? $params['template'] : 'widgetlist.permissionsetitem.tpl';

		$id_permission_set = $params['ID_PERMISSION_SET'];

		$modules = array();
		$available_actions = array();

		$model = new AdminModuleModel();
		$model->find();

		while ($model->fetch()) {
			if ($id_permission_set > 0) {
				$modelmod = new PermissionSetItemModel();

				$modelmod->MODULE = $model->MODULE;
				$modelmod->ID_PERMISSION_SET = $id_permission_set;

				$modelmod->find();

				$modelmod->fetch();

				if ($modelmod->ACTIONS) {
					$aray_choice_action = explode(' ', $modelmod->ACTIONS);

					foreach($aray_choice_action as $keylist){
						$available_actions[$model->ID][$keylist] = $keylist;
					}
				}
			}

			$modules[$model->MODULE] = array($model->MODULE, explode(' ',$model->AVAILABLE_ACTIONS), $model->ID, $model->NAME);
		}

        $smarty = Framework::getSmarty(__FILE__);

 		$smarty->assign('modules', $modules);
		$smarty->assign('id_permission_set', $id_permission_set);
		$smarty->assign('available_actions', $available_actions);

		return $smarty->fetch($template);
	}
}
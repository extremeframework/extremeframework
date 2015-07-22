<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */

/**
 * Usage: <{module class="WidgetListAccessRight" COLUMN=? REFTABLE___REFCOLUMN=? template='widgetlist.accessright.tpl'}>
 */

class WidgetListAccessRight extends UserMembershipController {
    function fetch($params) {
        $template = isset($params['template'])? $params['template'] : 'widgetlist.accessright.tpl';

		$id_user_group = $params['ID_USER_GROUP'];

		$modules = array();
		$available_actions = array();

		$model = new AdminModuleModel();
		$model->find();

		while ($model->fetch()) {
			if ($id_user_group > 0) {
				$modelmod = new AccessRightModel();

				$modelmod->MODULE = $model->MODULE;
				$modelmod->ID_USER_GROUP = $id_user_group;

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
		$smarty->assign('id_user_group', $id_user_group);
		$smarty->assign('available_actions', $available_actions);

		return $smarty->fetch($template);
	}
}
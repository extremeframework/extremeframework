<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AccessRightController extends _AccessRightController
{
	function saveAdvancedAction() {
		$id=intval($_REQUEST['IDR']);

		if($id>0){
			$modeldelete = new AccessRightModel();

			$modeldelete->whereAdd('ID_USER_GROUP = "'.$id.'"');

			$modeldelete->delete(true);

			$id_module=$_POST['id_module'];

			foreach($id_module as $value){

				$module_name= isset($_POST['name_module'])? $_POST['name_module'] : '';

				$module_action= isset($_POST['module_action_'.$value])? $_POST['module_action_'.$value] : '';

				 if($module_action){

					$action=implode(" ",$module_action);

					$model = new AccessRightModel();

					$model->ID = null;

					$model->ID_USER_GROUP = $id;

					$model->MODULE = $module_name[$value];

					$model->ACTIONS =$action;

					$model->insert();
				}
			}
		}

		ContextStack::getCurrentScreenContext($module, $action);

		if ($module != 'usergroup' || in_array($action, array('view', 'page'))) {
			ContextStack::back(0);
		} else {
			ContextStack::back(-1);
		}
	}
}
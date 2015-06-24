<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminCommentController extends _AdminCommentController
{
    function ajaxGetCommentsAction() {
        list($module, $object_id) = explode('/', $_REQUEST['args']);

        if (empty($module) || empty($object_id)) {
            return;
        }

        if (!ModuleHelper::isCommentEnabled($module)) {
            return;
        }

        $model = new AdminCommentModel();

        $model->selectAdd('');
        $model->selectAdd('ADMIN_COMMENT.*');
        $model->selectAdd('USER.FIRST_NAME, USER.LAST_NAME, USER.PHOTO');

        $model->MODULE = $module;
        $model->OBJECT_ID = $object_id;

        $model->joinAdd(new UserModel());

        $model->find();

        $items = array();

        while ($model->fetch()) {
            $items[] = clone $model;
        }

		$smarty = Framework::getSmarty();

		$smarty->assign('module', $module);
		$smarty->assign('object_id', $object_id);
		$smarty->assign('items', $items);

		$smarty->display('ajax-list.admincomment.tpl');
    }
}
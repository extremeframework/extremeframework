<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class UserMessageController extends _UserMessageController
{
    function onSaveSuccess($model) {
		parent::onSaveSuccess($model);

        if ($model->ID_USER == $_SESSION['user']->ID) {
            $_SESSION['user_message'] = $model->MESSAGE;
        }
    }
}
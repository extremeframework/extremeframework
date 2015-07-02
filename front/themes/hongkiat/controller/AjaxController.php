<?php
/**
 * Copyright © VIETMAI Solutions Corporation. All rights reserved.
 * www.vietmaisolutions.com
 *
 * This software is the confidential and proprietary information
 * of VIETMAI Solutions Corporation. ("Confidential Information").
 * You should not disclose such Confidential Information and should
 * use it only in accordance with the terms of the license
 * agreement you entered into with VIETMAI Solutions Corporation.
 */
class AjaxController {
    protected static function getSmarty() {
        $packageroot = realpath(dirname(__FILE__).'/../');

        return Framework::getSmarty($packageroot);
    }

    function getMenuHighlightsAction() {
		list($root_category_id) = explode('/', $_REQUEST['args']);

        if (empty($root_category_id)) {
            return;
        }

        $posts = PostHelper::getFeaturedPosts($root_category_id, 3);

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('posts', $posts);

        $smarty->display('menu.highlights.tpl');
    }
}
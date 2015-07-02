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
class TagController {
    protected static function getSmarty() {
        $packageroot = realpath(dirname(__FILE__).'/../');

        return Framework::getSmarty($packageroot);
    }

    function indexAction() {
		list($tag) = explode('/', $_REQUEST['args']);

        if (empty($tag)) {
            return;
        }

        $page = isset($_REQUEST['page'])? $_REQUEST['page'] : 1;

        $root_category_id = get_theme_option('blog-root-category-id');

        $posts = PostHelper::searchPostsByTag($root_category_id, $tag, 10, $page, $page_count);

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('root_category_id', $root_category_id);
        $smarty->assign('tag', $tag);
        $smarty->assign('page', $page);
        $smarty->assign('page_count', $page_count);
        $smarty->assign('posts', $posts);

        $smarty->display('blog-tag.tpl');
    }
}
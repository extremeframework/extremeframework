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
class AuthorController {
    protected static function getSmarty() {
        $packageroot = realpath(dirname(__FILE__).'/../');

        return Framework::getSmarty($packageroot);
    }

    function indexAction() {
		list($author) = explode('/', $_REQUEST['args']);

        if (empty($author)) {
            return;
        }

        $page = isset($_REQUEST['page'])? $_REQUEST['page'] : 1;

        $root_category_id = get_theme_option('blog-root-category-id');

        $posts = PostHelper::searchPostsByAuthor($root_category_id, $author, 1, $page, $page_count);

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('root_category_id', $root_category_id);
        $smarty->assign('author', $author);
        $smarty->assign('page', $page);
        $smarty->assign('page_count', $page_count);
        $smarty->assign('posts', $posts);

        $smarty->display('blog-author.tpl');
    }
}
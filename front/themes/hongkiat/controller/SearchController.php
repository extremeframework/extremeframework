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
class SearchController {
    protected static function getSmarty() {
        $packageroot = realpath(dirname(__FILE__).'/../');

        return Framework::getSmarty($packageroot);
    }

    function indexAction() {
		list($keyword) = explode('/', $_REQUEST['args']);

        if (empty($keyword)) {
            $keyword = isset($_REQUEST['q'])? $_REQUEST['q'] : '';
        }

        if (empty($keyword)) {
            return;
        }

        $page = isset($_REQUEST['page'])? $_REQUEST['page'] : 1;

        $root_category_id = get_theme_option('blog-root-category-id');

        $posts = PostHelper::searchPosts($root_category_id, $keyword, 10, $page, $page_count);

        $smarty = self::getSmarty();

        $smarty->assign('root_category_id', $root_category_id);
        $smarty->assign('keyword', $keyword);
        $smarty->assign('page', $page);
        $smarty->assign('page_count', $page_count);
        $smarty->assign('posts', $posts);

        $smarty->display('blog-search.tpl');
    }
}
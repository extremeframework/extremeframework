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
class JsonController extends PageController
{
    function newsFeedAction() {
        $category = get_request_param('category');
        $page = get_request_param('page', 1);
        $limit = get_request_param('limit', 10);

        if (!$category) {
            return;
        }

        $posts = PostHelper::getLatestPosts($category, $limit, $page, $page_count);

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('posts', $posts);

        $content = $smarty->fetch('part.news_list.tpl');

        // Response
        $data = array('success' => true, 'htmlContent' => $content, 'pageCount' => $page_count);

        header('Content-Type: application/json');
        echo json_encode($data);
    }
}
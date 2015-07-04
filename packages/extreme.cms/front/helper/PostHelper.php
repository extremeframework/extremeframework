<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PostHelper {
    static function getPostWidgets($single, $position) {
        $items = json_extract($single->JSON, 'POST_WIDGET');

        $items = array_filter($items, function($v) use ($position) {
            return ($v->ID_WIDGET_POSITION == $position);
        });

        uasort($items, function ($a, $b) {
            return $a->ORDERING < $b->ORDERING;
        });

        return $items;
    }

    static function getPostTree($root_category, $post_type = '', $keyword = '', $where = '', $limit = 0) {
        $posts = PostHelper::getPosts($root_category, $post_type, $keyword, $where, '', $limit);

        $tree = array();

        foreach ($posts as $post) {
            $tree[$post->ID_POST_CATEGORY][] = $post;
        }

        return $tree;
    }

    static function getPosts($root_category, $post_type = '', $keyword = '', $where = '', $order_by = '', $limit = 0, $page = 0, $return_page_count = false, &$page_count = 0) {
        $model = new PostModel();

        $model->selectAdd();
        $model->selectAdd('`'.TABLE_PREFIX.'POST`.TITLE, `'.TABLE_PREFIX.'POST`.SLUG, `'.TABLE_PREFIX.'POST`.ID_POST_TYPE, `'.TABLE_PREFIX.'POST`.ID_POST_CATEGORY, `'.TABLE_PREFIX.'POST`.IMAGE, `'.TABLE_PREFIX.'POST`.META_KEYWORDS, `'.TABLE_PREFIX.'POST`.META_DESCRIPTION, `'.TABLE_PREFIX.'POST`.EXCERPT, `'.TABLE_PREFIX.'POST`.CONTENT, `'.TABLE_PREFIX.'POST`.TAGS, `'.TABLE_PREFIX.'POST`.AUTHOR, `'.TABLE_PREFIX.'POST`.EXTERNAL_LINK, `'.TABLE_PREFIX.'POST`.ID_TEMPLATE, `'.TABLE_PREFIX.'POST`.CREATION_DATE, `'.TABLE_PREFIX.'POST`.LATEST_UPDATE, `'.TABLE_PREFIX.'POST`.IS_FEATURED, `'.TABLE_PREFIX.'POST`.NBR_VIEWS, `'.TABLE_PREFIX.'POST`.ID, `'.TABLE_PREFIX.'POST`.JSON, `'.TABLE_PREFIX.'POST`.UUID, `'.TABLE_PREFIX.'POST`.WFID');
        $model->selectAdd('POST_CATEGORY.NAME as reftext_ID_POST_CATEGORY');
        $model->selectAdd('POST_CATEGORY.SLUG as refslug_ID_POST_CATEGORY');

        $pc = new PostCategoryModel();

        if ($root_category) {
            $pc->whereAdd("POST_CATEGORY.ID = '$root_category' OR POST_CATEGORY.HIERACHY LIKE '%-".$root_category."-%'");
        }

        $model->joinAdd($pc);

        if (!empty($post_type)) {
            $model->whereAdd("ID_POST_TYPE = '$post_type'");
        }

        if (!empty($keyword)) {
            $model->whereAdd("POST.TITLE LIKE '%{$keyword}%' OR POST.EXCERPT LIKE '%{$keyword}%' OR POST.TAGS LIKE '%{$keyword}%'  OR POST.CONTENT LIKE '%{$keyword}%'");
        }

        if (!empty($where)) {
            $model->whereAdd($where);
        }

        if (!empty($order_by)) {
            $model->orderBy($order_by);
        }

        $page_count = 0;

        if ($limit > 0) {
            if ($return_page_count) {
                $model->find();

                $page_count = ceil($model->N / $limit);
            }

            if ($page >= 1) {
                $model->limit(($page - 1)*$limit, $limit);
            } else {
                $model->limit(0, $limit);
            }
        }

        $model->find();

        $items = array();

        while($model->fetch()) {
            $items[] = clone $model;
        }

        return $items;
    }

    static function getSubCategories($root_category_id) {
        $model = new PostCategoryModel();

        $model->selectAdd();
        $model->selectAdd('ID, NAME, SLUG');

        $model->PARENT = $root_category_id;
        $model->find();

        $items = array();

        while($model->fetch()) {
            $items[] = clone $model;
        }

        return $items;
    }

    static function getCategoryTree($root_category_id) {
        $model = new PostCategoryModel();

        (new PostCategoryController())->initListModel($model, false);

        $model->whereAdd("HIERACHY LIKE '%-".$root_category_id."-%'");

        $model->find();

        $items = array();

        while($model->fetch()) {
            $items[$model->PARENT][] = clone $model;
        }

        return $items;
    }

    static function convertTreeToFlatItems($tree) {
        $results = array();

        foreach ($tree as $items) {
            foreach ($items as $item) {
                $results[] = $item;
            }
        }

        return $results;
    }

    static function getFeaturedPosts($root_category, $limit) {
        return PostHelper::getPosts($root_category, 'article', '', "POST.IS_FEATURED = 1", '', $limit);
    }

    static function getLatestPosts($root_category, $limit = 10, $page = 0, &$page_count = 0) {
        return PostHelper::getPosts($root_category, 'article', '', '', '', $limit, $page, true, $page_count);
    }

    static function getPopularPosts($root_category, $limit = 10) {
        return PostHelper::getPosts($root_category, 'article', '', '', 'POST.NBR_VIEWS DESC', $limit);
    }

    static function getPostsBySlugs($slugs) {
        return PostHelper::getPosts('', 'article', '', "POST.SLUG IN ('".implode("', '", $slugs)."')");
    }

    static function searchPosts($root_category, $keyword, $limit = 10, $page = 0, &$page_count = 0) {
        return PostHelper::getPosts($root_category, 'article', $keyword, '', '', $limit, $page, true, $page_count);
    }

    static function searchPostsByTag($root_category, $tag, $limit = 10, $page = 0, &$page_count = 0) {
        return PostHelper::getPosts($root_category, 'article', '', "POST.TAGS LIKE '%$tag%'", '', $limit, $page, true, $page_count);
    }

    static function searchPostsByAuthor($root_category, $author, $limit = 10, $page = 0, &$page_count = 0) {
        return PostHelper::getPosts($root_category, 'article', '', "POST.AUTHOR = '$author'", '', $limit, $page, true, $page_count);
    }

    static function getPostSections($post_id) {
        $model = new PostSectionModel();

        $model->whereAdd("ID_POST = '$post_id'");

        $model->find();

        $items = array();

        while($model->fetch()) {
            $items[] = clone $model;
        }

        return $items;
    }

    static function getPostLink($post) {
        return LinkHelper::friendly_link('post', $post->SLUG, $post->ID);
    }

    static function getCategoryLink($postcategory) {
        return LinkHelper::friendly_link('postcategory', $postcategory->SLUG, $postcategory->ID);
    }

    static function excludePosts($source, $subset) {
        $ids = array();

        foreach ($subset as $post) {
            $ids[] = $post->ID;
        }

        $new = array();

        foreach ($source as $post) {
            if (!in_array($post->ID, $ids)) {
                $new[] = $post;
            }
        }

        return $new;
    }

    static function getRelatedPosts($post) {
        $tags = PostHelper::getPostTags($post);

        $by_tags_query = '';

        if (!empty($tags)) {
            $parts = array();

            foreach ($tags as $tag) {
                $parts[] = "POST.TAGS LIKE '%$tag%'";
            }

            $by_tags_query = implode(' OR ',  $parts);
        }

        return PostHelper::getPosts(null, 'article', '', "POST.ID != '{$post->ID}' AND (POST.ID IN (SELECT PEER_ID_POST FROM POST_RELATION WHERE ID_POST = '{$post->ID}') OR POST.ID IN (SELECT ID_POST FROM POST_RELATION WHERE PEER_ID_POST = '{$post->ID}')".(!empty($by_tags_query)? ' OR '.$by_tags_query : '').")");
    }

    static function getPostTags($post) {
        return !empty($post->TAGS)? preg_split('/\s*,\s*/', $post->TAGS) : array();
    }
}
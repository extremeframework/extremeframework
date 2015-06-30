<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class _PostController extends __FrontController {
    
    function onViewSuccess(&$model) {
        $model->NBR_VIEWS += 1;
        $model->update();
    }

    protected static function getSmarty() {
        $packageroot = realpath(dirname(__FILE__).'/../');

        return Framework::getSmarty($packageroot);
    }

    function indexAction() {
		$parts = explode('/', $_REQUEST['args']);

		$page = isset($parts[0])? $parts[0] : '';
		$slug = isset($parts[1])? $parts[1] : '';

        $template = !empty($page)? 'post.'.$page.'.tpl' : 'post.home.tpl';

        $smarty = self::getSmarty();

        $smarty->assign('slug', $slug);

        $this->display($smarty, $template);
    }

    function homeAction() {
        $smarty = self::getSmarty();

        $this->display($smarty, 'post.home.tpl');
    }

    function viewAction() {
		list($slug) = explode('/', $_REQUEST['args']);

        if (preg_match('/^[0-9]+$/', $slug)) {
            $item = $this->getItemById($slug, true);
        } else {
            $item = $this->getItemBySlug($slug, true);
        }

        if (empty($item)) {
            $this->pagenotfound();
        }

        $this->onBeforeView($item);

        $smarty = self::getSmarty();

        $smarty->assign('slug', $slug);
        $smarty->assign('post', $item);
        $smarty->assign('single', $item);
        $smarty->assign('meta_title', $item->TITLE);
        $smarty->assign('meta_description', $item->META_DESCRIPTION);
        $smarty->assign('meta_keywords', $item->META_KEYWORDS);
        $smarty->assign('meta_image', !empty($item->IMAGE)? UPLOAD_URL.'/'.$item->IMAGE : '');
        $smarty->assign('meta_url', LinkHelper::friendly_link('post', $item->SLUG, $item->ID));

        $template = $this->getViewTemplate($item);

        if (!$smarty->template_exists($template)) {
            die("<div style=\"color:orange\">[ERROR] Template '$template' not found.</div>");
        }

        $this->display($smarty, $template);

        $this->onViewSuccess($item);
    }

    function getViewTemplate($model) {
        if ($model->ID_TEMPLATE) {
            return 'template.'.$model->ID_TEMPLATE.'.tpl';
        }

        return 'post.single.tpl';
    }

    function applyFilters(&$model, $params, $excludemode = false) {
        foreach ($params as $key => $value) {
            if (is_array($value)) {
                $model->whereAdd("POST.$key ".($excludemode? 'NOT IN' : 'IN')." ('".implode("', '", $value)."')");
            } else if (preg_match('/^%.*%$/i', $value)) {
                $model->whereAdd("POST.$key ".($excludemode? 'NOT LIKE' : 'LIKE')." '$value'");
            } else if (preg_match('/^custom*/i', $key)) {
                $model->whereAdd(($excludemode? 'NOT ' : '')."($value)");
            } else if ($key == 'ID_POST_CATEGORY') {
                $model->whereAdd("POST.ID_POST_CATEGORY = '$value'");
            } else {
                $model->whereAdd("POST.$key ".($excludemode? '!=' : '=')." '$value'");
            }
        }
    }

    function getItem($params, $join = false) {
        $model = new PostModel();

        $instance = new PostController();

        $instance->initViewModel($model, $join);
        $instance->applyFilters($model, $params);

        $model->find();

        $item = null;

        if ($model->fetch()) {
            $item = $model;
        }

        return $item;
    }

    function getItemById($id, $join = false) {
        return self::getItem(array('ID' => $id), $join);
    }

    function getItemBySlug($slug, $join = false) {
        return self::getItem(array('SLUG' => $slug), $join);
    }

    function getItems($params = array(), $join = false, $excludes = array(), $orderby = 'ID', $limit = 0, $page = 1, $return_pagination = false, &$pagination = null) {
        $model = new PostModel();

        $instance = new PostController();

        $instance->initListModel($model, $join);

        $instance->applyFilters($model, $params);
        $instance->applyFilters($model, $excludes, true);

        

        if (!empty($orderby)) {
            $model->orderBy($orderby);
        }

        if ($return_pagination) {
    		$model->find();

            if ($return_pagination) {
        		$total = $model->N;
            }

            

		    $model->limit(($page-1)*$limit, $limit);
            $model->find();

            if ($return_pagination) {
                $curtotal = $model->N;

                $limit_from = ($page-1)*$limit + 1;
                $limit_to = $limit_from + $curtotal - 1;

                $pagination = new Pagination($total, ($page-1)*$limit, $limit);
                $pagination = $pagination->getPageLinks();
            } else {
                $pagination = array();
            }
        } else {
		    $model->limit(($page-1)*$limit, $limit);
            $model->find();

            $pagination = array();
        }

        $items = array();

        while ($model->fetch()) {
            $items[] = clone $model;
        }

        

        return $items;
    }

    function initViewModel(&$model, $join = false) {
        $model->selectAdd();
            $model->selectAdd('`'.TABLE_PREFIX.'POST`.TITLE, `'.TABLE_PREFIX.'POST`.SLUG, `'.TABLE_PREFIX.'POST`.ID_POST_TYPE, `'.TABLE_PREFIX.'POST`.ID_POST_CATEGORY, `'.TABLE_PREFIX.'POST`.IMAGE, `'.TABLE_PREFIX.'POST`.META_KEYWORDS, `'.TABLE_PREFIX.'POST`.META_DESCRIPTION, `'.TABLE_PREFIX.'POST`.EXCERPT, `'.TABLE_PREFIX.'POST`.CONTENT, `'.TABLE_PREFIX.'POST`.TAGS, `'.TABLE_PREFIX.'POST`.AUTHOR, `'.TABLE_PREFIX.'POST`.EXTERNAL_LINK, `'.TABLE_PREFIX.'POST`.ID_TEMPLATE, `'.TABLE_PREFIX.'POST`.CREATION_DATE, `'.TABLE_PREFIX.'POST`.LATEST_UPDATE, `'.TABLE_PREFIX.'POST`.IS_FEATURED, `'.TABLE_PREFIX.'POST`.NBR_VIEWS, `'.TABLE_PREFIX.'POST`.ID, `'.TABLE_PREFIX.'POST`.JSON, `'.TABLE_PREFIX.'POST`.UUID, `'.TABLE_PREFIX.'POST`.WFID');
        
            if ($join) {
                $model->selectAdd('reftable_ID_POST_TYPE.NAME as reftext_ID_POST_TYPE');
                $model->selectAdd('reftable_ID_POST_TYPE.UUID as refuuid_ID_POST_TYPE');
                $model->selectAdd('reftable_ID_POST_TYPE.ID as refslug_ID_POST_TYPE');
                $model->selectAdd('reftable_ID_POST_CATEGORY.NAME as reftext_ID_POST_CATEGORY');
                $model->selectAdd('reftable_ID_POST_CATEGORY.UUID as refuuid_ID_POST_CATEGORY');
                $model->selectAdd('reftable_ID_POST_CATEGORY.SLUG as refslug_ID_POST_CATEGORY');
                $model->selectAdd('reftable_ID_TEMPLATE.NAME as reftext_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.UUID as refuuid_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.ID as refslug_ID_TEMPLATE');
            }

        if ($join) {
            
        
            if ($join) {
        $model->joinAdd(array('ID_POST_TYPE',TABLE_PREFIX.'POST_TYPE:CODE'), 'LEFT', 'reftable_ID_POST_TYPE');
        $model->joinAdd(array('ID_POST_CATEGORY',TABLE_PREFIX.'POST_CATEGORY:ID'), 'LEFT', 'reftable_ID_POST_CATEGORY');
        $model->joinAdd(array('ID_TEMPLATE',TABLE_PREFIX.'TEMPLATE:CODE'), 'LEFT', 'reftable_ID_TEMPLATE');
            }
        }
    }

    function initListModel(&$model, $join = false) {
        $model->selectAdd();
            $model->selectAdd('`'.TABLE_PREFIX.'POST`.TITLE, `'.TABLE_PREFIX.'POST`.SLUG, `'.TABLE_PREFIX.'POST`.ID_POST_TYPE, `'.TABLE_PREFIX.'POST`.ID_POST_CATEGORY, `'.TABLE_PREFIX.'POST`.IMAGE, `'.TABLE_PREFIX.'POST`.META_KEYWORDS, `'.TABLE_PREFIX.'POST`.META_DESCRIPTION, `'.TABLE_PREFIX.'POST`.EXCERPT, `'.TABLE_PREFIX.'POST`.CONTENT, `'.TABLE_PREFIX.'POST`.TAGS, `'.TABLE_PREFIX.'POST`.AUTHOR, `'.TABLE_PREFIX.'POST`.EXTERNAL_LINK, `'.TABLE_PREFIX.'POST`.ID_TEMPLATE, `'.TABLE_PREFIX.'POST`.CREATION_DATE, `'.TABLE_PREFIX.'POST`.LATEST_UPDATE, `'.TABLE_PREFIX.'POST`.IS_FEATURED, `'.TABLE_PREFIX.'POST`.NBR_VIEWS, `'.TABLE_PREFIX.'POST`.ID, `'.TABLE_PREFIX.'POST`.JSON, `'.TABLE_PREFIX.'POST`.UUID, `'.TABLE_PREFIX.'POST`.WFID');
        
            if ($join) {
                $model->selectAdd('reftable_ID_POST_TYPE.NAME as reftext_ID_POST_TYPE');
                $model->selectAdd('reftable_ID_POST_TYPE.UUID as refuuid_ID_POST_TYPE');
                $model->selectAdd('reftable_ID_POST_TYPE.ID as refslug_ID_POST_TYPE');
                $model->selectAdd('reftable_ID_POST_CATEGORY.NAME as reftext_ID_POST_CATEGORY');
                $model->selectAdd('reftable_ID_POST_CATEGORY.UUID as refuuid_ID_POST_CATEGORY');
                $model->selectAdd('reftable_ID_POST_CATEGORY.SLUG as refslug_ID_POST_CATEGORY');
                $model->selectAdd('reftable_ID_TEMPLATE.NAME as reftext_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.UUID as refuuid_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.ID as refslug_ID_TEMPLATE');
            }

        if ($join) {
            
        
            if ($join) {
        $model->joinAdd(array('ID_POST_TYPE',TABLE_PREFIX.'POST_TYPE:CODE'), 'LEFT', 'reftable_ID_POST_TYPE');
        $model->joinAdd(array('ID_POST_CATEGORY',TABLE_PREFIX.'POST_CATEGORY:ID'), 'LEFT', 'reftable_ID_POST_CATEGORY');
        $model->joinAdd(array('ID_TEMPLATE',TABLE_PREFIX.'TEMPLATE:CODE'), 'LEFT', 'reftable_ID_TEMPLATE');
            }
        }
    }

    function getSearchedItems($keyword) {
        return self::getItems(array('custom' => "POST.TITLE LIKE '%$keyword%' OR POST.ID_POST_TYPE LIKE '%$keyword%' OR POST.ID_POST_CATEGORY LIKE '%$keyword%' OR POST.META_DESCRIPTION LIKE '%$keyword%' OR POST.CONTENT LIKE '%$keyword%' OR POST.TAGS LIKE '%$keyword%' OR POST.ID_TEMPLATE LIKE '%$keyword%'"));
    }

    function getItemsByCategory($id, $join = false) {
        return self::getItems(array('ID_POST_CATEGORY' => $id), $join);
    }

    function getRelatedItems($model, $join = false, $limit = 10) {
        $params = array(
            'ID_POST_TYPE' => $model->ID_POST_TYPE,
            'ID_POST_CATEGORY' => $model->ID_POST_CATEGORY
        );

        return self::getItems($params, $join, array('ID' => $model->ID), '', $limit);
    }

    function getFeaturedItems($limit = 10) {
        return self::getItems(array('IS_FEATURED' => true), array(), 'CREATION_DATE DESC', $limit);
    }

    function getLatestItems($limit = 10) {
        return self::getItems(array(), array(), 'CREATION_DATE DESC', $limit);
    }

    function getMostViewedItems($limit = 10) {
        return self::getItems(array(), array(), 'NBR_VIEWS DESC', $limit);
    }

    function getBreadCrumbs($model = null) {
        $breadcrumbs = array();

        // Home
        $breadcrumbs[] = array('title' => 'Home', 'link' => APPLICATION_URL);

        // Module
        //$breadcrumbs[] = array('title' => 'Posts', 'link' => !empty($model)? APPLICATION_URL.'/post/home' : '');

        // Item chain
        if (!empty($model)) {
            
            // Category
            $category = PostCategoryController::getItemById($model->ID_POST_CATEGORY);

            if (!empty($category)) {
                $categories = array();

                // Upper
                $hierachy = trim($category->HIERACHY, '-');
                if (!empty($hierachy)) {
                    $parents = PostCategoryController::getItems(array('ID' => explode('-', $hierachy)));

                    $categories = array_merge($categories, $parents);
                }

                // Direct
                $categories[] = $category;

                foreach ($categories as $item) {
                    $breadcrumbs[] = array('title' => $item->NAME, 'link' => LinkHelper::friendly_link('post-category', $item->SLUG, $item->ID));
                }
            }

            // Self
            $breadcrumbs[] = array('title' => $model->TITLE, 'link' => '');
        }

        return $breadcrumbs;
    }
}
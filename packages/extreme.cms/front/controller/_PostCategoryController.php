<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class _PostCategoryController extends __FrontController {
    

    protected static function getSmarty() {
        $packageroot = realpath(dirname(__FILE__).'/../');

        return Framework::getSmarty($packageroot);
    }

    function indexAction() {
		$parts = explode('/', $_REQUEST['args']);

		$page = isset($parts[0])? $parts[0] : '';
		$slug = isset($parts[1])? $parts[1] : '';

        $template = !empty($page)? 'postcategory.'.$page.'.tpl' : 'postcategory.home.tpl';

        $smarty = self::getSmarty();

        $smarty->assign('slug', $slug);

        $this->display($smarty, $template);
    }

    function homeAction() {
        $smarty = self::getSmarty();

        $this->display($smarty, 'postcategory.home.tpl');
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
        $smarty->assign('postcategory', $item);
        $smarty->assign('single', $item);
        $smarty->assign('meta_title', $item->NAME);
        $smarty->assign('meta_description', $item->DESCRIPTION);
        $smarty->assign('meta_keywords', $item->NAME);
        $smarty->assign('meta_image', '');
        $smarty->assign('meta_url', LinkHelper::friendly_link('postcategory', $item->SLUG, $item->ID));

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

        return 'postcategory.single.tpl';
    }

    function applyFilters(&$model, $params, $excludemode = false) {
        foreach ($params as $key => $value) {
            if (is_array($value)) {
                $model->whereAdd("POST_CATEGORY.$key ".($excludemode? 'NOT IN' : 'IN')." ('".implode("', '", $value)."')");
            } else if (preg_match('/^%.*%$/i', $value)) {
                $model->whereAdd("POST_CATEGORY.$key ".($excludemode? 'NOT LIKE' : 'LIKE')." '$value'");
            } else if (preg_match('/^custom*/i', $key)) {
                $model->whereAdd(($excludemode? 'NOT ' : '')."($value)");
            } else if ($key == 'PARENT') {
                $model->whereAdd("POST_CATEGORY.PARENT = '$value'");
            } else {
                $model->whereAdd("POST_CATEGORY.$key ".($excludemode? '!=' : '=')." '$value'");
            }
        }
    }

    function getItem($params, $join = false) {
        $model = new PostCategoryModel();

        $instance = new PostCategoryController();

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

    function getItems($params = array(), $join = false, $excludes = array(), $orderby = 'ORDERING', $limit = 0, $page = 1, $return_pagination = false, &$pagination = null) {
        $model = new PostCategoryModel();

        $instance = new PostCategoryController();

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

        $helper = new ViewHelper();
        $items = $helper->aspect_hierachical($items, 'ID', 'NAME', 'PARENT', '10');

        return $items;
    }

    function initViewModel(&$model, $join = false) {
        $model->selectAdd();
            $model->selectAdd('`'.TABLE_PREFIX.'POST_CATEGORY`.NAME, `'.TABLE_PREFIX.'POST_CATEGORY`.SLUG, `'.TABLE_PREFIX.'POST_CATEGORY`.PARENT, `'.TABLE_PREFIX.'POST_CATEGORY`.DESCRIPTION, `'.TABLE_PREFIX.'POST_CATEGORY`.ID_TEMPLATE, `'.TABLE_PREFIX.'POST_CATEGORY`.ID, `'.TABLE_PREFIX.'POST_CATEGORY`.JSON, `'.TABLE_PREFIX.'POST_CATEGORY`.UUID, `'.TABLE_PREFIX.'POST_CATEGORY`.WFID, `'.TABLE_PREFIX.'POST_CATEGORY`.HIERACHY');
        
            if ($join) {
                $model->selectAdd('reftable_PARENT.NAME as reftext_PARENT');
                $model->selectAdd('reftable_PARENT.UUID as refuuid_PARENT');
                $model->selectAdd('reftable_PARENT.SLUG as refslug_PARENT');
                $model->selectAdd('reftable_ID_TEMPLATE.NAME as reftext_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.UUID as refuuid_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.ID as refslug_ID_TEMPLATE');
            }

        if ($join) {
            
        
            if ($join) {
        $model->joinAdd(array('PARENT',TABLE_PREFIX.'POST_CATEGORY:ID'), 'LEFT', 'reftable_PARENT');
        $model->joinAdd(array('ID_TEMPLATE',TABLE_PREFIX.'TEMPLATE:CODE'), 'LEFT', 'reftable_ID_TEMPLATE');
            }
        }
    }

    function initListModel(&$model, $join = false) {
        $model->selectAdd();
            $model->selectAdd('`'.TABLE_PREFIX.'POST_CATEGORY`.NAME, `'.TABLE_PREFIX.'POST_CATEGORY`.SLUG, `'.TABLE_PREFIX.'POST_CATEGORY`.PARENT, `'.TABLE_PREFIX.'POST_CATEGORY`.DESCRIPTION, `'.TABLE_PREFIX.'POST_CATEGORY`.ID_TEMPLATE, `'.TABLE_PREFIX.'POST_CATEGORY`.ID, `'.TABLE_PREFIX.'POST_CATEGORY`.JSON, `'.TABLE_PREFIX.'POST_CATEGORY`.UUID, `'.TABLE_PREFIX.'POST_CATEGORY`.WFID, `'.TABLE_PREFIX.'POST_CATEGORY`.HIERACHY');
        
            if ($join) {
                $model->selectAdd('reftable_PARENT.NAME as reftext_PARENT');
                $model->selectAdd('reftable_PARENT.UUID as refuuid_PARENT');
                $model->selectAdd('reftable_PARENT.SLUG as refslug_PARENT');
                $model->selectAdd('reftable_ID_TEMPLATE.NAME as reftext_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.UUID as refuuid_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.ID as refslug_ID_TEMPLATE');
            }

        if ($join) {
            
        
            if ($join) {
        $model->joinAdd(array('ID_TEMPLATE',TABLE_PREFIX.'TEMPLATE:CODE'), 'LEFT', 'reftable_ID_TEMPLATE');
            }
        }
    }

    function getSearchedItems($keyword) {
        return self::getItems(array('custom' => "POST_CATEGORY.NAME LIKE '%$keyword%' OR POST_CATEGORY.PARENT LIKE '%$keyword%' OR POST_CATEGORY.DESCRIPTION LIKE '%$keyword%' OR POST_CATEGORY.ID_TEMPLATE LIKE '%$keyword%'"));
    }

    function getItemsByCategory($id, $join = false) {
        return self::getItems(array('PARENT' => $id), $join);
    }

    function getRelatedItems($model, $join = false, $limit = 10) {
        $params = array(
            'PARENT' => $model->PARENT
        );

        return self::getItems($params, $join, array('ID' => $model->ID), '', $limit);
    }

    function getBreadCrumbs($model = null) {
        $breadcrumbs = array();

        // Home
        $breadcrumbs[] = array('title' => 'Home', 'link' => APPLICATION_URL);

        // Module
        //$breadcrumbs[] = array('title' => 'Post Categories', 'link' => !empty($model)? APPLICATION_URL.'/post-category/home' : '');

        // Item chain
        if (!empty($model)) {
            
            // Category
            $category = PostCategoryController::getItemById($model->PARENT);

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
            $breadcrumbs[] = array('title' => $model->NAME, 'link' => '');
        }

        return $breadcrumbs;
    }
}
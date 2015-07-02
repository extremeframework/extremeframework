<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class _PageController extends __FrontController {
    
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

        $template = !empty($page)? 'page.'.$page.'.tpl' : 'page.home.tpl';

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('slug', $slug);

        $this->display($smarty, $template);
    }

    function homeAction() {
        $smarty = Framework::getSmarty(__FILE__);

        $this->display($smarty, 'page.home.tpl');
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

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('slug', $slug);
        $smarty->assign('page', $item);
        $smarty->assign('single', $item);
        $smarty->assign('meta_title', $item->TITLE);
        $smarty->assign('meta_description', $item->META_DESCRIPTION);
        $smarty->assign('meta_keywords', $item->META_KEYWORDS);
        $smarty->assign('meta_image', !empty($item->THUMB)? UPLOAD_URL.'/'.$item->THUMB : '');
        $smarty->assign('meta_url', LinkHelper::friendly_link('page', $item->SLUG, $item->ID));

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

        return 'page.single.tpl';
    }

    function applyFilters(&$model, $params, $excludemode = false) {
        foreach ($params as $key => $value) {
            if (is_array($value)) {
                $model->whereAdd("PAGE.$key ".($excludemode? 'NOT IN' : 'IN')." ('".implode("', '", $value)."')");
            } else if (preg_match('/^%.*%$/i', $value)) {
                $model->whereAdd("PAGE.$key ".($excludemode? 'NOT LIKE' : 'LIKE')." '$value'");
            } else if (preg_match('/^custom*/i', $key)) {
                $model->whereAdd(($excludemode? 'NOT ' : '')."($value)");
            } else if ($key == 'PARENT') {
                $model->whereAdd("PAGE.PARENT = '$value'");
            } else if ($key == 'VIEW_MORE_ID_PAGE') {
                $model->whereAdd("PAGE.VIEW_MORE_ID_PAGE = '$value'");
            } else {
                $model->whereAdd("PAGE.$key ".($excludemode? '!=' : '=')." '$value'");
            }
        }
    }

    function getItem($params, $join = false) {
        $model = new PageModel();

        $instance = new PageController();

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
        $model = new PageModel();

        $instance = new PageController();

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
            $model->selectAdd('`'.TABLE_PREFIX.'PAGE`.NAME, `'.TABLE_PREFIX.'PAGE`.TITLE, `'.TABLE_PREFIX.'PAGE`.PARENT, `'.TABLE_PREFIX.'PAGE`.SLUG, `'.TABLE_PREFIX.'PAGE`.TAG_LINE, `'.TABLE_PREFIX.'PAGE`.THUMB, `'.TABLE_PREFIX.'PAGE`.BACKGROUND_IMAGE, `'.TABLE_PREFIX.'PAGE`.IMAGE, `'.TABLE_PREFIX.'PAGE`.VIDEO, `'.TABLE_PREFIX.'PAGE`.META_KEYWORDS, `'.TABLE_PREFIX.'PAGE`.META_DESCRIPTION, `'.TABLE_PREFIX.'PAGE`.INTRODUCTION, `'.TABLE_PREFIX.'PAGE`.CONTENT, `'.TABLE_PREFIX.'PAGE`.FOOTER, `'.TABLE_PREFIX.'PAGE`.ID_TEMPLATE, `'.TABLE_PREFIX.'PAGE`.ADDITIONAL_CSS, `'.TABLE_PREFIX.'PAGE`.CUSTOM_TOP_ID_MENU, `'.TABLE_PREFIX.'PAGE`.CUSTOM_SIDE_ID_MENU, `'.TABLE_PREFIX.'PAGE`.VIEW_MORE_TITLE, `'.TABLE_PREFIX.'PAGE`.VIEW_MORE_ID_PAGE, `'.TABLE_PREFIX.'PAGE`.VIEW_MORE_LINK, `'.TABLE_PREFIX.'PAGE`.LATEST_UPDATE, `'.TABLE_PREFIX.'PAGE`.NBR_VIEWS, `'.TABLE_PREFIX.'PAGE`.ID, `'.TABLE_PREFIX.'PAGE`.JSON, `'.TABLE_PREFIX.'PAGE`.UUID, `'.TABLE_PREFIX.'PAGE`.WFID, `'.TABLE_PREFIX.'PAGE`.HIERACHY');
        
            if ($join) {
                $model->selectAdd('reftable_PARENT.NAME as reftext_PARENT');
                $model->selectAdd('reftable_PARENT.UUID as refuuid_PARENT');
                $model->selectAdd('reftable_PARENT.SLUG as refslug_PARENT');
                $model->selectAdd('reftable_ID_TEMPLATE.NAME as reftext_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.UUID as refuuid_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.ID as refslug_ID_TEMPLATE');
                $model->selectAdd('reftable_CUSTOM_TOP_ID_MENU.NAME as reftext_CUSTOM_TOP_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_TOP_ID_MENU.UUID as refuuid_CUSTOM_TOP_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_TOP_ID_MENU.ID as refslug_CUSTOM_TOP_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_SIDE_ID_MENU.NAME as reftext_CUSTOM_SIDE_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_SIDE_ID_MENU.UUID as refuuid_CUSTOM_SIDE_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_SIDE_ID_MENU.ID as refslug_CUSTOM_SIDE_ID_MENU');
                $model->selectAdd('reftable_VIEW_MORE_ID_PAGE.NAME as reftext_VIEW_MORE_ID_PAGE');
                $model->selectAdd('reftable_VIEW_MORE_ID_PAGE.UUID as refuuid_VIEW_MORE_ID_PAGE');
                $model->selectAdd('reftable_VIEW_MORE_ID_PAGE.SLUG as refslug_VIEW_MORE_ID_PAGE');
            }

        if ($join) {
            
        
            if ($join) {
        $model->joinAdd(array('PARENT',TABLE_PREFIX.'PAGE:ID'), 'LEFT', 'reftable_PARENT');
        $model->joinAdd(array('ID_TEMPLATE',TABLE_PREFIX.'TEMPLATE:CODE'), 'LEFT', 'reftable_ID_TEMPLATE');
        $model->joinAdd(array('CUSTOM_TOP_ID_MENU',TABLE_PREFIX.'MENU:CODE'), 'LEFT', 'reftable_CUSTOM_TOP_ID_MENU');
        $model->joinAdd(array('CUSTOM_SIDE_ID_MENU',TABLE_PREFIX.'MENU:CODE'), 'LEFT', 'reftable_CUSTOM_SIDE_ID_MENU');
        $model->joinAdd(array('VIEW_MORE_ID_PAGE',TABLE_PREFIX.'PAGE:ID'), 'LEFT', 'reftable_VIEW_MORE_ID_PAGE');
            }
        }
    }

    function initListModel(&$model, $join = false) {
        $model->selectAdd();
            $model->selectAdd('`'.TABLE_PREFIX.'PAGE`.NAME, `'.TABLE_PREFIX.'PAGE`.TITLE, `'.TABLE_PREFIX.'PAGE`.PARENT, `'.TABLE_PREFIX.'PAGE`.SLUG, `'.TABLE_PREFIX.'PAGE`.TAG_LINE, `'.TABLE_PREFIX.'PAGE`.THUMB, `'.TABLE_PREFIX.'PAGE`.BACKGROUND_IMAGE, `'.TABLE_PREFIX.'PAGE`.IMAGE, `'.TABLE_PREFIX.'PAGE`.VIDEO, `'.TABLE_PREFIX.'PAGE`.META_KEYWORDS, `'.TABLE_PREFIX.'PAGE`.META_DESCRIPTION, `'.TABLE_PREFIX.'PAGE`.INTRODUCTION, `'.TABLE_PREFIX.'PAGE`.CONTENT, `'.TABLE_PREFIX.'PAGE`.FOOTER, `'.TABLE_PREFIX.'PAGE`.ID_TEMPLATE, `'.TABLE_PREFIX.'PAGE`.ADDITIONAL_CSS, `'.TABLE_PREFIX.'PAGE`.CUSTOM_TOP_ID_MENU, `'.TABLE_PREFIX.'PAGE`.CUSTOM_SIDE_ID_MENU, `'.TABLE_PREFIX.'PAGE`.VIEW_MORE_TITLE, `'.TABLE_PREFIX.'PAGE`.VIEW_MORE_ID_PAGE, `'.TABLE_PREFIX.'PAGE`.VIEW_MORE_LINK, `'.TABLE_PREFIX.'PAGE`.LATEST_UPDATE, `'.TABLE_PREFIX.'PAGE`.NBR_VIEWS, `'.TABLE_PREFIX.'PAGE`.ID, `'.TABLE_PREFIX.'PAGE`.JSON, `'.TABLE_PREFIX.'PAGE`.UUID, `'.TABLE_PREFIX.'PAGE`.WFID, `'.TABLE_PREFIX.'PAGE`.HIERACHY');
        
            if ($join) {
                $model->selectAdd('reftable_PARENT.NAME as reftext_PARENT');
                $model->selectAdd('reftable_PARENT.UUID as refuuid_PARENT');
                $model->selectAdd('reftable_PARENT.SLUG as refslug_PARENT');
                $model->selectAdd('reftable_ID_TEMPLATE.NAME as reftext_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.UUID as refuuid_ID_TEMPLATE');
                $model->selectAdd('reftable_ID_TEMPLATE.ID as refslug_ID_TEMPLATE');
                $model->selectAdd('reftable_CUSTOM_TOP_ID_MENU.NAME as reftext_CUSTOM_TOP_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_TOP_ID_MENU.UUID as refuuid_CUSTOM_TOP_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_TOP_ID_MENU.ID as refslug_CUSTOM_TOP_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_SIDE_ID_MENU.NAME as reftext_CUSTOM_SIDE_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_SIDE_ID_MENU.UUID as refuuid_CUSTOM_SIDE_ID_MENU');
                $model->selectAdd('reftable_CUSTOM_SIDE_ID_MENU.ID as refslug_CUSTOM_SIDE_ID_MENU');
                $model->selectAdd('reftable_VIEW_MORE_ID_PAGE.NAME as reftext_VIEW_MORE_ID_PAGE');
                $model->selectAdd('reftable_VIEW_MORE_ID_PAGE.UUID as refuuid_VIEW_MORE_ID_PAGE');
                $model->selectAdd('reftable_VIEW_MORE_ID_PAGE.SLUG as refslug_VIEW_MORE_ID_PAGE');
            }

        if ($join) {
            
        
            if ($join) {
        $model->joinAdd(array('ID_TEMPLATE',TABLE_PREFIX.'TEMPLATE:CODE'), 'LEFT', 'reftable_ID_TEMPLATE');
        $model->joinAdd(array('VIEW_MORE_ID_PAGE',TABLE_PREFIX.'PAGE:ID'), 'LEFT', 'reftable_VIEW_MORE_ID_PAGE');
            }
        }
    }

    function getSearchedItems($keyword) {
        return self::getItems(array('custom' => "PAGE.NAME LIKE '%$keyword%' OR PAGE.TITLE LIKE '%$keyword%' OR PAGE.PARENT LIKE '%$keyword%' OR PAGE.TAG_LINE LIKE '%$keyword%' OR PAGE.META_DESCRIPTION LIKE '%$keyword%' OR PAGE.INTRODUCTION LIKE '%$keyword%' OR PAGE.CONTENT LIKE '%$keyword%' OR PAGE.ID_TEMPLATE LIKE '%$keyword%' OR PAGE.CUSTOM_TOP_ID_MENU LIKE '%$keyword%' OR PAGE.CUSTOM_SIDE_ID_MENU LIKE '%$keyword%' OR PAGE.VIEW_MORE_TITLE LIKE '%$keyword%' OR PAGE.VIEW_MORE_ID_PAGE LIKE '%$keyword%'"));
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

    function getMostViewedItems($limit = 10) {
        return self::getItems(array(), array(), 'NBR_VIEWS DESC', $limit);
    }

    function getBreadCrumbs($model = null) {
        $breadcrumbs = array();

        // Home
        $breadcrumbs[] = array('title' => 'Home', 'link' => APPLICATION_URL);

        // Module
        //$breadcrumbs[] = array('title' => 'Pages', 'link' => !empty($model)? APPLICATION_URL.'/page/home' : '');

        // Item chain
        if (!empty($model)) {
            
            // Category
            $category = PageController::getItemById($model->PARENT);

            if (!empty($category)) {
                $categories = array();

                // Upper
                $hierachy = trim($category->HIERACHY, '-');
                if (!empty($hierachy)) {
                    $parents = PageController::getItems(array('ID' => explode('-', $hierachy)));

                    $categories = array_merge($categories, $parents);
                }

                // Direct
                $categories[] = $category;

                foreach ($categories as $item) {
                    $breadcrumbs[] = array('title' => $item->NAME, 'link' => LinkHelper::friendly_link('page', $item->SLUG, $item->ID));
                }
            }

            // Self
            $breadcrumbs[] = array('title' => $model->NAME, 'link' => '');
        }

        return $breadcrumbs;
    }
}
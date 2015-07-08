<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PageHelper {
    static function searchPages($keyword = '', $limit = 0, $page = 0, &$page_count = 0) {
        return PageHelper::getPages($keyword, '', 'LATEST_UPDATE DESC', $limit, $page, true, $page_count);
    }

    static function getPages($keyword = '', $where = '', $order_by = '', $limit = 0, $page = 0, $return_page_count = false, &$page_count = 0) {
        $model = new PageModel();

        $model->selectAdd();
        $model->selectAdd('ID, TITLE, SLUG, PARENT, IMAGE, CONTENT, ID_TEMPLATE, LATEST_UPDATE, JSON');

        if (!empty($keyword)) {
            $model->whereAdd("PAGE.TITLE LIKE '%{$keyword}%' OR PAGE.INTRODUCTION LIKE '%{$keyword}%' OR PAGE.CONTENT LIKE '%{$keyword}%'");
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

    static function getPageWidgets($single, $position) {
        $items = json_extract($single->JSON, 'PAGE_WIDGET');

        $items = array_filter($items, function($v) use ($position) {
            return ($v->ID_WIDGET_POSITION == $position);
        });

        uasort($items, function ($a, $b) {
            return $a->ORDERING > $b->ORDERING;
        });

        return $items;
    }

    static function getPageGalleries($single) {
        return json_extract($single->JSON, 'PAGE_GALLERY');
    }

    static function getPageLinks($single, $linktype) {
        // x. Self
        $items = json_extract($single->JSON, 'PAGE_LINK');

        $items = array_values(array_filter($items, function($v) use ($linktype) {
            return ($v->ID_PAGE_LINK_TYPE == $linktype);
        }));

        // x. Parent
        if (empty($items)) {
            $parents = array_filter(explode('-', $single->HIERACHY), function($v) {
                return $v > 0;
            });

            if (!empty($parents)) {
                $cache = PageHelper::cacheGetSiteEntryPages();

                foreach ($parents as $id) {
                    if (isset($cache[$id])) {
                        $items = json_extract($cache[$id]['JSON'], 'PAGE_LINK');

                        $items = array_values(array_filter($items, function($v) use ($linktype) {
                            return ($v->ID_PAGE_LINK_TYPE == $linktype);
                        }));

                        if (!empty($items)) {
                            break;
                        }
                    }
                }
            }
        }

        // x. Rebuild slugs
        foreach ($items as $item) {
            $item->SLUG = '';

            if ($item->LINK_ID_PAGE) {
                $item->SLUG = LinkHelper::friendly_link('page', '', $item->LINK_ID_PAGE);
            } else {
                if (!empty($row->LINK_PATH)) {
                    if (!preg_match('/(http|https)\:\/\//i', $item->LINK_PATH)) {
                        $item->SLUG = APPLICATION_URL.'/'.$item->LINK_PATH;
                    } else {
                        $item->SLUG = $item->LINK_PATH;
                    }
                }
            }
        }

        return $items;
    }

    static function getMainMenuCode($single) {
        // x. Overriding menu
        if ($single->CUSTOM_TOP_ID_MENU) {
            return $single->CUSTOM_TOP_ID_MENU;
        }

        // x. Parent menu
        $parents = array_filter(explode('-', $single->HIERACHY), function($v) {
            return $v > 0;
        });

        if (!empty($parents)) {
            $cache = PageHelper::cacheGetPageCustomMenus();

            foreach ($parents as $id) {
                if (isset($cache[$id])) {
                    return $cache[$id];
                }
            }
        }

        // x. Site menu
        return get_theme_option('main-menu');
    }

    // TODO: apply cache
    static function cacheGetPageCustomMenus() {
        static $cache = null;

        if ($cache == null) {
            $model = new PageModel();

            $model->selectAdd();
            $model->selectAdd('ID, CUSTOM_TOP_ID_MENU');
            $model->whereAdd("CUSTOM_TOP_ID_MENU IS NOT NULL AND CUSTOM_TOP_ID_MENU <> ''");

            $model->find();

            $cache = array();

            while($model->fetch()) {
                $cache[$model->ID] = $model->CUSTOM_TOP_ID_MENU;
            }
        }

        return $cache;
    }

    // TODO: Apply cache
    static function cacheGetSiteEntryPages() {
        static $cache = null;

        if ($cache == null) {
            $model = new PageModel();

            $model->selectAdd();
            $model->selectAdd('ID, TITLE, JSON, ID_TEMPLATE');
            $model->whereAdd("ID_TEMPLATE = 'main-site' OR ID_TEMPLATE = 'subsite'");

            $model->find();

            $cache = array();

            while($model->fetch()) {
                $cache[$model->ID] = array('TITLE' => $model->TITLE, 'JSON' => $model->JSON, 'ID_TEMPLATE' => $model->ID_TEMPLATE);
            }
        }

        return $cache;
    }

    static function getSubsiteTitle($single) {
        // x. Self
        if ($single->ID_TEMPLATE == 'subsite') {
            return $single->TITLE;
        }

        // x. Parents
        $parents = array_filter(explode('-', $single->HIERACHY), function($v) {
            return $v > 0;
        });

        if (!empty($parents)) {
            $cache = PageHelper::cacheGetSiteEntryPages();

            foreach ($parents as $id) {
                if (isset($cache[$id]) && $cache[$id]['ID_TEMPLATE'] == 'subsite') {
                    return $cache[$id]['TITLE'];
                }
            }
        }
    }

    static function isPageOfMainSite($single) {
        $parents = array_filter(explode('-', $single->HIERACHY), function($v) {
            return $v > 0;
        });

        if (empty($parents)) {
            return true;
        }

        $cache = PageHelper::cacheGetSiteEntryPages();

        foreach ($parents as $id) {
            if (isset($cache[$id]) && $cache[$id]['ID_TEMPLATE'] == 'main-site') {
                return true;
            }
        }

        return false;
    }

    static function isPageOfSubSite($single) {
        $parents = array_filter(explode('-', $single->HIERACHY), function($v) {
            return $v > 0;
        });

        if (!empty($parents)) {
            $cache = PageHelper::cacheGetSiteEntryPages();

            foreach ($parents as $id) {
                if (isset($cache[$id]) && $cache[$id]['ID_TEMPLATE'] == 'subsite') {
                    return true;
                }
            }
        }

        return false;
    }

    static function getCorrespondingMenuItem($pageid, $menucode) {
        $model = new MenuItemModel();

        $model->ID_PAGE = $pageid;
        $model->ID_MENU = $menucode;

        $model->find();
        $model->fetch();

        return $model->ID? $model : null;
    }

    static function getRootValueFromHierachy($hierachy) {
        $parents = array_filter(explode('-', $hierachy), function($v) {
            return $v > 0;
        });

        return array_shift($parents);
    }

    static function getPageNavigation($single) {
        // x. Main menu corresponding to the page
        $menucode = PageHelper::getMainMenuCode($single);

        // x. Menus
        $menus = MenuHelper::getMenuItems($menucode, 2);

        // x. Find menuitem corresponding to the page
        $menuitem = MenuHelper::findMenuItem($menus, 'ID_PAGE', $single->ID);

        // x. If not, find menuitem corresponding to its parent
        if (empty($menuitem)) {
            $parents = array_filter(explode('-', $single->HIERACHY), function($v) {
                return $v > 0;
            });

            // Closest parents first
            $parents = array_reverse($parents);

            foreach ($parents as $parentid) {
                $menuitem = MenuHelper::findMenuItem($menus, 'ID_PAGE', $parentid);

                if (!empty($menuitem)) {
                    break;
                }
            }
        }

        if (!empty($menuitem)) {
            // x. Root item
            $rootitemid = $menuitem->PARENT? PageHelper::getRootValueFromHierachy($menuitem->HIERACHY) : $menuitem->ID;

            // x. Load all menu items from the root item
            $submenus = $menus[1][$rootitemid];

            return $submenus;
        }

        return array();
    }

    // TODO: apply cache
    static function cacheGetPagesWithSubPages() {
        static $cache = null;

        if ($cache == null) {
            $model = new PageModel();

            $model->selectAdd();
            $model->selectAdd('DISTINCT PARENT');

            $model->whereAdd('PARENT IS NOT NULL');
            $model->find();

            $cache = array();

            while($model->fetch()) {
                $cache[$model->PARENT] = $model->PARENT;
            }
        }

        return $cache;
    }

    static function hasSubPages($page_id) {
        $cache = PageHelper::cacheGetPagesWithSubPages();

        return isset($cache[$page_id]);
    }

    static function getSubPages($page_id) {
        $model = new PageModel();

        $model->selectAdd();
        $model->selectAdd('ID, TITLE, SLUG');

        $model->whereAdd("PARENT = '$page_id'");
        $model->find();

        $pages = array();

        while($model->fetch()) {
            $pages[] = clone $model;
        }

        return $pages;
    }

    static function isParentOfPage($page_id, $single) {
        $parents = array_filter(explode('-', $single->HIERACHY), function($v) {
            return $v > 0;
        });

        return in_array($page_id, $parents);
    }

    static function getPageLink($page) {
        return LinkHelper::friendly_link('page', $page->SLUG, $page->ID);
    }

    static function isPage($object) {
        return is_a($object, 'PageModel');
    }
}
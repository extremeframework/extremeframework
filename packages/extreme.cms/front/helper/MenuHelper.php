<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class MenuHelper {
	function getMenuItems($menucode, $level = 1) {
        $model = new MenuItemModel();
        $model->IS_ENABLED = 1;

        $model->selectAdd();
        $model->selectAdd(TABLE_PREFIX.'MENU_ITEM.*');

        $fm = new MenuModel();
        if (preg_match('/^[0-9]+$/', $menucode)) {
            $fm->ID = $menucode;
        } else {
            $fm->CODE = $menucode;
        }
        $model->joinAdd($fm);

        $model->selectAdd(TABLE_PREFIX.'PAGE.SLUG AS PAGE_SLUG');
        $model->joinAdd(new PageModel(), 'LEFT');

        $model->selectAdd(TABLE_PREFIX.'POST.SLUG AS POST_SLUG');
        $model->joinAdd(new PostModel(), 'LEFT');

        $model->selectAdd(TABLE_PREFIX.'POST_CATEGORY.SLUG AS CAT_SLUG');
        $model->joinAdd(new PostCategoryModel(), 'LEFT');

        $memberships = isset($_SESSION['memberships'])? $_SESSION['memberships'] : array();
        $user_group_ids = array(0);
        foreach ($memberships as $membership) {
            $user_group_ids[] = $membership->ID;
        }
        $model->whereAdd(TABLE_PREFIX."MENU_ITEM.ACL_ID_USER_GROUP IS NULL OR ".TABLE_PREFIX."MENU_ITEM.ACL_ID_USER_GROUP = '".implode("' OR ".TABLE_PREFIX."MENU_ITEM.ACL_ID_USER_GROUP = '", $user_group_ids)."'");

        $model->orderBy('ORDERING');
        $model->find();

        $rows = array();
        while ($model->fetch()) {
            $rows[] = clone $model;
        }

        // Rebuild slugs
        foreach ($rows as $row) {
            if (!empty($row->PAGE_SLUG)) {
                $row->SLUG = LinkHelper::friendly_link('page', $row->PAGE_SLUG, $row->ID_PAGE);
            } elseif (!empty($row->POST_SLUG)) {
                $row->SLUG = LinkHelper::friendly_link('post', $row->POST_SLUG, $row->ID_POST);
            } elseif (!empty($row->CAT_SLUG)) {
                $row->SLUG = LinkHelper::friendly_link('postcategory', $row->CAT_SLUG, $row->ID_POST_CATEGORY);
            } elseif (!empty($row->PATH)) {
                if (!preg_match('/(http|https)\:\/\//i', $row->PATH)) {
                    $row->SLUG = APPLICATION_URL.'/'.$row->PATH;
                } else {
                    $row->SLUG = $row->PATH;
                }
            }

            if (empty($row->SLUG)) {
                $row->SLUG = '#';
            }
        }

        $depth = 0;
        $orphan = true;
        $expectedparents = array();

        $menus = array();
        while ($orphan && $depth < $level) {
            $orphan = false;
            $ids = array();

            foreach ($rows as $i => $row) {
                if (empty($expectedparents) && empty($row->PARENT) || !empty($expectedparents) && in_array($row->PARENT, $expectedparents)) {
                    $menus[$depth][$row->PARENT? $row->PARENT : 0][] = $row;
                    $ids[] = $row->ID;

                    unset($rows[$i]);
                } else {
                    $orphan = true;
                }
            }

            $expectedparents = $ids;
            $depth += 1;
        }

        return $menus;
    }

    static function findMenuItem($menus, $property, $value) {
        foreach ($menus as $level => $levelitems) {
            foreach ($levelitems as $parentid => $items) {
                foreach ($items as $item) {
                    if ($item->$property == $value) {
                        return $item;
                    }
                }
            }
        }

        return null;
    }
}
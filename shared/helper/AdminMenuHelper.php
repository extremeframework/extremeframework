<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminMenuHelper {
    static function getMenuStructure($id_menu, &$flatmenu, &$menutree) {
        if (!Framework::hasModule('AdminMenuItem')) {
            return false;
        }

        $cache = Cache::session();
        $key = 'menustructure_'.$id_menu;

        if ($cache->has($key)) {
            $data = $cache->get($key);

            // Assign returned values
            $flatmenu = $data['flatmenu'];
            $menutree = $data['menutree'];
        } else {
            $acl = isset($_SESSION['acl'])? $_SESSION['acl'] : array();

            // Load menu
            $model = new AdminMenuItemModel();

            $model->ID_ADMIN_MENU = $id_menu;
            $model->whereAdd("ENABLE_LEFT = 1 OR ENABLE_TOP = 1 OR ENABLE_QUICK = 1 OR ENABLE_ALL = 1 OR ENABLE_SETTINGS = 1");
            $model->orderBy('PARENT, ORDERING');
            $model->find();

            $rows = array();
            while ($model->fetch()) {
                // Access right checking
                if (empty($model->MODULE) || Framework::hasModule($model->MODULE) && isset($acl[$model->MODULE]['menu']) && $acl[$model->MODULE]['menu']) {
                    $model->IS_EXTERNAL_LINK = false;

                    if (!empty($model->PATH)) {
                        if (preg_match('/^(http|www)/is', $model->PATH)) {
                            $model->LINK = $model->PATH;

                            $model->IS_EXTERNAL_LINK = true;
                        } else {
                            $model->LINK = APPLICATION_URL.'/'.$model->PATH;
                        }
                    } else {
                        if (!empty($model->MODULE)) {
                            $model->LINK = APPLICATION_URL.'/'.$model->MODULE;
                        } else {
                            $model->LINK = '';
                        }
                    }

                    $rows[$model->ID] = clone $model;
                }
            }

            // Assign returned value
            $flatmenu = $rows;

            $depth = 0;
            $orphan = true;
            $expectedparents = array();

            $menuitems = array();
            $cache = $rows;
            while ($orphan) {
                $orphan = false;
                $ids = array();

                foreach ($rows as $i => $row) {
                    if (empty($row->PARENT) || isset($cache[$row->PARENT])) {
                        if (empty($expectedparents) && empty($row->PARENT) || !empty($expectedparents) && in_array($row->PARENT, $expectedparents)) {
                            $menuitems[$depth][$row->PARENT? $row->PARENT : 0][] = $row;
                            $ids[] = $row->ID;

                            unset($rows[$i]);
                        } else {
                            $orphan = true;
                        }
                    } else {
                        unset($rows[$i]);
                    }
                }

                $expectedparents = $ids;
                $depth += 1;
            }

            // Assign returned value
            $menutree = $menuitems;

            Cache::set($key, array('flatmenu' => $flatmenu, 'menutree' => $menutree));
        }

        return true;
    }
}
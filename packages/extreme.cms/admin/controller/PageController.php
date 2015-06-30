<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PageController extends _PageController
{
    function add2menuAction() {
        $selection = isset($_REQUEST['pagelist_selection'])? $_REQUEST['pagelist_selection'] : array();

        if (!empty($selection)) {
            $_SESSION['pagelist_selection'] = $selection;
        } else {
            $selection = isset($_SESSION['pagelist_selection'])? $_SESSION['pagelist_selection'] : array();
        }

        $this->ensure_additional_data(
            'Add to Menu',
            'ID_MENU',
            'ID_MENU',
            array(
                'Add' => APPLICATION_URL.'/page/add2menu/'
            ),
            $formdata,
            array(
                'ID_MENU' => new ColumnSettings('refselect', 'Menu', 'menu', array('datasource' => 'MENU', 'valuecol' => 'CODE', 'textcol' => 'NAME'))
            )
        );

        $pageparent = array();
        $page_menuitems = array();

        foreach ($selection as $id) {
            $model = new PageModel();

            $model->UUID = $id;
            $model->find();
            $model->fetch();

            if ($model->PARENT) {
                $pageparent[$model->ID] = $model->PARENT;
            }

            $mi = new MenuItemModel();

            $mi->ID_MENU = $formdata['ID_MENU'];
            $mi->TITLE = $model->NAME;
            $mi->ID_PAGE = $model->ID;

            $mi->insert();

            $page_menuitems[$model->ID] = $mi->ID;
        }

        foreach ($pageparent as $pageid => $parentid) {
            $itemid = $page_menuitems[$pageid];

            if (isset($page_menuitems[$parentid])) {
                $itemparentid = $page_menuitems[$parentid];

                $mi = new MenuItemModel();
                $mi->ID = $itemid;
                $mi->PARENT = $itemparentid;
                $mi->update();
            }
        }

        ContextStack::back(0);
    }
}
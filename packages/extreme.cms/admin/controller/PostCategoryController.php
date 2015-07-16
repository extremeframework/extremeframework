<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PostCategoryController extends _PostCategoryController
{
    function add2menuAction() {
        $selection = isset($_REQUEST['postcategorylist_selection'])? $_REQUEST['postcategorylist_selection'] : array();

        if (!empty($selection)) {
            $_SESSION['postcategorylist_selection'] = $selection;
        } else {
            $selection = isset($_SESSION['postcategorylist_selection'])? $_SESSION['postcategorylist_selection'] : array();
        }

        $this->ensure_additional_data(
            Framework::getSmarty(__FILE__),
            'Add to Menu',
            'ID_MENU',
            'ID_MENU',
            array(
                'Add' => APPLICATION_URL.'/postcategory/add2menu/'
            ),
            $formdata,
            array(
                'ID_MENU' => new ColumnSettings('refselect', 'Menu', 'menu', array('datasource' => 'MENU', 'valuecol' => 'CODE', 'textcol' => 'NAME'))
            )
        );

        $postcategoryparent = array();
        $postcategory_menuitems = array();

        foreach ($selection as $id) {
            $model = new PostCategoryModel();

            $model->UUID = $id;
            $model->find();
            $model->fetch();

            if ($model->PARENT) {
                $postcategoryparent[$model->ID] = $model->PARENT;
            }

            $mi = new MenuItemModel();

            $mi->ID_MENU = $formdata['ID_MENU'];
            $mi->TITLE = $model->NAME;
            $mi->ID_POST_CATEGORY = $model->ID;

            $mi->insert();

            $postcategory_menuitems[$model->ID] = $mi->ID;
        }

        foreach ($postcategoryparent as $postcategoryid => $parentid) {
            $itemid = $postcategory_menuitems[$postcategoryid];

            if (isset($postcategory_menuitems[$parentid])) {
                $itemparentid = $postcategory_menuitems[$parentid];

                $mi = new MenuItemModel();
                $mi->ID = $itemid;
                $mi->PARENT = $itemparentid;
                $mi->update();
            }
        }

        ContextStack::back(0);
    }
}
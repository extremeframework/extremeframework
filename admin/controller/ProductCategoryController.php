<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ProductCategoryController extends _ProductCategoryController
{
    function add2menuAction() {
        $selection = isset($_REQUEST['productcategorylist_selection'])? $_REQUEST['productcategorylist_selection'] : array();

        if (!empty($selection)) {
            $_SESSION['productcategorylist_selection'] = $selection;
        } else {
            $selection = isset($_SESSION['productcategorylist_selection'])? $_SESSION['productcategorylist_selection'] : array();
        }

        $this->ensure_additional_data(
            'Add to Menu',
            'ID_MENU, PARENT',
            'ID_MENU',
            array(
                'Add' => APPLICATION_URL.'/productcategory/add2menu/'
            ),
            $formdata,
            array(
                'ID_MENU' => new ColumnSettings('refselect', 'Menu', 'menu', array('datasource' => 'MENU', 'valuecol' => 'ID', 'textcol' => 'NAME')),
                'PARENT' => new ColumnSettings('refselect', 'Parent', 'parent', array('datasource' => 'MENU_ITEM', 'valuecol' => 'ID', 'textcol' => 'TITLE'))
            )
        );

        foreach ($selection as $id) {
            $model = new ProductCategoryModel();

            $model->ID = $id;
            $model->find();
            $model->fetch();

            $mi = new MenuItemModel();

            $mi->ID_MENU = $formdata['ID_MENU'];
            $mi->PARENT = $formdata['PARENT'];
            $mi->TITLE = $model->NAME;
            $mi->ID_PRODUCT_CATEGORY = $id;

            $mi->insert();
        }

        ContextStack::back(0);
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ProductDepartmentController extends _ProductDepartmentController
{
    function add2menuAction() {
        list($id) = explode('/', $_REQUEST['args']);

        $this->ensure_additional_data(
            'Add to Menu',
            'ID_MENU',
            'ID_MENU',
            array(
                'Add' => APPLICATION_URL.'/productdepartment/add2menu/'.$id
            ),
            $formdata,
            array(
                'ID_MENU' => new ColumnSettings('refselect', 'Menu', 'menu', array('datasource' => 'MENU', 'valuecol' => 'ID', 'textcol' => 'NAME'))
            )
        );

        $model = new ProductDepartmentModel();

        $model->ID = $id;
        $model->find();
        $model->fetch();

        $mi = new MenuItemModel();

        $mi->ID_MENU = $formdata['ID_MENU'];
        $mi->TITLE = $model->NAME;
        $mi->PATH = LinkHelper::friendly_link('productdepartment', $model->SLUG, $model->ID, false);

        $mi->insert();

        ContextStack::back(0);
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PostController extends _PostController
{
    function add2menuAction() {
        $selection = isset($_REQUEST['postlist_selection'])? $_REQUEST['postlist_selection'] : array();

        if (!empty($selection)) {
            $_SESSION['postlist_selection'] = $selection;
        } else {
            $selection = isset($_SESSION['postlist_selection'])? $_SESSION['postlist_selection'] : array();
        }

        $this->ensure_additional_data(
            'Add to Menu',
            'ID_MENU',
            'ID_MENU',
            array(
                'Add' => APPLICATION_URL.'/post/add2menu/'
            ),
            $formdata,
            array(
                'ID_MENU' => new ColumnSettings('refselect', 'Menu', 'menu', array('datasource' => 'MENU', 'valuecol' => 'CODE', 'textcol' => 'NAME'))
            )
        );

        foreach ($selection as $id) {
            $model = new PostModel();

            $model->UUID = $id;
            $model->find();
            $model->fetch();

            $mi = new MenuItemModel();

            $mi->ID_MENU = $formdata['ID_MENU'];
            $mi->TITLE = $model->TITLE;
            $mi->ID_POST = $model->ID;

            $mi->insert();
        }

        ContextStack::back(0);
    }
}
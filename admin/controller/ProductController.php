<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ProductController extends _ProductController
{
    function onSaveSuccess($model) {
        parent::onSaveSuccess($model);

        // x. Category prefix
        $pcm = new ProductCategoryModel();

        $pcm->ID = $model->ID_PRODUCT_CATEGORY;

        $pcm->selectAdd('');
        $pcm->selectAdd('PRODUCT_CATEGORY.SKU_PREFIX AS CATEGORY_PREFIX');
        $pcm->selectAdd('PRODUCT_DEPARTMENT.SKU_PREFIX AS DEPARTMENT_PREFIX');
        $pcm->joinAdd(new ProductDepartmentModel());

        $pcm->find();

        if ($pcm->fetch()) {
            $department_prefix = $pcm->DEPARTMENT_PREFIX? $pcm->DEPARTMENT_PREFIX : 'Z';
            $category_prefix = $pcm->CATEGORY_PREFIX? $pcm->CATEGORY_PREFIX : 'Z';

            $model->SKU = $department_prefix.$category_prefix.'-'.substr($model->REFID, -4);

            $model->update();
        }
    }
}
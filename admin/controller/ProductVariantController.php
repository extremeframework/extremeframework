<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ProductVariantController extends _ProductVariantController
{
    function onSaveSuccess($model) {
        parent::onSaveSuccess($model);

        // x. Product
        $pm = new ProductModel();

        $pm->ID = $model->ID_PRODUCT;

        $pm->find();

        if ($pm->fetch()) {
            list($prefix, $number) = explode('-', $pm->SKU);

            $model->SKU = $prefix.'-'.substr($model->REFID, -6);

            $model->update();
        }
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class GoodsReceiptController extends _GoodsReceiptController
{
    function createFromPurchaseOrderAction() {
		@list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

        // x. Check if exists
        $gr = new GoodsReceiptModel();

        $gr->ID_PURCHASE_ORDER = $id;

        $gr->find();
        $gr->fetch();

        if (!$gr->ID) {
            // x. Purchase order
            $po = new PurchaseOrderModel();

            $po->find();
            $po->fetch();

    		if (empty($po->ID)) {
    		    $this->pagenotfound();
    		}

            // x. Create goods receipts
            $gr = new GoodsReceiptModel();

            $gr->ID_PURCHASE_ORDER = $po->ID;
            $gr->ID_VENDOR = $po->ID_VENDOR;
            $gr->DOCUMENT_DATE = date('Y-m-d');
            $gr->POSTING_DATE = date('Y-m-d');

            $this->save(array($gr));

            // x. Purchase order items
            $poi = new PurchaseOrderItemModel();

            $poi->ID_PURCHASE_ORDER = $po->ID;

            $poi->find();

            $models = array();

            while ($poi->fetch()) {
                $gri = new GoodsReceiptItemModel();

                $gri->ID_GOODS_RECEIPT = $gr->ID;
                $gri->ID_MATERIAL = $poi->ID_MATERIAL;
                $gri->QUANTITY = $poi->QUANTITY;
                $gri->ID_UNIT = $poi->ID_UNIT;
                $gri->ID_PLANT = $poi->ID_PLANT;

                $models[] = $gri;
            }

            $c = new GoodsReceiptItemController();
            $c->save($models);
        }

        // x. View
        application_route(APPLICATION_URL.'/goodsreceipt/view/'.$gr->ID);
    }
}
<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class CartController {
    function indexAction() {
        // x. Clear sensitive information if any
        if (isset($_SESSION['checkout.data'])) {
            $data = $_SESSION['checkout.data'];

            $data->CC_NUMBER = '';
            $data->CC_EXPIRY_MONTH = '';
            $data->CC_EXPIRY_YEAR = '';
            $data->CC_CVV = '';

            $_SESSION['checkout.data'] = $data;
        }

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('items', $this->getCartItems());
        $smarty->assign('other_purchases', $this->getOtherPurchases());

        $smarty->display('page.cart.tpl');
    }

    function addAction() {
        $product_id = isset($_REQUEST['product_id'])? $_REQUEST['product_id'] : '';

        if (!empty($product_id)) {
            $this->addAddCartItem($product_id);
        }

        // x. Redirect to cart page
        header('Location: '.APPLICATION_URL.'/cart');
    }

    function addAddCartItem($product_id) {
        // x. Check if product exists
        $apm = new AdminProductModel();

        $apm->ID = $product_id;

        $apm->find();

        if ($apm->fetch()) {
            // x. Get from session
            $session_cart = isset($_SESSION['session.cart'])? $_SESSION['session.cart'] : array();

            // x. Insert or update product to the cart
            if (isset($session_cart[$product_id])) {
                $aoim = $session_cart[$product_id];

                $aoim->QUANTITY += 1;

                $aoim->QUANTITY = min(10, $aoim->QUANTITY);
            } else {
                $aoim = new AdminOrderItemModel();

                $aoim->TITLE = $apm->TITLE;
                $aoim->IMAGE = $apm->IMAGE;
                $aoim->ID_ADMIN_PRODUCT = $apm->ID;
                $aoim->LIST_PRICE = $apm->LIST_PRICE;
                $aoim->PRICE = $apm->PRICE;
                $aoim->QUANTITY = 1;
            }

            $session_cart[$product_id] = $aoim;

            // x. Update to session
            $_SESSION['session.cart'] = $session_cart;
        }
    }

    function jsonAddCartItemAction() {
        $product_id = isset($_REQUEST['product_id'])? $_REQUEST['product_id'] : '';

        if (!empty($product_id)) {
            $this->addAddCartItem($product_id);
        }

        // x. Response
        $this->responseJsonCart();
    }

    function jsonRemoveCartItemAction() {
        $product_id = isset($_REQUEST['product_id'])? $_REQUEST['product_id'] : '';

        // x. Get from session
        $session_cart = isset($_SESSION['session.cart'])? $_SESSION['session.cart'] : array();

        // x. Remove
        if (isset($session_cart[$product_id])) {
            unset($session_cart[$product_id]);
        }

        // x. Update to session
        $_SESSION['session.cart'] = $session_cart;

        // x. Response
        $this->responseJsonCart();
    }

    function jsonUpdateCartItemAction() {
        $product_id = isset($_REQUEST['product_id'])? $_REQUEST['product_id'] : '';
        $quantity = isset($_REQUEST['quantity'])? $_REQUEST['quantity'] : 1;

        // x. Get from session
        $session_cart = isset($_SESSION['session.cart'])? $_SESSION['session.cart'] : array();

        // x. Insert or update product to the cart
        if (isset($session_cart[$product_id])) {
            $aoim = $session_cart[$product_id];

            $aoim->QUANTITY = $quantity;
            $aoim->QUANTITY = min(10, $aoim->QUANTITY);

            $session_cart[$product_id] = $aoim;
        }

        // x. Update to session
        $_SESSION['session.cart'] = $session_cart;

        // x. Response
        $this->responseJsonCart();
    }

    function responseJsonCart() {
        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('items', $this->getCartItems());
        $smarty->assign('other_purchases', $this->getOtherPurchases());

        $html_cart = $smarty->fetch('cart.content.tpl');

        // Response
        $json = array('success' => true, 'HtmlCart' => $html_cart);

        header("Content-type: application/json");
        echo json_encode($json);
    }

    function getCartItems() {
        return isset($_SESSION['session.cart'])? $_SESSION['session.cart'] : array();
    }

    function getOtherPurchases() {
        $product_ids = array_keys($this->getCartItems());

        $apm = new AdminProductModel();

        $apm->whereAdd("ID != '".implode("' AND ID != '", $product_ids)."'");

        $apm->find();

        $items = array();

        while($apm->fetch()) {
            $apm->ID_ADMIN_PRODUCT = $apm->ID;

            $items[] = clone $apm;
        }

        return $items;
    }
}
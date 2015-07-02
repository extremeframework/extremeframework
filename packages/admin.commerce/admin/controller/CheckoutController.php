<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class CheckoutController {
    function indexAction() {
        $message = isset($_GET['message'])? $_GET['message'] : '';

        $this->showCheckoutPage($message);
    }

    function showCheckoutPage($message = '') {
        // x. Return if no cart item
        $items = CartController::getCartItems();

        if (empty($items)) {
            header('Location:'.APPLICATION_URL.'/cart');
            return;
        }

        // x. Check if zero amount
        $zeroamount = true;

        foreach ($items as $item) {
            if ($item->PRICE > 0) {
                $zeroamount = false;

                break;
            }
        }

        // x. Order data
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : new stdClass();

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('cart_items', $items);
        $smarty->assign('data', $data);
        $smarty->assign('message', $message);

        $smarty->display($zeroamount? 'page.checkout-zero.tpl' : 'page.checkout.tpl');
    }

    function submitAction() {
        // x. Return if no cart item
        $items = CartController::getCartItems();

        if (empty($items)) {
            header('Location:'.APPLICATION_URL.'/cart');
            return;
        }

        $id_country = isset($_REQUEST['id_country'])? $_REQUEST['id_country'] : '';
        $first_name = isset($_REQUEST['first_name'])? $_REQUEST['first_name'] : '';
        $last_name = isset($_REQUEST['last_name'])? $_REQUEST['last_name'] : '';
        $address = isset($_REQUEST['address'])? $_REQUEST['address'] : '';
        $city = isset($_REQUEST['city'])? $_REQUEST['city'] : '';
        $state = isset($_REQUEST['state'])? $_REQUEST['state'] : '';
        $zip_code = isset($_REQUEST['zip_code'])? $_REQUEST['zip_code'] : '';
        $email = isset($_REQUEST['email'])? $_REQUEST['email'] : '';
        $phone = isset($_REQUEST['phone'])? $_REQUEST['phone'] : '';
        $note = isset($_REQUEST['note'])? $_REQUEST['note'] : '';

        $id_payment_type = isset($_REQUEST['id_payment_type'])? $_REQUEST['id_payment_type'] : '';

        $cc_number = isset($_REQUEST['cc_number'])? $_REQUEST['cc_number'] : '';
        $cc_expiry_month = isset($_REQUEST['cc_expiry_month'])? $_REQUEST['cc_expiry_month'] : '';
        $cc_expiry_year = isset($_REQUEST['cc_expiry_year'])? $_REQUEST['cc_expiry_year'] : '';
        $cc_cvv = isset($_REQUEST['cc_cvv'])? $_REQUEST['cc_cvv'] : '';

        // x. Check data
        $ok = true;
        $message = '';

        if (empty($id_country)) {
            $ok = false;

            $message = 'Please specify customer country';
        } else if (empty($first_name)) {
            $ok = false;

            $message = 'Please enter customer first name';
        } else if (empty($last_name)) {
            $ok = false;

            $message = 'Please enter customer last name';
        } else if (empty($email)) {
            $ok = false;

            $message = 'Please enter customer email address';
        } else if (!preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', $email)) {
            $ok = false;

            $message = 'Please enter a valid email address';
        } else if (!empty($phone) && !preg_match('/^[0-9 +-\.\(\)]*$/i', $phone)) {
            $ok = false;

            $message = 'Please enter a valid phone number';
        } else if (empty($id_payment_type)) {
            $ok = false;

            $message = 'Please select a payment method';
        } else if ($id_payment_type == 1) {
            if (empty($cc_number)) {
                $ok = false;

                $message = 'Please enter card number';
            } else if (empty($cc_expiry_month)) {
                $ok = false;

                $message = 'Please enter card expiry month';
            } else if (empty($cc_expiry_year)) {
                $ok = false;

                $message = 'Please enter card expiry year';
            } else if (empty($cc_cvv)) {
                $ok = false;

                $message = 'Please enter the CVV code';
            }
        }

        // x. Data object
        $data = new stdClass();

        $data->CUSTOMER_ID_COUNTRY = $id_country;
        $data->CUSTOMER_FIRST_NAME = $first_name;
        $data->CUSTOMER_LAST_NAME = $last_name;
        $data->CUSTOMER_ADDRESS = $address;
        $data->CUSTOMER_CITY = $city;
        $data->CUSTOMER_STATE = $state;
        $data->CUSTOMER_ZIP_CODE = $zip_code;
        $data->CUSTOMER_EMAIL = $email;
        $data->CUSTOMER_PHONE = $phone;
        $data->NOTE = $note;

        $data->ID_PAYMENT_TYPE = $id_payment_type;

        $data->CC_NUMBER = $cc_number;
        $data->CC_EXPIRY_MONTH = $cc_expiry_month;
        $data->CC_EXPIRY_YEAR = $cc_expiry_year;
        $data->CC_CVV = $cc_cvv;

        // Store to session
        $_SESSION['checkout.data'] = $data;

        // x. Check card
        if ($ok && $id_payment_type == 1 && !PaymentController::checkCreditCard($data, $msg)) {
            $ok = false;

            $message = $msg;
        }

        // x. If ok
        if ($ok) {
            // Redirect to the payment page
            header('Location: '.APPLICATION_URL.'/payment');
        } else {
            // Show checkout page
            $this->showCheckoutPage($message);
        }
    }

    function successAction() {
        $smarty = Framework::getSmarty(__FILE__);

        $smarty->display('checkout.success.tpl');
    }
}
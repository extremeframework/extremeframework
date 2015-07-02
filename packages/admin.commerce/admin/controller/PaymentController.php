<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
if (!defined('APPLICATION_DIR')) die('');

define('PAYPAL_RETURN_URL', APPLICATION_URL.'/payment/paypalConfirm');
define('PAYPAL_CANCEL_URL', APPLICATION_URL.'/payment/paypalCancel');

require_once('pCURL.php');

class PaymentController {
    function __construct() {
        PluginManager::add_action('order_paid', array($this, 'onOrderPaid'));
        PluginManager::add_action('order_refunded', array($this, 'onOrderRefunded'));
    }

    function getOption($code) {
        return get_package_option($code, 'admin.commerce');
    }

    function indexAction() {
        $this->showPaymentPage();
    }

    function showPaymentPage($message = '') {
        // x. Return if no cart item
        $items = CartController::getCartItems();

        if (empty($items)) {
            $this->gotoCartPage();
        }

        // x. Order data
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : new stdClass();

        if (empty($data) || !$data->CUSTOMER_ID_COUNTRY) {
            $this->gotoCartPage();
        }

        // x. Country name
        $country = new CountryModel();

        $country->ID = $data->CUSTOMER_ID_COUNTRY;
        $country->find();

        $country->fetch();

        // x. Payment type
        $payment_type = new PaymentTypeModel();

        $payment_type->ID = $data->ID_PAYMENT_TYPE;
        $payment_type->find();

        if (!$payment_type->fetch()) {
            $this->gotoCartPage();
        }

        $smarty = Framework::getSmarty();

        $smarty->assign('items', $items);
        $smarty->assign('data', $data);
        $smarty->assign('country', $country);
        $smarty->assign('payment_type', $payment_type);
        $smarty->assign('message', $message);

        $smarty->display('page.payment.tpl');
    }

    function placeOrderAction() {
        if (empty($_POST)) {
            $this->showPaymentPage();

            return;
        }

        // x. Return if no cart item
        $items = CartController::getCartItems();

        if (empty($items)) {
            $this->gotoCartPage();
        }

        $must_agree = isset($_REQUEST['must_agree'])? $_REQUEST['must_agree'] : false;

        // x. Check data
        $ok = true;
        $message = '';

        if (!$must_agree) {
            $ok = false;

            $message = 'Please read and accept the terms of sale and privacy policy.';
        }

        // x. If not ok
        if (!$ok) {
            $this->showPaymentPage($message);

            return;
        }

        // x. Process payment
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : array();

        // x. Payment type
        $payment_type = new PaymentTypeModel();

        $payment_type->ID = $data->ID_PAYMENT_TYPE;
        $payment_type->find();

        if (!$payment_type->fetch()) {
            $this->gotoCartPage();
        }

        // x. Pay
        if ($payment_type->CODE == 'paypal') {
            $this->paypalBegin();
        } else if ($payment_type->CODE == 'card') {
            $this->creditCardBegin();
        } else if ($payment_type->CODE == 'free') {
            $this->freeCheckoutBegin();
        } else {
            $this->showCheckoutPage('Invalid payment settings');

            return;
        }
    }

    function payWithPayPalAction() {
        // x. Update payment type
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : new stdClass();

        $data->ID_PAYMENT_TYPE = 2;

        $_SESSION['checkout.data'] = $data;

        // x. Pay
        $this->paypalBegin();
    }

    function paypalBegin() {
        // x. Cart items
        $items = CartController::getCartItems();

        $params = array();

        $params['USER'] = self::getOption('PAYPAL_USERNAME');
        $params['PWD'] = self::getOption('PAYPAL_PASSWORD');
        $params['SIGNATURE'] = self::getOption('PAYPAL_SIGNATURE');

        $params['METHOD'] = 'SetExpressCheckout';
        $params['VERSION'] = self::getOption('PAYPAL_VERSION');

        $total = 0;
        $i = 0;

        foreach ($items as $item) {
            if ($item->PRICE > 0) {
                $params['L_PAYMENTREQUEST_0_ITEMCATEGORY'.$i] = 'Digital';
                $params['L_PAYMENTREQUEST_0_NAME'.$i] = $item->TITLE;
                $params['L_PAYMENTREQUEST_0_QTY'.$i] = $item->QUANTITY;
                $params['L_PAYMENTREQUEST_0_AMT'.$i] = number_format($item->PRICE, 2, '.', '');

                $total += $item->QUANTITY * $item->PRICE;
                $i += 1;
            }
        }

        $params['PAYMENTREQUEST_0_PAYMENTACTION'] = 'SALE';
        $params['PAYMENTREQUEST_0_AMT'] = number_format($total, 2, '.', '');
        $params['PAYMENTREQUEST_0_CURRENCYCODE'] = 'USD';

        $params['RETURNURL'] = PAYPAL_RETURN_URL;
        $params['CANCELURL'] = PAYPAL_CANCEL_URL;

        // x. Request
        $content = pCURL::download(self::getOption('PAYPAL_API_URL'), http_build_query($params));

        if (empty($content)) {
            die('We are sorry, an unexpected error occurred processing your request. Please try again.');
        }

        // x. Parse response
        parse_str($content, $params);

        $ack = isset($params['ACK'])? $params['ACK'] : '';
        $token = isset($params['TOKEN'])? $params['TOKEN'] : '';
        $message = isset($params['L_LONGMESSAGE0'])? $params['L_LONGMESSAGE0'] : '';

        if ($ack != 'Success') {
            die('Error: '.$message);
        }

        // x. Redirect to Paypal
        $url = self::getOption('PAYPAL_WEB_URL')."/cgi-bin/webscr?cmd=_express-checkout&token=$token";

        header('Location: '.$url);
    }

    function paypalConfirmAction() {
        $token = isset($_REQUEST['token'])? $_REQUEST['token'] : '';
        $PayerID = isset($_REQUEST['PayerID'])? $_REQUEST['PayerID'] : '';

        if (empty($token) || empty($PayerID)) {
            die('We are sorry, an unexpected error occurred processing your request. Please try again.');
        }

        // x. Get session data
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : new stdClass();

        // x. Get checkout details
        $params = array(
            'USER' => self::getOption('PAYPAL_USERNAME'),
            'PWD' => self::getOption('PAYPAL_PASSWORD'),
            'SIGNATURE' => self::getOption('PAYPAL_SIGNATURE'),
            'METHOD' => 'GetExpressCheckoutDetails',
            'VERSION' => self::getOption('PAYPAL_VERSION'),
            'TOKEN' => $token
        );

        $content = pCURL::download(self::getOption('PAYPAL_API_URL'), http_build_query($params));

        if (empty($content)) {
            die('We are sorry, an unexpected error occurred processing your request. Please try again.');
        }

        parse_str($content, $params);

        $EMAIL = isset($params['EMAIL'])? $params['EMAIL'] : '';
        $PAYERID = isset($params['PAYERID'])? $params['PAYERID'] : '';
        $PAYERSTATUS = isset($params['PAYERSTATUS'])? $params['PAYERSTATUS'] : '';
        $FIRSTNAME = isset($params['FIRSTNAME'])? $params['FIRSTNAME'] : '';
        $LASTNAME = isset($params['LASTNAME'])? $params['LASTNAME'] : '';
        $COUNTRYCODE = isset($params['COUNTRYCODE'])? $params['COUNTRYCODE'] : '';

        $SHIPTONAME = isset($params['SHIPTONAME'])? $params['SHIPTONAME'] : '';
        $SHIPTOSTREET = isset($params['SHIPTOSTREET'])? $params['SHIPTOSTREET'] : '';
        $SHIPTOCITY = isset($params['SHIPTOCITY'])? $params['SHIPTOCITY'] : '';
        $SHIPTOSTATE = isset($params['SHIPTOSTATE'])? $params['SHIPTOSTATE'] : '';
        $SHIPTOZIP = isset($params['SHIPTOZIP'])? $params['SHIPTOZIP'] : '';

        $SHIPTOCOUNTRYCODE = isset($params['SHIPTOCOUNTRYCODE'])? $params['SHIPTOCOUNTRYCODE'] : '';
        $SHIPTOCOUNTRYNAME = isset($params['SHIPTOCOUNTRYNAME'])? $params['SHIPTOCOUNTRYNAME'] : '';

        // x. Country
        $country = new CountryModel();

        $country->CODE = $SHIPTOCOUNTRYCODE;
        $country->find();

        $country->fetch();

        // x. Update session checkout data
        $data->CUSTOMER_ID_COUNTRY = $country->ID;
        $data->CUSTOMER_FIRST_NAME = $SHIPTONAME;
        //$data->CUSTOMER_LAST_NAME = $LASTNAME;
        $data->CUSTOMER_ADDRESS = $SHIPTOSTREET;
        $data->CUSTOMER_CITY = $SHIPTOCITY;
        $data->CUSTOMER_STATE = $SHIPTOSTATE;
        $data->CUSTOMER_ZIP_CODE = $SHIPTOZIP;
        $data->CUSTOMER_EMAIL = $EMAIL;

        $data->ID_PAYMENT_TYPE = 2; // PayPal

        $_SESSION['checkout.data'] = $data;

        // x. Cart items
        $items = CartController::getCartItems();

        $total = 0;
        foreach ($items as $item) {
            $total += $item->QUANTITY * $item->PRICE;
        }

        // x. After the user confirm the payment in the order confirmation page
        $params = array(
            'USER' => self::getOption('PAYPAL_USERNAME'),
            'PWD' => self::getOption('PAYPAL_PASSWORD'),
            'SIGNATURE' => self::getOption('PAYPAL_SIGNATURE'),
            'METHOD' => 'DoExpressCheckoutPayment',
            'VERSION' => self::getOption('PAYPAL_VERSION'),
            'TOKEN' => $token,
            'PAYERID' => $PayerID,
            'PAYMENTREQUEST_0_PAYMENTACTION' => 'SALE',
            'PAYMENTREQUEST_0_AMT' => $total,
            'PAYMENTREQUEST_0_CURRENCYCODE' => 'USD',
        );

        // x. Request
        $content = pCURL::download(self::getOption('PAYPAL_API_URL'), http_build_query($params));

        if (empty($content)) {
            die('We are sorry, an unexpected error occurred processing your request. Please try again.');
        }

        // x. Parse response
        parse_str($content, $params);

        $ack = isset($params['ACK'])? $params['ACK'] : '';
        $token = isset($params['TOKEN'])? $params['TOKEN'] : '';

        $PAYMENTINFO_0_ACK = isset($params['PAYMENTINFO_0_ACK'])? $params['PAYMENTINFO_0_ACK'] : '';
        $PAYMENTINFO_0_TRANSACTIONID = isset($params['PAYMENTINFO_0_TRANSACTIONID'])? $params['PAYMENTINFO_0_TRANSACTIONID'] : '';
        $PAYMENTINFO_0_ORDERTIME = isset($params['PAYMENTINFO_0_ORDERTIME'])? $params['PAYMENTINFO_0_ORDERTIME'] : '';
        $PAYMENTINFO_0_FEEAMT = isset($params['PAYMENTINFO_0_FEEAMT'])? $params['PAYMENTINFO_0_FEEAMT'] : '';
        $PAYMENTINFO_0_TAXAMT = isset($params['PAYMENTINFO_0_TAXAMT'])? $params['PAYMENTINFO_0_TAXAMT'] : '';
        $PAYMENTINFO_0_PAYMENTSTATUS = isset($params['PAYMENTINFO_0_PAYMENTSTATUS'])? $params['PAYMENTINFO_0_PAYMENTSTATUS'] : '';

        $message = isset($params['L_LONGMESSAGE0'])? $params['L_LONGMESSAGE0'] : '';

        if ($ack != 'Success' && $ack != 'SuccessWithWarning') {
            $this->showCheckoutPage($message);
        }

        // x. Update payment info
        $data->PAYMENT_DATE = date('Y-m-d H:i:s');
        $data->PAYMENT_REF = $PAYMENTINFO_0_TRANSACTIONID;

        $_SESSION['checkout.data'] = $data;

        // x. On payment completed
        $this->onPaymentCompleted();
    }

    function payPalCancelAction() {
        $token = isset($_REQUEST['token'])? $_REQUEST['token'] : '';

        $this->gotoCartPage();
    }

    function xxxAction() {
        //ob_start();

        header('Location: http://www.vietmaisolutions.com');

header("Conection: close");
header("Content-length: " . (string)ob_get_length());

ob_end_flush();
ob_flush();
flush();

        // Long processing
        sleep(10);

        file_put_contents('D:/aaa', 'hello');
        //$this->refundOrder('7bc0f775-283b-431d-9d79-0cb5747bdf76');
    }

    function refundOrder($uuid) {
        $order = new AdminOrderModel();

        $order->UUID = $uuid;

        $order->find();

        if (!$order->fetch()) {
            die('Error: Order not found.');
        }

        // x. Check payment ref
        if (empty($order->PAYMENT_REF)) {
            die('Error: No payment information.');
        }

        // x. Refund
        $results = $this->paypalRefund($order->PAYMENT_REF);

        if (!$results['success']) {
            die('Error: '.$results['message']);
        }

        // x. Update
        $order->REFUND_DATE = date('Y-m-d H:i:s');
        $order->REFUND_REF = $results['transactionid'];
        $order->ID_ADMIN_ORDER_STATUS = 4; // Refunded

        $order->update();

        echo 'Order refunded successfully.';
    }

    function paypalRefund($transactionid, $is_full = true, $amount = 0, $currency = '', $note = '') {
        if (!$is_full && (empty($amount) || empty($currency) || empty($note))) {
            die('Parameter missing for a partial refunding type.');
        }

        $params = array(
            'USER' => self::getOption('PAYPAL_USERNAME'),
            'PWD' => self::getOption('PAYPAL_PASSWORD'),
            'SIGNATURE' => self::getOption('PAYPAL_SIGNATURE'),
            'METHOD' => 'RefundTransaction',
            'VERSION' => self::getOption('PAYPAL_VERSION'),
            'TRANSACTIONID' => $transactionid,
            'REFUNDTYPE' => $is_full? 'Full' : 'Partial'
        );

        if (!$is_full) {
            $params['AMT'] = $amount;
            $params['CURRENCYCODE'] = $currency;
            $params['NOTE'] = $note;
        }

        // x. Request
        $content = pCURL::download(self::getOption('PAYPAL_API_URL'), http_build_query($params));

        if (empty($content)) {
            die('We are sorry, an unexpected error occurred processing your request. Please try again.');
        }

        // x. Parse response
        parse_str($content, $params);

        $ack = isset($params['ACK'])? $params['ACK'] : '';
        $message = isset($params['L_LONGMESSAGE0'])? $params['L_LONGMESSAGE0'] : '';
        $REFUNDTRANSACTIONID = isset($params['REFUNDTRANSACTIONID'])? $params['REFUNDTRANSACTIONID'] : '';

        if ($ack != 'Success' && $ack != 'SuccessWithWarning') {
            return array('success' => false, 'message' => $message);
        }

        return array('success' => true, 'transactionid' => $REFUNDTRANSACTIONID);
    }

    function creditCardBegin() {
        // https://developer.paypal.com/docs/classic/paypal-payments-pro/integration-guide/WPDirectPayment/
        // Website Payments Pro account is needed for Direct Payments with a credit-card

        // x. Order data
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : array();

        // x. Cart items
        $items = CartController::getCartItems();

        $total = 0;
        foreach ($items as $item) {
            $total += $item->QUANTITY * $item->PRICE;
        }

        // x. Country name
        $country = new CountryModel();

        $country->ID = $data->CUSTOMER_ID_COUNTRY;
        $country->find();

        if (!$country->fetch()) {
            $this->showCheckoutPage();
        }

        $params = array(
            'USER' => self::getOption('PAYPAL_USERNAME'),
            'PWD' => self::getOption('PAYPAL_PASSWORD'),
            'SIGNATURE' => self::getOption('PAYPAL_SIGNATURE'),
            'METHOD' => 'DoDirectPayment',
            'VERSION' => self::getOption('PAYPAL_VERSION'),
            'AMT' => $total,
            'CURRENCYCODE' => 'USD',
            'PAYMENTACTION' => 'Sale',
            'IPADDRESS' => isset($_SERVER['REMOTE_ADDR'])? $_SERVER['REMOTE_ADDR'] : '',
            //'CREDITCARDTYPE' => 'VISA',
            'ACCT' => $data->CC_NUMBER,
            'EXPDATE' => $data->CC_EXPIRY_MONTH.$data->CC_EXPIRY_YEAR,
            'CVV2' => $data->CC_CVV,
            'FIRSTNAME' => $data->CUSTOMER_FIRST_NAME,
            'LASTNAME' => $data->CUSTOMER_LAST_NAME,
            'STREET' => $data->CUSTOMER_ADDRESS,
            'CITY' => $data->CUSTOMER_CITY,
            'STATE' => $data->CUSTOMER_STATE,
            'ZIP' => $data->CUSTOMER_ZIP_CODE,
            'COUNTRYCODE' => $country->CODE
        );

        set_time_limit(0);

        // x. Request
        $content = pCURL::download(self::getOption('PAYPAL_API_URL'), http_build_query($params));

        if (empty($content)) {
            die('We are sorry, an unexpected error occurred processing your request. Please try again.');
        }

        // x. Parse response
        parse_str($content, $params);

        $ack = isset($params['ACK'])? $params['ACK'] : '';
        $message = isset($params['L_LONGMESSAGE0'])? $params['L_LONGMESSAGE0'] : '';
        $transactionid = isset($params['TRANSACTIONID'])? $params['TRANSACTIONID'] : '';

        if ($ack != 'Success' && $ack != 'SuccessWithWarning') {
            $this->showCheckoutPage($message);
        }

        // x. Update payment info
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : array();

        $data->PAYMENT_DATE = date('Y-m-d H:i:s');
        $data->PAYMENT_REF = $transactionid;

        $_SESSION['checkout.data'] = $data;

        $this->onPaymentCompleted();
    }

    function checkCreditCard($data, &$error = '') {
        // x. Country name
        $country = new CountryModel();

        $country->ID = $data->CUSTOMER_ID_COUNTRY;
        $country->find();

        if (!$country->fetch()) {
            return false;
        }

        $params = array(
            'USER' => self::getOption('PAYPAL_USERNAME'),
            'PWD' => self::getOption('PAYPAL_PASSWORD'),
            'SIGNATURE' => self::getOption('PAYPAL_SIGNATURE'),
            'METHOD' => 'DoDirectPayment',
            'VERSION' => self::getOption('PAYPAL_VERSION'),
            'AMT' => '0.00',
            'CURRENCYCODE' => 'USD',
            'PAYMENTACTION' => 'Authorization',
            'IPADDRESS' => isset($_SERVER['REMOTE_ADDR'])? $_SERVER['REMOTE_ADDR'] : '',
            //'CREDITCARDTYPE' => 'VISA',
            'ACCT' => $data->CC_NUMBER,
            'EXPDATE' => $data->CC_EXPIRY_MONTH.$data->CC_EXPIRY_YEAR,
            'CVV2' => $data->CC_CVV,
            'FIRSTNAME' => $data->CUSTOMER_FIRST_NAME,
            'LASTNAME' => $data->CUSTOMER_LAST_NAME,
            'STREET' => $data->CUSTOMER_ADDRESS,
            'CITY' => $data->CUSTOMER_CITY,
            'STATE' => $data->CUSTOMER_STATE,
            'ZIP' => $data->CUSTOMER_ZIP_CODE,
            'COUNTRYCODE' => $country->CODE
        );

        set_time_limit(0);

        // x. Request
        $content = pCURL::download(self::getOption('PAYPAL_API_URL'), http_build_query($params));

        if (empty($content)) {
            $error = 'Can not verify the card number.';

            return false;
        }

        // x. Parse response
        parse_str($content, $params);

        $ack = isset($params['ACK'])? $params['ACK'] : '';
        $message = isset($params['L_LONGMESSAGE0'])? $params['L_LONGMESSAGE0'] : '';
        $transactionid = isset($params['TRANSACTIONID'])? $params['TRANSACTIONID'] : '';

        if ($ack != 'Success' && $ack != 'SuccessWithWarning') {
            $error = str_replace('This transaction cannot be processed.', '', $message);

            return false;
        }

        return true;
    }

    function freeCheckoutBegin() {
        // x. Nothing to pay. Still, update payment info
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : new stdClass();

        $data->PAYMENT_DATE = date('Y-m-d H:i:s');
        $data->PAYMENT_REF = strtoupper(substr(md5($data->PAYMENT_DATE), 0, 17));

        $_SESSION['checkout.data'] = $data;

        $this->onPaymentCompleted();
    }

    function showCheckoutPage($message = '') {
        header('Location:'.APPLICATION_URL.'/checkout'.(!empty($message)? '?message='.urlencode($message) : ''));

        exit(0);
    }

    function onPaymentCompleted() {
        $data = isset($_SESSION['checkout.data'])? $_SESSION['checkout.data'] : new stdClass();

        // x. Create order
        $aom = new AdminOrderModel();

        $aom->CUSTOMER_ID_COUNTRY = $data->CUSTOMER_ID_COUNTRY;
        $aom->CUSTOMER_FIRST_NAME = $data->CUSTOMER_FIRST_NAME;
        $aom->CUSTOMER_LAST_NAME = $data->CUSTOMER_LAST_NAME;
        $aom->CUSTOMER_ADDRESS = $data->CUSTOMER_ADDRESS;
        $aom->CUSTOMER_CITY = $data->CUSTOMER_CITY;
        $aom->CUSTOMER_STATE = $data->CUSTOMER_STATE;
        $aom->CUSTOMER_ZIP_CODE = $data->CUSTOMER_ZIP_CODE;
        $aom->CUSTOMER_EMAIL = $data->CUSTOMER_EMAIL;
        $aom->CUSTOMER_PHONE = $data->CUSTOMER_PHONE;
        $aom->NOTE = $data->NOTE;
        $aom->ID_PAYMENT_TYPE = $data->ID_PAYMENT_TYPE;
        $aom->CREATION_DATE = date('Y-m-d H:i:s');
        $aom->PAYMENT_DATE = $data->PAYMENT_DATE;
        $aom->PAYMENT_REF = $data->PAYMENT_REF;
        $aom->ID_ADMIN_ORDER_STATUS = 2; // Paid

        $aom = (new AdminOrderController())->save(array($aom));

        if (!$aom->ID) {
            die('We are sorry, an unexpected error occurred processing your request. Please try again.');
        }

        // x. Create order items
        $items = CartController::getCartItems();

        foreach ($items as $item) {
            $aoim = new AdminOrderItemModel();

            $aoim->ID_ADMIN_ORDER = $aom->ID;
            $aoim->ID_ADMIN_PRODUCT = $item->ID_ADMIN_PRODUCT;
            $aoim->QUANTITY = $item->QUANTITY;
            $aoim->PRICE = $item->PRICE;

            $aoim = (new AdminOrderItemController())->save(array($aoim));
        }

        // x. Clear session data
        unset($_SESSION['checkout.data']);
        unset($_SESSION['session.cart']);

        // x. Show order completed page
        header('Location:'.APPLICATION_URL.'/payment/orderCompleted/'.urlencode($aom->UUID));
    }

    function orderCompletedAction() {
        $this->showOrderCompletionPage(false);
    }

    function viewInvoiceAction() {
        $this->showOrderCompletionPage(true);
    }

    function showOrderCompletionPage($is_invoice_mode) {
		list($uuid) = explode('/', $_REQUEST['args']);

        if (empty($uuid)) {
            $this->gotoCartPage();
        }

        // x. Order
        $order = new AdminOrderModel();

        $order->UUID = $uuid;
        $order->find();

        if (!$order->fetch()) {
            $this->gotoCartPage();
        }

        // x. Payment type
        $payment_type = new PaymentTypeModel();

        $payment_type->ID = $order->ID_PAYMENT_TYPE;
        $payment_type->find();

        if (!$payment_type->fetch()) {
            $this->gotoCartPage();
        }

        // x. Order items
        $model = new AdminOrderItemModel();

        $model->selectAdd();
        $model->selectAdd('ADMIN_ORDER_ITEM.*');
        $model->selectAdd('ADMIN_PRODUCT.TITLE AS TITLE');

        $model->joinAdd(new AdminProductModel());
        $model->whereAdd("ID_ADMIN_ORDER = '".$order->ID."'");

        $model->find();

        $items = array();

        while ($model->fetch()) {
            $items[] = clone $model;
        }

        // x. Country name
        $country = new CountryModel();

        $country->ID = $order->CUSTOMER_ID_COUNTRY;
        $country->find();

        if (!$country->fetch()) {
            $this->gotoCartPage();
        }

        $smarty = Framework::getSmarty();

        $smarty->assign('order', $order);
        $smarty->assign('payment_type', $payment_type);
        $smarty->assign('items', $items);
        $smarty->assign('country', $country);

        $smarty->display($is_invoice_mode? 'page.order-invoice.tpl' : 'page.order-completed.tpl');
    }

    function gotoCartPage() {
        header('Location:'.APPLICATION_URL.'/cart');

        exit(0);
    }

    function cronAction() {
        set_time_limit(0);

        // x. Get orders to process
        $model = new AdminOrderModel();

        $model->whereAdd("ID_ADMIN_ORDER_STATUS = 2 OR ID_ADMIN_ORDER_STATUS = 4"); // Paid or Refunded

        $model->find();

        $orders = array();

        while ($model->fetch()) {
            $orders[] = clone $model;
        }

        // x. Process each order
        foreach ($orders as $order) {
            $new_status = 0;

            if ($order->ID_ADMIN_ORDER_STATUS == 2) {
                PluginManager::do_action("order_paid", $order);

                // Update status
                $new_status = 3; // Paid & Processed
            } else if ($order->ID_ADMIN_ORDER_STATUS == 4) {
                PluginManager::do_action("order_refunded", $order);

                // Update status
                $new_status = 5; // Refunded & Processed
            }

            // Update order
            if ($new_status) {
                $model = new AdminOrderModel();

                $model->ID = $order->ID;
                $model->PROCESSED_DATE = date('Y-m-d H:i:s');
                $model->ID_ADMIN_ORDER_STATUS = $new_status;

                $model->update();
            }
        }
    }

    function onOrderPaid($order) {
        // x. Send invoice
        $this->sendInvoice($order);

        // x. Other business specific operations
        // No need to do here. Just let other plugins register to the 'order_paid' event
    }

    function onOrderRefunded($order) {
        // x. Send refund email
        $this->sendRefundEmail($order);

        // x. Other business specific operations
        // No need to do here. Just let other plugins register to the 'order_refunded' event
    }

    function sendInvoice($order) {
        // x. Build invoice
        $content = $this->mailBuildInvoiceHtml($order);

        // x. Send invoice
        $subject = 'Order Confirmation';
        $from = SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>';
        $to = $order->CUSTOMER_EMAIL;

        MailController::queue($subject, $from, $to, $content);
    }

    function mailBuildInvoiceHtml($order) {
        // x. Payment type
        $payment_type = new PaymentTypeModel();

        $payment_type->ID = $order->ID_PAYMENT_TYPE;
        $payment_type->find();
        $payment_type->fetch();

        // x. Order items
        $model = new AdminOrderItemModel();

        $model->selectAdd();
        $model->selectAdd('ADMIN_ORDER_ITEM.*');
        $model->selectAdd('ADMIN_PRODUCT.TITLE AS TITLE');

        $model->joinAdd(new AdminProductModel());
        $model->whereAdd("ID_ADMIN_ORDER = '".$order->ID."'");

        $model->find();

        $items = array();

        while ($model->fetch()) {
            $items[] = clone $model;
        }

        // x. Country name
        $country = new CountryModel();

        $country->ID = $order->CUSTOMER_ID_COUNTRY;
        $country->find();
        $country->fetch();

        $smarty = Framework::getSmarty();

        $smarty->assign('order', $order);
        $smarty->assign('payment_type', $payment_type);
        $smarty->assign('items', $items);
        $smarty->assign('country', $country);

        return $smarty->fetch('.email.order-invoice.tpl');
    }

    function sendRefundEmail($order) {
        // x. Build refund email
        $content = $this->mailBuildRefundEmailHtml($order);

        // x. Send refund email
        $subject = 'Order Refunded';
        $from = SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>';
        $to = $order->CUSTOMER_EMAIL;

        MailController::queue($subject, $from, $to, $content);
    }

    function mailBuildRefundEmailHtml($order) {
        $smarty = Framework::getSmarty();

        $smarty->assign('order', $order);

        return $smarty->fetch('.email.order-refunded.tpl');
    }
}
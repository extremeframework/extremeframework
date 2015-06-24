<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
define('DATA_PASSWORD', '2013');

class ReferralController extends _ReferralController
{
    function indexAction() {
        $c = isset($_REQUEST['c'])? trim($_REQUEST['c']) : '';
        $h = isset($_REQUEST['h'])? trim($_REQUEST['h']) : '';

        if (empty($c)) {
            return parent::indexAction();
        }

        // x. Bot protection by using hash code
        $hash = hash('sha256', $c.date('YmdH'), false);

        // x. Redirect if no hash exists
        if (empty($h)) {
            $uri = isset($_SERVER['REQUEST_URI'])? $_SERVER['REQUEST_URI'] : '';
            $url = $uri."&h=$hash";

            header("refresh:1;url=$url");
            exit;
        }

        // x. Check if valid hash
        if ($h != $hash) {
            $this->simple_page('<p>The request is invalid or out-of-date. Please check again.</p>', 'Invalid request');
        }

        // x. Decode
        $c = base64_decode($c);
        if (!is_numeric($c)) {
            $this->pagenotfound();
        }

        // x. Decrypt the code
        if (!$this->_decrypt($c, $id_referral, $id_user) || empty($id_referral) || empty($id_user)) {
            $this->simple_page('<p>The referral code associated with this request is invalid.</p><p>Please check to ensure the request address is correct.</p>', 'Invalid referral code');
        }

        // x. Get the referral
        $rm = new ReferralModel();

        $rm->ID = $id_referral;
        $rm->find();

        if (!$rm->fetch() || empty($rm->TARGET_URL)) {
            $this->simple_page('<p>The page corresponding with this request no longer exists.</p>', 'Page not found');
        }

        // x. Insert referral log
        $rlm = new ReferralLogModel();

        $rlm->ID_USER = $id_user;
        $rlm->ID_REFERRAL = $id_referral;
        $rlm->REFERER = isset($_SERVER['HTTP_REFERER'])? $_SERVER['HTTP_REFERER'] : '';
        $rlm->IP_ADDRESS = isset($_SERVER['REMOTE_ADDR'])? $_SERVER['REMOTE_ADDR'] : '';
        $rlm->DATE = date('Y-m-d');

        $rlm->insert();

        // x. Keep track of referral information in the session
        $ru = new stdClass();

        $ru->ID_USER = intval($id_user);
        $ru->ID_REFERRAL = intval($id_referral);

        $_SESSION['referral_user'] = $ru;

        // x. Redirect to the target link
        header('Location: '.$rm->TARGET_URL);
    }

    function get_referral_link($id_referral) {
        $c = base64_encode($this->_encrypt($id_referral, $_SESSION['user']->ID));

        return APPLICATION_URL.'/referral?c='.$c;
    }

    function _encrypt($id_referral, $id_user) {
        $decstr = '';

        $decstr .= str_pad($id_referral, 3, '0', STR_PAD_LEFT);
        $decstr .= str_pad($id_user, 7, '0', STR_PAD_LEFT);
        $decstr .= EncryptionHelper::numeric_hash($decstr, 4);

        return EncryptionHelper::simple_encrypt($decstr, DATA_PASSWORD);
    }

    function _decrypt($encrypted, &$id_referral, &$id_user) {
        $id_referral = null;
        $id_user = null;

        $decstr = EncryptionHelper::simple_decrypt($encrypted, DATA_PASSWORD);

        if (substr($decstr, 10, 4) ==  EncryptionHelper::numeric_hash(substr($decstr, 0, 10), 4)) {
            $id_referral = substr($decstr, 0, 3);
            $id_user = substr($decstr, 3, 7);

            return true;
        }

        return false;
    }

    function setupAdditionalData(&$model) {
		$model->REFERRAL_LINK = $this->get_referral_link($model->ID);
    }

    function setupAdditionalViewFields($model) {
        $fields = array();

        $fields[] = array('label' => 'Referral link', 'type' => 'text', 'value' => '<a href="'.$model->REFERRAL_LINK.'" target="_blank">'.$model->REFERRAL_LINK.'</a>');

        return $fields;
    }
}
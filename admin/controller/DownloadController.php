<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class DownloadController extends _DownloadController
{
    const ACCESS_PUBLIC = 1;
    const ACCESS_PRIVATE = 2;
    const ACCESS_REFERRALS = 3;

    function indexAction() {
        $id = isset($_REQUEST['id'])? trim($_REQUEST['id']) : '';

        if (empty($id)) {
            return parent::indexAction();
        }

        // x. Decode
        $id = base64_decode($id);
        if (!is_numeric($id)) {
            $this->pagenotfound();
        }

        // x. Get download information
        $model = new DownloadModel();

        $model->ID = $id;
        $model->find();

        if (!$model->fetch()) {
            $this->pagenotfound();
        }

        $filepath = UPLOAD_DIR.'/'.$model->FILE;
        $permission = $model->ID_ACCESS_PERMISSION;
        $id_referral = $model->ID_REFERRAL;
        $required_referral_count = $model->REQUIRED_REFERRAL_COUNT;

        // x. Check access permission
        switch ($permission) {
            case self::ACCESS_PUBLIC:
                $this->_dump($filepath, $id);
                break;

            case self::ACCESS_PRIVATE:
                AuthenticationController::authenticate();
                $this->_dump($filepath, $id);

                break;

            case self::ACCESS_REFERRALS:
                AuthenticationController::authenticate();

                // x. Get the current referral count of the user for the target referral
                $rlm = new ReferralLogModel();

                $rlm->ID_USER = $_SESSION['user']->ID;
                $rlm->ID_REFERRAL = $id_referral;

                $rlm->find();
                $count = $rlm->N;

                // x. Check the current referral count
                $count_ok = $count >= $required_referral_count;

                if ($count_ok) {
                    $this->_dump($filepath, $id);
                } else {
                    $rc = new ReferralController();
                    $referral_link = $rc->get_referral_link($id_referral);

                    $smarty = Framework::getSmarty();

                    $smarty->assign('required_referral_count', $required_referral_count);
                    $smarty->assign('current_referral_count', $count);
                    $smarty->assign('referral_link', $referral_link);

                    $smarty->display('download.insufficient-referrals.tpl');

                    return;
                }

                break;

            default:
                AuthenticationController::authenticate();
                $this->_dump($filepath, $id);

                break;
        }
    }

    function _dump($filepath, $id_download) {
        if (!file_exists($filepath)) {
            $this->simple_page('<p>The file you are going to download does not exist or it has been removed.</p>', 'File not found');
        }

        $filename = basename($filepath);

        // x. Insert download log
        $dlm = new DownloadLogModel();

        $dlm->ID_USER = isset($_SESSION['user'])? $_SESSION['user']->ID : null;
        $dlm->ID_DOWNLOAD = $id_download;
        $dlm->REFERER = isset($_SERVER['HTTP_REFERER'])? $_SERVER['HTTP_REFERER'] : '';
        $dlm->IP_ADDRESS = isset($_SERVER['REMOTE_ADDR'])? $_SERVER['REMOTE_ADDR'] : '';
        $dlm->DATE = date('Y-m-d H:i:s');

        $dlm->insert();

        // x. Download
        header('Content-Disposition: attachment; filename="'.$filename.'"');
        header('Content-Type: application/force-download');
        header('Content-Type: application/octet-stream');
        header('Content-Type: application/download');
        header('Content-Length: '.filesize($filepath));

        readfile($filepath);
    }

    function setupAdditionalData(&$model) {
		$model->PUBLIC_LINK = APPLICATION_URL.'/download?id='.base64_encode(str_pad($model->ID, 8, '0', STR_PAD_LEFT));
    }

    function setupAdditionalViewFields($model) {
        $fields = array();

        $fields[] = array('label' => 'Public link', 'type' => 'text', 'value' => '<a href="'.$model->PUBLIC_LINK.'" target="_blank">'.$model->PUBLIC_LINK.'</a>');

        return $fields;
    }
}
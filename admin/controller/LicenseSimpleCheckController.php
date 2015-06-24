<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class LicenseSimpleCheckController extends LicenseLiveCheckController
{
    function checkAction() {
        // x. Get request data
        $data = isset($_REQUEST['k'])? $_REQUEST['k'] : '';

        if (empty($data)) {
            echo 'Invalid request';

            return;
        }

        // x. Decode request data
        $base64_decoded = base64_decode($data);

        // x. Parse data (serial_key|referer)
        $parts = explode('|', $base64_decoded);

        if (count($parts) != 2) {
            echo 'Invalid request';

            return;
        }

        list($serial_key, $referer) = $parts;

        $error = '';

        $referer_domain = self::get_domain_name($referer);
        $referer_machine_code = self::encrypt_machine_code($referer_domain);

        // x. Check serial key
        if (empty($error)) {
            $ulm = new UserLicenseModel();

            $ulm->SERIAL_KEY = $serial_key;
            $ulm->MACHINE_CODE = $referer_machine_code;

            $ulm->find();
            $ulm->fetch();

            if (!$ulm->ID) {
                $error = 'License not found';
            }
        }

        // x. Check if the license is disabled
        if (empty($error)) {
            if ($ulm->IS_DISABLED) {
                $error = 'License disabled or transfered';
            }
        }

        // x. Check if the license is expired
        if (empty($error)) {
            if ($ulm->EXPIRY_DATE < date('Y-m-d')) {
                $error = 'License expired';
            }
        }

        // x. Response data
        $response = empty($error)? 'OK' : $error;

        // x. Encrypt response data
        $encrypted_reponse = base64_encode($response);

        // x. Return
        echo $encrypted_reponse;
    }

    function getMachineCodeAction() {
        // x. Get request data
        $data = isset($_REQUEST['k'])? $_REQUEST['k'] : '';

        if (empty($data)) {
            return;
        }

        // x. Decode request data
        $domain_name = base64_decode($data);

        // x. Return machine code
        $machine_code = self::encrypt_machine_code($domain_name);

        echo $machine_code;
    }
}
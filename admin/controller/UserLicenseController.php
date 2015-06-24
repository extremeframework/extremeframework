<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
require_once('GetResponse/GetResponseApi.php');

class UserLicenseController extends _UserLicenseController
{
    function generateEvaluationLicense($id_user, $id_product, $encrypted_machine_code) {
        $id_license_type = 1;
        $id_license_feature = 1;// None

        // x. Get license type information
        $lym = new LicenseTypeModel();
        $lym->ID = $id_license_type;
        $lym->find();
        if (!$lym->fetch()) {
            return 'License creation error';
        }

        // x. License days
        $max_days = $lym->MAX_DAYS;

        // x. Expiry date
        if ($max_days != 0) {
            $sign = $max_days > 0? '+' : '-';

            if ($max_days == -1 || $max_days == 1) {
                $max_date = date('Ymd', strtotime($sign."1 day"));
            } else {
                $max_date = date('Ymd', strtotime($sign."$max_days days"));
            }
        } else {
            $max_date = date('Ymd', strtotime("+1 year"));
        }

        // x. Check machine code
        $machine_code = $this->decryptMachineCode($encrypted_machine_code);
        if (empty($machine_code)) {
            return 'Invalid machine code';
        }

        // x. Check if any active license still existings
        if ($this->activeLicenseExists($id_user, $id_product, $encrypted_machine_code, $id_license_type, $id_license_feature)) {
            return 'Active license exists';
        }

        // x. Generate serial key
        $expiry_date = substr($max_date, 2);
        $serial_key = $this->generateSerialKey($id_user, $id_product, $id_license_type, $id_license_feature, $machine_code, $expiry_date);
        if (empty($serial_key)) {
            return 'Serial key creation error';
        }

        // x. Save license
        $ulm = new UserLicenseModel();

        $ulm->ID_USER = $id_user;
        $ulm->ID_PRODUCT = $id_product;
        $ulm->ID_LICENSE_TYPE = $id_license_type;
        $ulm->ID_LICENSE_FEATURE = $id_license_feature;
        $ulm->MACHINE_CODE = $encrypted_machine_code;
        $ulm->SERIAL_KEY = $serial_key;
        $ulm->EXPIRY_DATE = $max_date;
        $ulm->CREATION_DATE = date('Y-d-m H:i:s');
        $ulm->IS_DISABLED = false;
        $ulm->GUID = $id_user;

        $ulm->insert();

        // x. Sync to GetResponse's mailing list
        $this->addToGetResponse($id_user);
    }

    function generateProLicense($id_user, $id_product, $id_license_type, $encrypted_machine_code, $id_license_feature) {
        // x. Get license type information
        $lym = new LicenseTypeModel();
        $lym->ID = $id_license_type;
        $lym->find();
        if (!$lym->fetch()) {
            return 'License creation error (code = 1)';
        }

        // x. Check machine code
        $machine_code = $this->decryptMachineCode($encrypted_machine_code);
        if (empty($machine_code)) {
            return 'Invalid machine code';
        }

        // x. Ensure user license limit
        $ullm = new UserLicenseLimitModel();

        $ullm->ID_USER = $id_user;
        $ullm->ID_PRODUCT = $id_product;
        $ullm->ID_LICENSE_TYPE = $id_license_type;
        $ullm->ID_LICENSE_FEATURE = $id_license_feature;

        $ullm->find();
        if (!$ullm->fetch()) {
            return 'No license quota for the specified settings';
        }

        if ($ullm->AVAIL_LICENCES < 1) {
            return 'License quota reached. No license available.';
        }

        // x. License days
        $max_days = $lym->MAX_DAYS;

        // x. Expiry date
        if ($max_days != 0) {
            $sign = $max_days > 0? '+' : '-';

            if ($max_days == -1 || $max_days == 1) {
                $max_date = date('Ymd', strtotime($sign."1 day"));
            } else {
                $max_date = date('Ymd', strtotime($sign."$max_days days"));
            }
        } else {
            $max_date = date('Ymd', strtotime("+1 year"));
        }

        // x. Check if any active license still existings
        if ($this->activeLicenseExists($id_user, $id_product, $encrypted_machine_code, $id_license_type, $id_license_feature)) {
            return 'Active license exists';
        }

        // x. Generate serial key
        $expiry_date = substr($max_date, 2);
        $serial_key = $this->generateSerialKey($id_user, $id_product, $id_license_type, $id_license_feature, $machine_code, $expiry_date);
        if (empty($serial_key)) {
            return 'Serial key creation error';
        }

        // x. Save license
        $ulm = new UserLicenseModel();

        $ulm->ID_USER = $id_user;
        $ulm->ID_PRODUCT = $id_product;
        $ulm->ID_LICENSE_TYPE = $id_license_type;
        $ulm->ID_LICENSE_FEATURE = $id_license_feature;
        $ulm->MACHINE_CODE = $encrypted_machine_code;
        $ulm->SERIAL_KEY = $serial_key;
        $ulm->EXPIRY_DATE = $max_date;
        $ulm->CREATION_DATE = date('Y-d-m H:i:s');
        $ulm->IS_DISABLED = false;
        $ulm->GUID = $id_user;

        $ulm->insert();

        // x. Update user license limit
        $ullm->AVAIL_LICENCES -= 1;
        $ullm->update();
    }

    function generateOfficialTrialLicense($id_user, $id_product, $id_license_type, $encrypted_machine_code, $id_license_feature) {
        // x. Get license type information
        $ltm = new LicenseTypeModel();
        $ltm->ID = $id_license_type;
        $ltm->find();
        if (!$ltm->fetch()) {
            return 'License creation error (code = 1)';
        }

        // x. Check machine code
        $machine_code = $this->decryptMachineCode($encrypted_machine_code);
        if (empty($machine_code)) {
            return 'Invalid machine code';
        }

        // x. Ensure that the same machine, the same license type does not exist
        $ulm = new UserLicenseModel();

        $ulm->ID_PRODUCT = $id_product;
        $ulm->ID_LICENSE_TYPE = $id_license_type;
        $ulm->ID_LICENSE_FEATURE = $id_license_feature;
        $ulm->MACHINE_CODE = $encrypted_machine_code;

        $ulm->find();
        if ($ulm->fetch()) {
            return 'A trial license is already generated for the machine';
        }

        // x. License days
        $max_days = $ltm->MAX_DAYS;

        // x. Expiry date
        if ($max_days != 0) {
            $sign = $max_days > 0? '+' : '-';

            if ($max_days == -1 || $max_days == 1) {
                $max_date = date('Ymd', strtotime($sign."1 day"));
            } else {
                $max_date = date('Ymd', strtotime($sign."$max_days days"));
            }
        } else {
            $max_date = date('Ymd', strtotime("+1 year"));
        }

        // x. Generate serial key
        $expiry_date = substr($max_date, 2);
        $serial_key = $this->generateSerialKey($id_user, $id_product, $id_license_type, $id_license_feature, $machine_code, $expiry_date);
        if (empty($serial_key)) {
            return 'Serial key creation error';
        }

        // x. Save license
        $ulm = new UserLicenseModel();

        $ulm->ID_USER = $id_user;
        $ulm->ID_PRODUCT = $id_product;
        $ulm->ID_LICENSE_TYPE = $id_license_type;
        $ulm->ID_LICENSE_FEATURE = $id_license_feature;
        $ulm->MACHINE_CODE = $encrypted_machine_code;
        $ulm->SERIAL_KEY = $serial_key;
        $ulm->EXPIRY_DATE = $max_date;
        $ulm->CREATION_DATE = date('Y-d-m H:i:s');
        $ulm->IS_DISABLED = false;
        $ulm->GUID = $id_user;

        $ulm->insert();
    }

    function transferLicense($id_user, $id_product, $encrypted_machine_code, $current_serial_key) {
        // x. Get details of the existing license
        $current = new UserLicenseModel();

        $current->ID_USER = $id_user;
        $current->ID_PRODUCT = $id_product;
        $current->SERIAL_KEY = $current_serial_key;
        $current->whereAdd('IS_DISABLED IS NULL OR IS_DISABLED = 0');

        $current->find();
        $current_exists = $current->fetch();

        if (!$current_exists) {
            return 'The given license is invalid or unavailable (disabled or transfered)';
        }

        if ($current->EXPIRY_DATE < date('Y-m-d')) {
            return 'The given license key is already expired';
        }

        // x. Check machine code
        $machine_code = $this->decryptMachineCode($encrypted_machine_code);
        if (empty($machine_code)) {
            return 'Invalid machine code';
        }

        // x. Check if the same machine code
        if ($encrypted_machine_code == $current->MACHINE_CODE) {
            return 'Not a new machine code';
        }

        // x. Check if the current license is a 'tranfered' license
        $transfer = new UserLicenseTransferModel();

        $transfer->ID_USER = $current->ID_USER;
        $transfer->ID_PRODUCT = $current->ID_PRODUCT;
        $transfer->ID_LICENSE_TYPE = $current->ID_LICENSE_TYPE;
        $transfer->SERIAL_KEY = $current->SERIAL_KEY;

        $transfer->orderBy('DATE DESC');    // Important: Check the latest transfer
        $transfer->find();

        $transfer_exists = $transfer->fetch();

        $use_license_transfer_credits = false;

        // Limit one license transfer per month
        if ($transfer_exists) {
            $transfer_month = substr($transfer->DATE, 0, 7);    // yyyy-mm
            $now_month = date('Y-m');

            if ($transfer_month == $now_month) {
                // Check if having license transfer credit
                $ullm = new UserLicenseLimitModel();

                $ullm->ID_USER = $current->ID_USER;
                $ullm->ID_PRODUCT = $current->ID_PRODUCT;
                $ullm->ID_LICENSE_TYPE = 5; // TODO - Id of license transfer type

                $ullm->find();

                $has_license_transfer_credits = $ullm->fetch() && $ullm->AVAIL_LICENCES > 0;

                if ($has_license_transfer_credits) {
                    $use_license_transfer_credits = true;
                } else {
                    return 'Only one free license transfer is allowed in a month. The given license has been transfered once during this month.';
                }
            }
        }

        // x. Generate serial key
        $expiry_date = substr(str_replace('-', '', $current->EXPIRY_DATE), 2);

        $serial_key = $this->generateSerialKey($current->ID_USER, $current->ID_PRODUCT, $current->ID_LICENSE_TYPE, $current->ID_LICENSE_FEATURE, $machine_code, $expiry_date);
        if (empty($serial_key)) {
            return 'Serial key creation error';
        }

        // x. Create new license
        $new = new UserLicenseModel();

        $new->ID_USER = $current->ID_USER;
        $new->ID_PRODUCT = $current->ID_PRODUCT;
        $new->ID_LICENSE_TYPE = $current->ID_LICENSE_TYPE;
        $new->ID_LICENSE_FEATURE = $current->ID_LICENSE_FEATURE;
        $new->MACHINE_CODE = $encrypted_machine_code;
        $new->SERIAL_KEY = $serial_key;
        $new->EXPIRY_DATE = $current->EXPIRY_DATE;
        $new->CREATION_DATE = date('Y-d-m H:i:s');
        $new->IS_DISABLED = false;
        $new->GUID = $current->GUID;

        $new->insert();

        // x. Disable the current license
        $current->IS_DISABLED = true;
        $current->update();

        // x. Record this license transfer
        $log = new UserLicenseTransferModel();

        $log->ID_USER = $current->ID_USER;
        $log->ID_PRODUCT = $current->ID_PRODUCT;
        $log->ID_LICENSE_TYPE = $current->ID_LICENSE_TYPE;
        $log->CURRENT_SERIAL_KEY = $current->SERIAL_KEY;
        $log->NEW_MACHINE_CODE = $new->MACHINE_CODE;
        $log->NEW_SERIAL_KEY = $new->SERIAL_KEY;
        $log->DATE = date('Y-m-d H:i:s');
        $log->GUID = $current->ID_USER;

        $log->insert();

        // x. Update license transfer credits
        if ($use_license_transfer_credits) {
            $ullm->AVAIL_LICENCES -= 1;
            $ullm->update();
        }
    }

    function generateTrialLicense($id_user, $id_product, $max_date_Ymd, $encrypted_machine_code) {
        $id_license_type = 4;// Professional (see: http://www.intelligenceextreme.com/licensetype/)
        $id_license_feature = 1; // None

        // x. Check machine code
        $machine_code = $this->decryptMachineCode($encrypted_machine_code);

        if (empty($machine_code)) {
            return 'Invalid machine code';
        }

        // x. Check if any active license still existings
        if ($this->activeLicenseExists($id_user, $id_product, $encrypted_machine_code, $id_license_type, $id_license_feature)) {
            return 'Active license exists';
        }

        // x. Generate serial key
        $expiry_date = substr($max_date_Ymd, 2);

        $serial_key = $this->generateSerialKey($id_user, $id_product, $id_license_type, $id_license_feature, $machine_code, $expiry_date);

        if (empty($serial_key)) {
            return 'Serial key creation error';
        }

        // x. Save license
        $ulm = new UserLicenseModel();

        $ulm->ID_USER = $id_user;
        $ulm->ID_PRODUCT = $id_product;
        $ulm->ID_LICENSE_TYPE = $id_license_type;
        $ulm->ID_LICENSE_FEATURE = $id_license_feature;
        $ulm->MACHINE_CODE = $encrypted_machine_code;
        $ulm->SERIAL_KEY = $serial_key;
        $ulm->EXPIRY_DATE = $max_date_Ymd;
        $ulm->CREATION_DATE = date('Y-d-m H:i:s');
        $ulm->IS_DISABLED = false;
        $ulm->GUID = $id_user;

        $ulm->insert();
    }

    function decryptMachineCode($encrypted_machine_code) {
        return SerialKeyHelper::decrypt_machine_code($encrypted_machine_code);
    }

    function activeLicenseExists($id_user, $id_product, $machine_code, $id_license_type, $id_license_feature) {
        $ulm = new UserLicenseModel();

        $ulm->ID_USER = $id_user;
        $ulm->ID_PRODUCT = $id_product;
        $ulm->ID_LICENSE_TYPE = $id_license_type;
        $ulm->ID_LICENSE_FEATURE = $id_license_feature;
        $ulm->MACHINE_CODE = $machine_code;

        $ulm->whereAdd('EXPIRY_DATE >='.date('Ymd'));

        $ulm->find();

        if ($ulm->fetch()) {
            return true;
        }

        return false;
    }

    function generateSerialKey($id_user, $id_product, $id_license_type, $id_license_feature, $machine_code, $expiry_date) {
        $serial_info = new SerialInfo();

        $serial_info->id_user = $id_user;
        $serial_info->id_product = $id_product;
        $serial_info->id_license_type = $id_license_type;
        $serial_info->features = $id_license_feature;
        $serial_info->machine_code = $machine_code;
        $serial_info->expiry_date = $expiry_date;

        return SerialKeyHelper::encrypt_serial_info($serial_info);
    }

    function addToGetResponse($id_user) {
		$model = new UserModel();
		$model->ID = $id_user;
        $model->find();

        if (!$model->fetch()) {
            return false;
        }

        $getresponse = new GetResponseApi(GETRESPONSE_API_KEY);

        $result = $getresponse->add_contact(GETRESPONSE_CAMPAIGN_SEOMACHINELITE, $model->NAME, $model->EMAIL);

        if (!isset($result['queued']) || $result['queued'] != 1) {
            // TODO - Error handling here
        }

        return true;
    }

    function applyLicenseGiftCode($code) {
        // x. Check if the gift code exists
        $gift = new LicenseGiftModel();

        $gift->GIFT_CODE = $code;

        $gift->find();
        $gift->fetch();

        if (!$gift->ID) {
            return 'Invalid gift code. Please check again.';
        }

        // x. Get product information
        $pmxm = new ProductMixModel();

        $pmxm->ID = $gift->ID_PRODUCT_MIX;

        $pmxm->find();
        $pmxm->fetch();

        if (!$pmxm->ID) {
            return 'Unexpected error :: Product information not found.';
        }

        if (!($pmxm->NBR_LICENSES > 0)) {
            return 'Unexpected error :: No license count.';
        }

        // x. Check if the user is entitled to use the code
        $holder = new LicenseGiftHolderModel();

        $holder->ID_LICENSE_GIFT = $gift->ID;
        $holder->EMAIL = $_SESSION['user']->EMAIL;

        $holder->find();
        $holder->fetch();

        if (!$holder->ID) {
            return 'You are not entitled to apply the gift code. Please check again.';
        }

        // x. Check if the available date of the gift code
        if (!empty($gift->VALID_FROM) && $gift->VALID_FROM > date('Y-m-d H:i:s')) {
            return 'The gift code is not in effective yet. Please check and apply it after '.$gift->VALID_FROM.'.';
        }

        // x. Check if the gift code is already applied
        if (!empty($holder->DATE_ACCEPTED)) {
            return 'The gift code is already applied.';
        }

        // x. Check if expired gift code
        if (!empty($gift->VALID_UNTIL) && $gift->VALID_UNTIL < date('Y-m-d H:i:s')) {
            return 'The gift code is already expired.';
        }

        $id_user = $_SESSION['user']->ID;

        // x. Get product membership information
        $pmm = new ProductMembershipModel();

        $pmm->ID_PRODUCT_MIX = $gift->ID_PRODUCT_MIX;

        $pmm->find();

        $memberships = array();
        while ($pmm->fetch()) {
            $memberships[] = clone $pmm;
        }

        // x. Add user to the user group corresponding to the purchased product
        foreach ($memberships as $membership) {
            $valid_from = null;
            $valid_until = null;

            if ($membership->MAX_DAYS > 0) {
                $valid_from = date('Y-m-d H:i:s');

                if ($membership->MAX_DAYS == 1) {
                    $valid_until = date('Y-m-d H:i:s', strtotime("+1 day"));
                } else {
                    $valid_until = date('Y-m-d H:i:s', strtotime("+{$membership->MAX_DAYS} days"));
                }
            }

		    if (!UserMembershipController::addUserToGroup($_SESSION['user'], $membership->ID_USER_GROUP, $valid_from, $valid_until)) {
                return('Cannot initiate user membership');
            }
        }

        // x. Insert/update license limit information
        if ($pmxm->NBR_LICENSES > 0) {
            // x. Get existing item
            $ullm = new UserLicenseLimitModel();

            $ullm->ID_USER = $id_user;
            $ullm->ID_PRODUCT = $pmxm->ID_PRODUCT;
            $ullm->ID_LICENSE_TYPE = $pmxm->ID_LICENSE_TYPE;
            $ullm->ID_LICENSE_FEATURE = $pmxm->ID_LICENSE_FEATURE;

            $ullm->find();
            $ullm->fetch();

            // x. Insert if not existing
            if (!$ullm->ID) {
                $ullm->AVAIL_LICENCES = $pmxm->NBR_LICENSES;
                $ullm->LATEST_RECEIPT = $code;
                $ullm->DATE = date('Y-m-d H:i:s');
                $ullm->GUID = $id_user;

                $ullm->insert();
            } else {
                // x. Just update in case of different latest receipt information
                if ($ullm->LATEST_RECEIPT !== $code) {

                    $ullm->AVAIL_LICENCES += $pmxm->NBR_LICENSES;
                    $ullm->LATEST_RECEIPT = $code;
                    $ullm->DATE = date('Y-m-d H:i:s');

                    $ullm->update();
                }
            }
        }

        // x Mark it as applied
        $holder->DATE_ACCEPTED = date('Y-m-d H:i:s');
        $holder->HOLDER_ID_USER = $id_user;

        $holder->update();

        // x. Return message
        $message = 'Congratulation! Your gift code has been applied. Please check your license quota for the update.';

        return $message;
    }
}
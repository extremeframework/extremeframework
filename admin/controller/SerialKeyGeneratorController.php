<?php
class SerialKeyGeneratorController
{
    function indexAction() {
        if (isset($_REQUEST['c'])) {
            $id_user = 1; // Admin
            $id_product = 2; // Test version
            $encrypted_machine_code = $_REQUEST['c'];
            $serial = $this->generateProfessionalLicense($id_user, $id_product, $encrypted_machine_code);

            echo "Serial key = ".$serial;
        }
    }

    function generateProfessionalLicense($id_user, $id_product, $encrypted_machine_code) {
        $id_license_type = 4;// Professional (see: http://www.intelligenceextreme.com/licensetype/)
        $id_license_feature = 2;// Free update

        // x. License days
        $max_days = 30;

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

        // x. Generate serial key
        $expiry_date = substr($max_date, 2);

        $serial_key = $this->generateSerialKey($id_user, $id_product, $id_license_type, $id_license_feature, $machine_code, $expiry_date);

        if (empty($serial_key)) {
            return 'Serial key creation error';
        }

        return $serial_key;
    }

    function decryptMachineCode($encrypted_machine_code) {
        return SerialKeyHelper::decrypt_machine_code($encrypted_machine_code);
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
}
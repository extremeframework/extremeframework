<?php
define('LICENSE_CHECK_HANDSHAKE_URL', 'http://www.intelligenceextreme.com/licenseLiveCheck/handshake');
define('LICENSE_CHECK_CHECK_URL', 'http://www.intelligenceextreme.com/licenseLiveCheck/check');
define('LICENSE_ONLINE_CREATION_URL', 'http://www.intelligenceextreme.com/scopes/license/pro');
define('LICENSE_CHECK_INTERVAL', 600);

require_once('pCURL.php');

class LicenseController {
    static function enforceLicenseCheck($module = '', $force_checking_now = false) {
        $timestamp = isset($_SESSION['license.timestamp'])? $_SESSION['license.timestamp'] : '';
        $message = isset($_SESSION['license.message'])? $_SESSION['license.message'] : '';

        $ok = true;

        if (!empty($message)) {
           $ok = false;
        }

        if ($force_checking_now || !empty($timestamp) && (time() - $timestamp > LICENSE_CHECK_INTERVAL)) {
            $ok = self::check_license(LICENSE_KEY, $error);
        }

        if (!$ok) {
            header('Location:'.APPLICATION_URL.'/license/notice');

            exit(0);
        }
    }

    function checkAction() {
        $ok = self::check_license(LICENSE_KEY, $message);

        echo json_encode(array('success' => $ok, 'message' => $message, 'timestamp' => $_SESSION['license.timestamp']));
    }

    function noticeAction() {
        $ok = self::check_license(LICENSE_KEY, $message);

        if ($ok) {
            header('Location:'.APPLICATION_URL);

            return;
        }

        $message = isset($_SESSION['license.message'])? $_SESSION['license.message'] : '';
        $license_key = isset($_POST['license_key'])? $_POST['license_key'] : '';
        $license_domain = self::get_license_domain();
        $machine_code = self::encrypt_machine_code($license_domain);

        if (!empty($_POST)) {
            $ok = self::check_license($license_key, $message);

            if ($ok) {
                // x. Write config file
                $filepath = SHARED_DIR.'/app_config.php';
                $content = file_get_contents($filepath);

                preg_match('/(define[^;]*LICENSE_KEY[^;]*;)/is', $content, $match);

                $s = $match[0];
                $r = "define('LICENSE_KEY'                            , '$license_key');";

                $content = str_replace($s, $r, $content);

                file_put_contents($filepath, $content);

                // x. Redirect
                header('Location:'.APPLICATION_URL);
            }
        }

        $smarty = Framework::getSmarty();

        $smarty->assign('message', $message);
        $smarty->assign('license_key', $license_key);
        $smarty->assign('machine_code', $machine_code);

	    $smarty->display('license.error.tpl');
    }

    function get_license_domain() {
        return $_SERVER['HTTP_HOST'];
    }

    function check_license($serial_key, &$error = '') {
        $error = '';

        // x. Handshake
        $date = date('Y-m-d');
        $date_md5 = md5($date);
        $request = "HANDSHAKE|$date_md5";
        $request_base64 = base64_encode($request);

        $content = pCURL::download(LICENSE_CHECK_HANDSHAKE_URL, "k=$request_base64");

        // x. Error checking
        if (empty($content)) {
            $error = "License checking error.";

            return false;
        }

        // x. Extract data
        $content_base64_decode = base64_decode($content);

        $parts = explode("|", $content_base64_decode);

        if (count($parts) != 4) {
            $error = "License checking error.";

            return false;
        }

        $p = $parts[0];
        $g = $parts[1];
        $exchange_php = $parts[2];
        $session_key = $parts[3];

        // Generate a private value
        $private_number = self::create_private_number();

        // Compute exchange value
        $exchange_c = bcpowmod($g, $private_number, $p);

        // Compute shared secret key
        $shared_secret_key = bcpowmod($exchange_php, $private_number, $p);

        // Data string
        $license_domain = self::get_license_domain();
        $machine_code = self::encrypt_machine_code($license_domain);
        $data = "$serial_key|$machine_code";

        // Encrypt data
        $data_encrypted = EncryptionHelper::rijndael_encrypt($data, $shared_secret_key);

        // Request data
        $check_request = "$data_encrypted|$exchange_c|$session_key";
        $check_request_base64 = base64_encode($check_request);

        // Send request
        $encrypted_response = pCURL::download(LICENSE_CHECK_CHECK_URL, "k=$check_request_base64");

        // Decrypt
        $response = EncryptionHelper::rijndael_decrypt($encrypted_response, $shared_secret_key);

        // x. Check response
        $result = ($response == "OK");

        if (!$result) {
            $error = $response;
        }

        // x. Record timestamp
        $_SESSION['license.timestamp'] = time();
        $_SESSION['license.message'] = $error;

        return $result;
    }

    function create_private_number() {
        return rand(0, 100);
    }

    function encrypt_machine_code($machine_code) {
        $machine_code = EncryptionHelper::numeric_hash($machine_code, 7);

        return EncryptionHelper::my_encrypt($machine_code, DATA_PASSWORD, DATA_HASHSIZE, DATA_BLOCKSIZE, false);
    }
}
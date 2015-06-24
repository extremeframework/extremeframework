<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
function dec2base($dec, $base, $digits=FALSE) {
	if ($base<2 or $base>256) {
		die("Invalid Base: ".$base);
	}

	bcscale(0);
	$value="";
	if (!$digits) {
		$digits = digits($base);
	}

	while ($dec > $base-1) {
		$rest = bcmod($dec, $base);
		$dec = bcdiv($dec, $base);
		$value = $digits[$rest].$value;
	}

	$value=$digits[intval($dec)].$value;

	return (string)$value;
}

function base2dec($value, $base, $digits=FALSE) {
	if ($base<2 or $base>256) {
		die("Invalid Base: ".$base);
	}

	bcscale(0);
	if ($base<37) {
		$value=strtolower($value);
	}

	if (!$digits) {
		$digits=digits($base);
	}

	$size = strlen($value);
	$dec="0";
	for ($loop=0; $loop<$size; $loop++) {
		$element = strpos($digits, $value[$loop]);
		$power = bcpow($base, $size-$loop-1);
		$dec = bcadd($dec, bcmul($element,$power));
	}

	return (string)$dec;
}

function digits($base) {
	if ($base>64) {
		$digits="";
		for ($loop=0; $loop<256; $loop++) {
			$digits.=chr($loop);
		}
	} else {
		$digits ="0123456789abcdefghijklmnopqrstuvwxyz";
		$digits.="ABCDEFGHIJKLMNOPQRSTUVWXYZ-_";
	}

	$digits=substr($digits,0,$base);

	return (string)$digits;
}

class LicenseLiveCheckController
{
    function handshakeAction() {
        // x. Check timestamp
        $data = isset($_REQUEST['k'])? $_REQUEST['k'] : '';

        if (empty($data)) {
            echo 'Invalid request';

            return;
        }

        // x. Decode request data
        $base64_decoded = base64_decode($data);

        // x. Parse data (HANDSHAKE|date_md5)
        $parts = explode('|', $base64_decoded);

        if (count($parts) != 2) {
            echo 'Invalid request';

            return;
        }

        list($action, $date_md5) = $parts;

        // x. Data checking
        if ($action != 'HANDSHAKE' || md5(gmdate('Y-m-d')) != $date_md5) {
            echo 'Invalid request';

            return;
        }

        // x. Create P and G
        $p = $this->create_p();
        $g = $this->create_g();

        // x. Create a private number
        $private_number = $this->create_private_number();

        // x. Create an exchange key
        $exchange_php = $this->create_exchange_key($p, $g, $private_number);

        // x. Create a session key
        $session_key = $this->create_session_key();

        // x. Store session key and private number to the database
        $model = new LicenseCheckSessionModel();

        $model->IP = $_SERVER['REMOTE_ADDR'];
        $model->SESSION_KEY = $session_key;
        $model->PRIVATE_KEY = $private_number;
        $model->PRIME = $p;
        $model->DATE = date('Y-m-d H:i:s');

        $model->insert();

        // x. Return a base64 encode of p|g|exchange_php|session_key
        echo base64_encode("$p|$g|$exchange_php|$session_key");
    }

    function checkAction() {
        // x. Get request data
        $data = isset($_REQUEST['k'])? $_REQUEST['k'] : '';

        if (empty($data)) {
            echo 'Invalid request';

            return;
        }

        // x. Decode request data
        $base64_decoded = base64_decode($data);

        // x. Parse data (encrypted|exchange_c|session_key)
        $parts = explode('|', $base64_decoded);

        if (count($parts) != 3) {
            echo 'Invalid request';

            return;
        }

        list($encrypted, $exchange_c, $session_key) = $parts;

        // x. Get session information
        $model = new LicenseCheckSessionModel();

        $model->SESSION_KEY = $session_key;

        $model->find();
        $model->fetch();

        if (!$model->ID) {
            echo 'Invalid request';

            return;
        }

        // x. Get associated private key of the session
        $private_number = $model->PRIVATE_KEY;
        $p = $model->PRIME;

        // x. Get the shared secret key
        $shared_secret_key = bcpowmod($exchange_c, $private_number, $p);

        // x. Decode request data
        $decrypted = EncryptionHelper::rijndael_decrypt($encrypted, $shared_secret_key);

        // x. Parse data (serial_key|machine_code)
        $parts = explode('|', $decrypted);

        if (count($parts) != 2) {
            echo 'Invalid request';

            return;
        }

        list($serial_key, $machine_code) = $parts;

        $error = '';

        // x. Check if the referer corresponds to the license's domain name
        $referer = isset($_SERVER['HTTP_REFERER'])? $_SERVER['HTTP_REFERER'] : '';

        if (!empty($referer)) {
            $referer_domain = self::get_domain_name($referer);
            $referer_machine_code = self::encrypt_machine_code($referer_domain);

            if ($machine_code != $referer_machine_code) {
                $error = 'License domain mismatch';
            }
        }

        // x. Check serial key
        if (empty($error)) {
            $ulm = new UserLicenseModel();

            $ulm->SERIAL_KEY = $serial_key;
            $ulm->MACHINE_CODE = $machine_code;

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
        $encrypted_reponse = EncryptionHelper::rijndael_encrypt($response, $shared_secret_key);

        // x. Return
        echo $encrypted_reponse;

        // x. Update license check information
        $model->SERIAL_KEY = $serial_key;
        $model->RESULT = $response;

        $model->update();
    }

	function get_domain_name($url) {
		$p = parse_url($url);

		if (isset($p['host'])) {
			return $p['host'];
		}

		return false;
	}

    function encrypt_machine_code($machine_code) {
        $machine_code = EncryptionHelper::numeric_hash($machine_code, 7);

        return EncryptionHelper::my_encrypt($machine_code, DATA_PASSWORD, DATA_HASHSIZE, DATA_BLOCKSIZE, false);
    }

    function get_error_response() {
        return base64_encode('error');
    }

    function create_p() {
        $candidates = array(7727, 7741, 7753, 7757, 7759, 7789, 7793, 7817, 7823, 7829, 7841, 7853, 7867, 7873, 7877, 7879, 7883, 7901, 7907, 7919);

        return $candidates[rand(0, count($candidates) - 1)];
    }

    function create_g() {
        $candidates = array(2, 3, 5);

        return $candidates[rand(0, count($candidates) - 1)];
    }

    function create_private_number() {
        return $this->bcrand("0", "99999999999");
    }

    function create_exchange_key($p, $g, $private_number) {
        return bcpowmod($g, $private_number, $p);
    }

    function create_session_key() {
        srand((double) microtime()*1000000);

        $id = uniqid(rand(10, 999));

        $key = dec2base(base2dec($id, 16), 64);

        return $key;
    }

    function bcrand($min, $max = false) {
        if(!$max) {
            $max = $min;
            $min = 0;
        }

        return bcadd(
                    bcmul(
                        bcdiv(
                            mt_rand(0, mt_getrandmax()),
                            mt_getrandmax(),

                            strlen($max)
                        ),
                        bcsub(
                            bcadd($max,1),
                            $min
                        )

                    ),
                    $min
               );
    }
}
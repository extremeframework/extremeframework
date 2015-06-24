<?php
class SerialInfo {
    public $id_product;         // 1 digits (ex: 9)
    public $id_license_type;    // 1 digits (ex: 2)
    public $features;           // 3 digits (ex: 023)
    public $id_user;            // 7 digits (ex: 9999999)
    public $machine_code;       // 7 digits (ex: 9999999)
    public $expiry_date;        // 6 digits (ex: 131231, ie. 2013/12/31)
}

define('DATA_PASSWORD', '2013');
define('DATA_HASHSIZE', 4);
define('DATA_BLOCKSIZE', 5);

class EncryptionHelper {
    const OUTPUT_CHARACTER_SET = 'ABCDEFGHIJKLMNPQRSTUVZW123456789';
    const PADDING_CHARACTER_SET = '0';

    // Get hash value
    public static function hash_sha256($text) {
        return strtoupper(hash('sha256', $text, false));
    }

    // Perform an AES encryption and return a base-64 version of the encrypted data
    public static function rijndael_encrypt($plaintext, $password) {
        $key = md5($password);

        # create a random IV to use with CBC encoding
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC);
        $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);

        # use an explicit encoding for the plain text
        $plaintext_utf8 = utf8_encode($plaintext);

        # creates a cipher text compatible with AES (Rijndael block size = 128)
        # to keep the text confidential
        # only suitable for encoded input that never ends with value 00h
        # (because of default zero padding)
        $ciphertext = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $key, $plaintext_utf8, MCRYPT_MODE_CBC, $iv);

        # prepend the IV for it to be available for decryption
        $ciphertext = $iv . $ciphertext;

        # encode the resulting cipher text so it can be represented by a string
        $ciphertext_base64 = base64_encode($ciphertext);

        return $ciphertext_base64;
    }

    public static function rijndael_decrypt($ciphertext_base64, $password) {
        $key = md5($password);

        # decode the base64 string
        $ciphertext_base64_decode = base64_decode($ciphertext_base64);

        # retrieves the IV, iv_size should be created using mcrypt_get_iv_size()
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC);
        $iv_dec = substr($ciphertext_base64_decode, 0, $iv_size);

        # retrieves the cipher text (everything except the $iv_size in the front)
        $ciphertext_dec = substr($ciphertext_base64_decode, $iv_size);

        # may remove 00h valued characters from end of plain text
        $plaintext_utf8_dec = mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $key, $ciphertext_dec, MCRYPT_MODE_CBC, $iv_dec);

        return rtrim($plaintext_utf8_dec, "\0");
    }

    // Perform rijndael_encrypt using the current UTC date as a password
    public static function utc_encrypt($data) {
        $password = gmdate('Y-m-d H');

        return self::rijndael_encrypt($data, $password);
    }

    // Perform rijndael_decrypt using the current UTC date as a password
    public static function utc_decrypt($cipher) {
        $password = gmdate('Y-m-d H');

        return self::rijndael_decrypt($cipher, $password);
    }

    public static function modulo($number, $base) {
        if (!is_int($number) || !is_int($base)) {
            die('modulo :: Invalid argument');
        }

        $result = $number - $base*intval($number / $base);

        if ($result < 0) {
            $result += $base;
        }

        return $result;
    }

    public static function simple_encrypt($data, $password) {
        if (!is_numeric($data) || !is_numeric($password)) {
            //die('simple_encrypt :: Invalid argument');
            return false;
        }

        $result = '';

        $datalen = strlen($data);
        $pwlen = strlen($password);

        for ($i = 0; $i < $datalen; $i++) {
            $datachar = substr($data, $i, 1);
            $datacharint = intval($datachar);

            $pwmod = self::modulo($i, $pwlen);
            $pwchar = substr($password, $pwmod, 1);
            $pwcharint = intval($pwchar);

            $newint = self::modulo($datacharint + $pwcharint, 10);

            $result .= strval($newint);
        }

        return $result;
    }

    public static function simple_decrypt($data, $password) {
        if (!is_numeric($data) || !is_numeric($password)) {
            //die('simple_decrypt :: Invalid argument');
            return false;
        }

        $result = '';

        $datalen = strlen($data);
        $pwlen = strlen($password);

        for ($i = 0; $i < $datalen; $i++) {
            $datachar = substr($data, $i, 1);
            $datacharint = intval($datachar);

            $pwmod = self::modulo($i, $pwlen);
            $pwchar = substr($password, $pwmod, 1);
            $pwcharint = intval($pwchar);

            $newint = self::modulo($datacharint - $pwcharint, 10);

            $result .= strval($newint);
        }

        return $result;
    }

    public static function numeric_hash($data, $ndigits = 0) {
        if (!is_numeric($ndigits)) {
            die('hash_as_number :: Invalid argument');
        }

        $hash = self::hexdec( substr(self::hash_sha256($data), 0, 15) );

        $hash = number_format($hash, 0, '', '');

        if ($ndigits > 0) {
            $hash = substr($hash, 0, $ndigits);
        }

        return $hash;
    }

    public static function my_encrypt($data, $password, $hashsize, $blocksize = 0, $use_padding = false) {
        if (!is_numeric($data) || !is_numeric($password) || !is_numeric($hashsize) || !is_numeric($blocksize)) {
            die('my_encrypt :: Invalid argument');
        }

        $hash = self::numeric_hash($data, $hashsize);
        //$encrypt = self::simple_encrypt($hash.$data, $password);
        $encrypt = self::simple_encrypt($data, $password);

        $result = self::my_serial_encode($hash.$encrypt);

        if ($blocksize > 0) {
            $result = self::my_serial_split($result, $blocksize, $use_padding);
        }

        return $result;
    }

    public static function my_decrypt($encrypted_data, $password, $hashsize) {
        if (!is_numeric($password) || !is_numeric($hashsize)) {
            die('my_decrypt :: Invalid argument');
        }

        $encrypted_data = self::my_serial_unsplit($encrypted_data);
        $encrypted_data = self::my_serial_decode($encrypted_data);

        $hash_extracted = substr($encrypted_data, 0, $hashsize);
        $encrypt_extracted = substr($encrypted_data, $hashsize);

        $data = self::simple_decrypt($encrypt_extracted, $password);
        $data_hash = self::numeric_hash($data, $hashsize);

        if ($hash_extracted != $data_hash) {
            return null;
        }

        return $data;
    }

    public static function my_serial_encode($input) {
        return self::convert_base($input, '0123456789-', self::OUTPUT_CHARACTER_SET);
    }

    public static function my_serial_decode($input) {
        return self::convert_base($input, self::OUTPUT_CHARACTER_SET, '0123456789-');
    }

    public static function my_serial_split($input, $blocksize = 5, $use_padding = true) {
        if ($use_padding) {
            $padding_character_set = self::PADDING_CHARACTER_SET;
        } else {
            $padding_character_set = '';
        }

        for ($i = 0; $i < strlen($padding_character_set); $i++) {
            $padding_character = substr($padding_character_set, $i, 1);

            if (strpos($input, $padding_character) !== false) {
                die('my_serial_split :: Padding character '.$padding_character.' should not belong to the character set of the input');
            }
        }

        $len = strlen($input);
        $len2 = strlen($padding_character_set);

        $npad = 0;
        $mod = $len % $blocksize;
        if ($mod > 0) {
            $npad = $blocksize - $mod;
        }

        if (!$use_padding && $len > $blocksize && $mod > 0) {
            return substr($input, 0, $mod).'-'.self::my_serial_split(substr($input, $mod), $blocksize, false);
        }

        for ($i = 0; $i < $npad; $i++) {
            $pos2 = rand(0, $len2 - 1);

            $padding_character = substr($padding_character_set, $pos2, 1);

            $input = self::str_random_insert($input, $padding_character);
        }

        $len = strlen($input);

        if ($len > $blocksize) {
            $nblock = $len / $blocksize;

            $parts = array();

            for ($i = 0; $i < $nblock; $i++) {
                $parts[] = substr($input, $i*$blocksize, $blocksize);
            }

            $input = implode('-', $parts);
        }

        return $input;
    }

    public static function my_serial_unsplit($input) {
        $removes = array('-');

        $padding_character_set = self::PADDING_CHARACTER_SET;
        for ($i = 0; $i < strlen($padding_character_set); $i++) {
            $removes[] = substr($padding_character_set, $i, 1);
        }

        return str_replace($removes, '', $input);
    }

    public static function str_random_insert($haystack, $needle) {
        $pos = rand(1, strlen($haystack) - 1);

        return substr($haystack, 0, $pos).$needle.substr($haystack, $pos);
    }

    public static function hexdec($hex) {
         return self::convert_base($hex, "0123456789ABCDEF", "0123456789");
    }

    /**
     * $input number to convert as a string
     * $from_character_set base of the number to convert as a string
     * $to_character_set base the number should be converted to as a string
     *
     * Examples for $from_character_set and $to_character_set
     * '0123456789ABCDEF' for Hexadecimal (Base16)
     * '0123456789' for Decimal (Base10)
     * '01234567' for Octal (Base8)
     * '01' for Binary (Base2)
     * You can really put in whatever you want and the first character is the 0.
     */
    public static function convert_base($input, $from_character_set, $to_character_set)
    {
        if ($from_character_set == $to_character_set) {
            return $input;
        }

        $from_base = str_split($from_character_set, 1);
        $to_base = str_split($to_character_set, 1);
        $number = str_split($input, 1);

        $from_len = strlen($from_character_set);
        $to_len = strlen($to_character_set);
        $number_len = strlen($input);

        $retval='';

        if ($to_character_set == '0123456789') {
            $retval=0;

            for ($i = 1;$i <= $number_len; $i++) {
                $retval = bcadd($retval, bcmul(array_search($number[$i-1], $from_base),bcpow($from_len,$number_len-$i)));
            }

            return $retval;
        }
        if ($from_character_set != '0123456789') {
            $base10 = self::convert_base($input, $from_character_set, '0123456789');
        } else {
            $base10 = $input;
        }

        if ($base10 < strlen($to_character_set)) {
            return $to_base[$base10];
        }

        while($base10 != '0') {
            $retval = $to_base[bcmod($base10,$to_len)].$retval;
            $base10 = bcdiv($base10,$to_len,0);
        }

        return $retval;
    }

    public static function str2dec($str) {
        $len = strlen($str);

        $binary = '';
        for ($i = 0; $i < $len; $i++) {
            $binary .= str_pad(decbin(ord($str[$i])), 8, '0', STR_PAD_LEFT);
        }

        $gmp = gmp_init($binary, 2);
        $str = gmp_strval($gmp);

        return $str;
    }

    public static function dec2str($dec) {
        $gmp = gmp_init($dec);
        $binary = gmp_strval($gmp, 2);

        $len = strlen($binary);
        $mod = $len % 8;
        if ($mod > 0) {
            $binary = str_repeat("0", 8 - $mod).$binary;
        }

        $binary_arr = str_split($binary, 8);

        $str = '';
        foreach ($binary_arr as $char) {
            $str .= chr(bindec($char));
        }

        return $str;
    }
}

class SerialKeyHelper {
    public static function encrypt_machine_code($machine_code) {
        if (!is_numeric($machine_code) || strlen("$machine_code") > 7) {
            throw new Exception('encrypt_machine_code :: Invalid argument');
        }

        return EncryptionHelper::my_encrypt($machine_code, DATA_PASSWORD, DATA_HASHSIZE, DATA_BLOCKSIZE, false);
    }

    public static function decrypt_machine_code($encrypted_machine_code) {
        return EncryptionHelper::my_decrypt($encrypted_machine_code, DATA_PASSWORD, DATA_HASHSIZE);
    }

    public static function encrypt_serial_info($serial_info) {
        $decstr = '';

        // x. Add id_product, 1 digits (ex: x)
        $decstr .= $serial_info->id_product;

        // x. Add id_license_type, 1 digits (ex: x)
        $decstr .= $serial_info->id_license_type;

        // x. Add features, 3 digits (ex: xxx)
        $decstr .= str_pad($serial_info->features, 3, '0', STR_PAD_LEFT);

        // x. Add id_user, 7 digits (ex: xxxxxxx)
        $decstr .= str_pad($serial_info->id_user, 7, '0', STR_PAD_LEFT);

        // x. Add machine_code, 7 digits (ex: xxxxxxx)
        $decstr .= str_pad($serial_info->machine_code, 7, '0', STR_PAD_LEFT);

        // x. Add expiry_date, 6 digits (ex: 131231, ie. 2013/12/31)
        $decstr .= str_pad($serial_info->expiry_date, 6, '0', STR_PAD_LEFT);

        return EncryptionHelper::my_encrypt($decstr, DATA_PASSWORD, DATA_HASHSIZE, DATA_BLOCKSIZE, false);
    }

    public static function decrypt_serial_info($encrypted_serial_info) {
        $decstr = EncryptionHelper::my_decrypt($encrypted_serial_info, DATA_PASSWORD, DATA_HASHSIZE);

        $serial_info = new SerialInfo();

        $serial_info->id_product = substr($decstr, 0, 1);
        $serial_info->id_license_type = substr($decstr, 1, 1);
        $serial_info->features = substr($decstr, 2, 3);
        $serial_info->id_user = substr($decstr, 5, 7);
        $serial_info->machine_code = substr($decstr, 12, 7);
        $serial_info->expiry_date = substr($decstr, 19, 6);

        return $serial_info;
    }
}
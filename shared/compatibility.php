<?php
$version = phpversion();

if ($version < '5.3') {
	die("PHP version >= 5.3 is required. (Your current version is $version)");
}

if (false === function_exists('lcfirst')) {
    function lcfirst( $str ) {
        $str[0] = strtolower($str[0]);
        return (string)$str;
    }
}
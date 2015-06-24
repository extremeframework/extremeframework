<?php
function smarty_modifier_currency_string($value) {
    $bil = floor($value / 1000000000);
    $value = $value % 1000000000;

    $mil = floor($value / 1000000);
    $value = $value % 1000000;

    $thoud = floor($value / 1000);
    $value = $value % 1000;

    $hund = floor($value / 100);
    $value = $value % 100;

    $dec = floor($value / 10);
    $value = $value % 10;

    $s = '';

    if ($bil) {
        $s .= smarty_modifier_currency_string($bil).' tỉ ';
    }

    if ($mil) {
        $s .= smarty_modifier_currency_string($mil).' triệu ';
    }

    if ($thoud) {
        $s .= smarty_modifier_currency_string($thoud).' ngàn ';
    }

    if ($hund) {
        $s .= smarty_modifier_currency_string($hund).' trăm ';
    }

    if ($dec > 1) {
        $s .= smarty_modifier_currency_string($dec).' mươi ';
    } else if ($dec == 1) {
        $s .= "mười ";
    }

    if ($value) {
        $x = array('không', 'một', 'hai', 'ba', 'bốn', 'năm', 'sáu', 'bảy', 'tám', 'chín');

        $s .= $x[$value];
    }

    return $s;
}
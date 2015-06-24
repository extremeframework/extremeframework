<?php
function smarty_modifier_friendly_money_string($value) {
    $k = floor($value / 1000);

    if ($k < 1000) {
        return number_format($k).'K';
    }

    $mil = floor($k / 1000);
    $k = floor(($k % 1000)/ 100);

    return $k > 0 ? "$mil,$k triệu" : "$mil triệu";
}
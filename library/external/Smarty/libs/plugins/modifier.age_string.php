<?php
function smarty_modifier_age_string($dob) {
    if (empty($dob)) {
        return;
    }

    $time_elapsed = time() - strtotime($dob);

    $days       = round($time_elapsed / 86400 );
    $months     = round($time_elapsed / 2600640 );
    $years      = round($time_elapsed / 31207680 );

    $s = '';

    if ($years) {
        return "$years tuổi";
    }

    if ($months) {
        return "$months tháng";
    }

    return "{$days} ngày";
}
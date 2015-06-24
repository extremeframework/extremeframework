<?php
function smarty_modifier_friendly_date($value) {
    if (empty($value)) {
        return;
    }

    $time_elapsed = time() - strtotime($value);

    $seconds    = $time_elapsed ;
    $minutes    = round($time_elapsed / 60 );
    $hours      = round($time_elapsed / 3600);
    $days       = round($time_elapsed / 86400 );
    $weeks      = round($time_elapsed / 604800);
    $months     = round($time_elapsed / 2600640 );
    $years      = round($time_elapsed / 31207680 );

    if ($seconds <= 60){
        return "just now";
    }

    if($minutes <= 60){
        if($minutes == 1){
            return "one minute ago";
        }
        else{
            return "$minutes minutes ago";
        }
    }

    if ($hours <= 24){
        if ($hours==1){
            return "an hour ago";
        } else {
            return "$hours hrs ago";
        }
    }

    if ($days <= 7){
        if ($days == 1){
            return "yesterday";
        } else {
            return "$days days ago";
        }
    }

    if ($weeks <= 4.3){
        if ($weeks == 1){
            return "a week ago";
        } else {
            return "$weeks weeks ago";
        }
    }

    if ($months <= 12){
        if ($months == 1){
            return "a month ago";
        } else {
            return "$months months ago";
        }
    }

    if($years == 1){
        return "one year ago";
    } else {
        return "$years years ago";
    }
}
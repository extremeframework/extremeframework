<?php
function get_friendly_money_string($value) {
    $k = floor($value / 1000);

    if ($k < 1000) {
        return number_format($k).'K';
    }

    $mil = floor($k / 1000);
    $k = floor(($k % 1000)/ 100);

    return $k > 0 ? "$mil,$k triệu" : "$mil triệu";
}

function smarty_modifier_budget_actual_remaining_bar($budget, $actual)
{
    $remaining = $budget - $actual;

    $budget_width = 300;
    $actual_width = 0;
    $percent = 0;

    if ($budget > 0) {
        $percent = $actual/$budget;
        $actual_width = floor($percent*$budget_width);
    } else {
        if ($actual > 0) {
            $percent = 1;
            $actual_width = $budget_width;
        }
    }

    $budget_string = get_friendly_money_string($budget);
    $actual_string = get_friendly_money_string($actual);
    $percent_string = number_format($percent*100).'%';

    if ($percent <= 0.5) {
        $actual_color = 'rgb(68, 191, 230)';
    } else if ($percent <= 0.75) {
        $actual_color = 'orange';
    } else {
        $actual_color = 'rgb(255, 97, 97)';
    }

    $tooltip = '';
    if ($percent > 0) {
        $tooltip .= 'còn lại '.get_friendly_money_string($remaining);
    }

    $html = '';
    $html .= '<div style="width: 360px"'.(!empty($tooltip) ? ' title="'.$tooltip.'"' : '').'>';
    $html .= '    <div style="width: '.$budget_width.'px; background-color: rgb(243, 243, 243);height: 22px;border: 1px solid rgb(189, 189, 189);float: left;">';

    if ($actual_width) {
        $html .= '    <div style="width:'.$actual_width.'px;background-color: '.$actual_color.';height: 18px;text-align: right;padding: 0 3px 5px 0;color: white;">';
        $html .= '    '.$actual_string;
        $html .= '    </div>';
    }

    $html .= '    </div>';
    $html .= '    <span style="margin-left:  5px;">'.$budget_string.'</span>';
    $html .= '</div>';

    return $html;
}

?>
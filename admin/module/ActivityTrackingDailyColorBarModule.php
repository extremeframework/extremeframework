<?php
class ActivityTrackingDailyColorBarModule {
    function fetch($params, $smarty) {
        // x. Get all activities of the current day
        $model = new ActivityTrackingModel();

        $model->GUID = $_SESSION['user']->ID;
        $model->DATE = date('Y-m-d');

        $model->find();

        $low_min = 0;
        $medium_min = 0;
        $high_min = 0;

        while ($model->fetch()) {
            $min = ActivityTrackingDailyColorBarModule::str2min($model->ELLAPSED_TIME);

            if ($model->ID_VALUE == 1) {
                $high_min += $min;
            } else if ($model->ID_VALUE == 2) {
                $low_min += $min;
            } else if ($model->ID_VALUE == 3) {
                $medium_min += $min;
            }
        }

        $total_min = $low_min + $medium_min + $high_min;

        if ($total_min == 0) {
            return;
        }

        $percent = ($total_min / (16*60))*100;

        $high_percent = ($high_min / $total_min)*100;

        // x. Convert to strings
        $low_str = ActivityTrackingDailyColorBarModule::min2str($low_min);
        $medium_str = ActivityTrackingDailyColorBarModule::min2str($medium_min);
        $high_str = ActivityTrackingDailyColorBarModule::min2str($high_min);
        $total_str = ActivityTrackingDailyColorBarModule::min2str($total_min);

        // x. Convert to width (16h --> 480px --> 1h = 30px --> 60min = 30px --> 1min = 0.5px)
        $lowpx = ceil($low_min*0.5);
        $mediumpx = ceil($medium_min*0.5);
        $highpx = ceil($high_min*0.5);

        $html = '';

        $html .= '<div style="clear:both;"></div>';

        // Start
        $html .= '<div style="border: 1px solid rgb(153, 153, 153);width: 600px;margin: 5px 0 0 164px;float:left">';

        // Body
        if ($lowpx) {
            $html .= '<div title="Low value activities" style="width:'.$lowpx.'px;background-color: rgb(94, 91, 88);float:left;height: 18px;text-align: center;padding: 2px 0 0 5px;">'.($lowpx >= 50? $low_str : '').'</div>';
        }
        if ($mediumpx) {
            $html .= '<div title="Medium value activities" style="width:'.$mediumpx.'px;background-color: rgb(61, 88, 63);float:left;height: 18px;text-align: center;padding: 2px 0 0 5px;margin-left: 3px;">'.($mediumpx >= 50? $medium_str : '').'</div>';
        }
        if ($highpx) {
            $html .= '<div title="High value activities" style="width: '.$highpx.'px;background-color: rgb(11, 155, 11);float:left;height: 18px;text-align: center;padding: 2px 0 0 5px;margin-left: 3px;">'.($highpx >= 50? $high_str : '').'</div>';
        }

        // Clear
        $html .= '<div style="clear:both"></div>';

        // End
        $html .= '</div>';

        // Total
        $html .= '<div style="float: left;margin: 8px 0 0 5px;">'.$total_str.' &nbsp; &nbsp; ( '.number_format($percent, 2).'% ) &nbsp; &nbsp;&nbsp; eff &nbsp;=&nbsp; '.number_format($high_percent, 2).'%</div>';

        return $html;
	}

	function min2str($min) {
        $h = floor($min / 60);
        $m = $min % 60;

        $str = str_pad($h, 1, '0', STR_PAD_LEFT).'h '.str_pad($m, 1, '0', STR_PAD_LEFT).'m';

        return $str;
    }

    function str2min($str) {
        preg_match('/(([0-9]+)h)?\s?(([0-9]+)m)?/is', $str, $matches);

        $h = isset($matches[2])? $matches[2] : 0;
        $m = isset($matches[4])? $matches[4] : 0;

        $min = $h*60 + $m;

        return $min;
    }
}
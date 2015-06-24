<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AmchartController extends AppController
{
    function settingsAction() {
        $label = 'This is a pie chart';
        $background = APPLICATION_URL.'/images/bg.gif';

		$smarty = Framework::getSmarty();
		$smarty->assign('label', $label);
		$smarty->assign('background', $background);
	    $smarty->display('chartsettings.pie.tpl');
	}

    function dataAction() {
        $data = array();

        $data[] = array('title' => 'a', 'value' => 50);
        $data[] = array('title' => 'b', 'value' => 150);

		$smarty = Framework::getSmarty();
		$smarty->assign('data', $data);
	    $smarty->display('chartdata.pie.tpl');
	}
}
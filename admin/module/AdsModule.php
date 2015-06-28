<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdsModule {
    function fetch($params, $smarty) {
        if (!Framework::hasModule('Ads')) {
            return;
        }

        $position = isset($params['position'])? $params['position'] : '';
        $template = isset($params['template'])? $params['template'] : 'mod.adsense.tpl';

        if (empty($position) || empty($template)) {
            return;
        }

        $model = new AdsModel();
        $model->POSITION = $position;
        $model->IS_ENABLED = true;
        $model->orderBy('ORDERING ASC');
        $model->find();

        $ads = array();

        while ($model->fetch()) {
            $ads[] = clone $model;
        }

        if (!empty($ads)) {
    		$smarty->assign('ads', $ads);

    		return $smarty->fetch($template);
        }
	}
}
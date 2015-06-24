<?php
class SlideshowModule {
    function fetch($params, $smarty) {
        $code = isset($params['code'])? $params['code'] : '';
        $showcaption = isset($params['showcaption'])? $params['showcaption'] : true;
        $background = isset($params['background'])? $params['background'] : '#000';
        $width = isset($params['width'])? $params['width'] : '';
        $height = isset($params['height'])? $params['height'] : '';
        $orientation = isset($params['orientation'])? $params['orientation'] : 'horizontal';
        $template = isset($params['template'])? $params['template'] : 'mod.slideshow-translucent.tpl';

        if (empty($code) || empty($template)) {
            return;
        }

        $model = new SlideshowItemModel();
        $model->IS_ENABLED = true;

        $sm = new SlideshowModel();
        $sm->CODE = $code;
        $model->joinAdd($sm);

        $model->orderBy('ORDERING ASC');
        $model->find();

        $rows = array();
        while ($model->fetch()) {
            $rows[] = clone $model;
        }

        if (!empty($rows)) {
    		$smarty->assign('items', $rows);
    		$smarty->assign('showcaption', $showcaption);
    		$smarty->assign('background', $background);
    		$smarty->assign('width', $width);
    		$smarty->assign('height', $height);
    		$smarty->assign('orientation', $orientation);

    		return $smarty->fetch($template);
        }
	}
}
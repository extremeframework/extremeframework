<?php
function smarty_function_share($params, $smarty) {
	$url = isset($params['url'])? $params['url'] : '';
	$text = isset($params['text'])? $params['text'] : '';
	$title = isset($params['title'])? $params['title'] : 'sharrre this page';
	$style = isset($params['style'])? $params['style'] : 'simple';

    $smarty->assign('share_url', $url);
    $smarty->assign('share_text', $text);
    $smarty->assign('share_title', $title);
    $smarty->assign('share_style', $style);

    return $smarty->fetch('mod.share.tpl');
}
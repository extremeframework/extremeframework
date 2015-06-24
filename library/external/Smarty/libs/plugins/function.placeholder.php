<?php
function smarty_function_placeholder($params, &$smarty)
{
    $i18n = $_SESSION['i18n'];

	$position = $params['position'];
	$menuitemid = $params['menuitemid'];

	$ci = new PlaceholderModuleI18nModel();
	$ci->I18N = $i18n;

	$model = new PlaceholderModuleModel();
    $model->joinAdd($ci, array('joinType' => 'LEFT', 'useWhereAsOn' => true));
	$model->POSITION = $position;
	$model->whereAdd("(IS_TEMPLATE_MODULE = 1) OR (IS_TEMPLATE_MODULE = 0 AND ID_FRONT_MENU_ITEM = '$menuitemid')");
	$model->find();

    while ($model->fetch()) {
        if ($model->IS_HTML_CONTENT) {
            $html .= $model->HTML_CONTENT;
        } else {
            $mname = $model->MODULE.'Module';
            $mtitle = $model->TITLE;
            $handler = new $mname();

            parse_str($model->PARAMS, $mparams);

            $html .= $handler->fetch($mparams, $mtitle);
        }
    }

	return $html;
}
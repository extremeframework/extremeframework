<?php
function smarty_function_backoffice($params, &$smarty)
{
	$res = $params['res'];
	$bo = new BackOfficeController();
	$bo->widget($res, $params);
}
<?php
function smarty_function_html_ref_text($params, &$smarty)
{
	$datasource = $params['datasource'];
	$class = 'DataObject_'.$datasource;

	$model = new $class();
    $model->whereAdd(TABLE_PREFIX.$datasource.".{$params['valuecol']} = '{$params['value']}'");
	$model->find();

 	if ($model->fetch()) {
	    return $model->{$params['textcol']};
	}

	return null;
}
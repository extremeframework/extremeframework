<?php
function smarty_function_backoffice_pagination($params, &$smarty)
{
    $pagination = isset($params['pagination'])? $params['pagination'] : null;
    $module = isset($params['module'])? $params['module'] : null;

    if (!empty($pagination) && !empty($module)) {
    	return BackOfficeController::pluggin_pagination($pagination, $module);
    }   
}
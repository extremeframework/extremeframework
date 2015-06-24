<?php
function smarty_function_module($params, &$smarty)
{
	$class = $params['class'];

    $handler = new $class();

    return $handler->fetch($params, $smarty);
}
<?php
function smarty_function_markups($params, &$smarty)
{
    $row = isset($params['row'])? $params['row'] : null;    
    $col = isset($params['col'])? $params['col'] : null;        
    $rownumber = isset($params['rownumber'])? $params['rownumber'] : null;            
    $controller = isset($params['controller'])? $params['controller'] : null;                

    if (!empty($controller) && !empty($controller)) {
        eval('$result = '.$controller.'::pluggin_markups($row, $col, $rownumber);');

        return $result;
    }   
}
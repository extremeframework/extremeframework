<?php
function smarty_function_backoffice_markups($params, &$smarty)
{
    $markups = isset($params['markups'])? $params['markups'] : array();
    $row = isset($params['row'])? $params['row'] : null;    
    $col = isset($params['col'])? $params['col'] : null;        
    $rownumber = isset($params['rownumber'])? $params['rownumber'] : null;            

    if (!empty($markups) && !empty($row)) {
    	return BackOfficeController::pluggin_markups($markups, $row, $col, $rownumber);
    }   
}
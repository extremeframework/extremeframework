<?php
function smarty_function_html_multi_ref_select($params, &$smarty)
{
	$datasource = $params['datasource'];

	$filepath = DATAOBJECT_DIR.'/'.$datasource.'.php';

	if (file_exists($filepath)) {		
		require_once($filepath); 

		$class = 'DataObject_'.$datasource; 
		$model = new $class();
        $model->orderBy($params['textcol']);
		$model->find();

		$multival = explode(',', $params['value']);	
		$options = '';
	 	while ($model->fetch()) {
			$selected = '';
	 		if (in_array($model->{$params['valuecol']}, $multival)) {
	 			$selected = ' checked ';
			} 			
			
		    $options .= '<input class="'.$params['class'].'" type="checkbox" name="'.$params['name'].'[]" value="'.$model->{$params['valuecol']}.'"'.$selected.($params['disabled']? ' disabled' : '').(!empty($params['onchange'])? ' onchange="'.$params['onchange'].'"' : '').'/>'.$model->{$params['textcol']};
		}
					    
	    $html_result = '';
	    $html_result .= $options;
	} else {
	    $html_result = '<input class="'.$params['class'].'" type="text" name="'.$params['name'].'" value="'.$params['value'].'">';
	}	    

    return $html_result;
}
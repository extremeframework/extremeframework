<?php
function smarty_function_html_multi_ref_text($params, &$smarty)
{
	$datasource = $params['datasource'];

	$filepath = DATAOBJECT_DIR.'/'.$datasource.'.php';

	if (file_exists($filepath)) {		
		require_once($filepath); 

		$class = 'DataObject_'.$datasource; 
		$model = new $class();
	
		$options = array();
	
		$model->find();
	 	while ($model->fetch()) {
		    $options[$model->{$params['valuecol']}] = $model->{$params['textcol']};
		}

		$multival = explode(',', $params['value']);	
		$multitext = array();
		foreach ($multival as $val) {
    		if (isset($options[$val])) {
    		    $multitext[] = $options[$val];
    		} else {
    		    $multitext[] = $val;
    		}
		}

		return implode(', ', $multitext);
	} else {
		return $params['value'];	
	}		
}
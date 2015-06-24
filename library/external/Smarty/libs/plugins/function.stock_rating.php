<?php
function smarty_function_stock_rating($params, &$smarty)
{
    static $loaded = false;
    static $ratings = null;
    
    if (!$loaded) {
        $model = new RatingModel();        
        $model->find();
        
		$ratings = array();
		while($model->fetch()) {
			$ratings[] = clone $model;
		}
		
        $loaded = true;
    }

    $output = '';
	$output .= '<select onChange="updateStockRating(\''.$params['stock'].'\', this.value);">';
    $output .= '<option value="0"></option>';
    foreach ($ratings as $rating) {
        $output .= '<option value="'.$rating->ID.'" '.($params['rating'] == $rating->ID? 'selected' : '').'>'.$rating->NAME.'</option>';
    }
    $output .= '</select>';
    
    return $output;
}
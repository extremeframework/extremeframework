<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty {i18n_to_array} function plugin
 *
 * Type:     function<br>
 * Name:     i18n_to_array<br>
 * Purpose:  convert an i18n string to an array whose keys are language code
 *		and element are translated chains.<br>
 * @author Clement Nodet <clement dot nodet at gmail dot com>
 * @param array
 *	- string : i18n string
 *	- assign : array in which the result will be stored
 * @param Smarty
 */
function smarty_function_i18n_to_array($params, &$smarty)
{
	// String and Assign parameters are compulsory
	if (!isset($params['string'])) {
		$smarty->trigger_error("i18n_to_array: missing 'string' parameter");
		return;
	}
	if (!isset($params['assign'])) {
		$smarty->trigger_error("i18n_to_array: missing 'assign' parameter");
		return;
	}

	$result = array();
	preg_match_all('/<([^>]+)>([^>]*)<\/\1>/',$params['string'],$matches);
	
	// Speeding up the loop
	$nb_match = count($matches[2]);
	$tags = array('&lt;', '&gt;');
	$replace = array('<','>');

	for ($i = 0; $i < $nb_match; ++$i)
	{
		// We keep the same behaviour as i18n modifier, id est the first occurence
		// of a language code is not overridenby further ones
		if (!isset($result[ $matches[1][$i] ]))
		{
			$result[ $matches[1][$i] ] = str_replace($tags,$replace,$matches[2][$i]);
		}
	}

	$smarty->assign($params['assign'],$result);
}

?>

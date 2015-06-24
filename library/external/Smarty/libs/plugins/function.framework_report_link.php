<?php
function smarty_function_framework_report_link($params, &$smarty)
{
    $html = '';

	$format = isset($params['format'])? $params['format'] : '';
	$data = isset($params['data'])? $params['data'] : array();

	if (is_object($data)) {
	    $data = (array) $data;
	}

    if (preg_match_all('/\{([a-z0-9_]+)\}/is', $format, $matches)) {
        $matches = $matches[1];

        foreach ($matches as $m) {
            if (isset($data[$m])) {
                $format = str_replace('{'.$m.'}', $data[$m], $format);
            }
        }
    }

    if (!preg_match('/^(http|www)/i', $format)) {
        $format = APPLICATION_URL.'/'.$format;
    }

	return $format;
}
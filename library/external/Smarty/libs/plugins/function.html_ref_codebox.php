<?php
function smarty_function_html_ref_codebox($params, &$smarty) {
    $module = str_replace('_', '', strtolower($params['datasource']));

    $api = APPLICATION_URL.'/api/'.$module.'/view?'.$params['valuecol'].'=';

    $html_result = '<input type="text"'.(isset($params['class'])? ' class="'.$params['class'].'"' : '').' name="'.$params['name'].'"'.(isset($params['id']) && $params['id']? ' id="'.$params['id'].'"' : '').' style="width: 50px;" />';
    $html_result .= '
        <script type="text/javascript">
            $(function() {
                $("input[name=\''.$params['name'].'\']").codebox({url: "'.$api.'"});
            });
        </script>
    ';

    return $html_result;
}
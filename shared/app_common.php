<?php
function __t($text, $key = '', $insidequote = false) {
    static $flag = false;

    if (isset($_REQUEST['configlabel'])) {
        $_SESSION['configlabel'] = $_REQUEST['configlabel'];
    }

    $config = isset($_SESSION['configlabel']) && $_SESSION['configlabel'];

    if ($config && !$insidequote) {
        $html = '<span class="config-label" data-label-text="'.$text.'" data-label-key="'.$key.'">'.$text.'</span>';

        if (!$flag) {
            $flag = true;

            $html .= '
                <script type="text/javascript">
                    $(function() {
                        $(\'body\').append(\'<div id="config-label-panel"><div class="header">Translation</div><div class="content"><input type="text" class="translation"/><br/></div><div class="footer">Key = <span class="key"></span></div></div>\');

                        $(".config-label").live("mouseover", function(e){
                            var label = $(this);

                            var panel = $("#config-label-panel");
                            var input = panel.find("input");

                            panel.show();
                            panel.css({top: e.clientY + 10, left: e.clientX + 10});

                            input.val(label.data("label-text"));
                            input.focus();

                            panel.find(".key").text(label.data("label-key"));

                            input.off("keydown").on("keydown", function(e) {
                                if (e.keyCode == 13) {
                                    $.ajax({
                                		type: "post",
                                		url: APPLICATION_URL + "/adminlanguageitem/updateTranslation",
                                		data: {key: label.data("label-key"), text: input.val()}
                                	});

                                    label.text(input.val());
                                    panel.hide();
                                }
                            });
                        });
                    });
                </script>
            ';
        }

        return $html;
    } else {
        return $text;
    }
}

function _t($key, $insidequote = false) {
    global $_L;

    if (isset($_L[$key])) {
        $text = __t($_L[$key], $key, $insidequote);
    } else {
        $text = $key;

        $is_english = !preg_match('/[^a-z0-9\s\-\?\.:,;]/i', $text);

        if ($is_english) {
            if (Framework::hasModule('AdminLabel')) {
                $model = new AdminLabelModel();
                $model->LABEL = $text;
                $model->find();
                $model->fetch();

                if (!$model->ID) {
                    $model->insert(false);

                    $item = new AdminLanguageItemModel();
                    $item->ID_ADMIN_LANGUAGE = 1;
                    $item->ID_ADMIN_LABEL = $model->ID;
                    $item->TRANSLATION = $text;

                    $item->insert(false);
                }
            }
        }

        $text = __t($text, $key, $insidequote);
    }

    return $text;
}

function array_select($items, $field, $value) {
    $selection = array();

    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field]) && $array[$field] == $value) {
            $selection[] = $item;
        }
    }

    return $selection;
}

function array_select_single($items, $field, $value) {
    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field]) && $array[$field] == $value) {
            return $item;
        }
    }

    return null;
}

function array_exists($items, $field, $value) {
    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field]) && $array[$field] == $value) {
            return true;
        }
    }

    return false;
}

function array_sum_by_field($items, $field) {
    $sum = 0;

    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field])) {
            $sum += $array[$field];
        }
    }

    return $sum;
}

function array_group($items, $field, $modifier_callback = null) {
    $results = array();

    foreach ($items as $item) {
        $array = (array) $item;

        if (isset($array[$field])) {
            $v = $array[$field];

            if (is_callable($modifier_callback)) {
                $v = call_user_func($modifier_callback, $v);
            }

            $results[$v][] = $item;
        }
    }

    return $results;
}

function json_extract($json, $property) {
    $json = json_decode($json);

    return is_object($json) && property_exists($json, $property)? $json->$property : array();
}

function get_option($option, $default = null, $context = null, $is_required = true) {
    $cache = Cache::context('get_option');

    if (!$cache->has('options')) {
    	$model = new OptionModel();

        $model->selectAdd();
        $model->selectAdd('`CODE`, `CONTEXT`, `VALUE`');

    	$model->find();

        $options = array();

     	while ($model->fetch()) {
     	    $options[$model->CONTEXT][$model->CODE] = $model->VALUE;
        }

        $cache->set('options', $options, 86400);
    }

    $options = $cache->get('options');
    $value = isset($options[$context][$option])? $options[$context][$option] : '';

    if (empty($value)) {
        if (empty($default) && $is_required) {
            die("<div style=\"color:orange\">[ERROR] Configuration option '$option' ".($context? "of context '$context' " : '')."is required.</div>");
        }

        $value = $default;
    }

 	return $value;
}

function get_theme_option($option, $default = null, $is_required = true) {
    return get_option($option, $default, THEME_NAME, $is_required);
}

function get_package_option($option, $packagename, $default = '', $is_required = true) {
    return get_option($option, $default, $packagename, $is_required);
}

function get_request_param($name, $default = '') {
    return isset($_REQUEST[$name])? $_REQUEST[$name] : $default;
}

function condstring_match($condstring, $model) {
    $condstring = str_replace('=', '==', $condstring);

    $s = preg_replace('/([a-z_]+)/is', '$model->$1', $condstring);

    eval("\$result = $s;");

    return $result;
}
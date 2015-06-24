<?php
function smarty_function_label($params, &$smarty) {
    global $_L;

	$key = isset($params['key'])? $params['key'] : '';
	$text = isset($params['text'])? $params['text'] : '';
	$format = isset($params['format'])? $params['format'] : '';
	$insidequote = isset($params['insidequote']) && $params['insidequote'];

    if (!empty($text)) {
        if (isset($_L[$text])) {
            $text = _label($_L[$text], $text, $format, $insidequote);
        } else {
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
        }
    } else {
        if (!empty($key)) {
            eval("\$text = _label($key, '$key', '$format', '$insidequote');");
        }
    }

    return $text;
}

function _label($text, $key = '', $format = '', $insidequote = false) {
    static $flag = false;

    if (isset($_REQUEST['_configlabel'])) {
        $_SESSION['_configlabel'] = $_REQUEST['_configlabel'];
    }

    $config = isset($_SESSION['_configlabel']) && $_SESSION['_configlabel'];

    if ($config && !$insidequote) {
        echo '<span class="config-label" data-label-text="'.$text.'" data-label-key="'.$key.'">'.$text.'</span>';

        if (!$flag) {
            $flag = true;

            echo '
                <div id="config-label-panel">
                    <div class="header">Translation</div>
                    <div class="content">
                        <input type="text" class="translation"/><br/>
                    </div>
                    <div class="footer">Key = <span class="key"></span></div>
                </div>

                <script type="text/javascript">
                    $(function() {
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
    } else {
        switch ($format) {
            case 'lower':
                $text = strtolower($text);
                break;

            case 'upper':
                $text = strtoupper($text);
                break;

            default:
                break;
        }

        echo $text;
    }
}
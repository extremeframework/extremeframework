<?php
/**
 * Copyright (c) 2006-2012 VIETMAI Solutions Corporation
 *
 * www.vietmaisolutions.com
 */
function smarty_modifier_htmlcleanup($content) {
    if (!empty($content) && stripos($content, '<p>') === false) {
        $content = "<p>$content</p>";
    }

    return $content;
}
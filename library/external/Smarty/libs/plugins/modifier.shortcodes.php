<?php
/**
 * Copyright (c) 2006-2012 VIETMAI Solutions Corporation
 *
 * www.vietmaisolutions.com
 */
function smarty_modifier_shortcodes($content) {
    return do_shortcode($content);
}
<?php
function smarty_modifier_ascode($string)
{
    return !empty($string) ? strtolower(str_replace(' ', '', $string)) : 'none';
}
<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */

/**
 * Smarty {nl2br}{/nl2br} block plugin
 *
 * Type:     block function<br>
 * Name:     nl2br<br>
 * Purpose:  convert \r\n, \r or \n to <<br>><br>
 * @param array not used here
 * @author Clement Nodet <clement dot nodet at dirox dot net>
 * @param string contents of the block
 * @param Smarty clever simulation of a method
 * @return string string $content with new lines escaped
 */
function smarty_block_nl2br($params,$content,&$smarty)
{
    if (is_null($content)) {
        return;
    }
    return nl2br($content);
}

/* vim: set expandtab: */

?>

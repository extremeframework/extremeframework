<?php
function smarty_modifier_plugin($content, $key, $args)
{
    return PluginManager::do_modifier($key, $content, $args);
}
<{if isset($menus.$depth.$parent) }>
<ul<{if $depth == 0}> class="sf-menu"<{/if}>>
<{foreach from=$menus.$depth.$parent item=menuitem}>
    <{if $menuitem->ENABLE_LEFT}>
        <li class="menu-<{$menuitem->MODULE}><{if isset($module) && $menuitem->MODULE == $module || $menuitem->ID == $parentmenu}> current<{/if}>">
            <a class="menulink menulink-<{$menuitem->MODULE}> scope-page" href="<{$menuitem->LINK}>"><{if $menuitem->FONT_AWESOME_ICON}><i class="fa <{$menuitem->FONT_AWESOME_ICON}>"></i> &nbsp; <{/if}><{_t($menuitem->NAME)}></a>
            <{include file="menu.items.tpl" parent=$menuitem->ID depth=$depth+1}>
        </li>
    <{/if}>
<{/foreach}>
</ul>
<{/if}>
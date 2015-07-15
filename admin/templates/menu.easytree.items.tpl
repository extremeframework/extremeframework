<{$cookie_menu_states = explode(',', $smarty.cookies["cookie_menu_states_`$smarty.session.menuid`"])}>

<ul>
    <li id="favourites" class="isFolder <{if in_array('favourites', $cookie_menu_states)}>isExpanded<{/if}>">
        <{_t('Favourites')}>
        <ul>
            <{foreach from=$smarty.session.flatmenu item=menuitem}>
                <{if $menuitem->ENABLE_LEFT && $menuitem->IS_STARRED}>
                    <li id="<{$menuitem->ID}>" class="menu-<{$menuitem->MODULE}><{if isset($module) && $menuitem->MODULE == $module || $menuitem->ID == $parentmenu}> current<{/if}> <{if in_array($menuitem->ID, $cookie_menu_states)}>isExpanded<{/if}>">
                        <a class="menulink menulink-<{$menuitem->MODULE}> scope-page cachable" href="<{$menuitem->LINK}>"<{if $menuitem->IS_EXTERNAL_LINK}> target="blank"<{/if}>><{if $menuitem->FONT_AWESOME_ICON}><i class="fa <{$menuitem->FONT_AWESOME_ICON}>"></i> &nbsp; <{/if}><{_t($menuitem->NAME)}></a>
                    </li>
                <{/if}>
            <{/foreach}>
        </ul>
    </li>
    <li id="usermenu" class="isFolder <{if in_array('usermenu', $cookie_menu_states)}>isExpanded<{/if}>">
        <{_t('User menu')}>
        <{include file="menu.easytree.items.ul.tpl" menus=$smarty.session.menu parent=0 depth=0}>
    </li>
</ul>
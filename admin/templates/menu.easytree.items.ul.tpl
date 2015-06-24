<{if isset($menus.$depth.$parent) }>
    <ul>
        <{foreach from=$menus.$depth.$parent item=menuitem}>
            <{if $menuitem->ENABLE_LEFT}>
                <{$next_depth = $depth+1}>
                <{$next_parent = $menuitem->ID}>

                <{$is_folder = !$menuitem->MODULE && !$menuitem->PATH}>
                <{$has_children = isset($menus.$next_depth.$next_parent)}>

                <{if !$is_folder || $has_children}>
                    <li id="<{$menuitem->ID}>" class="<{if $is_folder || $has_children}>isFolder <{/if}>menu-<{$menuitem->MODULE}><{if isset($module) && $menuitem->MODULE == $module || $menuitem->ID == $parentmenu}> current<{/if}> <{if in_array($menuitem->ID, $cookie_menu_states)}>isExpanded<{/if}>"<{if !$is_folder}> title="<{label text=$menuitem->NAME insidequote=true}>"<{/if}>>
                        <a class="menulink menulink-<{$menuitem->MODULE}> scope-page" href="<{$menuitem->LINK}>"<{if $menuitem->IS_EXTERNAL_LINK}> target="blank"<{/if}>><{if $menuitem->FONT_AWESOME_ICON}><i class="fa <{$menuitem->FONT_AWESOME_ICON}>"></i> &nbsp; <{/if}><{label text=$menuitem->NAME}></a>
                        <{include file="menu.easytree.items.ul.tpl" parent=$next_parent depth=$next_depth}>
                    </li>
                <{/if}>
            <{/if}>
        <{/foreach}>
    </ul>
<{/if}>
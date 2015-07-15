<{if isset($menus.$depth.$parent) }>
    <ul<{if $depth == 0}> class="main-navigation"<{/if}>>
        <{foreach from=$menus.$depth.$parent item=menuitem}>
            <{if $menuitem->ENABLE_TOP}>
                <{$parent2 = $menuitem->ID}>
                <{$depth2 = $depth+1}>

                <li>
                    <a <{if $menuitem->OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-page cachable"<{/if}> href="<{$menuitem->LINK}>">
                        <{_t($menuitem->NAME)}>
                    </a>
                    <{include file="menu.horizontal.items.tpl" parent=$parent2 depth=$depth2}>
                </li>

                <{$is_horizontal_menu_visible = true scope=global}>
            <{/if}>
        <{/foreach}>
    </ul>
<{/if}>
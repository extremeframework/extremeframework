<{if isset($menus.$depth.$parent) }>
    <ul<{if $depth == 0}> class="nav nav-pills nav-stacked adminex-nav"<{else}> class="sub-menu-list"<{/if}>>
        <{foreach from=$menus.$depth.$parent item=menuitem}>
            <{if $menuitem->ENABLE_LEFT}>
                <{$parent2 = $menuitem->ID}>
                <{$depth2 = $depth+1}>

                <li class="<{if $menus.$depth2.$parent2}>menu-list<{/if}> <{if isset($module) && $menuitem->MODULE == $module || $menuitem->ID == $parentmenu}><{if $menus.$depth2.$parent2}>nav-active<{else}>active<{/if}><{/if}>">
                    <a <{if !$menus.$depth2.$parent2 }><{if $menuitem->OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-page"<{/if}><{/if}> href="<{$menuitem->LINK}>">
                        <{if $menuitem->FONT_AWESOME_ICON}>
                            <i class="fa <{$menuitem->FONT_AWESOME_ICON}>"></i>
                        <{else}>
                            <i class="fa fa-book"></i>
                        <{/if}>
                        <{if $depth == 0}>
                            <span><{label text=$menuitem->NAME}></span>
                        <{else}>
                            <{label text=$menuitem->NAME}>
                        <{/if}>
                    </a>
                    <{include file="menu.adminex.items.tpl" parent=$parent2 depth=$depth2}>
                </li>
            <{/if}>
        <{/foreach}>
    </ul>
<{/if}>
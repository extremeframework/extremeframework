<{$submenus = PageHelper::getPageNavigation($single)}>

<{if $submenus}>
    <ul>
        <{foreach from=$submenus item=menuitem}>
            <{$is_folder = PageHelper::hasSubPages($menuitem->ID_PAGE)}>
            <{$is_active = ($menuitem->ID_PAGE == $single->ID)}>
            <{$is_parent_of_current = PageHelper::isParentOfPage($menuitem->ID_PAGE, $single)}>
            <{$is_folder_open = ($is_folder && $is_active) || $is_parent_of_current}>

            <li class="<{if $is_folder}><{if !$is_folder_open}>folder-closed<{else}><{if $is_active}>active folder-open-active<{else}>folder-open<{/if}><{/if}><{else}><{if $is_active}>active page-active<{else}>page<{/if}><{/if}>">
                <a href="<{$menuitem->SLUG}>">
                    <i class="fa fa-chevron-right show-for-small-only">&#160;</i>
                    <{$menuitem->TITLE}>
                </a>
            </li>

            <{if $is_folder_open}>
                <{include file="left-menu.subpages.tpl" parentid=$menuitem->ID_PAGE parentactive=$is_active}>
            <{/if}>
        <{/foreach}>
    </ul>
<{else}>
    <{include file="left-menu.subpages.tpl" parentid=$single->ID parentactive=true}>
<{/if}>
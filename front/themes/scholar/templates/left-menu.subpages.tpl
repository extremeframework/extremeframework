<{$subpages = PageHelper::getSubPages($parentid)}>

<ul <{if $parentactive}>id="current-children"<{/if}>>
    <{foreach from=$subpages item=page}>
        <{$is_folder = PageHelper::hasSubPages($page->ID)}>
        <{$is_active = ($page->ID == $single->ID)}>
        <{$is_parent_of_current = PageHelper::isParentOfPage($page->ID, $single)}>
        <{$is_folder_open = ($is_folder && $is_active) || $is_parent_of_current}>

        <li class="<{if $is_folder}><{if !$is_folder_open}>folder-closed<{else}><{if $is_active}>active folder-open-active<{else}>folder-open<{/if}><{/if}><{else}><{if $is_active}>active page-active<{else}>page<{/if}><{/if}>">
            <a href="<{link module="page" id=$page->ID slug=$page->SLUG}>">
                <i class="fa fa-chevron-right show-for-small-only">&nbsp;</i>
                <{$page->TITLE}>
            </a>
        </li>

        <{if $is_folder_open}>
            <{include file="left-menu.subpages.tpl" parentid=$page->ID parentactive=$is_active}>
        <{/if}>
    <{/foreach}>
</ul>
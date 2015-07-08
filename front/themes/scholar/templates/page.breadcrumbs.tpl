<{$breadcrumbs = PageController::getBreadCrumbs($single)}>

<{foreach from=$breadcrumbs key=key item=item}>
    <{if $item.link}>
        <a href="<{$item.link}>"><{$item.title}></a>
        <span class="divider">&#8250;</span>
    <{else}>
        <span id="active"><{$item.title}></span>
    <{/if}>
<{/foreach}>
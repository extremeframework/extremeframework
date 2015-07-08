<div class="row" id="content">
    <div class="small-12 medium-3 large-3 three columns remove-left" id="left-navigation">
        <{include file="page.left-menu.tpl"}>
    </div>

    <{$right_widgets = PageHelper::getPageWidgets($single, 'side-bar-right')}>

    <div class="small-12 <{if $right_widgets}>medium-6 large-6 six<{else}>medium-9 large-9 nine<{/if}> columns" id="body-area">
        <{if $single->IMAGE && $context != "site-section"}>
            <h2>
                <img alt="<{$single->TITLE}>" src="<{$smarty.const.UPLOAD_URL}>/<{$single->IMAGE}>" width="720" height="315" >
            </h2>
        <{/if}>
        <{$single->CONTENT|shortcodes}>
    </div>

    <{if $right_widgets}>
        <div class="small-12 medium-3 large-3 three columns" id="right-column">
            <{include file="widgets.tpl" widgets=$right_widgets}>
        </div>
    <{/if}>

    <div class="small-12 medium-3 large-3 three columns mobile-left-navigation" id="left-navigation">
        <{include file="page.left-menu.tpl"}>
    </div>
</div>
<{include file="header.tpl" context="main-site"}>

<div id="jumbotron">
    <{$galleries = PageHelper::getPageGalleries($single)}>

    <{if $galleries}>
        <{$item = $galleries[0]}>

        <span data-alt="<{$item->TITLE}>" data-picture="">
            <a href="<{$item->SLUG}>"><span data-src="<{$smarty.const.THEME_URL}>/uploads/www-slide-sm.jpg"></span></a>
            <a href="<{$item->SLUG}>"><span data-media="(min-width: 40.063em)" data-src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"></span></a>
            <span data-media="(min-width: 64em)" data-src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"></span>

            <!--[if IE 9]>
            <span data-src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"></span>
            <![endif]-->


            <!--[if lt IE 9]>
            <span data-src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"></span>
            <![endif]-->

            <noscript>
                <img alt="<{$item->TITLE}>" src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"/>
            </noscript>
        </span>
        <div class="row">
            <div class="large-12 columns remove-left">
                <div class="callout">
                    <p class="title"><a href="<{$item->SLUG}>"><{$item->TITLE}></a></p>
                    <p class="content lead show-for-large-up">
                        <{$item->DESCRIPTION|shortcodes}>
                    </p>
                    <p class="content show-for-large-up"><a href="<{$item->SLUG}>">Details &#187;</a></p>
                </div>
            </div>
        </div>
    <{/if}>
</div>

<{$hot_links = PageHelper::getPageLinks($single, 'hot-links')}>

<{if $hot_links}>
    <div class="row" id="hot-links">
        <div id="flyout">
            <{$count = count($hot_links)}>

            <{foreach from=$hot_links key=key item=item}>
                <{$is_last_2_links = ($key >= $count-2)}>

                <div class="small-6 medium-2 large-2 two columns <{if $key%2 == 0}>middle-line<{/if}> <{if !$is_last_2_links}>bottom-line<{/if}>">
                    <a href="<{$item->SLUG}>">
                        <i class="fa <{$item->FONT_AWESOME_ICON}>">
                            &#160;
                        </i>
                        <{$item->TITLE}>
                    </a>
                </div>
            <{/foreach}>
        </div>
    </div>
<{/if}>

<div class="row" id="<{$single->SLUG}>">
    <{$single->CONTENT|shortcodes}>
</div>

<{include file="footer.tpl" context="main-site"}>
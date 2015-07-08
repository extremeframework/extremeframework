<{include file="header.tpl" context="subsite"}>

<div class="row">
    <div class="small-12 medium-12 large-12 twelve columns" id="breadcrumb"></div>
</div>

<div class="row" id="content">
    <div class="small-12 medium-9 large-9 nine columns remove-left remove-right" id="body-area">
        <div class="small-12 medium-12 large-12 twelve columns remove-left body-block" data-random="true" data-type="slideshow" id="subsite-slideshow-wrapper">
            <{$galleries = PageHelper::getPageGalleries($single)}>

            <{if $galleries}>
                <ul id="subsite-slideshow">
                    <{foreach from=$galleries item=item}>
                        <li>
                            <img alt="<{$item->TITLE}>" src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"/>
                            <div class="callout">
                                <p class="title">
                                    <{if $item->SLUG}>
                                        <a href="<{$item->SLUG}>"><{$item->TITLE}></a>
                                    <{else}>
                                        <{$item->TITLE}>
                                    <{/if}>
                                 </p>
                                <p class="content lead show-for-large-up"><{$item->DESCRIPTION}></p>
                            </div>
                        </li>
                    <{/foreach}>
                </ul>
            <{/if}>
        </div>
        <div class="small-12 medium-3 large-4 four columns" id="subsite-left-column">
            <{$widgets = PageHelper::getPageWidgets($single, 'side-bar-left')}>

            <{include file="widgets.tpl" widgets=$widgets}>
        </div>
        <div class="small-12 medium-9 large-8 eight columns" id="subsite-mid-column">
            <{$single->CONTENT|shortcodes}>
        </div>
    </div>
    <div class="small-12 medium-3 large-3 three columns" id="right-column">
        <{$widgets = PageHelper::getPageWidgets($single, 'side-bar-right')}>

        <{include file="widgets.tpl" widgets=$widgets}>
    </div>
</div>

<{include file="footer.tpl" context="subsite"}>
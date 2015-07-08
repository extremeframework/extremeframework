<{foreach from=$widgets item=item}>
    <div class="sidebar-block <{$item->ID_WIDGET_TYPE}> <{$item->CODE}>" data-type="<{if $item->ID_WIDGET_TYPE}><{$item->ID_WIDGET_TYPE}><{else}>general<{/if}>">
        <{if !$item->HIDE_TITLE && $item->ID_WIDGET_TYPE != 'spotlight'}>
            <div class="title">
                <{$item->TITLE}>
            </div>
        <{/if}>

        <{if $item->ID_WIDGET_TYPE == 'spotlight'}>
            <div class="image">
                <a class="image" href="<{$item->LINK}>" target="_blank">
                    <img alt="<{$item->TITLE}>" src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>">
                    <div class="title"><{$item->TITLE}></div>
                </a>
            </div>
        <{/if}>

        <div class="body">
            <{if $item->ID_WIDGET_TYPE == 'video'}>
                <a class="featured fancybox.iframe" href="<{$item->LINK}>">
                    <div>
                        <img alt="Play icon" class="playicon" src="<{$smarty.const.THEME_URL}>/images/icon-playbutton.png"/>
                        <{if $item->IMAGE}>
                            <img alt="<{$item->TITLE}>" class="thumb" src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"/>
                        <{else}>
                            <img alt="" class="thumb" src=""/>
                        <{/if}>
                    </div>
                    <span class="text">
                        <{$item->CONTENT|shortcodes}>
                    </span>
                </a>
            <{elseif $item->ID_WIDGET_TYPE == 'spotlight'}>
                <p><{$item->CONTENT}></p>
                <p><a href="<{$item->LINK}>" target="_blank">Read more »</a></p>
            <{else}>
                <{$item->CONTENT|shortcodes}>
            <{/if}>
        </div>
    </div>
<{/foreach}>
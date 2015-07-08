<div class="body-block feed news" data-type="body-news" data-feed="<{$smarty.const.APPLICATION_URL}>/json/newsFeed" data-category="<{$category}>" data-page="1" data-limit="<{$limit}>">
    <div class="body">
        <{include file="part.news_list.tpl"}>
    </div>

    <{if $posts}>
        <div class="more-btn">
            <a href="#" id="more">More Stories</a>
        </div>
    <{/if}>
</div>
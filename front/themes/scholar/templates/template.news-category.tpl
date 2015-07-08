<{include file="header.tpl" context="news-category"}>

<div class="row">
    <div class="small-12 medium-12 large-12 twelve columns" id="breadcrumb"></div>
</div>
<div class="row">
    <div class="small-12 medium-12 large-12 twelve columns" id="heading">
        <{$single->NAME|ucwords}> News
    </div>
</div>
<div class="row" id="content">
    <div class="small-12 medium-9 large-9 nine columns" id="body-area">
        <{$posts = PostHelper::getLatestPosts($single->ID, 10)}>

        <{include file="shortcode.news_list.tpl" posts=$posts}>
    </div>

    <div class="small-12 medium-3 large-3 three columns" id="right-column">
        <{include file="widget.news_feeds.tpl"}>
    </div>
</div>

<{include file="footer.tpl" context="news-category"}>
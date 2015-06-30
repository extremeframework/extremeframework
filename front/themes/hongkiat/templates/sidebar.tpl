<div class="widget">
    <div style="height:250px; width:300px;">
        <img src="http://cdn.adnxs.com/p/9d/c3/ef/2c/9dc3ef2caa2d1fde4b5b45c50237f34a.jpg">
    </div>
</div>

<{$root_category_id = get_theme_option('blog-root-category-id')}>
<{$posts = PostHelper::getPopularPosts($root_category_id, 10)}>

<{if $posts}>
    <aside id="popular-widget" class="widget popular clearfix">
        <h3 class="widget-title"><{label text="Popular In"}> <{get_theme_option('site-name')}></h3>
        <ul class="clearfix">
            <{foreach from=$posts key=key item=post}>
                <li class="post clearfix">
                    <div class="post-thumbnail small">
                        <a href="<{PostHelper::getPostLink($post)}>" title="<{$post->TITLE}>" rel="nofollow"><img src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>" width="150" height="96" scale="0"/></a>
                    </div>
                    <div class="post-content">
                        <h4 class="post-title"><a href="<{PostHelper::getPostLink($post)}>" rel="nofollow"><{$post->TITLE}></a></h4>
                        <div class="post-meta"><a href="<{link module="postcategory" slug=$post->refslug_ID_POST_CATEGORY id=$post->ID_POST_CATEGORY}>" rel="nofollow"><{$post->reftext_ID_POST_CATEGORY}></a></div>
                    </div>
                </li>
                <{if $key && $key % 5 == 0}>
                    <li class="adunit adunit-sidebar adunit-sidebar-middle clearfix">
                        <div style="height:250px; width:300px;">
                            <img src="http://cdn.adnxs.com/p/9d/c3/ef/2c/9dc3ef2caa2d1fde4b5b45c50237f34a.jpg">
                        </div>
                    </li>
                <{/if}>
            <{/foreach}>
            <li class="adunit adunit-sidebar adunit-sidebar-bottom clearfix">
                <div style="height:250px; width:300px;">
                    <img src="http://cdn.adnxs.com/p/9d/c3/ef/2c/9dc3ef2caa2d1fde4b5b45c50237f34a.jpg">
                </div>
            </li>
        </ul>
    </aside>
<{/if}>
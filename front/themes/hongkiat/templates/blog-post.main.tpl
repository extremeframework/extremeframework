<article class="post-panel">
    <header class="post-header">
        <h1 class="post-title"><{$single->TITLE}></h1>
        <div class="post-meta">
            <ul>
                <{if $single->AUTHOR}>
                    <li class="post-author">
                        <a href="<{$smarty.const.APPLICATION_URL}>/author/<{$single->AUTHOR}>" title="Posts by <{$single->AUTHOR}>" rel="author"><{$single->AUTHOR}></a>
                        <span class="dash">—</span>
                    </li>
                <{/if}>
                <li class="post-category"><a href="<{link module="postcategory" slug=$single->refslug_ID_POST_CATEGORY id=$single->ID_POST_CATEGORY}>" title="View all posts in <{$single->reftext_ID_POST_CATEGORY}>"><{$single->reftext_ID_POST_CATEGORY}></a></li>
            </ul>
        </div>
        <figure class="post-image">
            <img src="<{$smarty.const.UPLOAD_URL}>/<{$single->IMAGE}>" scale="0">
        </figure>
    </header>

    <div class="post-content">
        <{$single->CONTENT}>

        <{$sections = PostHelper::getPostSections($single->ID)}>

        <{foreach from=$sections item=section}>
            <div class="post-section">
                <h4><a href="<{$section->LINK_PATH}>"><{$section->TITLE}></a></h4>
                <p><{$section->CONTENT}></p>
                <{if $section->IMAGE}>
                    <figure class="post-image">
                        <a href="<{$section->LINK_PATH}>">
                            <img src="<{$smarty.const.UPLOAD_URL}>/<{$section->IMAGE}>" width="100%" height="auto" scale="0">
                        </a>
                    </figure>
                <{/if}>
            <div>
        <{/foreach}>
    </div>

    <footer class="post-footer">
        <{$related_posts = PostHelper::getRelatedPosts($post)}>

        <{if $related_posts}>
            <div class="related-posts clearfix">
                <h3><{label text="Readers also read"}>:</h3>
                <ul class="clearfix">
                    <{foreach from=$related_posts item=post}>
                        <li class="clearfix">
                            <figure class="post-thumbnail small">
                                <a href="<{PostHelper::getPostLink($post)}>" title="<{$post->TITLE}>">
                                    <img src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>" scale="0">
                                </a>
                            </figure>
                            <h4 class="post-title">
        						<a href="<{PostHelper::getPostLink($post)}>" rel="bookmark"><{$post->TITLE}></a>
        					</h4>
                        </li>
                    <{/foreach}>
                </ul>
            </div>
        <{/if}>

        <{$tags = PostHelper::getPostTags($single)}>

        <{if $tags}>
            <div class="post-tags">
                <ul>
                    <li class="tag-heading"><{label text="Read more posts on"}>:</li>
                    <{foreach from=$tags key=key item=tag}>
                        <li><{if $key}>, <{/if}><a href="<{$smarty.const.APPLICATION_URL}>/tag/<{$tag|urlencode}>/" rel="tag"><{$tag}></a></li>
                    <{/foreach}>
                </ul>
            </div>
        <{/if}>
    </footer>

    <div class="ad"></div>
</article>

<div id="disqus_thread"></div>

<script type="text/javascript">
    var disqus_shortname = '<{get_theme_option('disqus_shortname')}>';
    var disqus_identifier = '<{$single->ID}>-<{$single->SLUG}>';
    var disqus_title = '<{$meta_title}>';
    var disqus_url = '<{PostHelper::getPostLink($single)}>';
    var disqus_config = function () {
        this.language = '';
    };
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
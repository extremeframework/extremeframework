<{foreach from=$posts item=post}>
    <article class="clearfix post-item">
        <div class="post-images">
            <div class="post-thumbnail small">
                <a href="<{PostHelper::getPostLink($post)}>" title="<{$post->TITLE}>"><img src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>" width="250" height="260"/></a>
            </div>
        </div>
        <div class="post-content">
            <header class="post-header">
                <h2 class="post-title"><a href="<{PostHelper::getPostLink($post)}>" rel="bookmark"><{$post->TITLE}></a></h2>
                <div class="post-meta">
                    <ul>
                        <{if $post->AUTHOR && !$hideauthor}>
                            <li class="post-author">
                                <a href="<{$smarty.const.APPLICATION_URL}>/author/<{$post->AUTHOR|urlencode}>" title="Posts by <{$post->AUTHOR}>" rel="author"><{$post->AUTHOR}></a>
                                <span class="dash">&mdash;</span>
                            </li>
                        <{/if}>
                        <li class="post-category">
                            <a href="<{link module="postcategory" slug=$post->refslug_ID_POST_CATEGORY id=$post->ID_POST_CATEGORY}>" title="View all posts in <{$post->reftext_ID_POST_CATEGORY|ucwords}>"><{$post->reftext_ID_POST_CATEGORY|ucwords}></a>
                            <span class="dash">&mdash;</span>
                        </li>
                        <li class="post-time">
                            <{$post->LATEST_UPDATE|friendly_date}>
                        </li>
                    </ul>
                </div>
            </header>
            <div class="post-excerpt">
                <p>
                    <{$post->EXCERPT|truncate:120}>
                    <a class="continue-read" href="<{PostHelper::getPostLink($post)}>"><{label text="Continue reading"}></a>
                </p>
            </div>
        </div>
    </article>
<{/foreach}>
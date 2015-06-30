<ul class="subpost-list clearfix">
    <{foreach from=$posts item=post}>
        <li>
            <h3>
                <a href="<{link module="postcategory" slug=$post->refslug_ID_POST_CATEGORY id=$post->ID_POST_CATEGORY}>" title="View all posts in <{$post->reftext_ID_POST_CATEGORY}>"><{$post->reftext_ID_POST_CATEGORY}></a>
            </h3>
            <div class="post-thumbnail small">
                <a href="<{PostHelper::getPostLink($post)}>" title="<{$post->TITLE}>"><img src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>" scale="0"></a>
            </div>
            <div class="post-content">
                <h4 class="post-title"><a href="<{PostHelper::getPostLink($post)}>" rel="bookmark"><{$post->TITLE}></a></h4>
            </div>
            <div class="post-author">
                <a href="<{$smarty.const.APPLICATION_URL}>/author/<{$post->AUTHOR|urlencode}>" title="Posts by <{$post->AUTHOR}>" rel="author"><{$post->AUTHOR}></a>
            </div>
        </li>
    <{/foreach}>
</ul>
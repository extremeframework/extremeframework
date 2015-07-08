<{foreach from=$posts item=post}>
    <div class="story-block">
        <a href="<{PostHelper::getPostLink($post)}>">
            <img src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>" alt="<{$post->TITLE}>" width="140px">
        </a>
        <div class="story-text has-image">
            <a href="<{PostHelper::getPostLink($post)}>">
                <strong><{$post->TITLE}></strong>
            </a>
            <p style="float: none; position: static;">
                <{$post->EXCERPT|truncate:120}>
            </p>
            <div class="tagline"></div>
        </div>
    </div>
<{/foreach}>
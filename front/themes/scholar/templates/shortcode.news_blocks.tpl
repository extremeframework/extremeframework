<div class="row" id="news">
    <{foreach from=$posts item=post}>
        <div class="small-12 medium-12 large-3 three columns">
            <div class="inner">
                <div class="image">
                    <a href="<{PostHelper::getPostLink($post)}>"><img alt="<{$post->TITLE}>" src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>"/></a>
                </div>
                <div class="body">
                    <p>
                        <strong>
                            <a href="<{PostHelper::getPostLink($post)}>"><{$post->TITLE}></a>
                        </strong>
                    </p>
                    <p><{$post->EXCERPT|truncate:120}></p>
                </div>
            </div>
        </div>
    <{/foreach}>
</div>
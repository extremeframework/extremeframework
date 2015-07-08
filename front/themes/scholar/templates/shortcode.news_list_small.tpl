<div class="feed news">
    <div class="body">
        <{foreach from=$posts key=key item=post}>
            <a class="<{if $key == 0}>featured<{else}>story<{/if}>" href="<{PostHelper::getPostLink($post)}>">
                <img src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>" alt="<{$post->TITLE}>">
                <span class="text">
                    <p title="<{$post->TITLE}>" style="float: none; position: static;"><{if $key == 0}><{$post->TITLE}><{else}><{$post->TITLE|truncate:50}><{/if}></p>
                 </span>
            </a>
        <{/foreach}>
    </div>
</div>

<div class="more"><a href="<{link module="postcategory" id=$category_id}>">More news »</a></div>
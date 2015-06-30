<{if !$posts}>
    <{include file="404.tpl"}>
<{else}>
    <header id="page-header">
        <h1 class="page-title"><{$tag|ucwords}></h1>
    </header>

    <div class="main-list clearfix">
        <div id="posts-list-heading" class="heading post-heading">
            <{label text="Latest posts in"}> <{$tag}>
        </div>

        <div id="posts-list">
           <{include file="posts-list.tpl" posts=$posts}>
        </div>
        <{if $page_count > 1}>
            <{include file="posts-nav.tpl" page=$page page_count=$page_count prefix="`$smarty.const.APPLICATION_URL`/tag/`$tag|urlencode`"}>
        <{/if}>
    </div>
<{/if}>

<header id="page-header">
    <h1 class="page-title">Search</h1>
</header>

<{if !$posts}>
    <{label text="No posts about"}> '<{$keyword}>'
<{else}>
    <div class="main-list clearfix">
        <div id="posts-list-heading" class="heading post-heading">
            <{label text="Latest posts about"}> '<{$keyword}>'
        </div>
        <div id="posts-list">
           <{include file="posts-list.tpl" posts=$posts}>
        </div>
        <{if $page_count > 1}>
            <{include file="posts-nav.tpl" page=$page page_count=$page_count prefix="`$smarty.const.APPLICATION_URL`/search/`$keyword|urlencode`"}>
        <{/if}>
    </div>
<{/if}>

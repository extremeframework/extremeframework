<{$root_category_id = get_theme_option('blog-root-category-id')}>
<{$is_root_category = ($single->ID == $root_category_id)}>

<{$posts = PostHelper::getFeaturedPosts($single->ID, 4)}>

<{if $smarty.request.page}>
    <{$page = $smarty.request.page}>
<{else}>
    <{$page = 1}>
<{/if}>

<{$latest_posts = PostHelper::getLatestPosts($single->ID, 10, $page, $page_count)}>

<{if $posts}>
    <{$latest_posts = PostHelper::excludePosts($latest_posts, $posts)}>
<{/if}>

<{if !$is_root_category}>
    <header id="page-header">
        <h1 class="page-title"><{$single->NAME}></h1>
        <{if $show_category_description}>
    		<div class="archive-desc">
    		    <{$single->DESCRIPTION}>
            </div>
        <{/if}>
    </header>
<{/if}>

<{if $posts}>
    <div class="featured clearfix">
        <div id="heading-trending" class="heading post-heading">
            <{label text="Trending Now"}> <{if !$is_root_category}><{label text="In"}> <{$single->NAME}><{/if}>
        </div>

        <{$post = array_shift($posts)}>

        <div class="trending clearfix">
            <article class="post clearfix">
                <div class="post-images">
                    <div class="post-thumbnail large">
                        <a href="<{PostHelper::getPostLink($post)}>" title="<{$post->TITLE}>"><img src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>"/></a>
                    </div>
                </div>
                <div class="post-content">
                    <header class="post-header">
                        <h2 class="post-title"><a href="<{PostHelper::getPostLink($post)}>" rel="bookmark"><{$post->TITLE}></a></h2>
                        <div class="post-meta">
                            <ul>
                                <{if $post->AUTHOR}>
                                    <li class="post-author">
                                        <a href="<{$smarty.const.APPLICATION_URL}>/author/<{$post->AUTHOR|urlencode}>" title="Posts by <{$post->AUTHOR}>" rel="author"><{$post->AUTHOR}></a>
                                        <span class="dash">&ndash;</span>
                                    </li>
                                <{/if}>
                                <li class="post-time">
                                    <{$post->CREATION_DATE|friendly_date}>
                                </li>
                            </ul>
                        </div>
                    </header>
                    <div class="post-excerpt">
                        <{$post->EXCERPT|truncate:120}>
                        <a class="continue-read" href="<{PostHelper::getPostLink($post)}>"><{label text="Continue reading"}></a>
                    </div>
                </div>
            </article>
        </div>

        <{if $posts}>
            <div class="more-trending">
                <ul class="clearfix">
                    <{foreach from=$posts item=post}>
                        <li>
                            <div class="post-thumbnail">
                                <a href="<{PostHelper::getPostLink($post)}>" title="<{$post->TITLE}>"><img src="<{$smarty.const.UPLOAD_URL}>/<{$post->IMAGE}>"/></a>
                            </div>
                            <div class="post-content">
                                <h4 class="post-title"><a href="<{PostHelper::getPostLink($post)}>" rel="bookmark"><{$post->TITLE}></a></h4>
                            </div>
                        </li>
                    <{/foreach}>
                </ul>
            </div>
        <{/if}>
    </div>
<{/if}>

<{if $latest_posts}>
    <div class="main-list clearfix">
        <div id="posts-list-heading" class="heading post-heading">
            <{label text="Latest Posts"}> <{if !$is_root_category}><{label text="In"}> <{$single->NAME}><{/if}>
        </div>
        <div id="posts-list">
           <{include file="posts-list.tpl" posts=$latest_posts}>
        </div>
        <{if $page_count > 1}>
            <{include file="posts-nav.tpl" page=$page page_count=$page_count prefix=PostHelper::getCategoryLink($single)}>
        <{/if}>
    </div>
<{/if}>

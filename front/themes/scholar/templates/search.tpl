<{include file="header.tpl" context="search" meta_title="`$keyword` | Search"}>

<div id="search-bar">
    <div class="row">
        <div class="large-12 columns remove-left remove-right">
            <div class="small-12 medium-12 large-12 columns">
                <form action="<{$smarty.const.APPLICATION_URL}>/search" method="get">
                    <input type="text" id="large-search" placeholder="Search..." value="<{$keyword}>" name="q" />
                    <button type="submit" id="large-search-button">
                        <img src="<{$smarty.const.THEME_URL}>/images/icon-magnifyingglass.png" alt=""/>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="large-12 medium-12 small-12 columns twelve">
        <{if !$pages && !$posts}>
            <br/>
            <p>We couldn't find anything for <strong><{$keyword}></strong>. </p>
        <{else}>
            <{foreach from=$posts item=item}>
                <div class="result">
                    <a href="<{PostHelper::getPostLink($item)}>" class="title-link">
                        <{$item->TITLE|highlight_keyword:$keyword}>
                    </a>
                    <br />
                    <{if $item->CONTENT}>
                        <{$item->CONTENT|shortcodes|highlight_keyword:$keyword:2}>
                        <br />
                    <{/if}>
                    <a href="<{PostHelper::getPostLink($item)}>" class="actual_link"><{PostHelper::getPostLink($item)|highlight_keyword:$keyword}></a>
                </div>
            <{/foreach}>

            <{foreach from=$pages item=item}>
                <div class="result">
                    <a href="<{PageHelper::getPageLink($item)}>" class="title-link">
                        <{LinkHelper::getFullPageTitle($item->ID)|highlight_keyword:$keyword}>
                    </a>
                    <br />
                    <{if $item->CONTENT}>
                        <{$item->CONTENT|shortcodes|highlight_keyword:$keyword:2}>
                        <br />
                    <{/if}>
                    <a href="<{PageHelper::getPageLink($item)}>" class="actual_link"><{PageHelper::getPageLink($item)|highlight_keyword:$keyword}></a>
                </div>
            <{/foreach}>

            <ul class="pager">
                <{$prev = max(1, $page - 1)}>
                <{$next = min($page_count, $page + 1)}>

                <{if $prev != $page}>
                    <li>
                        <a href="<{$smarty.const.APPLICATION_URL}>/search?page=<{$prev}>&q=<{$keyword}>">&laquo; Previous</a>
                    </li>
                <{else}>
                    <li class="disabled">
                        <span>&laquo; Previous</span>
                    </li>
                <{/if}>

                <{if $next != $page}>
                    <li>
                        <a href="<{$smarty.const.APPLICATION_URL}>/search?page=<{$next}>&q=<{$keyword}>">Next &raquo;</a>
                    </li>
                <{else}>
                    <li class="disabled">
                        <span>Next &raquo;</span>
                    </li>
                <{/if}>
            </ul>
        <{/if}>
    </div>
</div>

<{include file="footer.tpl" context="search"}>
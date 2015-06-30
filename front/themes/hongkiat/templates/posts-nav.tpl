<nav class="pagination" role="navigation">
    <div class="pagination-main">
        <span class='pages'>Page <{$page}> of <{$page_count}></span>

        <{$prev = max(1, $page - 1)}>
        <{$next = min($page_count, $page + 1)}>

        <{$from = max(1, $page - 5)}>
        <{$to = min($page_count, $page + 5)}>

        <{if $prev != $page}>
            <a class="prev" rel="prev" href="<{$prefix}>?page=<{$prev}>">&#59399;</a>
        <{else}>
            <span class="prev disabled">&#59399;</span>
        <{/if}>

        <{for $i=$from to $to}>
            <{if $page == $i}>
                <span class="current"><{$page}></span>
            <{else}>
                <a class="page larger" href="<{$prefix}>?page=<{$i}>"><{$i}></a>
            <{/if}>
        <{/for}>

        <{if $next != $page}>
            <a class="next" rel="next" href="<{$prefix}>?page=<{$next}>">&#59400;</a>
        <{else}>
            <span class="next disabled">&#59400;</span>
        <{/if}>
    </div>
</nav>
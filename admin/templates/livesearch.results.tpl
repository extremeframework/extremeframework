<ul class="live-search-results">
    <{foreach from=$rows item=item}>
        <li><a <{if $liveselect}>data-id="<{$item.eid}>"<{else}>class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/<{$module}>/<{if $mode == 'edit'}>edit<{else}>view<{/if}>/<{$item.id}>"<{/if}>><{$item.title}></a></li>
    <{/foreach}>
</ul>
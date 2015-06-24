<{if $toolboxes}>
<div id="toolboxes">
    <{foreach from=$toolboxes item=toolbox}>
    <div class="toolbox">
        <h3><{$toolbox.title}></h3>
        <ul>
            <{foreach from=$toolbox.items item=item}>
            <li><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/<{$item->LINK}>"><{$item->TITLE}></a></li>
            <{/foreach}>
        </ul>
    </div>
    <{/foreach}>
</div>
<{/if}>
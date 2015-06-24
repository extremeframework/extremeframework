<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{$smarty.const.L_CLOSE}>">x</button>
    <h3><{label key=L_SELECT_LANGUAGE}></h3>
</div>

<style>
.language-selection {
    list-style: none;
}
.language-selection li {
    float: left;
    min-width: 160px;
}
.language-selection li a {
    text-decoration: none;
}
</style>

<div class="modal-inner" style="padding:0 20px">
    <ul class="language-selection">
        <{foreach from=$rows item=item}>
            <li>
                <{if $smarty.session.lang == $item->CODE}>
                    <{$item->NAME}>
                <{else}>
                    <a href="<{$smarty.const.APPLICATION_URL}>/?lang=<{$item->CODE}>"><{$item->NAME}></a>
                <{/if}>
            </li>
        <{/foreach}>
    </ul>
    <div style="clear:both"></div>
</div>
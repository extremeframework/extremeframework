<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Select language')}></h3>
</div>

<div class="modal-inner">
    <ul class="language-selection">
        <{foreach from=$rows item=item}>
            <li>
                <a href="<{$smarty.const.APPLICATION_URL}>/?lang=<{$item->CODE}>"><{$item->NAME}></a>
            </li>
        <{/foreach}>
    </ul>
    <div style="clear:both"></div>
</div>
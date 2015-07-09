<{if $smarty.request.source == 'view'}>
    <{$type = 'view'}>
<{else}>
    <{$type = 'row'}>
<{/if}>

<tr class="embedded-view <{$type}>-embedded-view userpreference-<{$type}>-embedded-view-<{$details->UUID}>" data-id="<{$details->UUID}>">
    <{if $smarty.request.source == 'list'}>
    	<td colspan="<{$smarty.request.colcount + 1}>">
            <div class="userpreference-view view_details">
                <div class="section">
                    <{include file="view-main.userpreference.tpl"}>
                </div>
            </div>
    	</td>
    	<td style="vertical-align: top;">
    	    <{if isset($smarty.session.acl.userpreference.edit) && WorkflowHelper::isEditable($details->WFID) && !$readonly}>
    	        <div class="row-embedded-view-edit btn btn-success"><{_t('L_EDIT')}></div><br/>
            <{/if}>
        </td>
	<{else}>
    	<td colspan="<{$smarty.request.colcount}>">
            <div class="userpreference-view view_details">
                <div class="section">
                    <{include file="view-main.userpreference.tpl"}>
                </div>
            </div>
    	</td>
	<{/if}>
</tr>
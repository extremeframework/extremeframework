<{if $smarty.request.source == 'view'}>
    <{$type = 'view'}>
<{else}>
    <{$type = 'row'}>
<{/if}>

<tr class="embedded-view <{$type}>-embedded-view userrole-<{$type}>-embedded-view-<{$details->UUID}>" data-id="<{$details->UUID}>">
    <{if $smarty.request.source == 'list'}>
    	<td colspan="<{$smarty.request.colcount + 1}>">
            <div class="userrole-view view_details">
                <div class="section">
                    <{include file="view-main.userrole.tpl"}>
                </div>
            </div>
    	</td>
    	<td style="vertical-align: top;">
    	    <{if isset($smarty.session.acl.userrole.edit) && WorkflowHelper::isEditable($details->WFID) && !$readonly}>
    	        <div class="row-embedded-view-edit btn btn-success"><{_t('Edit')}></div><br/>
            <{/if}>
        </td>
	<{else}>
    	<td colspan="<{$smarty.request.colcount}>">
            <div class="userrole-view view_details">
                <div class="section">
                    <{include file="view-main.userrole.tpl"}>
                </div>
            </div>
    	</td>
	<{/if}>
</tr>
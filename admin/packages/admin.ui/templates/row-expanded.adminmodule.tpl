<{if $smarty.request.source == 'view'}>
    <{$type = 'view'}>
<{else}>
    <{$type = 'row'}>
<{/if}>

<tr class="embedded-view <{$type}>-embedded-view adminmodule-<{$type}>-embedded-view-<{$details->UUID}>" data-id="<{$details->UUID}>">
    <{if $smarty.request.source == 'list'}>
    	<td colspan="<{$smarty.request.colcount + 1}>">
            <div class="adminmodule-view view_details">
                <div class="section">
                    <{include file="view-main.adminmodule.tpl"}>
                </div>
            </div>
    	</td>
    	<td style="vertical-align: top;">
    	    <{if isset($smarty.session.acl.adminmodule.edit) && WorkflowHelper::isEditable($details->WFID) && !$readonly}>
    	        <div class="row-embedded-view-edit btn btn-success"><{_t('Edit')}></div><br/>
            <{/if}>
        </td>
	<{else}>
    	<td colspan="<{$smarty.request.colcount}>">
            <div class="adminmodule-view view_details">
                <div class="section">
                    <{include file="view-main.adminmodule.tpl"}>
                </div>
            </div>
    	</td>
	<{/if}>
</tr>
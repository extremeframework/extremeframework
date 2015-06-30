<{if $smarty.request.source == 'view'}>
    <{$type = 'view'}>
<{else}>
    <{$type = 'row'}>
<{/if}>

<tr class="embedded-view <{$type}>-embedded-view postcategory-<{$type}>-embedded-view-<{$details->UUID}>" data-id="<{$details->UUID}>">
    <{if $smarty.request.source == 'list'}>
	    <td colspan="2"></td>
    	<td colspan="<{$smarty.request.colcount - 1}>">
            <div class="postcategory-view view_details">
                <div class="section">
                    <{include file="view-main.postcategory.tpl"}>
                </div>
            </div>
    	</td>
    	<td style="vertical-align: top;">
    	    <{if isset($smarty.session.acl.postcategory.edit) && WorkflowHelper::isEditable($details->WFID) && !$readonly}>
    	        <div class="row-embedded-view-edit btn btn-success"><{label key="L_EDIT"}></div><br/>
            <{/if}>
        </td>
	<{else}>
    	<td colspan="<{$smarty.request.colcount}>">
            <div class="postcategory-view view_details">
                <div class="section">
                    <{include file="view-main.postcategory.tpl"}>
                </div>
            </div>
    	</td>
	<{/if}>
</tr>
<{if $smarty.request.source == 'view'}>
    <{$type = 'view'}>
<{else}>
    <{$type = 'row'}>
<{/if}>

<tr class="embedded-view <{$type}>-embedded-view workflowapplication-<{$type}>-embedded-view-<{$details->UUID}>" data-id="<{$details->UUID}>">
    <{if $smarty.request.source == 'list'}>
    	<td colspan="<{$smarty.request.colcount + 1}>">
            <div class="workflowapplication-view view_details">
                <div class="section">
                    <{include file="edit-main.workflowapplication.tpl"}>
                </div>
            </div>
    	</td>
    	<td style="vertical-align: top;">
    	    <div class="row-embedded-edit-save btn btn-success">Save</div><br/>
    	    <a class="row-embedded-edit-cancel button-cancel">Cancel</a>
        </td>
	<{/if}>
</tr>
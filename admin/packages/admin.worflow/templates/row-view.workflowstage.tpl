<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-workflowstage-<{$row->UUID}>" class="workflowstagelistchk" name="workflowstagelist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>workflowstage_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('ID_WORKFLOW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
                <td class="column column-id-workflow reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WORKFLOW}>
        <{if $alreadyhaslink && isset($smarty.session.acl.workflow.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$row->refuuid_ID_WORKFLOW}>"><{$row->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$row->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WORKFLOW}><{$row->ID_WORKFLOW|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_DEFAULT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_DEFAULT']) && ((isset($aclviewablecolumns['IS_DEFAULT']) && $aclviewablecolumns['IS_DEFAULT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_DEFAULT']) || $aclviewablecolumns['IS_DEFAULT']))) }>
                <td class="column column-is-default yesno " data-value="<{$row->IS_DEFAULT}>" data-column="IS_DEFAULT" data-module="workflowstage">
                                        	<span>	<{if $row->IS_DEFAULT}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_BINDING_OBJECT_EDITABLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_BINDING_OBJECT_EDITABLE']) && ((isset($aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) && $aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) || $aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']))) }>
                <td class="column column-is-binding-object-editable yesno " data-value="<{$row->IS_BINDING_OBJECT_EDITABLE}>" data-column="IS_BINDING_OBJECT_EDITABLE" data-module="workflowstage">
                                        	<span>	<{if $row->IS_BINDING_OBJECT_EDITABLE}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_BINDING_OBJECT_DELETABLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_BINDING_OBJECT_DELETABLE']) && ((isset($aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) && $aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) || $aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']))) }>
                <td class="column column-is-binding-object-deletable yesno " data-value="<{$row->IS_BINDING_OBJECT_DELETABLE}>" data-column="IS_BINDING_OBJECT_DELETABLE" data-module="workflowstage">
                                        	<span>	<{if $row->IS_BINDING_OBJECT_DELETABLE}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="workflowstage_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.workflowstage.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{$smarty.const.L_EDIT}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.workflowstage[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/workflowstage/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{label text=$item->TITLE insidequote=true}>"></i><{else}><{label text=$item->TITLE}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/booking/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
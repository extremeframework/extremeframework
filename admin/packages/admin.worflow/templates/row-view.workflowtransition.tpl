<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-workflowtransition-<{$row->UUID}>" class="workflowtransitionlistchk" name="workflowtransitionlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>workflowtransition_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('ID_WORKFLOW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
                <td class="column column-id-workflow reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WORKFLOW}>
        <{if $alreadyhaslink && isset($smarty.session.acl.workflow.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$row->refuuid_ID_WORKFLOW}>"><{$row->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$row->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WORKFLOW}><{$row->ID_WORKFLOW|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ACTION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ACTION']) && ((isset($aclviewablecolumns['ACTION']) && $aclviewablecolumns['ACTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTION']) || $aclviewablecolumns['ACTION']))) }>
                <td class="column column-action text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>	<{$row->ACTION|escape}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
                <td class="column column-id-user-group reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ID_USER_GROUP}>"><{$row->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_GROUP}><{$row->ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_USER_ROLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
                <td class="column column-id-user-role reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_ROLE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.userrole.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$row->refuuid_ID_USER_ROLE}>"><{$row->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_ROLE}><{$row->ID_USER_ROLE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('TRANSITION_ID_SCREEN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TRANSITION_ID_SCREEN']) && ((isset($aclviewablecolumns['TRANSITION_ID_SCREEN']) && $aclviewablecolumns['TRANSITION_ID_SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TRANSITION_ID_SCREEN']) || $aclviewablecolumns['TRANSITION_ID_SCREEN']))) }>
                <td class="column column-transition-id-screen reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_TRANSITION_ID_SCREEN}>
        <{if $alreadyhaslink && isset($smarty.session.acl.screen.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$row->refuuid_TRANSITION_ID_SCREEN}>"><{$row->reftext_TRANSITION_ID_SCREEN|escape}></a>
        <{else}>
            <{$row->reftext_TRANSITION_ID_SCREEN|escape}>        <{/if}>
    <{else}>
    	<{if $row->TRANSITION_ID_SCREEN}><{$row->TRANSITION_ID_SCREEN|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="workflowtransition_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.workflowtransition.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{$smarty.const.L_EDIT}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.workflowtransition[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/workflowtransition/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{label text=$item->TITLE insidequote=true}>"></i><{else}><{label text=$item->TITLE}><{/if}></a>
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
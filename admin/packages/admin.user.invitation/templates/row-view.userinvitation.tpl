<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> status-<{$row->reftext_ID_USER_INVITATION_STATUS|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-userinvitation-<{$row->UUID}>" class="userinvitationlistchk" name="userinvitationlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>userinvitation_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('INVITEE_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['INVITEE_NAME']) && ((isset($aclviewablecolumns['INVITEE_NAME']) && $aclviewablecolumns['INVITEE_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INVITEE_NAME']) || $aclviewablecolumns['INVITEE_NAME']))) }>
                <td class="column column-invitee-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    	    <{$row->INVITEE_NAME|escape}>
    <{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('INVITEE_EMAIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['INVITEE_EMAIL']) && ((isset($aclviewablecolumns['INVITEE_EMAIL']) && $aclviewablecolumns['INVITEE_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INVITEE_EMAIL']) || $aclviewablecolumns['INVITEE_EMAIL']))) }>
                <td class="column column-invitee-email email " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    	    <{$row->INVITEE_EMAIL|escape}>
    <{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
                <td class="column column-id-user-group reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ID_USER_GROUP}>"><{$row->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_GROUP}><{$row->ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_USER_ROLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
                <td class="column column-id-user-role reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_ROLE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.userrole.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$row->refuuid_ID_USER_ROLE}>"><{$row->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_ROLE}><{$row->ID_USER_ROLE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('VALID_FROM', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
                <td class="column column-valid-from datetime " >
                                        	<span>
            <{$row->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('VALID_UNTIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_UNTIL']) && ((isset($aclviewablecolumns['VALID_UNTIL']) && $aclviewablecolumns['VALID_UNTIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_UNTIL']) || $aclviewablecolumns['VALID_UNTIL']))) }>
                <td class="column column-valid-until datetime " >
                                        	<span>
            <{$row->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_USER_INVITATION_STATUS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_INVITATION_STATUS']) && ((isset($aclviewablecolumns['ID_USER_INVITATION_STATUS']) && $aclviewablecolumns['ID_USER_INVITATION_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_INVITATION_STATUS']) || $aclviewablecolumns['ID_USER_INVITATION_STATUS']))) }>
                <td class="column column-id-user-invitation-status reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_INVITATION_STATUS}>
        <{if $alreadyhaslink && isset($smarty.session.acl.userinvitationstatus.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/view/<{$row->refuuid_ID_USER_INVITATION_STATUS}>"><{$row->reftext_ID_USER_INVITATION_STATUS|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_INVITATION_STATUS|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_INVITATION_STATUS}><{$row->ID_USER_INVITATION_STATUS|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('DATE_SENT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE_SENT']) && ((isset($aclviewablecolumns['DATE_SENT']) && $aclviewablecolumns['DATE_SENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_SENT']) || $aclviewablecolumns['DATE_SENT']))) }>
                <td class="column column-date-sent datetime " >
                                        	<span>
            <{$row->DATE_SENT|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('DATE_ACCEPTED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE_ACCEPTED']) && ((isset($aclviewablecolumns['DATE_ACCEPTED']) && $aclviewablecolumns['DATE_ACCEPTED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_ACCEPTED']) || $aclviewablecolumns['DATE_ACCEPTED']))) }>
                <td class="column column-date-accepted datetime " >
                                        	<span>
            <{$row->DATE_ACCEPTED|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="userinvitation_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.userinvitation.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.userinvitation[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/userinvitation/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
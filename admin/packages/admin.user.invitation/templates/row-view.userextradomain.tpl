<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-userextradomain-<{$row->UUID}>" class="userextradomainlistchk" name="userextradomainlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>userextradomain_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('EXTRA_UDID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['EXTRA_UDID']) && ((isset($aclviewablecolumns['EXTRA_UDID']) && $aclviewablecolumns['EXTRA_UDID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EXTRA_UDID']) || $aclviewablecolumns['EXTRA_UDID']))) }>
                <td class="column column-extra-udid number " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/view/<{$row->UUID}>"><{/if}>
            <{if $row->EXTRA_UDID != 0}><{$row->EXTRA_UDID}><{/if}>
    
    <{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('VALID_FROM', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
                <td class="column column-valid-from datetime " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/view/<{$row->UUID}>"><{/if}>
            <{$row->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    <{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="userextradomain_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.userextradomain.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.userextradomain[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/userextradomain/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/userextradomain/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
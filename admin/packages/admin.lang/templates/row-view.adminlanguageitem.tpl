<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminlanguageitem-<{$row->UUID}>" class="adminlanguageitemlistchk" name="adminlanguageitemlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminlanguageitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_ADMIN_LANGUAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_LANGUAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_LANGUAGE']) && $aclviewablecolumns['ID_ADMIN_LANGUAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LANGUAGE']) || $aclviewablecolumns['ID_ADMIN_LANGUAGE']))) }>
                <td class="column column-id-admin-language reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlanguageitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_LANGUAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminlanguage.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/view/<{$row->refuuid_ID_ADMIN_LANGUAGE}>"><{$row->reftext_ID_ADMIN_LANGUAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_LANGUAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_LANGUAGE}><{$row->ID_ADMIN_LANGUAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminlanguageitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_ADMIN_LABEL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_LABEL']) && ((isset($aclviewablecolumns['ID_ADMIN_LABEL']) && $aclviewablecolumns['ID_ADMIN_LABEL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LABEL']) || $aclviewablecolumns['ID_ADMIN_LABEL']))) }>
                <td class="column column-id-admin-label reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlanguageitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_LABEL}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminlabel.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/view/<{$row->refuuid_ID_ADMIN_LABEL}>"><{$row->reftext_ID_ADMIN_LABEL|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_LABEL|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_LABEL}><{$row->ID_ADMIN_LABEL|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminlanguageitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="adminlanguageitem_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminlanguageitem.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('L_EDIT', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminlanguageitem[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminlanguageitem/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
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
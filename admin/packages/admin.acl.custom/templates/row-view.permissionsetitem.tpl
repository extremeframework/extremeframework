<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-permissionsetitem-<{$row->UUID}>" class="permissionsetitemlistchk" name="permissionsetitemlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>permissionsetitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_PERMISSION_SET', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PERMISSION_SET']) && ((isset($aclviewablecolumns['ID_PERMISSION_SET']) && $aclviewablecolumns['ID_PERMISSION_SET']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PERMISSION_SET']) || $aclviewablecolumns['ID_PERMISSION_SET']))) }>
                <td class="column column-id-permission-set reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PERMISSION_SET}>
        <{if $alreadyhaslink && isset($smarty.session.acl.permissionset.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$row->refuuid_ID_PERMISSION_SET}>"><{$row->reftext_ID_PERMISSION_SET|escape}></a>
        <{else}>
            <{$row->reftext_ID_PERMISSION_SET|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PERMISSION_SET}><{$row->ID_PERMISSION_SET|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/view/<{$row->UUID}>"><{/if}>    	    <{$row->MODULE|escape}>
    <{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ACTIONS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ACTIONS']) && ((isset($aclviewablecolumns['ACTIONS']) && $aclviewablecolumns['ACTIONS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTIONS']) || $aclviewablecolumns['ACTIONS']))) }>
                <td class="column column-actions text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/view/<{$row->UUID}>"><{/if}>    	    <{$row->ACTIONS|escape}>
    <{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="permissionsetitem_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.permissionsetitem.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.permissionsetitem[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/permissionsetitem/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
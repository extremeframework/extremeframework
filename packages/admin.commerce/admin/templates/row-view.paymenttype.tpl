<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>"<{if $row->NOTE}> title="<{$row->NOTE|strip_tags}>"<{/if}>>
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-paymenttype-<{$row->UUID}>" class="paymenttypelistchk" name="paymenttypelist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>paymenttype_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.paymenttype.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/view/<{$row->UUID}>"><{/if}>            <{_t($row->NAME, false, true)}>
    <{if isset($smarty.session.acl.paymenttype.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.paymenttype.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/view/<{$row->UUID}>"><{/if}>    	    <{$row->CODE|escape}>
    <{if isset($smarty.session.acl.paymenttype.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_ENABLED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_ENABLED']) && ((isset($aclviewablecolumns['IS_ENABLED']) && $aclviewablecolumns['IS_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_ENABLED']) || $aclviewablecolumns['IS_ENABLED']))) }>
                <td class="column column-is-enabled yesno " data-value="<{$row->IS_ENABLED}>" data-column="IS_ENABLED" data-module="paymenttype">
                                        	<span>	<{if $row->IS_ENABLED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number " >
                                        	<span>
            <span class="number number-format"><{if $row->ORDERING != 0}><{$row->ORDERING}><{/if}></span>
    
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="paymenttype_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.paymenttype.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.paymenttype[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/paymenttype/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/paymenttype/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
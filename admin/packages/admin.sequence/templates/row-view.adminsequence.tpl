<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminsequence-<{$row->UUID}>" class="adminsequencelistchk" name="adminsequencelist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminsequence_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminsequence.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/view/<{$row->UUID}>"><{/if}>    	    <{$row->MODULE|escape}>
    <{if isset($smarty.session.acl.adminsequence.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('SEQUENCE_FORMAT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SEQUENCE_FORMAT']) && ((isset($aclviewablecolumns['SEQUENCE_FORMAT']) && $aclviewablecolumns['SEQUENCE_FORMAT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SEQUENCE_FORMAT']) || $aclviewablecolumns['SEQUENCE_FORMAT']))) }>
                <td class="column column-sequence-format text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminsequence.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/view/<{$row->UUID}>"><{/if}>    	    <{$row->SEQUENCE_FORMAT|escape}>
    <{if isset($smarty.session.acl.adminsequence.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CURRENT_VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CURRENT_VALUE']) && ((isset($aclviewablecolumns['CURRENT_VALUE']) && $aclviewablecolumns['CURRENT_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CURRENT_VALUE']) || $aclviewablecolumns['CURRENT_VALUE']))) }>
                <td class="column column-current-value text " >
                                        	<span>    	    <{$row->CURRENT_VALUE|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('SEQUENCE_STEP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SEQUENCE_STEP']) && ((isset($aclviewablecolumns['SEQUENCE_STEP']) && $aclviewablecolumns['SEQUENCE_STEP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SEQUENCE_STEP']) || $aclviewablecolumns['SEQUENCE_STEP']))) }>
                <td class="column column-sequence-step number " >
                                        	<span>
            <span class="number number-format"><{if $row->SEQUENCE_STEP != 0}><{$row->SEQUENCE_STEP}><{/if}></span>
    
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="adminsequence_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminsequence.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminsequence[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminsequence/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/adminsequence/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
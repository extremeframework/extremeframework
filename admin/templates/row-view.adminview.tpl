<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminview-<{$row->UUID}>" class="adminviewlistchk" name="adminviewlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminview_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_MODULE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmodule.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->refuuid_MODULE}>"><{$row->reftext_MODULE|escape}></a>
        <{else}>
            <{$row->reftext_MODULE|escape}>        <{/if}>
    <{else}>
    	<{if $row->MODULE}><{$row->MODULE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('SCREEN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SCREEN']) && ((isset($aclviewablecolumns['SCREEN']) && $aclviewablecolumns['SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SCREEN']) || $aclviewablecolumns['SCREEN']))) }>
                <td class="column column-screen text " >
                                        	<span>	<{$row->SCREEN|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CONDITION_FIELD', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CONDITION_FIELD']) && ((isset($aclviewablecolumns['CONDITION_FIELD']) && $aclviewablecolumns['CONDITION_FIELD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION_FIELD']) || $aclviewablecolumns['CONDITION_FIELD']))) }>
                <td class="column column-condition-field text " >
                                        	<span>	<{$row->CONDITION_FIELD|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CONDITION_VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CONDITION_VALUE']) && ((isset($aclviewablecolumns['CONDITION_VALUE']) && $aclviewablecolumns['CONDITION_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION_VALUE']) || $aclviewablecolumns['CONDITION_VALUE']))) }>
                <td class="column column-condition-value text " >
                                        	<span>	<{$row->CONDITION_VALUE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('TEMPLATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TEMPLATE']) && ((isset($aclviewablecolumns['TEMPLATE']) && $aclviewablecolumns['TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TEMPLATE']) || $aclviewablecolumns['TEMPLATE']))) }>
                <td class="column column-template text " >
                                        	<span>	<{$row->TEMPLATE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_PRINT_VIEW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_PRINT_VIEW']) && ((isset($aclviewablecolumns['IS_PRINT_VIEW']) && $aclviewablecolumns['IS_PRINT_VIEW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_PRINT_VIEW']) || $aclviewablecolumns['IS_PRINT_VIEW']))) }>
                <td class="column column-is-print-view yesno " data-value="<{$row->IS_PRINT_VIEW}>" data-column="IS_PRINT_VIEW" data-module="adminview">
                                        	<span>	<{if $row->IS_PRINT_VIEW}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
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
	<{plugin key="adminview_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminview.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{$smarty.const.L_EDIT}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminview[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminview/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{label text=$item->TITLE insidequote=true}>"></i><{else}><{label text=$item->TITLE}><{/if}></a>
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
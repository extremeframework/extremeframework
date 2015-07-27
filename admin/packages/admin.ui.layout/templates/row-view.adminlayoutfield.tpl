<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminlayoutfield-<{$row->UUID}>" class="adminlayoutfieldlistchk" name="adminlayoutfieldlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminlayoutfield_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/view/<{$row->UUID}>"><{/if}>    	    <{$row->MODULE|escape}>
    <{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_ADMIN_LAYOUT_SECTION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_LAYOUT_SECTION']) && ((isset($aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) && $aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) || $aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']))) }>
                <td class="column column-id-admin-layout-section reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_LAYOUT_SECTION}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminlayoutsection.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/view/<{$row->refuuid_ID_ADMIN_LAYOUT_SECTION}>"><{$row->reftext_ID_ADMIN_LAYOUT_SECTION|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_LAYOUT_SECTION|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_LAYOUT_SECTION}><{$row->ID_ADMIN_LAYOUT_SECTION|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('COLUMN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['COLUMN']) && ((isset($aclviewablecolumns['COLUMN']) && $aclviewablecolumns['COLUMN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COLUMN']) || $aclviewablecolumns['COLUMN']))) }>
                <td class="column column-column text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/view/<{$row->UUID}>"><{/if}>    	    <{$row->COLUMN|escape}>
    <{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('POSITION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['POSITION']) && ((isset($aclviewablecolumns['POSITION']) && $aclviewablecolumns['POSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['POSITION']) || $aclviewablecolumns['POSITION']))) }>
                <td class="column column-position text " >
                                        	<span>    	    <{$row->POSITION|escape}>
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
	<{plugin key="adminlayoutfield_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminlayoutfield.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminlayoutfield[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminlayoutfield/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
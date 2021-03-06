<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> type-<{$row->reftext_ID_DASHBOARD_ITEM_TYPE|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-dashboarditem-<{$row->UUID}>" class="dashboarditemlistchk" name="dashboarditemlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>dashboarditem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>"><{/if}>    	    <{$row->TITLE|escape}>
    <{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_DASHBOARD', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_DASHBOARD']) && ((isset($aclviewablecolumns['ID_DASHBOARD']) && $aclviewablecolumns['ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD']) || $aclviewablecolumns['ID_DASHBOARD']))) }>
                <td class="column column-id-dashboard reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_DASHBOARD}>
        <{if $alreadyhaslink && isset($smarty.session.acl.dashboard.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->refuuid_ID_DASHBOARD}>"><{$row->reftext_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$row->reftext_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_DASHBOARD}><{$row->ID_DASHBOARD|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>"><{/if}>    <{media src=$row->IMAGE thumbnail=1}>
<{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
                <td class="column column-path text " >
                                        	<span>    	    <{$row->PATH|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_DASHBOARD_ITEM_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_DASHBOARD_ITEM_TYPE']) && ((isset($aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) && $aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) || $aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']))) }>
                <td class="column column-id-dashboard-item-type reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_DASHBOARD_ITEM_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.dashboarditemtype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/view/<{$row->refuuid_ID_DASHBOARD_ITEM_TYPE}>"><{$row->reftext_ID_DASHBOARD_ITEM_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_DASHBOARD_ITEM_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_DASHBOARD_ITEM_TYPE}><{$row->ID_DASHBOARD_ITEM_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
	<{plugin key="dashboarditem_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.dashboarditem.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.dashboarditem[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/dashboarditem/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
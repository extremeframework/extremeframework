<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> type-<{$row->reftext_ID_PAGE_LINK_TYPE|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-pagelink-<{$row->UUID}>" class="pagelinklistchk" name="pagelinklist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>pagelink_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>    	    <{$row->TITLE|escape}>
    <{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
                <td class="column column-id-page reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_ID_PAGE}>"><{$row->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE}><{$row->ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('FONT_AWESOME_ICON', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
                <td class="column column-font-awesome-icon text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>    	    <{$row->FONT_AWESOME_ICON|escape}>
    <{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LINK_ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LINK_ID_PAGE']) && ((isset($aclviewablecolumns['LINK_ID_PAGE']) && $aclviewablecolumns['LINK_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_ID_PAGE']) || $aclviewablecolumns['LINK_ID_PAGE']))) }>
                <td class="column column-link-id-page reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_LINK_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_LINK_ID_PAGE}>"><{$row->reftext_LINK_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_LINK_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->LINK_ID_PAGE}><{$row->LINK_ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LINK_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LINK_PATH']) && ((isset($aclviewablecolumns['LINK_PATH']) && $aclviewablecolumns['LINK_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_PATH']) || $aclviewablecolumns['LINK_PATH']))) }>
                <td class="column column-link-path text " >
                                        	<span>    	    <{$row->LINK_PATH|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_PAGE_LINK_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE_LINK_TYPE']) && ((isset($aclviewablecolumns['ID_PAGE_LINK_TYPE']) && $aclviewablecolumns['ID_PAGE_LINK_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE_LINK_TYPE']) || $aclviewablecolumns['ID_PAGE_LINK_TYPE']))) }>
                <td class="column column-id-page-link-type reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE_LINK_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.pagelinktype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/view/<{$row->refuuid_ID_PAGE_LINK_TYPE}>"><{$row->reftext_ID_PAGE_LINK_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE_LINK_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE_LINK_TYPE}><{$row->ID_PAGE_LINK_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
	<{plugin key="pagelink_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.pagelink.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.pagelink[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/pagelink/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
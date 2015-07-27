<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminmenuitem-<{$row->UUID}>" class="adminmenuitemlistchk" name="adminmenuitemlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminmenuitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_ADMIN_MENU', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_MENU']) && ((isset($aclviewablecolumns['ID_ADMIN_MENU']) && $aclviewablecolumns['ID_ADMIN_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_MENU']) || $aclviewablecolumns['ID_ADMIN_MENU']))) }>
                <td class="column column-id-admin-menu reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_MENU}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmenu.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$row->refuuid_ID_ADMIN_MENU}>"><{$row->reftext_ID_ADMIN_MENU|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_MENU|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_MENU}><{$row->ID_ADMIN_MENU|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_MODULE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmodule.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->refuuid_MODULE}>"><{$row->reftext_MODULE|escape}></a>
        <{else}>
            <{$row->reftext_MODULE|escape}>        <{/if}>
    <{else}>
    	<{if $row->MODULE}><{$row->MODULE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
                <td class="column column-path text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>"><{/if}>    	    <{$row->PATH|escape}>
    <{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('FONT_AWESOME_ICON', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
                <td class="column column-font-awesome-icon text " >
                                        	<span>    	    <{$row->FONT_AWESOME_ICON|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ENABLE_LEFT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_LEFT']) && ((isset($aclviewablecolumns['ENABLE_LEFT']) && $aclviewablecolumns['ENABLE_LEFT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_LEFT']) || $aclviewablecolumns['ENABLE_LEFT']))) }>
                <td class="column column-enable-left yesno " data-value="<{$row->ENABLE_LEFT}>" data-column="ENABLE_LEFT" data-module="adminmenuitem">
                                        	<span>	<{if $row->ENABLE_LEFT}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ENABLE_TOP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_TOP']) && ((isset($aclviewablecolumns['ENABLE_TOP']) && $aclviewablecolumns['ENABLE_TOP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_TOP']) || $aclviewablecolumns['ENABLE_TOP']))) }>
                <td class="column column-enable-top yesno " data-value="<{$row->ENABLE_TOP}>" data-column="ENABLE_TOP" data-module="adminmenuitem">
                                        	<span>	<{if $row->ENABLE_TOP}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ENABLE_QUICK', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_QUICK']) && ((isset($aclviewablecolumns['ENABLE_QUICK']) && $aclviewablecolumns['ENABLE_QUICK']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_QUICK']) || $aclviewablecolumns['ENABLE_QUICK']))) }>
                <td class="column column-enable-quick yesno " data-value="<{$row->ENABLE_QUICK}>" data-column="ENABLE_QUICK" data-module="adminmenuitem">
                                        	<span>	<{if $row->ENABLE_QUICK}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ENABLE_ALL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_ALL']) && ((isset($aclviewablecolumns['ENABLE_ALL']) && $aclviewablecolumns['ENABLE_ALL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_ALL']) || $aclviewablecolumns['ENABLE_ALL']))) }>
                <td class="column column-enable-all yesno " data-value="<{$row->ENABLE_ALL}>" data-column="ENABLE_ALL" data-module="adminmenuitem">
                                        	<span>	<{if $row->ENABLE_ALL}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ENABLE_SETTINGS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_SETTINGS']) && ((isset($aclviewablecolumns['ENABLE_SETTINGS']) && $aclviewablecolumns['ENABLE_SETTINGS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_SETTINGS']) || $aclviewablecolumns['ENABLE_SETTINGS']))) }>
                <td class="column column-enable-settings yesno " data-value="<{$row->ENABLE_SETTINGS}>" data-column="ENABLE_SETTINGS" data-module="adminmenuitem">
                                        	<span>	<{if $row->ENABLE_SETTINGS}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('OPEN_IN_NEW_WINDOW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['OPEN_IN_NEW_WINDOW']) && ((isset($aclviewablecolumns['OPEN_IN_NEW_WINDOW']) && $aclviewablecolumns['OPEN_IN_NEW_WINDOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OPEN_IN_NEW_WINDOW']) || $aclviewablecolumns['OPEN_IN_NEW_WINDOW']))) }>
                <td class="column column-open-in-new-window yesno " data-value="<{$row->OPEN_IN_NEW_WINDOW}>" data-column="OPEN_IN_NEW_WINDOW" data-module="adminmenuitem">
                                        	<span>	<{if $row->OPEN_IN_NEW_WINDOW}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_STARRED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_STARRED']) && ((isset($aclviewablecolumns['IS_STARRED']) && $aclviewablecolumns['IS_STARRED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_STARRED']) || $aclviewablecolumns['IS_STARRED']))) }>
                <td class="column column-is-starred yesno " data-value="<{$row->IS_STARRED}>" data-column="IS_STARRED" data-module="adminmenuitem">
                                        	<span>	<{if $row->IS_STARRED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
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
	<{plugin key="adminmenuitem_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminmenuitem.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminmenuitem[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminmenuitem/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> post-category-<{$row->reftext_ID_POST_CATEGORY|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-menuitem-<{$row->UUID}>" class="menuitemlistchk" name="menuitemlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>menuitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CLASS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CLASS']) && ((isset($aclviewablecolumns['CLASS']) && $aclviewablecolumns['CLASS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CLASS']) || $aclviewablecolumns['CLASS']))) }>
                <td class="column column-class text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>	<{$row->CLASS|escape}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_MENU', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_MENU']) && ((isset($aclviewablecolumns['ID_MENU']) && $aclviewablecolumns['ID_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_MENU']) || $aclviewablecolumns['ID_MENU']))) }>
                <td class="column column-id-menu reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_MENU}>
        <{if $alreadyhaslink && isset($smarty.session.acl.menu.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$row->refuuid_ID_MENU}>"><{$row->reftext_ID_MENU|escape}></a>
        <{else}>
            <{$row->reftext_ID_MENU|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_MENU}><{$row->ID_MENU|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
                <td class="column column-id-page reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_ID_PAGE}>"><{$row->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE}><{$row->ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_POST', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
                <td class="column column-id-post reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST}>
        <{if $alreadyhaslink && isset($smarty.session.acl.post.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->refuuid_ID_POST}>"><{$row->reftext_ID_POST|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST}><{$row->ID_POST|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_POST_CATEGORY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST_CATEGORY']) && ((isset($aclviewablecolumns['ID_POST_CATEGORY']) && $aclviewablecolumns['ID_POST_CATEGORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_CATEGORY']) || $aclviewablecolumns['ID_POST_CATEGORY']))) }>
                <td class="column column-id-post-category reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST_CATEGORY}>
        <{if $alreadyhaslink && isset($smarty.session.acl.postcategory.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/view/<{$row->refuuid_ID_POST_CATEGORY}>"><{$row->reftext_ID_POST_CATEGORY|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST_CATEGORY|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST_CATEGORY}><{$row->ID_POST_CATEGORY|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
                <td class="column column-path text " >
                                        	<span>	<{$row->PATH|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('HAS_BREAK_AFTER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['HAS_BREAK_AFTER']) && ((isset($aclviewablecolumns['HAS_BREAK_AFTER']) && $aclviewablecolumns['HAS_BREAK_AFTER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HAS_BREAK_AFTER']) || $aclviewablecolumns['HAS_BREAK_AFTER']))) }>
                <td class="column column-has-break-after yesno " data-value="<{$row->HAS_BREAK_AFTER}>" data-column="HAS_BREAK_AFTER" data-module="menuitem">
                                        	<span>	<{if $row->HAS_BREAK_AFTER}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
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
	        <{if (in_array('ACL_ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ACL_ID_USER_GROUP']) && ((isset($aclviewablecolumns['ACL_ID_USER_GROUP']) && $aclviewablecolumns['ACL_ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACL_ID_USER_GROUP']) || $aclviewablecolumns['ACL_ID_USER_GROUP']))) }>
                <td class="column column-acl-id-user-group reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ACL_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ACL_ID_USER_GROUP}>"><{$row->reftext_ACL_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ACL_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ACL_ID_USER_GROUP}><{$row->ACL_ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="menuitem_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.menuitem.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('L_EDIT', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.menuitem[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/menuitem/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
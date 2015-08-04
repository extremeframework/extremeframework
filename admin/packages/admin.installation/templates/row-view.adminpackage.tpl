<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>"<{if $row->DESCRIPTION}> title="<{$row->DESCRIPTION|strip_tags}>"<{/if}>>
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminpackage-<{$row->UUID}>" class="adminpackagelistchk" name="adminpackagelist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminpackage_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->UUID}>"><{/if}>    	    <{$row->CODE|escape}>
    <{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image " >
                                        	<span>    <{media src=$row->IMAGE thumbnail=1}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ENTRY_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENTRY_PATH']) && ((isset($aclviewablecolumns['ENTRY_PATH']) && $aclviewablecolumns['ENTRY_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENTRY_PATH']) || $aclviewablecolumns['ENTRY_PATH']))) }>
                <td class="column column-entry-path text " >
                                        	<span>    	    <{$row->ENTRY_PATH|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('AUTHOR', $filtercolumns)) }>
            <{if !isset($excludedcolumns['AUTHOR']) && ((isset($aclviewablecolumns['AUTHOR']) && $aclviewablecolumns['AUTHOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AUTHOR']) || $aclviewablecolumns['AUTHOR']))) }>
                <td class="column column-author text " >
                                        	<span>    	    <{$row->AUTHOR|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('VERSION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VERSION']) && ((isset($aclviewablecolumns['VERSION']) && $aclviewablecolumns['VERSION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VERSION']) || $aclviewablecolumns['VERSION']))) }>
                <td class="column column-version text " >
                                        	<span>    	    <{$row->VERSION|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PACKAGE_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PACKAGE_PATH']) && ((isset($aclviewablecolumns['PACKAGE_PATH']) && $aclviewablecolumns['PACKAGE_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PACKAGE_PATH']) || $aclviewablecolumns['PACKAGE_PATH']))) }>
                <td class="column column-package-path text " >
                                        	<span>    	    <{$row->PACKAGE_PATH|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('INSTALLATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['INSTALLATION_DATE']) && ((isset($aclviewablecolumns['INSTALLATION_DATE']) && $aclviewablecolumns['INSTALLATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INSTALLATION_DATE']) || $aclviewablecolumns['INSTALLATION_DATE']))) }>
                <td class="column column-installation-date date " >
                                        	<span>
            <{$row->INSTALLATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
                <td class="column column-latest-update datetime " >
                                        	<span>
            <{$row->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="adminpackage_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminpackage.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminpackage[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminpackage/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> type-<{$row->reftext_ID_PARAMETER_TYPE|ascode}>" data-id="<{$row->UUID}>"<{if $row->DESCRIPTION}> title="<{$row->DESCRIPTION|strip_tags}>"<{/if}>>
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-parameter-<{$row->UUID}>" class="parameterlistchk" name="parameterlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>parameter_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>"><{/if}>    	    <{$row->CODE|escape}>
    <{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_PARAMETER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PARAMETER_GROUP']) && ((isset($aclviewablecolumns['ID_PARAMETER_GROUP']) && $aclviewablecolumns['ID_PARAMETER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PARAMETER_GROUP']) || $aclviewablecolumns['ID_PARAMETER_GROUP']))) }>
                <td class="column column-id-parameter-group reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PARAMETER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.parametergroup.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/view/<{$row->refuuid_ID_PARAMETER_GROUP}>"><{$row->reftext_ID_PARAMETER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ID_PARAMETER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PARAMETER_GROUP}><{$row->ID_PARAMETER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_PARAMETER_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PARAMETER_TYPE']) && ((isset($aclviewablecolumns['ID_PARAMETER_TYPE']) && $aclviewablecolumns['ID_PARAMETER_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PARAMETER_TYPE']) || $aclviewablecolumns['ID_PARAMETER_TYPE']))) }>
                <td class="column column-id-parameter-type reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PARAMETER_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.parametertype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/view/<{$row->refuuid_ID_PARAMETER_TYPE}>"><{$row->reftext_ID_PARAMETER_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PARAMETER_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PARAMETER_TYPE}><{$row->ID_PARAMETER_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALUE']) && ((isset($aclviewablecolumns['VALUE']) && $aclviewablecolumns['VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALUE']) || $aclviewablecolumns['VALUE']))) }>
                <td class="column column-value text " >
                                        	<span>    	    <{$row->VALUE|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="parameter_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.parameter.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.parameter[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/parameter/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
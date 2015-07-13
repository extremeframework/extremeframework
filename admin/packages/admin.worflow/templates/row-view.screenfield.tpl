<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> value-type-<{$row->reftext_ID_VALUE_TYPE|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-screenfield-<{$row->UUID}>" class="screenfieldlistchk" name="screenfieldlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>screenfield_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('ID_SCREEN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_SCREEN']) && ((isset($aclviewablecolumns['ID_SCREEN']) && $aclviewablecolumns['ID_SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_SCREEN']) || $aclviewablecolumns['ID_SCREEN']))) }>
                <td class="column column-id-screen reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_SCREEN}>
        <{if $alreadyhaslink && isset($smarty.session.acl.screen.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$row->refuuid_ID_SCREEN}>"><{$row->reftext_ID_SCREEN|escape}></a>
        <{else}>
            <{$row->reftext_ID_SCREEN|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_SCREEN}><{$row->ID_SCREEN|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_VALUE_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_VALUE_TYPE']) && ((isset($aclviewablecolumns['ID_VALUE_TYPE']) && $aclviewablecolumns['ID_VALUE_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_VALUE_TYPE']) || $aclviewablecolumns['ID_VALUE_TYPE']))) }>
                <td class="column column-id-value-type reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_VALUE_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.valuetype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype/view/<{$row->refuuid_ID_VALUE_TYPE}>"><{$row->reftext_ID_VALUE_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_VALUE_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_VALUE_TYPE}><{$row->ID_VALUE_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('DATASOURCE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATASOURCE']) && ((isset($aclviewablecolumns['DATASOURCE']) && $aclviewablecolumns['DATASOURCE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATASOURCE']) || $aclviewablecolumns['DATASOURCE']))) }>
                <td class="column column-datasource text " >
                                        	<span>	<{$row->DATASOURCE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CONDITION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CONDITION']) && ((isset($aclviewablecolumns['CONDITION']) && $aclviewablecolumns['CONDITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION']) || $aclviewablecolumns['CONDITION']))) }>
                <td class="column column-condition text " >
                                        	<span>	<{$row->CONDITION|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('VALUECOL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALUECOL']) && ((isset($aclviewablecolumns['VALUECOL']) && $aclviewablecolumns['VALUECOL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALUECOL']) || $aclviewablecolumns['VALUECOL']))) }>
                <td class="column column-valuecol text " >
                                        	<span>	<{$row->VALUECOL|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('TEXTCOL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TEXTCOL']) && ((isset($aclviewablecolumns['TEXTCOL']) && $aclviewablecolumns['TEXTCOL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TEXTCOL']) || $aclviewablecolumns['TEXTCOL']))) }>
                <td class="column column-textcol text " >
                                        	<span>	<{$row->TEXTCOL|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_MANDATORY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_MANDATORY']) && ((isset($aclviewablecolumns['IS_MANDATORY']) && $aclviewablecolumns['IS_MANDATORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_MANDATORY']) || $aclviewablecolumns['IS_MANDATORY']))) }>
                <td class="column column-is-mandatory yesno " data-value="<{$row->IS_MANDATORY}>" data-column="IS_MANDATORY" data-module="screenfield">
                                        	<span>	<{if $row->IS_MANDATORY}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
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
	<{plugin key="screenfield_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.screenfield.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('L_EDIT', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.screenfield[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/screenfield/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminorderitem-<{$row->UUID}>" class="adminorderitemlistchk" name="adminorderitemlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminorderitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('ID_ADMIN_ORDER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_ORDER']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER']) && $aclviewablecolumns['ID_ADMIN_ORDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER']) || $aclviewablecolumns['ID_ADMIN_ORDER']))) }>
                <td class="column column-id-admin-order reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_ORDER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminorder.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->refuuid_ID_ADMIN_ORDER}>"><{$row->reftext_ID_ADMIN_ORDER|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_ORDER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_ORDER}><{$row->ID_ADMIN_ORDER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_ADMIN_PRODUCT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_PRODUCT']) && ((isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) && $aclviewablecolumns['ID_ADMIN_PRODUCT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) || $aclviewablecolumns['ID_ADMIN_PRODUCT']))) }>
                <td class="column column-id-admin-product reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_PRODUCT}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminproduct.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->refuuid_ID_ADMIN_PRODUCT}>"><{$row->reftext_ID_ADMIN_PRODUCT|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_PRODUCT|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_PRODUCT}><{$row->ID_ADMIN_PRODUCT|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('QUANTITY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['QUANTITY']) && ((isset($aclviewablecolumns['QUANTITY']) && $aclviewablecolumns['QUANTITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['QUANTITY']) || $aclviewablecolumns['QUANTITY']))) }>
                <td class="column column-quantity number " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/view/<{$row->UUID}>"><{/if}>
            <span class="number number-format"><{if $row->QUANTITY != 0}><{$row->QUANTITY}><{/if}></span>
    
    <{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PRICE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
                <td class="column column-price number " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/view/<{$row->UUID}>"><{/if}>
            <span class="currency currency-format"><{if $row->PRICE != 0}><{$row->PRICE}><{/if}></span>
    
            <{$summable.PRICE = $summable.PRICE + $row->PRICE scope=parent}>
    <{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="adminorderitem_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminorderitem.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{$smarty.const.L_EDIT}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminorderitem[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminorderitem/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{label text=$item->TITLE insidequote=true}>"></i><{else}><{label text=$item->TITLE}><{/if}></a>
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
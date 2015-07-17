<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>"<{if $row->DESCRIPTION}> title="<{$row->DESCRIPTION|strip_tags}>"<{/if}>>
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminproduct-<{$row->UUID}>" class="adminproductlistchk" name="adminproductlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminproduct_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->UUID}>"><{/if}>    <{media src=$row->IMAGE thumbnail=1}>
<{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LIST_PRICE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LIST_PRICE']) && ((isset($aclviewablecolumns['LIST_PRICE']) && $aclviewablecolumns['LIST_PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LIST_PRICE']) || $aclviewablecolumns['LIST_PRICE']))) }>
                <td class="column column-list-price number " >
                                        	<span>
            <span class="currency currency-format"><{if $row->LIST_PRICE != 0}><{$row->LIST_PRICE}><{/if}></span>
    
            <{$summable.LIST_PRICE = $summable.LIST_PRICE + $row->LIST_PRICE scope=parent}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PRICE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
                <td class="column column-price number " >
                                        	<span>
            <span class="currency currency-format"><{if $row->PRICE != 0}><{$row->PRICE}><{/if}></span>
    
            <{$summable.PRICE = $summable.PRICE + $row->PRICE scope=parent}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PRODUCT_ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PRODUCT_ID_PAGE']) && ((isset($aclviewablecolumns['PRODUCT_ID_PAGE']) && $aclviewablecolumns['PRODUCT_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRODUCT_ID_PAGE']) || $aclviewablecolumns['PRODUCT_ID_PAGE']))) }>
                <td class="column column-product-id-page reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_PRODUCT_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_PRODUCT_ID_PAGE}>"><{$row->reftext_PRODUCT_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_PRODUCT_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->PRODUCT_ID_PAGE}><{$row->PRODUCT_ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="adminproduct_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminproduct.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminproduct[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminproduct/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminproduct-rowedit <{if $row->UUID}>adminproduct-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminproduct.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminproductlistchk" name="adminproductlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminproduct_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminproduct_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminproduct_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-title" type="text" name="<{$prefix}>adminproduct_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image" >
                                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->UUID}>"><{/if}>    <{media src=$row->IMAGE thumbnail=1}>
<{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LIST_PRICE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LIST_PRICE']) && ((isset($aclviewablecolumns['LIST_PRICE']) && $aclviewablecolumns['LIST_PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LIST_PRICE']) || $aclviewablecolumns['LIST_PRICE']))) }>
                <td class="column column-list-price number" >
                                            <{if (in_array('LIST_PRICE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.LIST_PRICE) }>
                            <{assign var='tmp_value' value=$formdata.LIST_PRICE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-list-price currency-format" type="text" name="<{$prefix}>adminproduct_formdata_LIST_PRICE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="currency currency-format"><{if $row->LIST_PRICE != 0}><{$row->LIST_PRICE}><{/if}></span>
    
            <{$summable.LIST_PRICE = $summable.LIST_PRICE + $row->LIST_PRICE scope=parent}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PRICE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
                <td class="column column-price number" >
                                            <{if (in_array('PRICE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.PRICE) }>
                            <{assign var='tmp_value' value=$formdata.PRICE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-price currency-format" type="text" name="<{$prefix}>adminproduct_formdata_PRICE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="currency currency-format"><{if $row->PRICE != 0}><{$row->PRICE}><{/if}></span>
    
            <{$summable.PRICE = $summable.PRICE + $row->PRICE scope=parent}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PRODUCT_ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PRODUCT_ID_PAGE']) && ((isset($aclviewablecolumns['PRODUCT_ID_PAGE']) && $aclviewablecolumns['PRODUCT_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRODUCT_ID_PAGE']) || $aclviewablecolumns['PRODUCT_ID_PAGE']))) }>
                <td class="column column-product-id-page reftext" >
                                            <{if (in_array('PRODUCT_ID_PAGE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.PRODUCT_ID_PAGE) }>
                            <{assign var='tmp_value' value=$formdata.PRODUCT_ID_PAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-product-id-page" name="`$prefix`adminproduct_formdata_PRODUCT_ID_PAGE" value=$formdata.PRODUCT_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_PRODUCT_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_PRODUCT_ID_PAGE}>"><{$row->reftext_PRODUCT_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_PRODUCT_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->PRODUCT_ID_PAGE}><{$row->PRODUCT_ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminproduct.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{include file="item.edit.tpl" customfield=$item id=$row->UUID value=CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<td class="actions">
	    <{if $row->UUID}>
    	    <div class="adminproduct-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminproduct.0}>
        $('.adminproduct-rowedit-message').html('<{$messages.adminproduct.0}>').show();
    <{/if}>

    $('#adminproductlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminproductlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminproductlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminproductlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminproduct-rowedit-save').click();
        }
    });

    bind_hotkey("#adminproductlist > tbody tr.rowedit input[type=text]", 'f2', '.adminproduct-rowedit-save');
    bind_hotkey("#adminproductlist > tbody tr.rowedit input[type=text]", 'esc', '.adminproduct-rowedit-cancel');
</script>



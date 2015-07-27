<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminorderitem-rowedit <{if $row->UUID}>adminorderitem-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminorderitem.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminorderitemlistchk" name="adminorderitemlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminorderitem_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminorderitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminorderitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_ADMIN_ORDER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_ORDER']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER']) && $aclviewablecolumns['ID_ADMIN_ORDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER']) || $aclviewablecolumns['ID_ADMIN_ORDER']))) }>
                <td class="column column-id-admin-order reftext" >
                                            <{if (in_array('ID_ADMIN_ORDER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_ORDER}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-order" name="`$prefix`adminorderitem_formdata_ID_ADMIN_ORDER" value=$formdata.ID_ADMIN_ORDER datasource="ADMIN_ORDER" valuecol="ID" textcol="CUSTOMER_FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminorder.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/new" title="Create a New Admin Order">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_ORDER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminorder.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->refuuid_ID_ADMIN_ORDER}>"><{$row->reftext_ID_ADMIN_ORDER|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_ORDER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_ORDER}><{$row->ID_ADMIN_ORDER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_PRODUCT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_PRODUCT']) && ((isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) && $aclviewablecolumns['ID_ADMIN_PRODUCT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) || $aclviewablecolumns['ID_ADMIN_PRODUCT']))) }>
                <td class="column column-id-admin-product reftext" >
                                            <{if (in_array('ID_ADMIN_PRODUCT', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_PRODUCT}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-product" name="`$prefix`adminorderitem_formdata_ID_ADMIN_PRODUCT" value=$formdata.ID_ADMIN_PRODUCT datasource="ADMIN_PRODUCT" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminproduct.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/new" title="Create a New Admin Product">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_PRODUCT}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminproduct.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$row->refuuid_ID_ADMIN_PRODUCT}>"><{$row->reftext_ID_ADMIN_PRODUCT|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_PRODUCT|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_PRODUCT}><{$row->ID_ADMIN_PRODUCT|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('QUANTITY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['QUANTITY']) && ((isset($aclviewablecolumns['QUANTITY']) && $aclviewablecolumns['QUANTITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['QUANTITY']) || $aclviewablecolumns['QUANTITY']))) }>
                <td class="column column-quantity number" >
                                            <{if (in_array('QUANTITY', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataQUANTITY}>

                                                    
                            <input class="input-quantity number-format" type="text" name="<{$prefix}>adminorderitem_formdata_QUANTITY" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/view/<{$row->UUID}>"><{/if}>
            <span class="number number-format"><{if $row->QUANTITY != 0}><{$row->QUANTITY}><{/if}></span>
    
    <{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PRICE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
                <td class="column column-price number" >
                                            <{if (in_array('PRICE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataPRICE}>

                                                    
                            <input class="input-price currency-format" type="text" name="<{$prefix}>adminorderitem_formdata_PRICE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/view/<{$row->UUID}>"><{/if}>
            <span class="currency currency-format"><{if $row->PRICE != 0}><{$row->PRICE}><{/if}></span>
    
            <{$summable.PRICE = $summable.PRICE + $row->PRICE scope=parent}>
    <{if isset($smarty.session.acl.adminorderitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="adminorderitem-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminorderitem.0}>
        $('.adminorderitem-rowedit-message').html('<{$messages.adminorderitem.0}>').show();
    <{/if}>

    $('#adminorderitemlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminorderitemlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminorderitemlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminorderitemlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminorderitem-rowedit-save').click();
        }
    });

    bind_hotkey("#adminorderitemlist > tbody tr.rowedit input[type=text]", 'f2', '.adminorderitem-rowedit-save');
    bind_hotkey("#adminorderitemlist > tbody tr.rowedit input[type=text]", 'esc', '.adminorderitem-rowedit-cancel');
</script>



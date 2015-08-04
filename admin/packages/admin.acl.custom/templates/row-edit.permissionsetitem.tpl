<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="permissionsetitem-rowedit <{if $row->UUID}>permissionsetitem-rowedit-existing rowedit-existing<{/if}> <{if $messages.permissionsetitem.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="permissionsetitemlistchk" name="permissionsetitemlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="permissionsetitem_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>permissionsetitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="permissionsetitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_PERMISSION_SET', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PERMISSION_SET']) && ((isset($aclviewablecolumns['ID_PERMISSION_SET']) && $aclviewablecolumns['ID_PERMISSION_SET']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PERMISSION_SET']) || $aclviewablecolumns['ID_PERMISSION_SET']))) }>
                <td class="column column-id-permission-set reftext" >
                                            <{if (in_array('ID_PERMISSION_SET', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_PERMISSION_SET}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-permission-set" name="`$prefix`permissionsetitem_formdata_ID_PERMISSION_SET" value=$formdata.ID_PERMISSION_SET datasource="PERMISSION_SET" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.permissionset.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/new" title="Create a New Permission Set">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PERMISSION_SET}>
        <{if $alreadyhaslink && isset($smarty.session.acl.permissionset.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$row->refuuid_ID_PERMISSION_SET}>"><{$row->reftext_ID_PERMISSION_SET|escape}></a>
        <{else}>
            <{$row->reftext_ID_PERMISSION_SET|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PERMISSION_SET}><{$row->ID_PERMISSION_SET|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataMODULE}>

                        
                            <input class="input-module" type="text" name="<{$prefix}>permissionsetitem_formdata_MODULE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/view/<{$row->UUID}>"><{/if}>    	    <{$row->MODULE|escape}>
    <{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ACTIONS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ACTIONS']) && ((isset($aclviewablecolumns['ACTIONS']) && $aclviewablecolumns['ACTIONS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTIONS']) || $aclviewablecolumns['ACTIONS']))) }>
                <td class="column column-actions text" >
                                            <{if (in_array('ACTIONS', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataACTIONS}>

                        
                            <input class="input-actions" type="text" name="<{$prefix}>permissionsetitem_formdata_ACTIONS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/view/<{$row->UUID}>"><{/if}>    	    <{$row->ACTIONS|escape}>
    <{if isset($smarty.session.acl.permissionsetitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="permissionsetitem-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.permissionsetitem.0}>
        $('.permissionsetitem-rowedit-message').html('<{$messages.permissionsetitem.0}>').show();
    <{/if}>

    $('#permissionsetitemlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#permissionsetitemlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#permissionsetitemlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#permissionsetitemlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.permissionsetitem-rowedit-save').click();
        }
    });

    bind_hotkey("#permissionsetitemlist > tbody tr.rowedit input[type=text]", 'f2', '.permissionsetitem-rowedit-save');
    bind_hotkey("#permissionsetitemlist > tbody tr.rowedit input[type=text]", 'esc', '.permissionsetitem-rowedit-cancel');
</script>



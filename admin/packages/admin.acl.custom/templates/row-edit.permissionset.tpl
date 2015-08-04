<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="permissionset-rowedit <{if $row->UUID}>permissionset-rowedit-existing rowedit-existing<{/if}> <{if $messages.permissionset.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="permissionsetlistchk" name="permissionsetlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="permissionset_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>permissionset_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="permissionset_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>permissionset_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="500"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.permissionset.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.permissionset.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="permissionset-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.permissionset.0}>
        $('.permissionset-rowedit-message').html('<{$messages.permissionset.0}>').show();
    <{/if}>

    $('#permissionsetlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#permissionsetlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#permissionsetlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#permissionsetlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.permissionset-rowedit-save').click();
        }
    });

    bind_hotkey("#permissionsetlist > tbody tr.rowedit input[type=text]", 'f2', '.permissionset-rowedit-save');
    bind_hotkey("#permissionsetlist > tbody tr.rowedit input[type=text]", 'esc', '.permissionset-rowedit-cancel');
</script>



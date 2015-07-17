<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminlabel-rowedit <{if $row->UUID}>adminlabel-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminlabel.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminlabellistchk" name="adminlabellist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminlabel_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminlabel_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminlabel_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('LABEL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LABEL']) && ((isset($aclviewablecolumns['LABEL']) && $aclviewablecolumns['LABEL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LABEL']) || $aclviewablecolumns['LABEL']))) }>
                <td class="column column-label text" >
                                            <{if (in_array('LABEL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataLABEL}>

                        
                            <input class="input-label" type="text" name="<{$prefix}>adminlabel_formdata_LABEL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="500"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlabel.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/view/<{$row->UUID}>"><{/if}>	<{$row->LABEL|escape}>
<{if isset($smarty.session.acl.adminlabel.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="adminlabel-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminlabel.0}>
        $('.adminlabel-rowedit-message').html('<{$messages.adminlabel.0}>').show();
    <{/if}>

    $('#adminlabellist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminlabellist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminlabellist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminlabellist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminlabel-rowedit-save').click();
        }
    });

    bind_hotkey("#adminlabellist > tbody tr.rowedit input[type=text]", 'f2', '.adminlabel-rowedit-save');
    bind_hotkey("#adminlabellist > tbody tr.rowedit input[type=text]", 'esc', '.adminlabel-rowedit-cancel');
</script>



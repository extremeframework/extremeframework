<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminlanguage-rowedit <{if $row->UUID}>adminlanguage-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminlanguage.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminlanguagelistchk" name="adminlanguagelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminlanguage_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminlanguage_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminlanguage_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminlanguage_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlanguage.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.adminlanguage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text" >
                                            <{if (in_array('CODE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CODE) }>
                            <{assign var='tmp_value' value=$formdata.CODE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-code" type="text" name="<{$prefix}>adminlanguage_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlanguage.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.adminlanguage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="adminlanguage-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminlanguage.0}>
        $('.adminlanguage-rowedit-message').html('<{$messages.adminlanguage.0}>').show();
    <{/if}>

    $('#adminlanguagelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminlanguagelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminlanguagelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminlanguagelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminlanguage-rowedit-save').click();
        }
    });

    bind_hotkey("#adminlanguagelist > tbody tr.rowedit input[type=text]", 'f2', '.adminlanguage-rowedit-save');
    bind_hotkey("#adminlanguagelist > tbody tr.rowedit input[type=text]", 'esc', '.adminlanguage-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('adminlanguage_formdata_NAME', 'adminlanguage_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


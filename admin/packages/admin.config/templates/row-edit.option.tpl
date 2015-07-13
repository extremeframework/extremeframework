<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="option-rowedit <{if $row->UUID}>option-rowedit-existing rowedit-existing<{/if}> <{if $messages.option.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="optionlistchk" name="optionlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="option_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>option_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="option_formdata_<{$key}>" value="<{$value}>" />
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
                        
                            <input class="input-name" type="text" name="<{$prefix}>option_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.option.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/option/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.option.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
                        
                            <input class="input-code" type="text" name="<{$prefix}>option_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.option.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/option/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.option.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALUE']) && ((isset($aclviewablecolumns['VALUE']) && $aclviewablecolumns['VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALUE']) || $aclviewablecolumns['VALUE']))) }>
                <td class="column column-value text" >
                                            <{if (in_array('VALUE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.VALUE) }>
                            <{assign var='tmp_value' value=$formdata.VALUE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-value" type="text" name="<{$prefix}>option_formdata_VALUE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>	<{$row->VALUE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CONTEXT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CONTEXT']) && ((isset($aclviewablecolumns['CONTEXT']) && $aclviewablecolumns['CONTEXT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONTEXT']) || $aclviewablecolumns['CONTEXT']))) }>
                <td class="column column-context text" >
                                            <{if (in_array('CONTEXT', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CONTEXT) }>
                            <{assign var='tmp_value' value=$formdata.CONTEXT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-context" type="text" name="<{$prefix}>option_formdata_CONTEXT" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CONTEXT|escape}>
</span>
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
    	    <div class="option-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.option.0}>
        $('.option-rowedit-message').html('<{$messages.option.0}>').show();
    <{/if}>

    $('#optionlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#optionlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#optionlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#optionlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.option-rowedit-save').click();
        }
    });

    bind_hotkey("#optionlist > tbody tr.rowedit input[type=text]", 'f2', '.option-rowedit-save');
    bind_hotkey("#optionlist > tbody tr.rowedit input[type=text]", 'esc', '.option-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('option_formdata_NAME', 'option_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


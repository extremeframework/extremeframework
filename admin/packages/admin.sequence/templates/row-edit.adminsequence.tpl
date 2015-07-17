<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminsequence-rowedit <{if $row->UUID}>adminsequence-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminsequence.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminsequencelistchk" name="adminsequencelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminsequence_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminsequence_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminsequence_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataMODULE}>

                        
                            <input class="input-module" type="text" name="<{$prefix}>adminsequence_formdata_MODULE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminsequence.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/view/<{$row->UUID}>"><{/if}>	<{$row->MODULE|escape}>
<{if isset($smarty.session.acl.adminsequence.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('SEQUENCE_FORMAT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SEQUENCE_FORMAT']) && ((isset($aclviewablecolumns['SEQUENCE_FORMAT']) && $aclviewablecolumns['SEQUENCE_FORMAT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SEQUENCE_FORMAT']) || $aclviewablecolumns['SEQUENCE_FORMAT']))) }>
                <td class="column column-sequence-format text" >
                                            <{if (in_array('SEQUENCE_FORMAT', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataSEQUENCE_FORMAT}>

                        
                            <input class="input-sequence-format" type="text" name="<{$prefix}>adminsequence_formdata_SEQUENCE_FORMAT" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminsequence.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/view/<{$row->UUID}>"><{/if}>	<{$row->SEQUENCE_FORMAT|escape}>
<{if isset($smarty.session.acl.adminsequence.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CURRENT_VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CURRENT_VALUE']) && ((isset($aclviewablecolumns['CURRENT_VALUE']) && $aclviewablecolumns['CURRENT_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CURRENT_VALUE']) || $aclviewablecolumns['CURRENT_VALUE']))) }>
                <td class="column column-current-value text" >
                                            <{if (in_array('CURRENT_VALUE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCURRENT_VALUE}>

                        
                            <input class="input-current-value" type="text" name="<{$prefix}>adminsequence_formdata_CURRENT_VALUE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CURRENT_VALUE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('SEQUENCE_STEP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SEQUENCE_STEP']) && ((isset($aclviewablecolumns['SEQUENCE_STEP']) && $aclviewablecolumns['SEQUENCE_STEP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SEQUENCE_STEP']) || $aclviewablecolumns['SEQUENCE_STEP']))) }>
                <td class="column column-sequence-step number" >
                                            <{if (in_array('SEQUENCE_STEP', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataSEQUENCE_STEP}>

                                                    
                            <input class="input-sequence-step number-format" type="text" name="<{$prefix}>adminsequence_formdata_SEQUENCE_STEP" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="number number-format"><{if $row->SEQUENCE_STEP != 0}><{$row->SEQUENCE_STEP}><{/if}></span>
    
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
    	    <div class="adminsequence-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminsequence.0}>
        $('.adminsequence-rowedit-message').html('<{$messages.adminsequence.0}>').show();
    <{/if}>

    $('#adminsequencelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminsequencelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminsequencelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminsequencelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminsequence-rowedit-save').click();
        }
    });

    bind_hotkey("#adminsequencelist > tbody tr.rowedit input[type=text]", 'f2', '.adminsequence-rowedit-save');
    bind_hotkey("#adminsequencelist > tbody tr.rowedit input[type=text]", 'esc', '.adminsequence-rowedit-cancel');
</script>



<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="parametertype-rowedit <{if $row->UUID}>parametertype-rowedit-existing rowedit-existing<{/if}> <{if $messages.parametertype.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="parametertypelistchk" name="parametertypelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="parametertype_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>parametertype_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="parametertype_formdata_<{$key}>" value="<{$value}>" />
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
                        
                            <input class="input-name" type="text" name="<{$prefix}>parametertype_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parametertype.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.parametertype.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('BASE_TYPE_CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['BASE_TYPE_CODE']) && ((isset($aclviewablecolumns['BASE_TYPE_CODE']) && $aclviewablecolumns['BASE_TYPE_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BASE_TYPE_CODE']) || $aclviewablecolumns['BASE_TYPE_CODE']))) }>
                <td class="column column-base-type-code text" >
                                            <{if (in_array('BASE_TYPE_CODE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.BASE_TYPE_CODE) }>
                            <{assign var='tmp_value' value=$formdata.BASE_TYPE_CODE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-base-type-code" type="text" name="<{$prefix}>parametertype_formdata_BASE_TYPE_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parametertype.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/view/<{$row->UUID}>"><{/if}>	<{$row->BASE_TYPE_CODE|escape}>
<{if isset($smarty.session.acl.parametertype.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('EXTRA', $filtercolumns)) }>
            <{if !isset($excludedcolumns['EXTRA']) && ((isset($aclviewablecolumns['EXTRA']) && $aclviewablecolumns['EXTRA']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EXTRA']) || $aclviewablecolumns['EXTRA']))) }>
                <td class="column column-extra text" >
                                            <{if (in_array('EXTRA', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.EXTRA) }>
                            <{assign var='tmp_value' value=$formdata.EXTRA}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-extra" type="text" name="<{$prefix}>parametertype_formdata_EXTRA" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->EXTRA|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ORDERING) }>
                            <{assign var='tmp_value' value=$formdata.ORDERING}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>parametertype_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="number number-format"><{if $row->ORDERING != 0}><{$row->ORDERING}><{/if}></span>
    
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
    	    <div class="parametertype-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.parametertype.0}>
        $('.parametertype-rowedit-message').html('<{$messages.parametertype.0}>').show();
    <{/if}>

    $('#parametertypelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#parametertypelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#parametertypelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#parametertypelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.parametertype-rowedit-save').click();
        }
    });

    bind_hotkey("#parametertypelist > tbody tr.rowedit input[type=text]", 'f2', '.parametertype-rowedit-save');
    bind_hotkey("#parametertypelist > tbody tr.rowedit input[type=text]", 'esc', '.parametertype-rowedit-cancel');
</script>



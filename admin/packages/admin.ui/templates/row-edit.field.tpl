<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="field-rowedit <{if $row->UUID}>field-rowedit-existing rowedit-existing<{/if}> <{if $messages.field.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="fieldlistchk" name="fieldlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="field_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>field_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="field_formdata_<{$key}>" value="<{$value}>" />
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
                        
                            <input class="input-name" type="text" name="<{$prefix}>field_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.field.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/field/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.field.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module reftext" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`field_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.field.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/field/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_MODULE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmodule.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->refuuid_MODULE}>"><{$row->reftext_MODULE|escape}></a>
        <{else}>
            <{$row->reftext_MODULE|escape}>        <{/if}>
    <{else}>
    	<{if $row->MODULE}><{$row->MODULE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.field.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('COLUMN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['COLUMN']) && ((isset($aclviewablecolumns['COLUMN']) && $aclviewablecolumns['COLUMN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COLUMN']) || $aclviewablecolumns['COLUMN']))) }>
                <td class="column column-column text" >
                                            <{if (in_array('COLUMN', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.COLUMN) }>
                            <{assign var='tmp_value' value=$formdata.COLUMN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-column" type="text" name="<{$prefix}>field_formdata_COLUMN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.field.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/field/view/<{$row->UUID}>"><{/if}>	<{$row->COLUMN|escape}>
<{if isset($smarty.session.acl.field.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TOOLTIP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TOOLTIP']) && ((isset($aclviewablecolumns['TOOLTIP']) && $aclviewablecolumns['TOOLTIP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TOOLTIP']) || $aclviewablecolumns['TOOLTIP']))) }>
                <td class="column column-tooltip text" >
                                            <{if (in_array('TOOLTIP', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.TOOLTIP) }>
                            <{assign var='tmp_value' value=$formdata.TOOLTIP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-tooltip" type="text" name="<{$prefix}>field_formdata_TOOLTIP" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->TOOLTIP|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_EXCLUDED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_EXCLUDED']) && ((isset($aclviewablecolumns['IS_EXCLUDED']) && $aclviewablecolumns['IS_EXCLUDED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_EXCLUDED']) || $aclviewablecolumns['IS_EXCLUDED']))) }>
                <td class="column column-is-excluded yesno" data-value="<{$row->IS_EXCLUDED}>" data-column="IS_EXCLUDED" data-module="field">
                                            <{if (in_array('IS_EXCLUDED', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_EXCLUDED) }>
                            <{assign var='tmp_value' value=$formdata.IS_EXCLUDED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-excluded" name="<{$prefix}>field_formdata_IS_EXCLUDED" >
                                    <option value="1" <{if $formdata.IS_EXCLUDED}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_EXCLUDED}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-excluded" type="radio" name="<{$prefix}>field_formdata_IS_EXCLUDED" value="1" <{if $formdata.IS_EXCLUDED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>field_formdata_IS_EXCLUDED" value="0" <{if !$formdata.IS_EXCLUDED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_EXCLUDED}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
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
    	    <div class="field-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.field.0}>
        $('.field-rowedit-message').html('<{$messages.field.0}>').show();
    <{/if}>

    $('#fieldlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#fieldlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#fieldlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#fieldlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.field-rowedit-save').click();
        }
    });

    bind_hotkey("#fieldlist > tbody tr.rowedit input[type=text]", 'f2', '.field-rowedit-save');
    bind_hotkey("#fieldlist > tbody tr.rowedit input[type=text]", 'esc', '.field-rowedit-cancel');
</script>



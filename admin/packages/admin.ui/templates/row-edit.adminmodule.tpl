<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminmodule-rowedit <{if $row->UUID}>adminmodule-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminmodule.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminmodulelistchk" name="adminmodulelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminmodule_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminmodule_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminmodule_formdata_<{$key}>" value="<{$value}>" />
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
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminmodule_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-module" type="text" name="<{$prefix}>adminmodule_formdata_MODULE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->UUID}>"><{/if}>	<{$row->MODULE|escape}>
<{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PREFIX', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PREFIX']) && ((isset($aclviewablecolumns['PREFIX']) && $aclviewablecolumns['PREFIX']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PREFIX']) || $aclviewablecolumns['PREFIX']))) }>
                <td class="column column-prefix text" >
                                            <{if (in_array('PREFIX', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.PREFIX) }>
                            <{assign var='tmp_value' value=$formdata.PREFIX}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-prefix" type="text" name="<{$prefix}>adminmodule_formdata_PREFIX" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->PREFIX|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('AVAILABLE_ACTIONS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['AVAILABLE_ACTIONS']) && ((isset($aclviewablecolumns['AVAILABLE_ACTIONS']) && $aclviewablecolumns['AVAILABLE_ACTIONS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AVAILABLE_ACTIONS']) || $aclviewablecolumns['AVAILABLE_ACTIONS']))) }>
                <td class="column column-available-actions text" >
                                            <{if (in_array('AVAILABLE_ACTIONS', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.AVAILABLE_ACTIONS) }>
                            <{assign var='tmp_value' value=$formdata.AVAILABLE_ACTIONS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-available-actions" type="text" name="<{$prefix}>adminmodule_formdata_AVAILABLE_ACTIONS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->AVAILABLE_ACTIONS|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_COMMENT_ENABLED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_COMMENT_ENABLED']) && ((isset($aclviewablecolumns['IS_COMMENT_ENABLED']) && $aclviewablecolumns['IS_COMMENT_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_COMMENT_ENABLED']) || $aclviewablecolumns['IS_COMMENT_ENABLED']))) }>
                <td class="column column-is-comment-enabled yesno" data-value="<{$row->IS_COMMENT_ENABLED}>" data-column="IS_COMMENT_ENABLED" data-module="adminmodule">
                                            <{if (in_array('IS_COMMENT_ENABLED', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_COMMENT_ENABLED) }>
                            <{assign var='tmp_value' value=$formdata.IS_COMMENT_ENABLED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-comment-enabled" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" >
                                    <option value="1" <{if $formdata.IS_COMMENT_ENABLED}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_COMMENT_ENABLED}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-comment-enabled" type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="1" <{if $formdata.IS_COMMENT_ENABLED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="0" <{if !$formdata.IS_COMMENT_ENABLED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_COMMENT_ENABLED}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
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
    	    <div class="adminmodule-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminmodule.0}>
        $('.adminmodule-rowedit-message').html('<{$messages.adminmodule.0}>').show();
    <{/if}>

    $('#adminmodulelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminmodulelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminmodulelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminmodulelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminmodule-rowedit-save').click();
        }
    });

    bind_hotkey("#adminmodulelist > tbody tr.rowedit input[type=text]", 'f2', '.adminmodule-rowedit-save');
    bind_hotkey("#adminmodulelist > tbody tr.rowedit input[type=text]", 'esc', '.adminmodule-rowedit-cancel');
</script>



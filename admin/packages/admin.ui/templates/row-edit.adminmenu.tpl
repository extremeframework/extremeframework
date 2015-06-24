<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminmenu-rowedit <{if $row->UUID}>adminmenu-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminmenu.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminmenulistchk" name="adminmenulist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminmenu_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminmenu_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminmenu_formdata_<{$key}>" value="<{$value}>" />
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
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminmenu_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenu.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.adminmenu.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminmenu_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenu.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$row->UUID}>"><{/if}>
            <span class="number number-format"><{if $row->ORDERING != 0}><{$row->ORDERING}><{/if}></span>
    
    <{if isset($smarty.session.acl.adminmenu.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_ENABLED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_ENABLED']) && ((isset($aclviewablecolumns['IS_ENABLED']) && $aclviewablecolumns['IS_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_ENABLED']) || $aclviewablecolumns['IS_ENABLED']))) }>
                <td class="column column-is-enabled yesno" data-value="<{$row->IS_ENABLED}>" data-column="IS_ENABLED" data-module="adminmenu">
                                            <{if (in_array('IS_ENABLED', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_ENABLED) }>
                            <{assign var='tmp_value' value=$formdata.IS_ENABLED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-enabled" name="<{$prefix}>adminmenu_formdata_IS_ENABLED" >
                                    <option value="1" <{if $formdata.IS_ENABLED}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_ENABLED}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>adminmenu_formdata_IS_ENABLED" value="1" <{if $formdata.IS_ENABLED}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminmenu_formdata_IS_ENABLED" value="0" <{if !$formdata.IS_ENABLED}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_ENABLED}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
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
    	    <div class="adminmenu-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminmenu.0}>
        $('.adminmenu-rowedit-message').html('<{$messages.adminmenu.0}>').show();
    <{/if}>

    $('#adminmenulist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminmenulist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminmenulist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminmenulist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminmenu-rowedit-save').click();
        }
    });

    bind_hotkey("#adminmenulist > tbody tr.rowedit input[type=text]", 'f2', '.adminmenu-rowedit-save');
    bind_hotkey("#adminmenulist > tbody tr.rowedit input[type=text]", 'esc', '.adminmenu-rowedit-cancel');
</script>



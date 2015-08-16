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
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>adminmodule_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataMODULE}>

                        
                            <input class="input-module" type="text" name="<{$prefix}>adminmodule_formdata_MODULE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->UUID}>"><{/if}>    	    <{$row->MODULE|escape}>
    <{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TABLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TABLE']) && ((isset($aclviewablecolumns['TABLE']) && $aclviewablecolumns['TABLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TABLE']) || $aclviewablecolumns['TABLE']))) }>
                <td class="column column-table text" >
                                            <{if (in_array('TABLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTABLE}>

                        
                            <input class="input-table" type="text" name="<{$prefix}>adminmodule_formdata_TABLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->TABLE|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_PACKAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) && $aclviewablecolumns['ID_ADMIN_PACKAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) || $aclviewablecolumns['ID_ADMIN_PACKAGE']))) }>
                <td class="column column-id-admin-package reftext" >
                                            <{if (in_array('ID_ADMIN_PACKAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_PACKAGE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-package" name="`$prefix`adminmodule_formdata_ID_ADMIN_PACKAGE" value=$formdata.ID_ADMIN_PACKAGE datasource="ADMIN_PACKAGE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminpackage.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new" title="Create a New Admin Package">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_PACKAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminpackage.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->refuuid_ID_ADMIN_PACKAGE}>"><{$row->reftext_ID_ADMIN_PACKAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_PACKAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_PACKAGE}><{$row->ID_ADMIN_PACKAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminmodule.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PREFIX', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PREFIX']) && ((isset($aclviewablecolumns['PREFIX']) && $aclviewablecolumns['PREFIX']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PREFIX']) || $aclviewablecolumns['PREFIX']))) }>
                <td class="column column-prefix text" >
                                            <{if (in_array('PREFIX', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataPREFIX}>

                        
                            <input class="input-prefix" type="text" name="<{$prefix}>adminmodule_formdata_PREFIX" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->PREFIX|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('AVAILABLE_ACTIONS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['AVAILABLE_ACTIONS']) && ((isset($aclviewablecolumns['AVAILABLE_ACTIONS']) && $aclviewablecolumns['AVAILABLE_ACTIONS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AVAILABLE_ACTIONS']) || $aclviewablecolumns['AVAILABLE_ACTIONS']))) }>
                <td class="column column-available-actions text" >
                                            <{if (in_array('AVAILABLE_ACTIONS', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataAVAILABLE_ACTIONS}>

                        
                            <input class="input-available-actions" type="text" name="<{$prefix}>adminmodule_formdata_AVAILABLE_ACTIONS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->AVAILABLE_ACTIONS|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_COMMENT_ENABLED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_COMMENT_ENABLED']) && ((isset($aclviewablecolumns['IS_COMMENT_ENABLED']) && $aclviewablecolumns['IS_COMMENT_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_COMMENT_ENABLED']) || $aclviewablecolumns['IS_COMMENT_ENABLED']))) }>
                <td class="column column-is-comment-enabled yesno" data-value="<{$row->IS_COMMENT_ENABLED}>" data-column="IS_COMMENT_ENABLED" data-module="adminmodule">
                                            <{if (in_array('IS_COMMENT_ENABLED', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataIS_COMMENT_ENABLED}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-comment-enabled" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" >
                                    <option value="1" <{if $formdata.IS_COMMENT_ENABLED}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_COMMENT_ENABLED}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-comment-enabled" type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="1" <{if $formdata.IS_COMMENT_ENABLED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="0" <{if !$formdata.IS_COMMENT_ENABLED}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_COMMENT_ENABLED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
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



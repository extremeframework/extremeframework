<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="workflowstage-rowedit <{if $row->UUID}>workflowstage-rowedit-existing rowedit-existing<{/if}> <{if $messages.workflowstage.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="workflowstagelistchk" name="workflowstagelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="workflowstage_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>workflowstage_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="workflowstage_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_WORKFLOW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
                <td class="column column-id-workflow reftext" >
                                            <{if (in_array('ID_WORKFLOW', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_WORKFLOW) }>
                            <{assign var='tmp_value' value=$formdata.ID_WORKFLOW}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow" name="`$prefix`workflowstage_formdata_ID_WORKFLOW" value=$formdata.ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WORKFLOW}>
        <{if $alreadyhaslink && isset($smarty.session.acl.workflow.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$row->refuuid_ID_WORKFLOW}>"><{$row->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$row->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WORKFLOW}><{$row->ID_WORKFLOW|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>workflowstage_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
                        
                            <input class="input-code" type="text" name="<{$prefix}>workflowstage_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.workflowstage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_DEFAULT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_DEFAULT']) && ((isset($aclviewablecolumns['IS_DEFAULT']) && $aclviewablecolumns['IS_DEFAULT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_DEFAULT']) || $aclviewablecolumns['IS_DEFAULT']))) }>
                <td class="column column-is-default yesno" data-value="<{$row->IS_DEFAULT}>" data-column="IS_DEFAULT" data-module="workflowstage">
                                            <{if (in_array('IS_DEFAULT', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_DEFAULT) }>
                            <{assign var='tmp_value' value=$formdata.IS_DEFAULT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-default" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" >
                                    <option value="1" <{if $formdata.IS_DEFAULT}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_DEFAULT}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-default" type="radio" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" value="1" <{if $formdata.IS_DEFAULT}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" value="0" <{if !$formdata.IS_DEFAULT}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_DEFAULT}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_BINDING_OBJECT_EDITABLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_BINDING_OBJECT_EDITABLE']) && ((isset($aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) && $aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) || $aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']))) }>
                <td class="column column-is-binding-object-editable yesno" data-value="<{$row->IS_BINDING_OBJECT_EDITABLE}>" data-column="IS_BINDING_OBJECT_EDITABLE" data-module="workflowstage">
                                            <{if (in_array('IS_BINDING_OBJECT_EDITABLE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_BINDING_OBJECT_EDITABLE) }>
                            <{assign var='tmp_value' value=$formdata.IS_BINDING_OBJECT_EDITABLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-binding-object-editable" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" >
                                    <option value="1" <{if $formdata.IS_BINDING_OBJECT_EDITABLE}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_BINDING_OBJECT_EDITABLE}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-binding-object-editable" type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="1" <{if $formdata.IS_BINDING_OBJECT_EDITABLE}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="0" <{if !$formdata.IS_BINDING_OBJECT_EDITABLE}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_BINDING_OBJECT_EDITABLE}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_BINDING_OBJECT_DELETABLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_BINDING_OBJECT_DELETABLE']) && ((isset($aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) && $aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) || $aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']))) }>
                <td class="column column-is-binding-object-deletable yesno" data-value="<{$row->IS_BINDING_OBJECT_DELETABLE}>" data-column="IS_BINDING_OBJECT_DELETABLE" data-module="workflowstage">
                                            <{if (in_array('IS_BINDING_OBJECT_DELETABLE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_BINDING_OBJECT_DELETABLE) }>
                            <{assign var='tmp_value' value=$formdata.IS_BINDING_OBJECT_DELETABLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-binding-object-deletable" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" >
                                    <option value="1" <{if $formdata.IS_BINDING_OBJECT_DELETABLE}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_BINDING_OBJECT_DELETABLE}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-binding-object-deletable" type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="1" <{if $formdata.IS_BINDING_OBJECT_DELETABLE}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="0" <{if !$formdata.IS_BINDING_OBJECT_DELETABLE}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_BINDING_OBJECT_DELETABLE}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
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
    	    <div class="workflowstage-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.workflowstage.0}>
        $('.workflowstage-rowedit-message').html('<{$messages.workflowstage.0}>').show();
    <{/if}>

    $('#workflowstagelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#workflowstagelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#workflowstagelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#workflowstagelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.workflowstage-rowedit-save').click();
        }
    });

    bind_hotkey("#workflowstagelist > tbody tr.rowedit input[type=text]", 'f2', '.workflowstage-rowedit-save');
    bind_hotkey("#workflowstagelist > tbody tr.rowedit input[type=text]", 'esc', '.workflowstage-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('workflowstage_formdata_NAME', 'workflowstage_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


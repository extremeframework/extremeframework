<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminview-rowedit <{if $row->UUID}>adminview-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminview.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminviewlistchk" name="adminviewlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminview_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminview_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminview_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-title" type="text" name="<{$prefix}>adminview_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
                        
                            <input class="input-code" type="text" name="<{$prefix}>adminview_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminview_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_MODULE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmodule.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->refuuid_MODULE}>"><{$row->reftext_MODULE|escape}></a>
        <{else}>
            <{$row->reftext_MODULE|escape}>        <{/if}>
    <{else}>
    	<{if $row->MODULE}><{$row->MODULE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminview.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('SCREEN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SCREEN']) && ((isset($aclviewablecolumns['SCREEN']) && $aclviewablecolumns['SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SCREEN']) || $aclviewablecolumns['SCREEN']))) }>
                <td class="column column-screen text" >
                                            <{if (in_array('SCREEN', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.SCREEN) }>
                            <{assign var='tmp_value' value=$formdata.SCREEN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-screen" type="text" name="<{$prefix}>adminview_formdata_SCREEN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->SCREEN|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CONDITION_FIELD', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CONDITION_FIELD']) && ((isset($aclviewablecolumns['CONDITION_FIELD']) && $aclviewablecolumns['CONDITION_FIELD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION_FIELD']) || $aclviewablecolumns['CONDITION_FIELD']))) }>
                <td class="column column-condition-field text" >
                                            <{if (in_array('CONDITION_FIELD', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CONDITION_FIELD) }>
                            <{assign var='tmp_value' value=$formdata.CONDITION_FIELD}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-condition-field" type="text" name="<{$prefix}>adminview_formdata_CONDITION_FIELD" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CONDITION_FIELD|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CONDITION_VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CONDITION_VALUE']) && ((isset($aclviewablecolumns['CONDITION_VALUE']) && $aclviewablecolumns['CONDITION_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION_VALUE']) || $aclviewablecolumns['CONDITION_VALUE']))) }>
                <td class="column column-condition-value text" >
                                            <{if (in_array('CONDITION_VALUE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CONDITION_VALUE) }>
                            <{assign var='tmp_value' value=$formdata.CONDITION_VALUE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-condition-value" type="text" name="<{$prefix}>adminview_formdata_CONDITION_VALUE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CONDITION_VALUE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TEMPLATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TEMPLATE']) && ((isset($aclviewablecolumns['TEMPLATE']) && $aclviewablecolumns['TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TEMPLATE']) || $aclviewablecolumns['TEMPLATE']))) }>
                <td class="column column-template text" >
                                            <{if (in_array('TEMPLATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.TEMPLATE) }>
                            <{assign var='tmp_value' value=$formdata.TEMPLATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-template" type="text" name="<{$prefix}>adminview_formdata_TEMPLATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->TEMPLATE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_PRINT_VIEW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_PRINT_VIEW']) && ((isset($aclviewablecolumns['IS_PRINT_VIEW']) && $aclviewablecolumns['IS_PRINT_VIEW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_PRINT_VIEW']) || $aclviewablecolumns['IS_PRINT_VIEW']))) }>
                <td class="column column-is-print-view yesno" data-value="<{$row->IS_PRINT_VIEW}>" data-column="IS_PRINT_VIEW" data-module="adminview">
                                            <{if (in_array('IS_PRINT_VIEW', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_PRINT_VIEW) }>
                            <{assign var='tmp_value' value=$formdata.IS_PRINT_VIEW}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-print-view" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" >
                                    <option value="1" <{if $formdata.IS_PRINT_VIEW}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_PRINT_VIEW}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-print-view" type="radio" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" value="1" <{if $formdata.IS_PRINT_VIEW}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" value="0" <{if !$formdata.IS_PRINT_VIEW}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_PRINT_VIEW}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminview_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="adminview-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminview.0}>
        $('.adminview-rowedit-message').html('<{$messages.adminview.0}>').show();
    <{/if}>

    $('#adminviewlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminviewlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminviewlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminviewlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminview-rowedit-save').click();
        }
    });

    bind_hotkey("#adminviewlist > tbody tr.rowedit input[type=text]", 'f2', '.adminview-rowedit-save');
    bind_hotkey("#adminviewlist > tbody tr.rowedit input[type=text]", 'esc', '.adminview-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('adminview_formdata_TITLE', 'adminview_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


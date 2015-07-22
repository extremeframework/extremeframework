<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="screenfield-rowedit <{if $row->UUID}>screenfield-rowedit-existing rowedit-existing<{/if}> <{if $messages.screenfield.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="screenfieldlistchk" name="screenfieldlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="screenfield_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>screenfield_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="screenfield_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_SCREEN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_SCREEN']) && ((isset($aclviewablecolumns['ID_SCREEN']) && $aclviewablecolumns['ID_SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_SCREEN']) || $aclviewablecolumns['ID_SCREEN']))) }>
                <td class="column column-id-screen reftext" >
                                            <{if (in_array('ID_SCREEN', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_SCREEN}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-screen" name="`$prefix`screenfield_formdata_ID_SCREEN" value=$formdata.ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.screen.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/new" title="Create a New Screen">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_SCREEN}>
        <{if $alreadyhaslink && isset($smarty.session.acl.screen.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$row->refuuid_ID_SCREEN}>"><{$row->reftext_ID_SCREEN|escape}></a>
        <{else}>
            <{$row->reftext_ID_SCREEN|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_SCREEN}><{$row->ID_SCREEN|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>screenfield_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text" >
                                            <{if (in_array('CODE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCODE}>

                        
                            <input class="input-code" type="text" name="<{$prefix}>screenfield_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_VALUE_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_VALUE_TYPE']) && ((isset($aclviewablecolumns['ID_VALUE_TYPE']) && $aclviewablecolumns['ID_VALUE_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_VALUE_TYPE']) || $aclviewablecolumns['ID_VALUE_TYPE']))) }>
                <td class="column column-id-value-type reftext" >
                                            <{if (in_array('ID_VALUE_TYPE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_VALUE_TYPE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-value-type" name="`$prefix`screenfield_formdata_ID_VALUE_TYPE" value=$formdata.ID_VALUE_TYPE datasource="VALUE_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.valuetype.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype/new" title="Create a New Value Type">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_VALUE_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.valuetype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype/view/<{$row->refuuid_ID_VALUE_TYPE}>"><{$row->reftext_ID_VALUE_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_VALUE_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_VALUE_TYPE}><{$row->ID_VALUE_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.screenfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DATASOURCE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATASOURCE']) && ((isset($aclviewablecolumns['DATASOURCE']) && $aclviewablecolumns['DATASOURCE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATASOURCE']) || $aclviewablecolumns['DATASOURCE']))) }>
                <td class="column column-datasource text" >
                                            <{if (in_array('DATASOURCE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataDATASOURCE}>

                        
                            <input class="input-datasource" type="text" name="<{$prefix}>screenfield_formdata_DATASOURCE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->DATASOURCE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CONDITION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CONDITION']) && ((isset($aclviewablecolumns['CONDITION']) && $aclviewablecolumns['CONDITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION']) || $aclviewablecolumns['CONDITION']))) }>
                <td class="column column-condition text" >
                                            <{if (in_array('CONDITION', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCONDITION}>

                        
                            <input class="input-condition" type="text" name="<{$prefix}>screenfield_formdata_CONDITION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CONDITION|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALUECOL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALUECOL']) && ((isset($aclviewablecolumns['VALUECOL']) && $aclviewablecolumns['VALUECOL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALUECOL']) || $aclviewablecolumns['VALUECOL']))) }>
                <td class="column column-valuecol text" >
                                            <{if (in_array('VALUECOL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALUECOL}>

                        
                            <input class="input-valuecol" type="text" name="<{$prefix}>screenfield_formdata_VALUECOL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->VALUECOL|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TEXTCOL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TEXTCOL']) && ((isset($aclviewablecolumns['TEXTCOL']) && $aclviewablecolumns['TEXTCOL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TEXTCOL']) || $aclviewablecolumns['TEXTCOL']))) }>
                <td class="column column-textcol text" >
                                            <{if (in_array('TEXTCOL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTEXTCOL}>

                        
                            <input class="input-textcol" type="text" name="<{$prefix}>screenfield_formdata_TEXTCOL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->TEXTCOL|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_MANDATORY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_MANDATORY']) && ((isset($aclviewablecolumns['IS_MANDATORY']) && $aclviewablecolumns['IS_MANDATORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_MANDATORY']) || $aclviewablecolumns['IS_MANDATORY']))) }>
                <td class="column column-is-mandatory yesno" data-value="<{$row->IS_MANDATORY}>" data-column="IS_MANDATORY" data-module="screenfield">
                                            <{if (in_array('IS_MANDATORY', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataIS_MANDATORY}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-mandatory" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" >
                                    <option value="1" <{if $formdata.IS_MANDATORY}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_MANDATORY}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-mandatory" type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="1" <{if $formdata.IS_MANDATORY}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="0" <{if !$formdata.IS_MANDATORY}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_MANDATORY}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>screenfield_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="screenfield-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.screenfield.0}>
        $('.screenfield-rowedit-message').html('<{$messages.screenfield.0}>').show();
    <{/if}>

    $('#screenfieldlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#screenfieldlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#screenfieldlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#screenfieldlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.screenfield-rowedit-save').click();
        }
    });

    bind_hotkey("#screenfieldlist > tbody tr.rowedit input[type=text]", 'f2', '.screenfield-rowedit-save');
    bind_hotkey("#screenfieldlist > tbody tr.rowedit input[type=text]", 'esc', '.screenfield-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('screenfield_formdata_TITLE', 'screenfield_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


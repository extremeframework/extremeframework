<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="parameter-rowedit <{if $row->UUID}>parameter-rowedit-existing rowedit-existing<{/if}> <{if $messages.parameter.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="parameterlistchk" name="parameterlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="parameter_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>parameter_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="parameter_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>parameter_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text" >
                                            <{if (in_array('CODE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCODE}>

                        
                            <input class="input-code" type="text" name="<{$prefix}>parameter_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_PARAMETER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PARAMETER_GROUP']) && ((isset($aclviewablecolumns['ID_PARAMETER_GROUP']) && $aclviewablecolumns['ID_PARAMETER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PARAMETER_GROUP']) || $aclviewablecolumns['ID_PARAMETER_GROUP']))) }>
                <td class="column column-id-parameter-group reftext" >
                                            <{if (in_array('ID_PARAMETER_GROUP', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_PARAMETER_GROUP}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-parameter-group" name="`$prefix`parameter_formdata_ID_PARAMETER_GROUP" value=$formdata.ID_PARAMETER_GROUP datasource="PARAMETER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.parametergroup.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/new" title="Create a New Parameter Group">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PARAMETER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.parametergroup.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/view/<{$row->refuuid_ID_PARAMETER_GROUP}>"><{$row->reftext_ID_PARAMETER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ID_PARAMETER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PARAMETER_GROUP}><{$row->ID_PARAMETER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_PARAMETER_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PARAMETER_TYPE']) && ((isset($aclviewablecolumns['ID_PARAMETER_TYPE']) && $aclviewablecolumns['ID_PARAMETER_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PARAMETER_TYPE']) || $aclviewablecolumns['ID_PARAMETER_TYPE']))) }>
                <td class="column column-id-parameter-type reftext" >
                                            <{if (in_array('ID_PARAMETER_TYPE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_PARAMETER_TYPE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-parameter-type" name="`$prefix`parameter_formdata_ID_PARAMETER_TYPE" value=$formdata.ID_PARAMETER_TYPE datasource="PARAMETER_TYPE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.parametertype.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/new" title="Create a New Parameter Type">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PARAMETER_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.parametertype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/view/<{$row->refuuid_ID_PARAMETER_TYPE}>"><{$row->reftext_ID_PARAMETER_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PARAMETER_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PARAMETER_TYPE}><{$row->ID_PARAMETER_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.parameter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALUE']) && ((isset($aclviewablecolumns['VALUE']) && $aclviewablecolumns['VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALUE']) || $aclviewablecolumns['VALUE']))) }>
                <td class="column column-value text" >
                                            <{if (in_array('VALUE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALUE}>

                        
                            <input class="input-value" type="text" name="<{$prefix}>parameter_formdata_VALUE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>	<{$row->VALUE|escape}>
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
    	    <div class="parameter-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.parameter.0}>
        $('.parameter-rowedit-message').html('<{$messages.parameter.0}>').show();
    <{/if}>

    $('#parameterlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#parameterlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#parameterlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#parameterlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.parameter-rowedit-save').click();
        }
    });

    bind_hotkey("#parameterlist > tbody tr.rowedit input[type=text]", 'f2', '.parameter-rowedit-save');
    bind_hotkey("#parameterlist > tbody tr.rowedit input[type=text]", 'esc', '.parameter-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('parameter_formdata_NAME', 'parameter_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


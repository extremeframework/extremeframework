<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="customaccessright-rowedit <{if $row->UUID}>customaccessright-rowedit-existing rowedit-existing<{/if}> <{if $messages.customaccessright.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="customaccessrightlistchk" name="customaccessrightlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="customaccessright_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>customaccessright_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="customaccessright_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`customaccessright_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.user.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.customaccessright.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/customaccessright/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.customaccessright.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_PERMISSION_SET', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PERMISSION_SET']) && ((isset($aclviewablecolumns['ID_PERMISSION_SET']) && $aclviewablecolumns['ID_PERMISSION_SET']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PERMISSION_SET']) || $aclviewablecolumns['ID_PERMISSION_SET']))) }>
                <td class="column column-id-permission-set reftext" >
                                            <{if (in_array('ID_PERMISSION_SET', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_PERMISSION_SET}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-permission-set" name="`$prefix`customaccessright_formdata_ID_PERMISSION_SET" value=$formdata.ID_PERMISSION_SET datasource="PERMISSION_SET" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.permissionset.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/new" title="Create a New Permission Set">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.customaccessright.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/customaccessright/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PERMISSION_SET}>
        <{if $alreadyhaslink && isset($smarty.session.acl.permissionset.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$row->refuuid_ID_PERMISSION_SET}>"><{$row->reftext_ID_PERMISSION_SET|escape}></a>
        <{else}>
            <{$row->reftext_ID_PERMISSION_SET|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PERMISSION_SET}><{$row->ID_PERMISSION_SET|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.customaccessright.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALID_FROM', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
                <td class="column column-valid-from datetime" >
                                            <{if (in_array('VALID_FROM', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALID_FROM}>

                                                    <input class="input-valid-from field-date" type="text" id="<{$prefix}>customaccessright_formdata_VALID_FROM" name="<{$prefix}>customaccessright_formdata_VALID_FROM" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.customaccessright.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/customaccessright/view/<{$row->UUID}>"><{/if}>
            <{$row->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    <{if isset($smarty.session.acl.customaccessright.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALID_UNTIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_UNTIL']) && ((isset($aclviewablecolumns['VALID_UNTIL']) && $aclviewablecolumns['VALID_UNTIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_UNTIL']) || $aclviewablecolumns['VALID_UNTIL']))) }>
                <td class="column column-valid-until datetime" >
                                            <{if (in_array('VALID_UNTIL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALID_UNTIL}>

                                                    <input class="input-valid-until field-date" type="text" id="<{$prefix}>customaccessright_formdata_VALID_UNTIL" name="<{$prefix}>customaccessright_formdata_VALID_UNTIL" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.customaccessright.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/customaccessright/view/<{$row->UUID}>"><{/if}>
            <{$row->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    <{if isset($smarty.session.acl.customaccessright.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="customaccessright-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.customaccessright.0}>
        $('.customaccessright-rowedit-message').html('<{$messages.customaccessright.0}>').show();
    <{/if}>

    $('#customaccessrightlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#customaccessrightlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#customaccessrightlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#customaccessrightlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.customaccessright-rowedit-save').click();
        }
    });

    bind_hotkey("#customaccessrightlist > tbody tr.rowedit input[type=text]", 'f2', '.customaccessright-rowedit-save');
    bind_hotkey("#customaccessrightlist > tbody tr.rowedit input[type=text]", 'esc', '.customaccessright-rowedit-cancel');
</script>



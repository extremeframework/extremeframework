<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminlanguageitem-rowedit <{if $row->UUID}>adminlanguageitem-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminlanguageitem.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminlanguageitemlistchk" name="adminlanguageitemlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminlanguageitem_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminlanguageitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminlanguageitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_ADMIN_LANGUAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_LANGUAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_LANGUAGE']) && $aclviewablecolumns['ID_ADMIN_LANGUAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LANGUAGE']) || $aclviewablecolumns['ID_ADMIN_LANGUAGE']))) }>
                <td class="column column-id-admin-language reftext" >
                                            <{if (in_array('ID_ADMIN_LANGUAGE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_ADMIN_LANGUAGE) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_LANGUAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-language" name="`$prefix`adminlanguageitem_formdata_ID_ADMIN_LANGUAGE" value=$formdata.ID_ADMIN_LANGUAGE datasource="ADMIN_LANGUAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/new" title="Create a New Admin Language">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlanguageitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_LANGUAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminlanguage.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/view/<{$row->refuuid_ID_ADMIN_LANGUAGE}>"><{$row->reftext_ID_ADMIN_LANGUAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_LANGUAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_LANGUAGE}><{$row->ID_ADMIN_LANGUAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminlanguageitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_LABEL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_LABEL']) && ((isset($aclviewablecolumns['ID_ADMIN_LABEL']) && $aclviewablecolumns['ID_ADMIN_LABEL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LABEL']) || $aclviewablecolumns['ID_ADMIN_LABEL']))) }>
                <td class="column column-id-admin-label reftext" >
                                            <{if (in_array('ID_ADMIN_LABEL', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_ADMIN_LABEL) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_LABEL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-label" name="`$prefix`adminlanguageitem_formdata_ID_ADMIN_LABEL" value=$formdata.ID_ADMIN_LABEL datasource="ADMIN_LABEL" valuecol="ID" textcol="LABEL" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/new" title="Create a New Admin Label">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlanguageitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_LABEL}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminlabel.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/view/<{$row->refuuid_ID_ADMIN_LABEL}>"><{$row->reftext_ID_ADMIN_LABEL|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_LABEL|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_LABEL}><{$row->ID_ADMIN_LABEL|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminlanguageitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="adminlanguageitem-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminlanguageitem.0}>
        $('.adminlanguageitem-rowedit-message').html('<{$messages.adminlanguageitem.0}>').show();
    <{/if}>

    $('#adminlanguageitemlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminlanguageitemlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminlanguageitemlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminlanguageitemlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminlanguageitem-rowedit-save').click();
        }
    });

    bind_hotkey("#adminlanguageitemlist > tbody tr.rowedit input[type=text]", 'f2', '.adminlanguageitem-rowedit-save');
    bind_hotkey("#adminlanguageitemlist > tbody tr.rowedit input[type=text]", 'esc', '.adminlanguageitem-rowedit-cancel');
</script>



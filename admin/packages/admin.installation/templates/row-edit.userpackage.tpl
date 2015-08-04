<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="userpackage-rowedit <{if $row->UUID}>userpackage-rowedit-existing rowedit-existing<{/if}> <{if $messages.userpackage.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="userpackagelistchk" name="userpackagelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="userpackage_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>userpackage_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="userpackage_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`userpackage_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.user.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpackage/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_PACKAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) && $aclviewablecolumns['ID_ADMIN_PACKAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) || $aclviewablecolumns['ID_ADMIN_PACKAGE']))) }>
                <td class="column column-id-admin-package reftext" >
                                            <{if (in_array('ID_ADMIN_PACKAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_PACKAGE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-package" name="`$prefix`userpackage_formdata_ID_ADMIN_PACKAGE" value=$formdata.ID_ADMIN_PACKAGE datasource="ADMIN_PACKAGE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminpackage.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new" title="Create a New Admin Package">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpackage/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_PACKAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminpackage.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->refuuid_ID_ADMIN_PACKAGE}>"><{$row->reftext_ID_ADMIN_PACKAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_PACKAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_PACKAGE}><{$row->ID_ADMIN_PACKAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('INSTALLATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['INSTALLATION_DATE']) && ((isset($aclviewablecolumns['INSTALLATION_DATE']) && $aclviewablecolumns['INSTALLATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INSTALLATION_DATE']) || $aclviewablecolumns['INSTALLATION_DATE']))) }>
                <td class="column column-installation-date date" >
                                            <{if (in_array('INSTALLATION_DATE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataINSTALLATION_DATE}>

                                                    <input class="input-installation-date field-date" type="text" id="<{$prefix}>userpackage_formdata_INSTALLATION_DATE" name="<{$prefix}>userpackage_formdata_INSTALLATION_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpackage/view/<{$row->UUID}>"><{/if}>
            <{$row->INSTALLATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    <{if isset($smarty.session.acl.userpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="userpackage-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.userpackage.0}>
        $('.userpackage-rowedit-message').html('<{$messages.userpackage.0}>').show();
    <{/if}>

    $('#userpackagelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#userpackagelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#userpackagelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#userpackagelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.userpackage-rowedit-save').click();
        }
    });

    bind_hotkey("#userpackagelist > tbody tr.rowedit input[type=text]", 'f2', '.userpackage-rowedit-save');
    bind_hotkey("#userpackagelist > tbody tr.rowedit input[type=text]", 'esc', '.userpackage-rowedit-cancel');
</script>



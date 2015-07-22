<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="usergroup-rowedit <{if $row->UUID}>usergroup-rowedit-existing rowedit-existing<{/if}> <{if $messages.usergroup.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="usergrouplistchk" name="usergrouplist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="usergroup_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>usergroup_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="usergroup_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>usergroup_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.usergroup.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.usergroup.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DEFAULT_ID_DASHBOARD', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DEFAULT_ID_DASHBOARD']) && ((isset($aclviewablecolumns['DEFAULT_ID_DASHBOARD']) && $aclviewablecolumns['DEFAULT_ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DEFAULT_ID_DASHBOARD']) || $aclviewablecolumns['DEFAULT_ID_DASHBOARD']))) }>
                <td class="column column-default-id-dashboard reftext" >
                                            <{if (in_array('DEFAULT_ID_DASHBOARD', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataDEFAULT_ID_DASHBOARD}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-default-id-dashboard" name="`$prefix`usergroup_formdata_DEFAULT_ID_DASHBOARD" value=$formdata.DEFAULT_ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.dashboard.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.usergroup.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_DEFAULT_ID_DASHBOARD}>
        <{if $alreadyhaslink && isset($smarty.session.acl.dashboard.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->refuuid_DEFAULT_ID_DASHBOARD}>"><{$row->reftext_DEFAULT_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$row->reftext_DEFAULT_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
    	<{if $row->DEFAULT_ID_DASHBOARD}><{$row->DEFAULT_ID_DASHBOARD|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.usergroup.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="usergroup-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.usergroup.0}>
        $('.usergroup-rowedit-message').html('<{$messages.usergroup.0}>').show();
    <{/if}>

    $('#usergrouplist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#usergrouplist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#usergrouplist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#usergrouplist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.usergroup-rowedit-save').click();
        }
    });

    bind_hotkey("#usergrouplist > tbody tr.rowedit input[type=text]", 'f2', '.usergroup-rowedit-save');
    bind_hotkey("#usergrouplist > tbody tr.rowedit input[type=text]", 'esc', '.usergroup-rowedit-cancel');
</script>



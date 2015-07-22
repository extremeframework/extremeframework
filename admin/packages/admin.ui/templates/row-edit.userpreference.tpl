<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="userpreference-rowedit <{if $row->UUID}>userpreference-rowedit-existing rowedit-existing<{/if}> <{if $messages.userpreference.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="userpreferencelistchk" name="userpreferencelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="userpreference_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>userpreference_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="userpreference_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`userpreference_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.user.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userpreference.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpreference/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userpreference.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_DASHBOARD', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_DASHBOARD']) && ((isset($aclviewablecolumns['ID_DASHBOARD']) && $aclviewablecolumns['ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD']) || $aclviewablecolumns['ID_DASHBOARD']))) }>
                <td class="column column-id-dashboard reftext" >
                                            <{if (in_array('ID_DASHBOARD', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_DASHBOARD}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-dashboard" name="`$prefix`userpreference_formdata_ID_DASHBOARD" value=$formdata.ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.dashboard.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userpreference.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpreference/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_DASHBOARD}>
        <{if $alreadyhaslink && isset($smarty.session.acl.dashboard.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->refuuid_ID_DASHBOARD}>"><{$row->reftext_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$row->reftext_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_DASHBOARD}><{$row->ID_DASHBOARD|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userpreference.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_WALLPAPER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WALLPAPER']) && ((isset($aclviewablecolumns['ID_WALLPAPER']) && $aclviewablecolumns['ID_WALLPAPER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WALLPAPER']) || $aclviewablecolumns['ID_WALLPAPER']))) }>
                <td class="column column-id-wallpaper key" >
                                            <{if (in_array('ID_WALLPAPER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_WALLPAPER}>

                        
                            <input class="input-id-wallpaper" type="text" name="<{$prefix}>userpreference_formdata_ID_WALLPAPER" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userpreference.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpreference/view/<{$row->UUID}>"><{/if}>	<{$row->ID_WALLPAPER|escape}>
<{if isset($smarty.session.acl.userpreference.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_STYLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_STYLE']) && ((isset($aclviewablecolumns['ID_ADMIN_STYLE']) && $aclviewablecolumns['ID_ADMIN_STYLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_STYLE']) || $aclviewablecolumns['ID_ADMIN_STYLE']))) }>
                <td class="column column-id-admin-style key" >
                                            <{if (in_array('ID_ADMIN_STYLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_STYLE}>

                        
                            <input class="input-id-admin-style" type="text" name="<{$prefix}>userpreference_formdata_ID_ADMIN_STYLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->ID_ADMIN_STYLE|escape}>
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
    	    <div class="userpreference-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.userpreference.0}>
        $('.userpreference-rowedit-message').html('<{$messages.userpreference.0}>').show();
    <{/if}>

    $('#userpreferencelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#userpreferencelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#userpreferencelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#userpreferencelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.userpreference-rowedit-save').click();
        }
    });

    bind_hotkey("#userpreferencelist > tbody tr.rowedit input[type=text]", 'f2', '.userpreference-rowedit-save');
    bind_hotkey("#userpreferencelist > tbody tr.rowedit input[type=text]", 'esc', '.userpreference-rowedit-cancel');
</script>



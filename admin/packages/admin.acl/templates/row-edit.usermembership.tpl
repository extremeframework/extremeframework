<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="usermembership-rowedit <{if $row->UUID}>usermembership-rowedit-existing rowedit-existing<{/if}> <{if $messages.usermembership.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="usermembershiplistchk" name="usermembershiplist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="usermembership_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>usermembership_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="usermembership_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`usermembership_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.user.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
                <td class="column column-id-user-group reftext" >
                                            <{if (in_array('ID_USER_GROUP', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER_GROUP}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`usermembership_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.usergroup.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ID_USER_GROUP}>"><{$row->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_GROUP}><{$row->ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER_ROLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
                <td class="column column-id-user-role reftext" >
                                            <{if (in_array('ID_USER_ROLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER_ROLE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-role" name="`$prefix`usermembership_formdata_ID_USER_ROLE" value=$formdata.ID_USER_ROLE datasource="USER_ROLE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.userrole.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new" title="Create a New User Role">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_ROLE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.userrole.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$row->refuuid_ID_USER_ROLE}>"><{$row->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_ROLE}><{$row->ID_USER_ROLE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALID_FROM', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
                <td class="column column-valid-from datetime" >
                                            <{if (in_array('VALID_FROM', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALID_FROM}>

                                                    <input class="input-valid-from field-date" type="text" id="<{$prefix}>usermembership_formdata_VALID_FROM" name="<{$prefix}>usermembership_formdata_VALID_FROM" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/view/<{$row->UUID}>"><{/if}>
            <{$row->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    <{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALID_UNTIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_UNTIL']) && ((isset($aclviewablecolumns['VALID_UNTIL']) && $aclviewablecolumns['VALID_UNTIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_UNTIL']) || $aclviewablecolumns['VALID_UNTIL']))) }>
                <td class="column column-valid-until datetime" >
                                            <{if (in_array('VALID_UNTIL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALID_UNTIL}>

                                                    <input class="input-valid-until field-date" type="text" id="<{$prefix}>usermembership_formdata_VALID_UNTIL" name="<{$prefix}>usermembership_formdata_VALID_UNTIL" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/view/<{$row->UUID}>"><{/if}>
            <{$row->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    <{if isset($smarty.session.acl.usermembership.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="usermembership-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.usermembership.0}>
        $('.usermembership-rowedit-message').html('<{$messages.usermembership.0}>').show();
    <{/if}>

    $('#usermembershiplist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#usermembershiplist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#usermembershiplist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#usermembershiplist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.usermembership-rowedit-save').click();
        }
    });

    bind_hotkey("#usermembershiplist > tbody tr.rowedit input[type=text]", 'f2', '.usermembership-rowedit-save');
    bind_hotkey("#usermembershiplist > tbody tr.rowedit input[type=text]", 'esc', '.usermembership-rowedit-cancel');
</script>



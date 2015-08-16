<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="userinvitation-rowedit <{if $row->UUID}>userinvitation-rowedit-existing rowedit-existing<{/if}> <{if $messages.userinvitation.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="userinvitationlistchk" name="userinvitationlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="userinvitation_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>userinvitation_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="userinvitation_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('INVITEE_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['INVITEE_NAME']) && ((isset($aclviewablecolumns['INVITEE_NAME']) && $aclviewablecolumns['INVITEE_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INVITEE_NAME']) || $aclviewablecolumns['INVITEE_NAME']))) }>
                <td class="column column-invitee-name text" >
                                            <{if (in_array('INVITEE_NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataINVITEE_NAME}>

                        
                            <input class="input-invitee-name" type="text" name="<{$prefix}>userinvitation_formdata_INVITEE_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    	    <{$row->INVITEE_NAME|escape}>
    <{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('INVITEE_EMAIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['INVITEE_EMAIL']) && ((isset($aclviewablecolumns['INVITEE_EMAIL']) && $aclviewablecolumns['INVITEE_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INVITEE_EMAIL']) || $aclviewablecolumns['INVITEE_EMAIL']))) }>
                <td class="column column-invitee-email email" >
                                            <{if (in_array('INVITEE_EMAIL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataINVITEE_EMAIL}>

                        
                            <input class="input-invitee-email" type="text" name="<{$prefix}>userinvitation_formdata_INVITEE_EMAIL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="150"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    	    <{$row->INVITEE_EMAIL|escape}>
    <{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
                <td class="column column-id-user-group reftext" >
                                            <{if (in_array('ID_USER_GROUP', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER_GROUP}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`userinvitation_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.usergroup.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ID_USER_GROUP}>"><{$row->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_GROUP}><{$row->ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER_ROLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
                <td class="column column-id-user-role reftext" >
                                            <{if (in_array('ID_USER_ROLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER_ROLE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-user-role" name="`$prefix`userinvitation_formdata_ID_USER_ROLE" value=$formdata.ID_USER_ROLE datasource="USER_ROLE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.userrole.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new" title="Create a New User Role">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_ROLE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.userrole.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$row->refuuid_ID_USER_ROLE}>"><{$row->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_ROLE}><{$row->ID_USER_ROLE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALID_FROM', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
                <td class="column column-valid-from datetime" >
                                            <{if (in_array('VALID_FROM', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALID_FROM}>

                                                    <input class="input-valid-from field-date" type="text" id="<{$prefix}>userinvitation_formdata_VALID_FROM" name="<{$prefix}>userinvitation_formdata_VALID_FROM" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALID_UNTIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_UNTIL']) && ((isset($aclviewablecolumns['VALID_UNTIL']) && $aclviewablecolumns['VALID_UNTIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_UNTIL']) || $aclviewablecolumns['VALID_UNTIL']))) }>
                <td class="column column-valid-until datetime" >
                                            <{if (in_array('VALID_UNTIL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALID_UNTIL}>

                                                    <input class="input-valid-until field-date" type="text" id="<{$prefix}>userinvitation_formdata_VALID_UNTIL" name="<{$prefix}>userinvitation_formdata_VALID_UNTIL" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER_INVITATION_STATUS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_INVITATION_STATUS']) && ((isset($aclviewablecolumns['ID_USER_INVITATION_STATUS']) && $aclviewablecolumns['ID_USER_INVITATION_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_INVITATION_STATUS']) || $aclviewablecolumns['ID_USER_INVITATION_STATUS']))) }>
                <td class="column column-id-user-invitation-status reftext" >
                                            <{if (in_array('ID_USER_INVITATION_STATUS', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER_INVITATION_STATUS}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-user-invitation-status" name="`$prefix`userinvitation_formdata_ID_USER_INVITATION_STATUS" value=$formdata.ID_USER_INVITATION_STATUS datasource="USER_INVITATION_STATUS" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.userinvitationstatus.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/new" title="Create a New User Invitation Status">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_INVITATION_STATUS}>
        <{if $alreadyhaslink && isset($smarty.session.acl.userinvitationstatus.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/view/<{$row->refuuid_ID_USER_INVITATION_STATUS}>"><{$row->reftext_ID_USER_INVITATION_STATUS|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_INVITATION_STATUS|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_INVITATION_STATUS}><{$row->ID_USER_INVITATION_STATUS|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userinvitation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DATE_SENT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE_SENT']) && ((isset($aclviewablecolumns['DATE_SENT']) && $aclviewablecolumns['DATE_SENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_SENT']) || $aclviewablecolumns['DATE_SENT']))) }>
                <td class="column column-date-sent datetime" >
                                            <{if (in_array('DATE_SENT', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataDATE_SENT}>

                                                    <input class="input-date-sent field-date" type="text" id="<{$prefix}>userinvitation_formdata_DATE_SENT" name="<{$prefix}>userinvitation_formdata_DATE_SENT" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->DATE_SENT|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DATE_ACCEPTED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE_ACCEPTED']) && ((isset($aclviewablecolumns['DATE_ACCEPTED']) && $aclviewablecolumns['DATE_ACCEPTED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_ACCEPTED']) || $aclviewablecolumns['DATE_ACCEPTED']))) }>
                <td class="column column-date-accepted datetime" >
                                            <{if (in_array('DATE_ACCEPTED', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataDATE_ACCEPTED}>

                                                    <input class="input-date-accepted field-date" type="text" id="<{$prefix}>userinvitation_formdata_DATE_ACCEPTED" name="<{$prefix}>userinvitation_formdata_DATE_ACCEPTED" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->DATE_ACCEPTED|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
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
    	    <div class="userinvitation-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.userinvitation.0}>
        $('.userinvitation-rowedit-message').html('<{$messages.userinvitation.0}>').show();
    <{/if}>

    $('#userinvitationlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#userinvitationlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#userinvitationlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#userinvitationlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.userinvitation-rowedit-save').click();
        }
    });

    bind_hotkey("#userinvitationlist > tbody tr.rowedit input[type=text]", 'f2', '.userinvitation-rowedit-save');
    bind_hotkey("#userinvitationlist > tbody tr.rowedit input[type=text]", 'esc', '.userinvitation-rowedit-cancel');
</script>



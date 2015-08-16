<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="userextradomain-rowedit <{if $row->UUID}>userextradomain-rowedit-existing rowedit-existing<{/if}> <{if $messages.userextradomain.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="userextradomainlistchk" name="userextradomainlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="userextradomain_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>userextradomain_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="userextradomain_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`userextradomain_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.user.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('EXTRA_UDID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['EXTRA_UDID']) && ((isset($aclviewablecolumns['EXTRA_UDID']) && $aclviewablecolumns['EXTRA_UDID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EXTRA_UDID']) || $aclviewablecolumns['EXTRA_UDID']))) }>
                <td class="column column-extra-udid number" >
                                            <{if (in_array('EXTRA_UDID', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataEXTRA_UDID}>

                                                    
                            <input class="input-extra-udid" type="text" name="<{$prefix}>userextradomain_formdata_EXTRA_UDID" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/view/<{$row->UUID}>"><{/if}>
            <{if $row->EXTRA_UDID != 0}><{$row->EXTRA_UDID}><{/if}>
    
    <{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALID_FROM', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
                <td class="column column-valid-from datetime" >
                                            <{if (in_array('VALID_FROM', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALID_FROM}>

                                                    <input class="input-valid-from field-date" type="text" id="<{$prefix}>userextradomain_formdata_VALID_FROM" name="<{$prefix}>userextradomain_formdata_VALID_FROM" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/view/<{$row->UUID}>"><{/if}>
            <{$row->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    <{if isset($smarty.session.acl.userextradomain.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VALID_UNTIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VALID_UNTIL']) && ((isset($aclviewablecolumns['VALID_UNTIL']) && $aclviewablecolumns['VALID_UNTIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_UNTIL']) || $aclviewablecolumns['VALID_UNTIL']))) }>
                <td class="column column-valid-until datetime" >
                                            <{if (in_array('VALID_UNTIL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVALID_UNTIL}>

                                                    <input class="input-valid-until field-date" type="text" id="<{$prefix}>userextradomain_formdata_VALID_UNTIL" name="<{$prefix}>userextradomain_formdata_VALID_UNTIL" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
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
    	    <div class="userextradomain-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.userextradomain.0}>
        $('.userextradomain-rowedit-message').html('<{$messages.userextradomain.0}>').show();
    <{/if}>

    $('#userextradomainlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#userextradomainlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#userextradomainlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#userextradomainlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.userextradomain-rowedit-save').click();
        }
    });

    bind_hotkey("#userextradomainlist > tbody tr.rowedit input[type=text]", 'f2', '.userextradomain-rowedit-save');
    bind_hotkey("#userextradomainlist > tbody tr.rowedit input[type=text]", 'esc', '.userextradomain-rowedit-cancel');
</script>



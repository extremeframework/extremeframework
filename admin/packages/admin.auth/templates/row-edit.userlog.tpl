<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="userlog-rowedit <{if $row->UUID}>userlog-rowedit-existing rowedit-existing<{/if}> <{if $messages.userlog.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="userloglistchk" name="userloglist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="userlog_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>userlog_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="userlog_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`userlog_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.user.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userlog.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userlog/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.userlog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DATE_TIME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE_TIME']) && ((isset($aclviewablecolumns['DATE_TIME']) && $aclviewablecolumns['DATE_TIME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_TIME']) || $aclviewablecolumns['DATE_TIME']))) }>
                <td class="column column-date-time datetime" >
                                            <{if (in_array('DATE_TIME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataDATE_TIME}>

                                                    <input class="input-date-time field-date" type="text" id="<{$prefix}>userlog_formdata_DATE_TIME" name="<{$prefix}>userlog_formdata_DATE_TIME" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userlog.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userlog/view/<{$row->UUID}>"><{/if}>
            <{$row->DATE_TIME|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    <{if isset($smarty.session.acl.userlog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IP']) && ((isset($aclviewablecolumns['IP']) && $aclviewablecolumns['IP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IP']) || $aclviewablecolumns['IP']))) }>
                <td class="column column-ip text" >
                                            <{if (in_array('IP', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataIP}>

                        
                            <input class="input-ip" type="text" name="<{$prefix}>userlog_formdata_IP" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.userlog.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userlog/view/<{$row->UUID}>"><{/if}>	<{$row->IP|escape}>
<{if isset($smarty.session.acl.userlog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="userlog-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.userlog.0}>
        $('.userlog-rowedit-message').html('<{$messages.userlog.0}>').show();
    <{/if}>

    $('#userloglist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#userloglist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#userloglist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#userloglist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.userlog-rowedit-save').click();
        }
    });

    bind_hotkey("#userloglist > tbody tr.rowedit input[type=text]", 'f2', '.userlog-rowedit-save');
    bind_hotkey("#userloglist > tbody tr.rowedit input[type=text]", 'esc', '.userlog-rowedit-cancel');
</script>



<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="changelog-rowedit <{if $row->UUID}>changelog-rowedit-existing rowedit-existing<{/if}> <{if $messages.changelog.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="changeloglistchk" name="changeloglist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="changelog_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>changelog_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="changelog_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ACTION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ACTION']) && ((isset($aclviewablecolumns['ACTION']) && $aclviewablecolumns['ACTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTION']) || $aclviewablecolumns['ACTION']))) }>
                <td class="column column-action text" >
                                            <{if (in_array('ACTION', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ACTION) }>
                            <{assign var='tmp_value' value=$formdata.ACTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-action" type="text" name="<{$prefix}>changelog_formdata_ACTION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.changelog.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/changelog/view/<{$row->UUID}>"><{/if}>	<{$row->ACTION|escape}>
<{if isset($smarty.session.acl.changelog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ITEM', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ITEM']) && ((isset($aclviewablecolumns['ITEM']) && $aclviewablecolumns['ITEM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ITEM']) || $aclviewablecolumns['ITEM']))) }>
                <td class="column column-item text" >
                                            <{if (in_array('ITEM', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ITEM) }>
                            <{assign var='tmp_value' value=$formdata.ITEM}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-item" type="text" name="<{$prefix}>changelog_formdata_ITEM" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.changelog.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/changelog/view/<{$row->UUID}>"><{/if}>	<{$row->ITEM|escape}>
<{if isset($smarty.session.acl.changelog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module reftext" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`changelog_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.changelog.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/changelog/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_MODULE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmodule.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->refuuid_MODULE}>"><{$row->reftext_MODULE|escape}></a>
        <{else}>
            <{$row->reftext_MODULE|escape}>        <{/if}>
    <{else}>
    	<{if $row->MODULE}><{$row->MODULE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.changelog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DATE_TIME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE_TIME']) && ((isset($aclviewablecolumns['DATE_TIME']) && $aclviewablecolumns['DATE_TIME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_TIME']) || $aclviewablecolumns['DATE_TIME']))) }>
                <td class="column column-date-time datetime" >
                                            <{if (in_array('DATE_TIME', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.DATE_TIME) }>
                            <{assign var='tmp_value' value=$formdata.DATE_TIME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-date-time field-date" type="text" id="<{$prefix}>changelog_formdata_DATE_TIME" name="<{$prefix}>changelog_formdata_DATE_TIME" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->DATE_TIME|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_USER) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`changelog_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.changelog.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/changelog/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.changelog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="changelog-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.changelog.0}>
        $('.changelog-rowedit-message').html('<{$messages.changelog.0}>').show();
    <{/if}>

    $('#changeloglist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#changeloglist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#changeloglist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#changeloglist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.changelog-rowedit-save').click();
        }
    });

    bind_hotkey("#changeloglist > tbody tr.rowedit input[type=text]", 'f2', '.changelog-rowedit-save');
    bind_hotkey("#changeloglist > tbody tr.rowedit input[type=text]", 'esc', '.changelog-rowedit-cancel');
</script>



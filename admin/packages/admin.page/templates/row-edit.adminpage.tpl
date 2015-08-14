<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminpage-rowedit <{if $row->UUID}>adminpage-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminpage.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminpagelistchk" name="adminpagelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminpage_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminpage_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminpage_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>adminpage_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpage/view/<{$row->UUID}>"><{/if}>    	    <{$row->TITLE|escape}>
    <{if isset($smarty.session.acl.adminpage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('SLUG', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SLUG']) && ((isset($aclviewablecolumns['SLUG']) && $aclviewablecolumns['SLUG']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SLUG']) || $aclviewablecolumns['SLUG']))) }>
                <td class="column column-slug text" >
                                            <{if (in_array('SLUG', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataSLUG}>

                        
                            <input class="input-slug" type="text" name="<{$prefix}>adminpage_formdata_SLUG" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpage/view/<{$row->UUID}>"><{/if}>    	    <{$row->SLUG|escape}>
    <{if isset($smarty.session.acl.adminpage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="adminpage-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminpage.0}>
        $('.adminpage-rowedit-message').html('<{$messages.adminpage.0}>').show();
    <{/if}>

    $('#adminpagelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminpagelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminpagelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminpagelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminpage-rowedit-save').click();
        }
    });

    bind_hotkey("#adminpagelist > tbody tr.rowedit input[type=text]", 'f2', '.adminpage-rowedit-save');
    bind_hotkey("#adminpagelist > tbody tr.rowedit input[type=text]", 'esc', '.adminpage-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('adminpage_formdata_TITLE', 'adminpage_formdata_SLUG', 'tr');
                                    </script>
    <{/if}>


<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="menu-rowedit <{if $row->UUID}>menu-rowedit-existing rowedit-existing<{/if}> <{if $messages.menu.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="menulistchk" name="menulist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="menu_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>menu_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="menu_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>menu_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menu.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.menu.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text" >
                                            <{if (in_array('CODE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCODE}>

                        
                            <input class="input-code" type="text" name="<{$prefix}>menu_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menu.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$row->UUID}>"><{/if}>    	    <{$row->CODE|escape}>
    <{if isset($smarty.session.acl.menu.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CLASS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CLASS']) && ((isset($aclviewablecolumns['CLASS']) && $aclviewablecolumns['CLASS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CLASS']) || $aclviewablecolumns['CLASS']))) }>
                <td class="column column-class text" >
                                            <{if (in_array('CLASS', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCLASS}>

                        
                            <input class="input-class" type="text" name="<{$prefix}>menu_formdata_CLASS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->CLASS|escape}>
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
    	    <div class="menu-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.menu.0}>
        $('.menu-rowedit-message').html('<{$messages.menu.0}>').show();
    <{/if}>

    $('#menulist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#menulist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#menulist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#menulist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.menu-rowedit-save').click();
        }
    });

    bind_hotkey("#menulist > tbody tr.rowedit input[type=text]", 'f2', '.menu-rowedit-save');
    bind_hotkey("#menulist > tbody tr.rowedit input[type=text]", 'esc', '.menu-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('menu_formdata_NAME', 'menu_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


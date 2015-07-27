<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminlayoutsection-rowedit <{if $row->UUID}>adminlayoutsection-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminlayoutsection.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminlayoutsectionlistchk" name="adminlayoutsectionlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminlayoutsection_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminlayoutsection_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminlayoutsection_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>adminlayoutsection_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutsection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.adminlayoutsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module reftext" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataMODULE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminlayoutsection_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminmodule.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutsection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_MODULE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmodule.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->refuuid_MODULE}>"><{$row->reftext_MODULE|escape}></a>
        <{else}>
            <{$row->reftext_MODULE|escape}>        <{/if}>
    <{else}>
    	<{if $row->MODULE}><{$row->MODULE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminlayoutsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('SHOW_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SHOW_TITLE']) && ((isset($aclviewablecolumns['SHOW_TITLE']) && $aclviewablecolumns['SHOW_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SHOW_TITLE']) || $aclviewablecolumns['SHOW_TITLE']))) }>
                <td class="column column-show-title yesno" data-value="<{$row->SHOW_TITLE}>" data-column="SHOW_TITLE" data-module="adminlayoutsection">
                                            <{if (in_array('SHOW_TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataSHOW_TITLE}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-show-title" name="<{$prefix}>adminlayoutsection_formdata_SHOW_TITLE" >
                                    <option value="1" <{if $formdata.SHOW_TITLE}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.SHOW_TITLE}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-show-title" type="radio" name="<{$prefix}>adminlayoutsection_formdata_SHOW_TITLE" value="1" <{if $formdata.SHOW_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminlayoutsection_formdata_SHOW_TITLE" value="0" <{if !$formdata.SHOW_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutsection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/view/<{$row->UUID}>"><{/if}>	<{if $row->SHOW_TITLE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
<{if isset($smarty.session.acl.adminlayoutsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminlayoutsection_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="number number-format"><{if $row->ORDERING != 0}><{$row->ORDERING}><{/if}></span>
    
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
    	    <div class="adminlayoutsection-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminlayoutsection.0}>
        $('.adminlayoutsection-rowedit-message').html('<{$messages.adminlayoutsection.0}>').show();
    <{/if}>

    $('#adminlayoutsectionlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminlayoutsectionlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminlayoutsectionlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminlayoutsectionlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminlayoutsection-rowedit-save').click();
        }
    });

    bind_hotkey("#adminlayoutsectionlist > tbody tr.rowedit input[type=text]", 'f2', '.adminlayoutsection-rowedit-save');
    bind_hotkey("#adminlayoutsectionlist > tbody tr.rowedit input[type=text]", 'esc', '.adminlayoutsection-rowedit-cancel');
</script>



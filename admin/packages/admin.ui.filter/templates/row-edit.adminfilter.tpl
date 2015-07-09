<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminfilter-rowedit <{if $row->UUID}>adminfilter-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminfilter.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminfilterlistchk" name="adminfilterlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminfilter_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminfilter_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminfilter_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminfilter_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminfilter.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.adminfilter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminfilter_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminfilter.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_MODULE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmodule.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->refuuid_MODULE}>"><{$row->reftext_MODULE|escape}></a>
        <{else}>
            <{$row->reftext_MODULE|escape}>        <{/if}>
    <{else}>
    	<{if $row->MODULE}><{$row->MODULE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminfilter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('COLUMNS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['COLUMNS']) && ((isset($aclviewablecolumns['COLUMNS']) && $aclviewablecolumns['COLUMNS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COLUMNS']) || $aclviewablecolumns['COLUMNS']))) }>
                <td class="column column-columns text" >
                                            <{if (in_array('COLUMNS', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.COLUMNS) }>
                            <{assign var='tmp_value' value=$formdata.COLUMNS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-columns" type="text" name="<{$prefix}>adminfilter_formdata_COLUMNS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminfilter.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/view/<{$row->UUID}>"><{/if}>	<{$row->COLUMNS|escape}>
<{if isset($smarty.session.acl.adminfilter.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_DEFAULT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_DEFAULT']) && ((isset($aclviewablecolumns['IS_DEFAULT']) && $aclviewablecolumns['IS_DEFAULT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_DEFAULT']) || $aclviewablecolumns['IS_DEFAULT']))) }>
                <td class="column column-is-default yesno" data-value="<{$row->IS_DEFAULT}>" data-column="IS_DEFAULT" data-module="adminfilter">
                                            <{if (in_array('IS_DEFAULT', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_DEFAULT) }>
                            <{assign var='tmp_value' value=$formdata.IS_DEFAULT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-default" name="<{$prefix}>adminfilter_formdata_IS_DEFAULT" >
                                    <option value="1" <{if $formdata.IS_DEFAULT}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_DEFAULT}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-default" type="radio" name="<{$prefix}>adminfilter_formdata_IS_DEFAULT" value="1" <{if $formdata.IS_DEFAULT}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminfilter_formdata_IS_DEFAULT" value="0" <{if !$formdata.IS_DEFAULT}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_DEFAULT}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
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
    	    <div class="adminfilter-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminfilter.0}>
        $('.adminfilter-rowedit-message').html('<{$messages.adminfilter.0}>').show();
    <{/if}>

    $('#adminfilterlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminfilterlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminfilterlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminfilterlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminfilter-rowedit-save').click();
        }
    });

    bind_hotkey("#adminfilterlist > tbody tr.rowedit input[type=text]", 'f2', '.adminfilter-rowedit-save');
    bind_hotkey("#adminfilterlist > tbody tr.rowedit input[type=text]", 'esc', '.adminfilter-rowedit-cancel');
</script>



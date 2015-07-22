<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminlayoutfield-rowedit <{if $row->UUID}>adminlayoutfield-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminlayoutfield.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminlayoutfieldlistchk" name="adminlayoutfieldlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminlayoutfield_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminlayoutfield_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminlayoutfield_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataMODULE}>

                        
                            <input class="input-module" type="text" name="<{$prefix}>adminlayoutfield_formdata_MODULE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/view/<{$row->UUID}>"><{/if}>	<{$row->MODULE|escape}>
<{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_LAYOUT_SECTION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_LAYOUT_SECTION']) && ((isset($aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) && $aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) || $aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']))) }>
                <td class="column column-id-admin-layout-section reftext" >
                                            <{if (in_array('ID_ADMIN_LAYOUT_SECTION', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_LAYOUT_SECTION}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-layout-section" name="`$prefix`adminlayoutfield_formdata_ID_ADMIN_LAYOUT_SECTION" value=$formdata.ID_ADMIN_LAYOUT_SECTION datasource="ADMIN_LAYOUT_SECTION" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminlayoutsection.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/new" title="Create a New Admin Layout Section">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_LAYOUT_SECTION}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminlayoutsection.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/view/<{$row->refuuid_ID_ADMIN_LAYOUT_SECTION}>"><{$row->reftext_ID_ADMIN_LAYOUT_SECTION|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_LAYOUT_SECTION|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_LAYOUT_SECTION}><{$row->ID_ADMIN_LAYOUT_SECTION|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('COLUMN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['COLUMN']) && ((isset($aclviewablecolumns['COLUMN']) && $aclviewablecolumns['COLUMN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COLUMN']) || $aclviewablecolumns['COLUMN']))) }>
                <td class="column column-column text" >
                                            <{if (in_array('COLUMN', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCOLUMN}>

                        
                            <input class="input-column" type="text" name="<{$prefix}>adminlayoutfield_formdata_COLUMN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/view/<{$row->UUID}>"><{/if}>	<{$row->COLUMN|escape}>
<{if isset($smarty.session.acl.adminlayoutfield.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('POSITION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['POSITION']) && ((isset($aclviewablecolumns['POSITION']) && $aclviewablecolumns['POSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['POSITION']) || $aclviewablecolumns['POSITION']))) }>
                <td class="column column-position text" >
                                            <{if (in_array('POSITION', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataPOSITION}>

                        
                            <input class="input-position" type="text" name="<{$prefix}>adminlayoutfield_formdata_POSITION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->POSITION|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminlayoutfield_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="adminlayoutfield-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminlayoutfield.0}>
        $('.adminlayoutfield-rowedit-message').html('<{$messages.adminlayoutfield.0}>').show();
    <{/if}>

    $('#adminlayoutfieldlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminlayoutfieldlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminlayoutfieldlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminlayoutfieldlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminlayoutfield-rowedit-save').click();
        }
    });

    bind_hotkey("#adminlayoutfieldlist > tbody tr.rowedit input[type=text]", 'f2', '.adminlayoutfield-rowedit-save');
    bind_hotkey("#adminlayoutfieldlist > tbody tr.rowedit input[type=text]", 'esc', '.adminlayoutfield-rowedit-cancel');
</script>



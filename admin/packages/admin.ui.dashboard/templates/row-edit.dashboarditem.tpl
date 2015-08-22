<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="dashboarditem-rowedit <{if $row->UUID}>dashboarditem-rowedit-existing rowedit-existing<{/if}> <{if $messages.dashboarditem.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="dashboarditemlistchk" name="dashboarditemlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="dashboarditem_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>dashboarditem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="dashboarditem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>dashboarditem_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>"><{/if}>    	    <{$row->TITLE|escape}>
    <{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_DASHBOARD', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_DASHBOARD']) && ((isset($aclviewablecolumns['ID_DASHBOARD']) && $aclviewablecolumns['ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD']) || $aclviewablecolumns['ID_DASHBOARD']))) }>
                <td class="column column-id-dashboard reftext" >
                                            <{if (in_array('ID_DASHBOARD', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_DASHBOARD}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-dashboard" name="`$prefix`dashboarditem_formdata_ID_DASHBOARD" value=$formdata.ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.dashboard.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_DASHBOARD}>
        <{if $alreadyhaslink && isset($smarty.session.acl.dashboard.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->refuuid_ID_DASHBOARD}>"><{$row->reftext_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$row->reftext_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_DASHBOARD}><{$row->ID_DASHBOARD|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image" >
                                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>"><{/if}>    <{media src=$row->IMAGE thumbnail=1}>
<{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
                <td class="column column-path text" >
                                            <{if (in_array('PATH', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataPATH}>

                        
                            <input class="input-path" type="text" name="<{$prefix}>dashboarditem_formdata_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->PATH|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_DASHBOARD_ITEM_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_DASHBOARD_ITEM_TYPE']) && ((isset($aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) && $aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) || $aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']))) }>
                <td class="column column-id-dashboard-item-type reftext" >
                                            <{if (in_array('ID_DASHBOARD_ITEM_TYPE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_DASHBOARD_ITEM_TYPE}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-dashboard-item-type" name="`$prefix`dashboarditem_formdata_ID_DASHBOARD_ITEM_TYPE" value=$formdata.ID_DASHBOARD_ITEM_TYPE datasource="DASHBOARD_ITEM_TYPE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.dashboarditemtype.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/new" title="Create a New Dashboard Item Type">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_DASHBOARD_ITEM_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.dashboarditemtype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/view/<{$row->refuuid_ID_DASHBOARD_ITEM_TYPE}>"><{$row->reftext_ID_DASHBOARD_ITEM_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_DASHBOARD_ITEM_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_DASHBOARD_ITEM_TYPE}><{$row->ID_DASHBOARD_ITEM_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.dashboarditem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>dashboarditem_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="dashboarditem-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.dashboarditem.0}>
        $('.dashboarditem-rowedit-message').html('<{$messages.dashboarditem.0}>').show();
    <{/if}>

    $('#dashboarditemlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#dashboarditemlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#dashboarditemlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#dashboarditemlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.dashboarditem-rowedit-save').click();
        }
    });

    bind_hotkey("#dashboarditemlist > tbody tr.rowedit input[type=text]", 'f2', '.dashboarditem-rowedit-save');
    bind_hotkey("#dashboarditemlist > tbody tr.rowedit input[type=text]", 'esc', '.dashboarditem-rowedit-cancel');
</script>



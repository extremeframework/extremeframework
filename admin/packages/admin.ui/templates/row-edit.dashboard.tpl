<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="dashboard-rowedit <{if $row->UUID}>dashboard-rowedit-existing rowedit-existing<{/if}> <{if $messages.dashboard.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="dashboardlistchk" name="dashboardlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="dashboard_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>dashboard_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="dashboard_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>dashboard_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_MENU', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_MENU']) && ((isset($aclviewablecolumns['ID_ADMIN_MENU']) && $aclviewablecolumns['ID_ADMIN_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_MENU']) || $aclviewablecolumns['ID_ADMIN_MENU']))) }>
                <td class="column column-id-admin-menu reftext" >
                                            <{if (in_array('ID_ADMIN_MENU', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_MENU}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-menu" name="`$prefix`dashboard_formdata_ID_ADMIN_MENU" value=$formdata.ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminmenu.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new" title="Create a New Admin Menu">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_MENU}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmenu.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$row->refuuid_ID_ADMIN_MENU}>"><{$row->reftext_ID_ADMIN_MENU|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_MENU|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_MENU}><{$row->ID_ADMIN_MENU|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_DASHBOARD_LAYOUT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_DASHBOARD_LAYOUT']) && ((isset($aclviewablecolumns['ID_DASHBOARD_LAYOUT']) && $aclviewablecolumns['ID_DASHBOARD_LAYOUT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD_LAYOUT']) || $aclviewablecolumns['ID_DASHBOARD_LAYOUT']))) }>
                <td class="column column-id-dashboard-layout key" >
                                            <{if (in_array('ID_DASHBOARD_LAYOUT', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_DASHBOARD_LAYOUT}>

                        
                            <input class="input-id-dashboard-layout" type="text" name="<{$prefix}>dashboard_formdata_ID_DASHBOARD_LAYOUT" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->UUID}>"><{/if}>    	    <{$row->ID_DASHBOARD_LAYOUT|escape}>
    <{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DASHBOARD_FILE_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DASHBOARD_FILE_PATH']) && ((isset($aclviewablecolumns['DASHBOARD_FILE_PATH']) && $aclviewablecolumns['DASHBOARD_FILE_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DASHBOARD_FILE_PATH']) || $aclviewablecolumns['DASHBOARD_FILE_PATH']))) }>
                <td class="column column-dashboard-file-path text" >
                                            <{if (in_array('DASHBOARD_FILE_PATH', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataDASHBOARD_FILE_PATH}>

                        
                            <input class="input-dashboard-file-path" type="text" name="<{$prefix}>dashboard_formdata_DASHBOARD_FILE_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->DASHBOARD_FILE_PATH|escape}>
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
    	    <div class="dashboard-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.dashboard.0}>
        $('.dashboard-rowedit-message').html('<{$messages.dashboard.0}>').show();
    <{/if}>

    $('#dashboardlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#dashboardlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#dashboardlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#dashboardlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.dashboard-rowedit-save').click();
        }
    });

    bind_hotkey("#dashboardlist > tbody tr.rowedit input[type=text]", 'f2', '.dashboard-rowedit-save');
    bind_hotkey("#dashboardlist > tbody tr.rowedit input[type=text]", 'esc', '.dashboard-rowedit-cancel');
</script>



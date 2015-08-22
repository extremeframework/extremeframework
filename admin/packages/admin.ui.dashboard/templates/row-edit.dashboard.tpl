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
	        <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>dashboard_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->UUID}>"><{/if}>    	    <{$row->TITLE|escape}>
    <{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('SUBTITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['SUBTITLE']) && ((isset($aclviewablecolumns['SUBTITLE']) && $aclviewablecolumns['SUBTITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SUBTITLE']) || $aclviewablecolumns['SUBTITLE']))) }>
                <td class="column column-subtitle text" >
                                            <{if (in_array('SUBTITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataSUBTITLE}>

                        
                            <input class="input-subtitle" type="text" name="<{$prefix}>dashboard_formdata_SUBTITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->SUBTITLE|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_PACKAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) && $aclviewablecolumns['ID_ADMIN_PACKAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) || $aclviewablecolumns['ID_ADMIN_PACKAGE']))) }>
                <td class="column column-id-admin-package reftext" >
                                            <{if (in_array('ID_ADMIN_PACKAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_PACKAGE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-package" name="`$prefix`dashboard_formdata_ID_ADMIN_PACKAGE" value=$formdata.ID_ADMIN_PACKAGE datasource="ADMIN_PACKAGE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminpackage.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new" title="Create a New Admin Package">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.dashboard.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_PACKAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminpackage.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->refuuid_ID_ADMIN_PACKAGE}>"><{$row->reftext_ID_ADMIN_PACKAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_PACKAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_PACKAGE}><{$row->ID_ADMIN_PACKAGE|escape}><{/if}>
    <{/if}>
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-menu" name="`$prefix`dashboard_formdata_ID_ADMIN_MENU" value=$formdata.ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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



<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminpackage-rowedit <{if $row->UUID}>adminpackage-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminpackage.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminpackagelistchk" name="adminpackagelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminpackage_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminpackage_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminpackage_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>adminpackage_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text" >
                                            <{if (in_array('CODE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCODE}>

                        
                            <input class="input-code" type="text" name="<{$prefix}>adminpackage_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->UUID}>"><{/if}>    	    <{$row->CODE|escape}>
    <{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_PACKAGE_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_TYPE']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE_TYPE']) && $aclviewablecolumns['ID_ADMIN_PACKAGE_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE_TYPE']) || $aclviewablecolumns['ID_ADMIN_PACKAGE_TYPE']))) }>
                <td class="column column-id-admin-package-type reftext" >
                                            <{if (in_array('ID_ADMIN_PACKAGE_TYPE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_PACKAGE_TYPE}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-admin-package-type" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_TYPE" value=$formdata.ID_ADMIN_PACKAGE_TYPE datasource="ADMIN_PACKAGE_TYPE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminpackagetype.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagetype/new" title="Create a New Admin Package Type">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_PACKAGE_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminpackagetype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagetype/view/<{$row->refuuid_ID_ADMIN_PACKAGE_TYPE}>"><{$row->reftext_ID_ADMIN_PACKAGE_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_PACKAGE_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_PACKAGE_TYPE}><{$row->ID_ADMIN_PACKAGE_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_PACKAGE_CATEGORY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_CATEGORY']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) && $aclviewablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) || $aclviewablecolumns['ID_ADMIN_PACKAGE_CATEGORY']))) }>
                <td class="column column-id-admin-package-category reftext" >
                                            <{if (in_array('ID_ADMIN_PACKAGE_CATEGORY', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_PACKAGE_CATEGORY}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-admin-package-category" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_CATEGORY" value=$formdata.ID_ADMIN_PACKAGE_CATEGORY datasource="ADMIN_PACKAGE_CATEGORY" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminpackagecategory.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/new" title="Create a New Admin Package Category">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_PACKAGE_CATEGORY}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminpackagecategory.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/view/<{$row->refuuid_ID_ADMIN_PACKAGE_CATEGORY}>"><{$row->reftext_ID_ADMIN_PACKAGE_CATEGORY|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_PACKAGE_CATEGORY|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_PACKAGE_CATEGORY}><{$row->ID_ADMIN_PACKAGE_CATEGORY|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_PACKAGE_INDUSTRY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_INDUSTRY']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) && $aclviewablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) || $aclviewablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']))) }>
                <td class="column column-id-admin-package-industry reftext" >
                                            <{if (in_array('ID_ADMIN_PACKAGE_INDUSTRY', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_PACKAGE_INDUSTRY}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-package-industry" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_INDUSTRY" value=$formdata.ID_ADMIN_PACKAGE_INDUSTRY datasource="ADMIN_PACKAGE_INDUSTRY" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminpackageindustry.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackageindustry/new" title="Create a New Admin Package Industry">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_PACKAGE_INDUSTRY}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminpackageindustry.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackageindustry/view/<{$row->refuuid_ID_ADMIN_PACKAGE_INDUSTRY}>"><{$row->reftext_ID_ADMIN_PACKAGE_INDUSTRY|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_PACKAGE_INDUSTRY|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_PACKAGE_INDUSTRY}><{$row->ID_ADMIN_PACKAGE_INDUSTRY|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminpackage.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image" >
                                            <span>    <{media src=$row->IMAGE thumbnail=1}>
</span>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ENTRY_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENTRY_PATH']) && ((isset($aclviewablecolumns['ENTRY_PATH']) && $aclviewablecolumns['ENTRY_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENTRY_PATH']) || $aclviewablecolumns['ENTRY_PATH']))) }>
                <td class="column column-entry-path text" >
                                            <{if (in_array('ENTRY_PATH', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataENTRY_PATH}>

                        
                            <input class="input-entry-path" type="text" name="<{$prefix}>adminpackage_formdata_ENTRY_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->ENTRY_PATH|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('AUTHOR', $filtercolumns)) }>
            <{if !isset($excludedcolumns['AUTHOR']) && ((isset($aclviewablecolumns['AUTHOR']) && $aclviewablecolumns['AUTHOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AUTHOR']) || $aclviewablecolumns['AUTHOR']))) }>
                <td class="column column-author text" >
                                            <{if (in_array('AUTHOR', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataAUTHOR}>

                        
                            <input class="input-author" type="text" name="<{$prefix}>adminpackage_formdata_AUTHOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->AUTHOR|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VERSION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VERSION']) && ((isset($aclviewablecolumns['VERSION']) && $aclviewablecolumns['VERSION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VERSION']) || $aclviewablecolumns['VERSION']))) }>
                <td class="column column-version text" >
                                            <{if (in_array('VERSION', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVERSION}>

                        
                            <input class="input-version" type="text" name="<{$prefix}>adminpackage_formdata_VERSION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->VERSION|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PACKAGE_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PACKAGE_PATH']) && ((isset($aclviewablecolumns['PACKAGE_PATH']) && $aclviewablecolumns['PACKAGE_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PACKAGE_PATH']) || $aclviewablecolumns['PACKAGE_PATH']))) }>
                <td class="column column-package-path text" >
                                            <{if (in_array('PACKAGE_PATH', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataPACKAGE_PATH}>

                        
                            <input class="input-package-path" type="text" name="<{$prefix}>adminpackage_formdata_PACKAGE_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->PACKAGE_PATH|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('INSTALLATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['INSTALLATION_DATE']) && ((isset($aclviewablecolumns['INSTALLATION_DATE']) && $aclviewablecolumns['INSTALLATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INSTALLATION_DATE']) || $aclviewablecolumns['INSTALLATION_DATE']))) }>
                <td class="column column-installation-date date" >
                                            <{if (in_array('INSTALLATION_DATE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataINSTALLATION_DATE}>

                                                    <input class="input-installation-date field-date" type="text" id="<{$prefix}>adminpackage_formdata_INSTALLATION_DATE" name="<{$prefix}>adminpackage_formdata_INSTALLATION_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->INSTALLATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
                <td class="column column-latest-update date" >
                                            <{if (in_array('LATEST_UPDATE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataLATEST_UPDATE}>

                                                    <input class="input-latest-update field-date" type="text" id="<{$prefix}>adminpackage_formdata_LATEST_UPDATE" name="<{$prefix}>adminpackage_formdata_LATEST_UPDATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
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
    	    <div class="adminpackage-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminpackage.0}>
        $('.adminpackage-rowedit-message').html('<{$messages.adminpackage.0}>').show();
    <{/if}>

    $('#adminpackagelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminpackagelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminpackagelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminpackagelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminpackage-rowedit-save').click();
        }
    });

    bind_hotkey("#adminpackagelist > tbody tr.rowedit input[type=text]", 'f2', '.adminpackage-rowedit-save');
    bind_hotkey("#adminpackagelist > tbody tr.rowedit input[type=text]", 'esc', '.adminpackage-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('adminpackage_formdata_NAME', 'adminpackage_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


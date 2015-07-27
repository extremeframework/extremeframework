<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminmenuitem">

<{include file="top.tpl"}>

<script type="text/javascript">
function remove_attachment(element, attachment, spanid)
{
    element.value = element.value.replace(attachment, '');
    document.getElementById(spanid).style.visibility = 'hidden';
    document.getElementById(spanid).style.display = 'none';
}
</script>

<h1 class="heading">
    <span class="h"><{$formtitle}></span>
</h1>

<div class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-top hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#adminmenuitemform').attr('action', '<{$actionurl}>');$('#adminmenuitemform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>

    <!-- Details -->
    <div class="section" style="padding: 10px 0;">
        <div>
            <div class="edit-main edit_details">
                <{if $messages}>
                    <ul class="message">
                        <{foreach from=$messages key=field item=message}>
                            <li data-error-field="<{$field}>"><{$message}></li>
                        <{/foreach}>
                    </ul>
                <{/if}>

                <form name="adminmenuitemform" id="adminmenuitemform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$columns item=column }>
                                <{if $columnsettings.$column }>
                                    <tr class="form-row form-row-<{$columnsettings.$column->code}> <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t($columnsettings.$column->text)}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-<{$columnsettings.$column->code}>">
                                                <{include file="input-item.tpl"}>
                                            </div>
                                        </td>
                                    </tr>

                            
                                <{elseif $column == 'NAME' }>
                                    <tr class="form-row form-row-name <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Admin menu item name')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-name">
                                                                        <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>adminmenuitem_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_ADMIN_MENU' }>
                                    <tr class="form-row form-row-id-admin-menu <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Admin menu')}><{if in_array('ID_ADMIN_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-admin-menu">
                                                                        <{$tmp_value = $formdataID_ADMIN_MENU}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-menu" name="`$prefix`adminmenuitem_formdata_ID_ADMIN_MENU" value=$formdata.ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PARENT' }>
                                    <tr class="form-row form-row-parent <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Parent')}><{if in_array('PARENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-parent">
                                                                        <{$tmp_value = $formdataPARENT}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`adminmenuitem_formdata_PARENT" value=$formdata.PARENT datasource="ADMIN_MENU_ITEM" valuecol="ID" textcol="NAME" sortcol="" groupcol="ID_ADMIN_MENU" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'MODULE' }>
                                    <tr class="form-row form-row-module <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Module')}><{if in_array('MODULE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-module">
                                                                        <{$tmp_value = $formdataMODULE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminmenuitem_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PATH' }>
                                    <tr class="form-row form-row-path <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Path')}><{if in_array('PATH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-path">
                                                                        <{$tmp_value = $formdataPATH}>

                        
                            <input class="input-path" type="text" name="<{$prefix}>adminmenuitem_formdata_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'FONT_AWESOME_ICON' }>
                                    <tr class="form-row form-row-font-awesome-icon <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Font awesome icon')}><{if in_array('FONT_AWESOME_ICON', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-font-awesome-icon">
                                                                        <{$tmp_value = $formdataFONT_AWESOME_ICON}>

                        
                            <input class="input-font-awesome-icon" type="text" name="<{$prefix}>adminmenuitem_formdata_FONT_AWESOME_ICON" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ENABLE_LEFT' }>
                                    <tr class="form-row form-row-enable-left <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Enable left?')}><{if in_array('ENABLE_LEFT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-enable-left">
                                                                        <{$tmp_value = $formdataENABLE_LEFT}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-left" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" >
                                    <option value="1" <{if $formdata.ENABLE_LEFT}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_LEFT}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-left" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="1" <{if $formdata.ENABLE_LEFT}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="0" <{if !$formdata.ENABLE_LEFT}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ENABLE_TOP' }>
                                    <tr class="form-row form-row-enable-top <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Enable top?')}><{if in_array('ENABLE_TOP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-enable-top">
                                                                        <{$tmp_value = $formdataENABLE_TOP}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-top" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" >
                                    <option value="1" <{if $formdata.ENABLE_TOP}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_TOP}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-top" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="1" <{if $formdata.ENABLE_TOP}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="0" <{if !$formdata.ENABLE_TOP}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ENABLE_QUICK' }>
                                    <tr class="form-row form-row-enable-quick <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Enable quick?')}><{if in_array('ENABLE_QUICK', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-enable-quick">
                                                                        <{$tmp_value = $formdataENABLE_QUICK}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-quick" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" >
                                    <option value="1" <{if $formdata.ENABLE_QUICK}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_QUICK}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-quick" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="1" <{if $formdata.ENABLE_QUICK}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="0" <{if !$formdata.ENABLE_QUICK}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ENABLE_ALL' }>
                                    <tr class="form-row form-row-enable-all <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Enable all?')}><{if in_array('ENABLE_ALL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-enable-all">
                                                                        <{$tmp_value = $formdataENABLE_ALL}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-all" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" >
                                    <option value="1" <{if $formdata.ENABLE_ALL}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_ALL}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-all" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="1" <{if $formdata.ENABLE_ALL}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="0" <{if !$formdata.ENABLE_ALL}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ENABLE_SETTINGS' }>
                                    <tr class="form-row form-row-enable-settings <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Enable settings?')}><{if in_array('ENABLE_SETTINGS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-enable-settings">
                                                                        <{$tmp_value = $formdataENABLE_SETTINGS}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-settings" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" >
                                    <option value="1" <{if $formdata.ENABLE_SETTINGS}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_SETTINGS}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-settings" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="1" <{if $formdata.ENABLE_SETTINGS}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="0" <{if !$formdata.ENABLE_SETTINGS}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'OPEN_IN_NEW_WINDOW' }>
                                    <tr class="form-row form-row-open-in-new-window <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Open in new window')}><{if in_array('OPEN_IN_NEW_WINDOW', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-open-in-new-window">
                                                                        <{$tmp_value = $formdataOPEN_IN_NEW_WINDOW}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-open-in-new-window" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" >
                                    <option value="1" <{if $formdata.OPEN_IN_NEW_WINDOW}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.OPEN_IN_NEW_WINDOW}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-open-in-new-window" type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="1" <{if $formdata.OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="0" <{if !$formdata.OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'IS_STARRED' }>
                                    <tr class="form-row form-row-is-starred <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Starred?')}><{if in_array('IS_STARRED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-is-starred">
                                                                        <{$tmp_value = $formdataIS_STARRED}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-starred" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" >
                                    <option value="1" <{if $formdata.IS_STARRED}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_STARRED}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-starred" type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="1" <{if $formdata.IS_STARRED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="0" <{if !$formdata.IS_STARRED}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ORDERING' }>
                                    <tr class="form-row form-row-ordering <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Ordering')}><{if in_array('ORDERING', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-ordering">
                                                                        <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminmenuitem_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{/if}>
                            <{/foreach}>
                        </tbody>
                    </table>
                </form>
            </div>
    	</div>
        <div class="clearer"></div>
    </div>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-bottom hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#adminmenuitemform').attr('action', '<{$actionurl}>');$('#adminmenuitemform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmenuitemform', 'f2', '.button-save');
    	bind_hotkey('#adminmenuitemform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmenuitemform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
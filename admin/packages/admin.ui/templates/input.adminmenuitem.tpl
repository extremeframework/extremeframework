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

<h2 class="heading"><{$formtitle}></h2>

<{foreach from=$messages key=ignored item=message}>
    <li><{$message}></li>
<{/foreach}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminmenuitemform" id="adminmenuitemform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

<!-- Details -->
<div class="section">
    <div>
        <{foreach from=$columns item=column }>
                <{if $columnsettings.$column }>
                	<div class="form-row <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{$columnsettings.$column->text}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-<{$columnsettings.$column->code}>">
                		    <{include file="input-item.tpl"}>
                		</div>
                	</div>
            
                <{elseif $column == 'NAME' }>
                	<div class="form-row <{if in_array('NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ADMIN_MENU_ITEM_NAME')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminmenuitem_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ADMIN_MENU' }>
                	<div class="form-row <{if in_array('ID_ADMIN_MENU', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ADMIN_MENU')}><{if in_array('ID_ADMIN_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-menu">

                                                    <{if isset($formdata.ID_ADMIN_MENU) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_MENU}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-menu" name="`$prefix`adminmenuitem_formdata_ID_ADMIN_MENU" value=$formdata.ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'PARENT' }>
                	<div class="form-row <{if in_array('PARENT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PARENT')}><{if in_array('PARENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-parent">

                                                    <{if isset($formdata.PARENT) }>
                            <{assign var='tmp_value' value=$formdata.PARENT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`adminmenuitem_formdata_PARENT" value=$formdata.PARENT datasource="ADMIN_MENU_ITEM" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'MODULE' }>
                	<div class="form-row <{if in_array('MODULE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_MODULE')}><{if in_array('MODULE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-module">

                                                    <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminmenuitem_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'PATH' }>
                	<div class="form-row <{if in_array('PATH', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PATH')}><{if in_array('PATH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-path">

                                                    <{if isset($formdata.PATH) }>
                            <{assign var='tmp_value' value=$formdata.PATH}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-path" type="text" name="<{$prefix}>adminmenuitem_formdata_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'FONT_AWESOME_ICON' }>
                	<div class="form-row <{if in_array('FONT_AWESOME_ICON', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_FONT_AWESOME_ICON')}><{if in_array('FONT_AWESOME_ICON', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-font-awesome-icon">

                                                    <{if isset($formdata.FONT_AWESOME_ICON) }>
                            <{assign var='tmp_value' value=$formdata.FONT_AWESOME_ICON}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-font-awesome-icon" type="text" name="<{$prefix}>adminmenuitem_formdata_FONT_AWESOME_ICON" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ENABLE_LEFT' }>
                	<div class="form-row <{if in_array('ENABLE_LEFT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ENABLE_LEFT')}><{if in_array('ENABLE_LEFT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-enable-left">

                                                    <{if isset($formdata.ENABLE_LEFT) }>
                            <{assign var='tmp_value' value=$formdata.ENABLE_LEFT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-left" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" >
                                    <option value="1" <{if $formdata.ENABLE_LEFT}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_LEFT}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-left" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="1" <{if $formdata.ENABLE_LEFT}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="0" <{if !$formdata.ENABLE_LEFT}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ENABLE_TOP' }>
                	<div class="form-row <{if in_array('ENABLE_TOP', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ENABLE_TOP')}><{if in_array('ENABLE_TOP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-enable-top">

                                                    <{if isset($formdata.ENABLE_TOP) }>
                            <{assign var='tmp_value' value=$formdata.ENABLE_TOP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-top" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" >
                                    <option value="1" <{if $formdata.ENABLE_TOP}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_TOP}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-top" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="1" <{if $formdata.ENABLE_TOP}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="0" <{if !$formdata.ENABLE_TOP}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ENABLE_QUICK' }>
                	<div class="form-row <{if in_array('ENABLE_QUICK', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ENABLE_QUICK')}><{if in_array('ENABLE_QUICK', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-enable-quick">

                                                    <{if isset($formdata.ENABLE_QUICK) }>
                            <{assign var='tmp_value' value=$formdata.ENABLE_QUICK}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-quick" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" >
                                    <option value="1" <{if $formdata.ENABLE_QUICK}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_QUICK}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-quick" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="1" <{if $formdata.ENABLE_QUICK}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="0" <{if !$formdata.ENABLE_QUICK}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ENABLE_ALL' }>
                	<div class="form-row <{if in_array('ENABLE_ALL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ENABLE_ALL')}><{if in_array('ENABLE_ALL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-enable-all">

                                                    <{if isset($formdata.ENABLE_ALL) }>
                            <{assign var='tmp_value' value=$formdata.ENABLE_ALL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-all" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" >
                                    <option value="1" <{if $formdata.ENABLE_ALL}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_ALL}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-all" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="1" <{if $formdata.ENABLE_ALL}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="0" <{if !$formdata.ENABLE_ALL}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ENABLE_SETTINGS' }>
                	<div class="form-row <{if in_array('ENABLE_SETTINGS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ENABLE_SETTINGS')}><{if in_array('ENABLE_SETTINGS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-enable-settings">

                                                    <{if isset($formdata.ENABLE_SETTINGS) }>
                            <{assign var='tmp_value' value=$formdata.ENABLE_SETTINGS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-settings" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" >
                                    <option value="1" <{if $formdata.ENABLE_SETTINGS}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_SETTINGS}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-settings" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="1" <{if $formdata.ENABLE_SETTINGS}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="0" <{if !$formdata.ENABLE_SETTINGS}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'OPEN_IN_NEW_WINDOW' }>
                	<div class="form-row <{if in_array('OPEN_IN_NEW_WINDOW', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_OPEN_IN_NEW_WINDOW')}><{if in_array('OPEN_IN_NEW_WINDOW', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-open-in-new-window">

                                                    <{if isset($formdata.OPEN_IN_NEW_WINDOW) }>
                            <{assign var='tmp_value' value=$formdata.OPEN_IN_NEW_WINDOW}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-open-in-new-window" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" >
                                    <option value="1" <{if $formdata.OPEN_IN_NEW_WINDOW}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.OPEN_IN_NEW_WINDOW}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-open-in-new-window" type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="1" <{if $formdata.OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="0" <{if !$formdata.OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_STARRED' }>
                	<div class="form-row <{if in_array('IS_STARRED', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_STARRED')}><{if in_array('IS_STARRED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-starred">

                                                    <{if isset($formdata.IS_STARRED) }>
                            <{assign var='tmp_value' value=$formdata.IS_STARRED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-starred" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" >
                                    <option value="1" <{if $formdata.IS_STARRED}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_STARRED}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-starred" type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="1" <{if $formdata.IS_STARRED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="0" <{if !$formdata.IS_STARRED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ORDERING' }>
                	<div class="form-row <{if in_array('ORDERING', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ORDERING')}><{if in_array('ORDERING', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-ordering">

                                                    <{if isset($formdata.ORDERING) }>
                            <{assign var='tmp_value' value=$formdata.ORDERING}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminmenuitem_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminmenuitemform').attr('action', '<{$actionurl}>');$('#adminmenuitemform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


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
</script>

<{include file="footer.tpl"}>
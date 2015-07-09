<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminmenu">

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

<form name="adminmenuform" id="adminmenuform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{_t('L_ADMIN_MENU_NAME')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminmenu_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminmenu_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_ENABLED' }>
                	<div class="form-row <{if in_array('IS_ENABLED', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_ENABLED')}><{if in_array('IS_ENABLED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-enabled">

                                                    <{if isset($formdata.IS_ENABLED) }>
                            <{assign var='tmp_value' value=$formdata.IS_ENABLED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-enabled" name="<{$prefix}>adminmenu_formdata_IS_ENABLED" >
                                    <option value="1" <{if $formdata.IS_ENABLED}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_ENABLED}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>adminmenu_formdata_IS_ENABLED" value="1" <{if $formdata.IS_ENABLED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminmenu_formdata_IS_ENABLED" value="0" <{if !$formdata.IS_ENABLED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminmenuform').attr('action', '<{$actionurl}>');$('#adminmenuform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/cancel/?back=0"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmenuform', 'f2', '.button-save');
    	bind_hotkey('#adminmenuform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmenuform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-screenfield">

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

<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=field item=message}>
            <li data-error-field="<{$field}>"><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="screenfieldform" id="screenfieldform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

<!-- Details -->
<div class="section" style="padding: 10px 0;">
    <div>
        <{foreach from=$columns item=column }>
                <{if $columnsettings.$column }>
                	<div class="form-row <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{$columnsettings.$column->text}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-<{$columnsettings.$column->code}>">
                		    <{include file="input-item.tpl"}>
                		</div>
                	</div>
            
                <{elseif $column == 'ID_SCREEN' }>
                	<div class="form-row <{if in_array('ID_SCREEN', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_SCREEN')}><{if in_array('ID_SCREEN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-screen">

                                                    <{if isset($formdata.ID_SCREEN) }>
                            <{assign var='tmp_value' value=$formdata.ID_SCREEN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-screen" name="`$prefix`screenfield_formdata_ID_SCREEN" value=$formdata.ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'TITLE' }>
                	<div class="form-row <{if in_array('TITLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TITLE')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-title">

                                                    <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-title" type="text" name="<{$prefix}>screenfield_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CODE' }>
                	<div class="form-row <{if in_array('CODE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CODE')}><{if in_array('CODE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-code">

                                                    <{if isset($formdata.CODE) }>
                            <{assign var='tmp_value' value=$formdata.CODE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-code" type="text" name="<{$prefix}>screenfield_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_VALUE_TYPE' }>
                	<div class="form-row <{if in_array('ID_VALUE_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_VALUE_TYPE')}><{if in_array('ID_VALUE_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-value-type">

                                                    <{if isset($formdata.ID_VALUE_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_VALUE_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-value-type" name="`$prefix`screenfield_formdata_ID_VALUE_TYPE" value=$formdata.ID_VALUE_TYPE datasource="VALUE_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'DATASOURCE' }>
                	<div class="form-row <{if in_array('DATASOURCE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_DATASOURCE')}><{if in_array('DATASOURCE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-datasource">

                                                    <{if isset($formdata.DATASOURCE) }>
                            <{assign var='tmp_value' value=$formdata.DATASOURCE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-datasource" type="text" name="<{$prefix}>screenfield_formdata_DATASOURCE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CONDITION' }>
                	<div class="form-row <{if in_array('CONDITION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CONDITION')}><{if in_array('CONDITION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-condition">

                                                    <{if isset($formdata.CONDITION) }>
                            <{assign var='tmp_value' value=$formdata.CONDITION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-condition" type="text" name="<{$prefix}>screenfield_formdata_CONDITION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'VALUECOL' }>
                	<div class="form-row <{if in_array('VALUECOL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_VALUECOL')}><{if in_array('VALUECOL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-valuecol">

                                                    <{if isset($formdata.VALUECOL) }>
                            <{assign var='tmp_value' value=$formdata.VALUECOL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-valuecol" type="text" name="<{$prefix}>screenfield_formdata_VALUECOL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TEXTCOL' }>
                	<div class="form-row <{if in_array('TEXTCOL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TEXTCOL')}><{if in_array('TEXTCOL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-textcol">

                                                    <{if isset($formdata.TEXTCOL) }>
                            <{assign var='tmp_value' value=$formdata.TEXTCOL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-textcol" type="text" name="<{$prefix}>screenfield_formdata_TEXTCOL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_MANDATORY' }>
                	<div class="form-row <{if in_array('IS_MANDATORY', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_MANDATORY')}><{if in_array('IS_MANDATORY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-mandatory">

                                                    <{if isset($formdata.IS_MANDATORY) }>
                            <{assign var='tmp_value' value=$formdata.IS_MANDATORY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-mandatory" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" >
                                    <option value="1" <{if $formdata.IS_MANDATORY}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_MANDATORY}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-mandatory" type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="1" <{if $formdata.IS_MANDATORY}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="0" <{if !$formdata.IS_MANDATORY}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>screenfield_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#screenfieldform').attr('action', '<{$actionurl}>');$('#screenfieldform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screenfield/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#screenfieldform', 'f2', '.button-save');
    	bind_hotkey('#screenfieldform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#screenfieldform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
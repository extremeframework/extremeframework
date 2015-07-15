<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-workflowstage">

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

<form name="workflowstageform" id="workflowstageform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'ID_WORKFLOW' }>
                	<div class="form-row <{if in_array('ID_WORKFLOW', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_WORKFLOW')}><{if in_array('ID_WORKFLOW', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-workflow">

                                                    <{if isset($formdata.ID_WORKFLOW) }>
                            <{assign var='tmp_value' value=$formdata.ID_WORKFLOW}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow" name="`$prefix`workflowstage_formdata_ID_WORKFLOW" value=$formdata.ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'NAME' }>
                	<div class="form-row <{if in_array('NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_WORKFLOW_STAGE_NAME')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>workflowstage_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-code" type="text" name="<{$prefix}>workflowstage_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_DEFAULT' }>
                	<div class="form-row <{if in_array('IS_DEFAULT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_DEFAULT')}><{if in_array('IS_DEFAULT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-default">

                                                    <{if isset($formdata.IS_DEFAULT) }>
                            <{assign var='tmp_value' value=$formdata.IS_DEFAULT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-default" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" >
                                    <option value="1" <{if $formdata.IS_DEFAULT}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_DEFAULT}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-default" type="radio" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" value="1" <{if $formdata.IS_DEFAULT}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" value="0" <{if !$formdata.IS_DEFAULT}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_BINDING_OBJECT_EDITABLE' }>
                	<div class="form-row <{if in_array('IS_BINDING_OBJECT_EDITABLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_BINDING_OBJECT_EDITABLE')}><{if in_array('IS_BINDING_OBJECT_EDITABLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-binding-object-editable">

                                                    <{if isset($formdata.IS_BINDING_OBJECT_EDITABLE) }>
                            <{assign var='tmp_value' value=$formdata.IS_BINDING_OBJECT_EDITABLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-binding-object-editable" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" >
                                    <option value="1" <{if $formdata.IS_BINDING_OBJECT_EDITABLE}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_BINDING_OBJECT_EDITABLE}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-binding-object-editable" type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="1" <{if $formdata.IS_BINDING_OBJECT_EDITABLE}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="0" <{if !$formdata.IS_BINDING_OBJECT_EDITABLE}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_BINDING_OBJECT_DELETABLE' }>
                	<div class="form-row <{if in_array('IS_BINDING_OBJECT_DELETABLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_BINDING_OBJECT_DELETABLE')}><{if in_array('IS_BINDING_OBJECT_DELETABLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-binding-object-deletable">

                                                    <{if isset($formdata.IS_BINDING_OBJECT_DELETABLE) }>
                            <{assign var='tmp_value' value=$formdata.IS_BINDING_OBJECT_DELETABLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-binding-object-deletable" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" >
                                    <option value="1" <{if $formdata.IS_BINDING_OBJECT_DELETABLE}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_BINDING_OBJECT_DELETABLE}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-binding-object-deletable" type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="1" <{if $formdata.IS_BINDING_OBJECT_DELETABLE}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="0" <{if !$formdata.IS_BINDING_OBJECT_DELETABLE}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#workflowstageform').attr('action', '<{$actionurl}>');$('#workflowstageform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#workflowstageform', 'f2', '.button-save');
    	bind_hotkey('#workflowstageform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#workflowstageform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
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

<{foreach from=$messages key=ignored item=message}>
    <li><{$message}></li>
<{/foreach}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="workflowstageform" id="workflowstageform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'ID_WORKFLOW' }>
                	<div class="form-row <{if in_array('ID_WORKFLOW', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_WORKFLOW"}><{if in_array('ID_WORKFLOW', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-workflow">

                                                    <{if isset($formdata.ID_WORKFLOW) }>
                            <{assign var='tmp_value' value=$formdata.ID_WORKFLOW}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  249.2471    9967528   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  252.8771   10121368   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  252.8871   10174904   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  252.8871   10305032   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  249.2471    9967528   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  252.8771   10121368   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  252.8871   10174904   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  252.8871   10305032   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  252.8971   10305320   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow" name="`$prefix`workflowstage_formdata_ID_WORKFLOW" value=$formdata.ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'NAME' }>
                	<div class="form-row <{if in_array('NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_WORKFLOW_STAGE_NAME"}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
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
                		<label><{label key="L_CODE"}><{if in_array('CODE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
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
                		<label><{label key="L_IS_DEFAULT"}><{if in_array('IS_DEFAULT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-default">

                                                    <{if isset($formdata.IS_DEFAULT) }>
                            <{assign var='tmp_value' value=$formdata.IS_DEFAULT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-default" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" >
                                    <option value="1" <{if $formdata.IS_DEFAULT}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_DEFAULT}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-default" type="radio" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" value="1" <{if $formdata.IS_DEFAULT}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" value="0" <{if !$formdata.IS_DEFAULT}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_BINDING_OBJECT_EDITABLE' }>
                	<div class="form-row <{if in_array('IS_BINDING_OBJECT_EDITABLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_IS_BINDING_OBJECT_EDITABLE"}><{if in_array('IS_BINDING_OBJECT_EDITABLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-binding-object-editable">

                                                    <{if isset($formdata.IS_BINDING_OBJECT_EDITABLE) }>
                            <{assign var='tmp_value' value=$formdata.IS_BINDING_OBJECT_EDITABLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-binding-object-editable" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" >
                                    <option value="1" <{if $formdata.IS_BINDING_OBJECT_EDITABLE}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_BINDING_OBJECT_EDITABLE}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-binding-object-editable" type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="1" <{if $formdata.IS_BINDING_OBJECT_EDITABLE}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="0" <{if !$formdata.IS_BINDING_OBJECT_EDITABLE}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_BINDING_OBJECT_DELETABLE' }>
                	<div class="form-row <{if in_array('IS_BINDING_OBJECT_DELETABLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_IS_BINDING_OBJECT_DELETABLE"}><{if in_array('IS_BINDING_OBJECT_DELETABLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-binding-object-deletable">

                                                    <{if isset($formdata.IS_BINDING_OBJECT_DELETABLE) }>
                            <{assign var='tmp_value' value=$formdata.IS_BINDING_OBJECT_DELETABLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-binding-object-deletable" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" >
                                    <option value="1" <{if $formdata.IS_BINDING_OBJECT_DELETABLE}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_BINDING_OBJECT_DELETABLE}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-binding-object-deletable" type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="1" <{if $formdata.IS_BINDING_OBJECT_DELETABLE}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="0" <{if !$formdata.IS_BINDING_OBJECT_DELETABLE}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
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
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
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
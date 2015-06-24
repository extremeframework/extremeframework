<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminview">

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

<form name="adminviewform" id="adminviewform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'TITLE' }>
                	<div class="form-row <{if in_array('TITLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_TITLE"}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-title">

                                                    <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-title" type="text" name="<{$prefix}>adminview_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-code" type="text" name="<{$prefix}>adminview_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'MODULE' }>
                	<div class="form-row <{if in_array('MODULE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_MODULE"}><{if in_array('MODULE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-module">

                                                    <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  163.3975    9621448   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  167.0366    9753184   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  167.0566    9811328   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  167.0666    9941432   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  163.3975    9621448   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  167.0366    9753184   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  167.0566    9811328   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  167.0666    9941432   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  167.0766    9941720   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminview_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'SCREEN' }>
                	<div class="form-row <{if in_array('SCREEN', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_SCREEN"}><{if in_array('SCREEN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-screen">

                                                    <{if isset($formdata.SCREEN) }>
                            <{assign var='tmp_value' value=$formdata.SCREEN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-screen" type="text" name="<{$prefix}>adminview_formdata_SCREEN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CONDITION_FIELD' }>
                	<div class="form-row <{if in_array('CONDITION_FIELD', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_CONDITION_FIELD"}><{if in_array('CONDITION_FIELD', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-condition-field">

                                                    <{if isset($formdata.CONDITION_FIELD) }>
                            <{assign var='tmp_value' value=$formdata.CONDITION_FIELD}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-condition-field" type="text" name="<{$prefix}>adminview_formdata_CONDITION_FIELD" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CONDITION_VALUE' }>
                	<div class="form-row <{if in_array('CONDITION_VALUE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_CONDITION_VALUE"}><{if in_array('CONDITION_VALUE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-condition-value">

                                                    <{if isset($formdata.CONDITION_VALUE) }>
                            <{assign var='tmp_value' value=$formdata.CONDITION_VALUE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-condition-value" type="text" name="<{$prefix}>adminview_formdata_CONDITION_VALUE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TEMPLATE' }>
                	<div class="form-row <{if in_array('TEMPLATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_TEMPLATE"}><{if in_array('TEMPLATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-template">

                                                    <{if isset($formdata.TEMPLATE) }>
                            <{assign var='tmp_value' value=$formdata.TEMPLATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-template" type="text" name="<{$prefix}>adminview_formdata_TEMPLATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_PRINT_VIEW' }>
                	<div class="form-row <{if in_array('IS_PRINT_VIEW', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_IS_PRINT_VIEW"}><{if in_array('IS_PRINT_VIEW', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-print-view">

                                                    <{if isset($formdata.IS_PRINT_VIEW) }>
                            <{assign var='tmp_value' value=$formdata.IS_PRINT_VIEW}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-print-view" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" >
                                    <option value="1" <{if $formdata.IS_PRINT_VIEW}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_PRINT_VIEW}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-print-view" type="radio" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" value="1" <{if $formdata.IS_PRINT_VIEW}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" value="0" <{if !$formdata.IS_PRINT_VIEW}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ORDERING' }>
                	<div class="form-row <{if in_array('ORDERING', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_ORDERING"}><{if in_array('ORDERING', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-ordering">

                                                    <{if isset($formdata.ORDERING) }>
                            <{assign var='tmp_value' value=$formdata.ORDERING}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminview_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminviewform').attr('action', '<{$actionurl}>');$('#adminviewform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminviewform', 'f2', '.button-save');
    	bind_hotkey('#adminviewform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminviewform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
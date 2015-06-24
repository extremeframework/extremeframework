<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-parameter">

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

<form name="parameterform" id="parameterform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{label key="L_PARAMETER_NAME"}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>parameter_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-code" type="text" name="<{$prefix}>parameter_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_PARAMETER_GROUP' }>
                	<div class="form-row <{if in_array('ID_PARAMETER_GROUP', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_PARAMETER_GROUP"}><{if in_array('ID_PARAMETER_GROUP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-parameter-group">

                                                    <{if isset($formdata.ID_PARAMETER_GROUP) }>
                            <{assign var='tmp_value' value=$formdata.ID_PARAMETER_GROUP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  184.5381    9727528   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  188.1202    9856424   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  188.1262    9912488   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  188.1312   10042616   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  184.5381    9727528   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  188.1202    9856424   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  188.1262    9912488   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  188.1312   10042616   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  188.1362   10042904   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-parameter-group" name="`$prefix`parameter_formdata_ID_PARAMETER_GROUP" value=$formdata.ID_PARAMETER_GROUP datasource="PARAMETER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_PARAMETER_TYPE' }>
                	<div class="form-row <{if in_array('ID_PARAMETER_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_PARAMETER_TYPE"}><{if in_array('ID_PARAMETER_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-parameter-type">

                                                    <{if isset($formdata.ID_PARAMETER_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_PARAMETER_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  184.5381    9727528   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  188.1202    9856424   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  188.1262    9912488   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  188.1422   10042832   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  184.5381    9727528   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  188.1202    9856424   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  188.1262    9912488   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  188.1422   10042832   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  188.1472   10042904   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-parameter-type" name="`$prefix`parameter_formdata_ID_PARAMETER_TYPE" value=$formdata.ID_PARAMETER_TYPE datasource="PARAMETER_TYPE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'VALUE' }>
                	<div class="form-row <{if in_array('VALUE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_VALUE"}><{if in_array('VALUE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-value">

                                                    <{if isset($formdata.VALUE) }>
                            <{assign var='tmp_value' value=$formdata.VALUE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-value" type="text" name="<{$prefix}>parameter_formdata_VALUE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'DESCRIPTION' }>
                	<div class="form-row <{if in_array('DESCRIPTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_DESCRIPTION"}><{if in_array('DESCRIPTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-description">

                                                    <{if isset($formdata.DESCRIPTION) }>
                            <{assign var='tmp_value' value=$formdata.DESCRIPTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-description" id="<{$prefix}>parameter_formdata_DESCRIPTION" name="<{$prefix}>parameter_formdata_DESCRIPTION" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>parameter_formdata_DESCRIPTION')</script>                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#parameterform').attr('action', '<{$actionurl}>');$('#parameterform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/parameter/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#parameterform', 'f2', '.button-save');
    	bind_hotkey('#parameterform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#parameterform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
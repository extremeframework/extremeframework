<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-workflowlog">

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

<form name="workflowlogform" id="workflowlogform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
  248.9771    9950688   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  249.1871   10083016   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  249.1971   10144752   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  249.1971   10274864   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  248.9771    9950688   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  249.1871   10083016   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  249.1971   10144752   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  249.1971   10274864   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  249.1971   10275152   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow" name="`$prefix`workflowlog_formdata_ID_WORKFLOW" value=$formdata.ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_WORKFLOW_TRANSITION' }>
                	<div class="form-row <{if in_array('ID_WORKFLOW_TRANSITION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_WORKFLOW_TRANSITION"}><{if in_array('ID_WORKFLOW_TRANSITION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-workflow-transition">

                                                    <{if isset($formdata.ID_WORKFLOW_TRANSITION) }>
                            <{assign var='tmp_value' value=$formdata.ID_WORKFLOW_TRANSITION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  248.9771    9950688   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  249.1871   10083016   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  249.1971   10144752   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  249.2071   10275088   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  248.9771    9950688   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  249.1871   10083016   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  249.1971   10144752   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  249.2071   10275088   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  249.2071   10275160   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow-transition" name="`$prefix`workflowlog_formdata_ID_WORKFLOW_TRANSITION" value=$formdata.ID_WORKFLOW_TRANSITION datasource="WORKFLOW_TRANSITION" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
  248.9771    9950688   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  249.1871   10083016   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  249.1971   10144752   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  249.2171   10275080   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  248.9771    9950688   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  249.1871   10083016   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  249.1971   10144752   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  249.2171   10275080   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  249.2171   10275152   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`workflowlog_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'OBJECT_ID' }>
                	<div class="form-row <{if in_array('OBJECT_ID', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_OBJECT"}><{if in_array('OBJECT_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-object-id">

                                                    <{if isset($formdata.OBJECT_ID) }>
                            <{assign var='tmp_value' value=$formdata.OBJECT_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-object-id" type="text" name="<{$prefix}>workflowlog_formdata_OBJECT_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'DATE' }>
                	<div class="form-row <{if in_array('DATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_DATE"}><{if in_array('DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-date">

                                                    <{if isset($formdata.DATE) }>
                            <{assign var='tmp_value' value=$formdata.DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-date field-date" type="text" id="<{$prefix}>workflowlog_formdata_DATE" name="<{$prefix}>workflowlog_formdata_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_USER' }>
                	<div class="form-row <{if in_array('ID_USER', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_USER"}><{if in_array('ID_USER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-user">

                                                    <{if isset($formdata.ID_USER) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  248.9771    9950688   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  249.1871   10083016   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  249.1971   10144752   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  249.2271   10275080   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  248.9771    9950688   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  249.1871   10083016   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  249.1971   10144752   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  249.2271   10275080   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  249.2271   10275152   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`workflowlog_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'DETAILS' }>
                	<div class="form-row <{if in_array('DETAILS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_DETAILS"}><{if in_array('DETAILS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-details">

                                                    <{if isset($formdata.DETAILS) }>
                            <{assign var='tmp_value' value=$formdata.DETAILS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-details" type="text" name="<{$prefix}>workflowlog_formdata_DETAILS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#workflowlogform').attr('action', '<{$actionurl}>');$('#workflowlogform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#workflowlogform', 'f2', '.button-save');
    	bind_hotkey('#workflowlogform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#workflowlogform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
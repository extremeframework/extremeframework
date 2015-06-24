<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminsequence">

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

<form name="adminsequenceform" id="adminsequenceform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
  159.8275    9609048   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  163.3675    9736272   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  163.3775    9786624   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  163.3775    9916728   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  159.8275    9609048   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  163.3675    9736272   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  163.3775    9786624   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  163.3775    9916728   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  163.3775    9917016   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminsequence_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'SEQUENCE_FORMAT' }>
                	<div class="form-row <{if in_array('SEQUENCE_FORMAT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_SEQUENCE_FORMAT"}><{if in_array('SEQUENCE_FORMAT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-sequence-format">

                                                    <{if isset($formdata.SEQUENCE_FORMAT) }>
                            <{assign var='tmp_value' value=$formdata.SEQUENCE_FORMAT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-sequence-format" type="text" name="<{$prefix}>adminsequence_formdata_SEQUENCE_FORMAT" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CURRENT_VALUE' }>
                	<div class="form-row <{if in_array('CURRENT_VALUE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_CURRENT_VALUE"}><{if in_array('CURRENT_VALUE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-current-value">

                                                    <{if isset($formdata.CURRENT_VALUE) }>
                            <{assign var='tmp_value' value=$formdata.CURRENT_VALUE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-current-value" type="text" name="<{$prefix}>adminsequence_formdata_CURRENT_VALUE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'SEQUENCE_STEP' }>
                	<div class="form-row <{if in_array('SEQUENCE_STEP', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_SEQUENCE_STEP"}><{if in_array('SEQUENCE_STEP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-sequence-step">

                                                    <{if isset($formdata.SEQUENCE_STEP) }>
                            <{assign var='tmp_value' value=$formdata.SEQUENCE_STEP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-sequence-step number-format" type="text" name="<{$prefix}>adminsequence_formdata_SEQUENCE_STEP" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminsequenceform').attr('action', '<{$actionurl}>');$('#adminsequenceform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminsequenceform', 'f2', '.button-save');
    	bind_hotkey('#adminsequenceform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminsequenceform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
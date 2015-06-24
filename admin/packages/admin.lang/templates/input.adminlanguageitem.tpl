<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminlanguageitem">

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

<form name="adminlanguageitemform" id="adminlanguageitemform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'ID_ADMIN_LANGUAGE' }>
                	<div class="form-row <{if in_array('ID_ADMIN_LANGUAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_ADMIN_LANGUAGE"}><{if in_array('ID_ADMIN_LANGUAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-language">

                                                    <{if isset($formdata.ID_ADMIN_LANGUAGE) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_LANGUAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  144.6764    9508576   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  144.8764    9633280   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  144.8764    9684672   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  144.8864    9814784   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  144.6764    9508576   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  144.8764    9633280   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  144.8764    9684672   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  144.8864    9814784   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  144.8864    9815072   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-language" name="`$prefix`adminlanguageitem_formdata_ID_ADMIN_LANGUAGE" value=$formdata.ID_ADMIN_LANGUAGE datasource="ADMIN_LANGUAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ADMIN_LABEL' }>
                	<div class="form-row <{if in_array('ID_ADMIN_LABEL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_ADMIN_LABEL"}><{if in_array('ID_ADMIN_LABEL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-label">

                                                    <{if isset($formdata.ID_ADMIN_LABEL) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_LABEL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  144.6764    9508576   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  144.8764    9633280   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  144.8764    9684672   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  144.8964    9814992   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  144.6764    9508576   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  144.8764    9633280   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  144.8764    9684672   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  144.8964    9814992   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  144.8964    9815064   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-label" name="`$prefix`adminlanguageitem_formdata_ID_ADMIN_LABEL" value=$formdata.ID_ADMIN_LABEL datasource="ADMIN_LABEL" valuecol="ID" textcol="LABEL" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'TRANSLATION' }>
                	<div class="form-row <{if in_array('TRANSLATION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_TRANSLATION"}><{if in_array('TRANSLATION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-translation">

                                                    <{if isset($formdata.TRANSLATION) }>
                            <{assign var='tmp_value' value=$formdata.TRANSLATION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-translation" id="<{$prefix}>adminlanguageitem_formdata_TRANSLATION" name="<{$prefix}>adminlanguageitem_formdata_TRANSLATION" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>adminlanguageitem_formdata_TRANSLATION')</script>                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminlanguageitemform').attr('action', '<{$actionurl}>');$('#adminlanguageitemform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminlanguageitemform', 'f2', '.button-save');
    	bind_hotkey('#adminlanguageitemform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminlanguageitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
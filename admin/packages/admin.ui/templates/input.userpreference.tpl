<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-userpreference">

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

<form name="userpreferenceform" id="userpreferenceform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
  237.8510    9889456   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  238.0610   10018552   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  238.0610   10071056   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  238.0710   10201232   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  237.8510    9889456   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  238.0610   10018552   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  238.0610   10071056   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  238.0710   10201232   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  238.0710   10201520   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`userpreference_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_DASHBOARD' }>
                	<div class="form-row <{if in_array('ID_DASHBOARD', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_DASHBOARD"}><{if in_array('ID_DASHBOARD', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-dashboard">

                                                    <{if isset($formdata.ID_DASHBOARD) }>
                            <{assign var='tmp_value' value=$formdata.ID_DASHBOARD}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  237.8510    9889456   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  238.0610   10018552   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  238.0610   10071056   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  238.0810   10201424   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  237.8510    9889456   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  238.0610   10018552   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  238.0610   10071056   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  238.0810   10201424   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  238.0810   10201496   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-dashboard" name="`$prefix`userpreference_formdata_ID_DASHBOARD" value=$formdata.ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_WALLPAPER' }>
                	<div class="form-row <{if in_array('ID_WALLPAPER', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_WALLPAPER"}><{if in_array('ID_WALLPAPER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-wallpaper">

                                                    <{if isset($formdata.ID_WALLPAPER) }>
                            <{assign var='tmp_value' value=$formdata.ID_WALLPAPER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-id-wallpaper" type="text" name="<{$prefix}>userpreference_formdata_ID_WALLPAPER" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ADMIN_STYLE' }>
                	<div class="form-row <{if in_array('ID_ADMIN_STYLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_ADMIN_STYLE"}><{if in_array('ID_ADMIN_STYLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-style">

                                                    <{if isset($formdata.ID_ADMIN_STYLE) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_STYLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-id-admin-style" type="text" name="<{$prefix}>userpreference_formdata_ID_ADMIN_STYLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#userpreferenceform').attr('action', '<{$actionurl}>');$('#userpreferenceform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/userpreference/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#userpreferenceform', 'f2', '.button-save');
    	bind_hotkey('#userpreferenceform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#userpreferenceform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
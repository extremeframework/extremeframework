<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-dashboard">

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

<form name="dashboardform" id="dashboardform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{label key="L_DASHBOARD_NAME"}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>dashboard_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ADMIN_MENU' }>
                	<div class="form-row <{if in_array('ID_ADMIN_MENU', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_ADMIN_MENU"}><{if in_array('ID_ADMIN_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-menu">

                                                    <{if isset($formdata.ID_ADMIN_MENU) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_MENU}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  167.4256    9653400   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  167.6376    9782168   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  167.6376    9832488   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  167.6376    9962592   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  167.4256    9653400   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  167.6376    9782168   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  167.6376    9832488   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  167.6376    9962592   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  167.6476    9962880   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-menu" name="`$prefix`dashboard_formdata_ID_ADMIN_MENU" value=$formdata.ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_DASHBOARD_LAYOUT' }>
                	<div class="form-row <{if in_array('ID_DASHBOARD_LAYOUT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_DASHBOARD_LAYOUT"}><{if in_array('ID_DASHBOARD_LAYOUT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-dashboard-layout">

                                                    <{if isset($formdata.ID_DASHBOARD_LAYOUT) }>
                            <{assign var='tmp_value' value=$formdata.ID_DASHBOARD_LAYOUT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-id-dashboard-layout" type="text" name="<{$prefix}>dashboard_formdata_ID_DASHBOARD_LAYOUT" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'DASHBOARD_FILE_PATH' }>
                	<div class="form-row <{if in_array('DASHBOARD_FILE_PATH', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_DASHBOARD_FILE_PATH"}><{if in_array('DASHBOARD_FILE_PATH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-dashboard-file-path">

                                                    <{if isset($formdata.DASHBOARD_FILE_PATH) }>
                            <{assign var='tmp_value' value=$formdata.DASHBOARD_FILE_PATH}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-dashboard-file-path" type="text" name="<{$prefix}>dashboard_formdata_DASHBOARD_FILE_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#dashboardform').attr('action', '<{$actionurl}>');$('#dashboardform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#dashboardform', 'f2', '.button-save');
    	bind_hotkey('#dashboardform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#dashboardform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
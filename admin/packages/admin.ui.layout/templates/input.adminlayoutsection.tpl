<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminlayoutsection">

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

<form name="adminlayoutsectionform" id="adminlayoutsectionform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{label key="L_ADMIN_LAYOUT_SECTION_NAME"}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminlayoutsection_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
  148.5634    9534200   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  152.1274    9660936   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  152.1374    9711280   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  152.1374    9841384   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  148.5634    9534200   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  152.1274    9660936   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  152.1374    9711280   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  152.1374    9841384   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  152.1474    9841672   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminlayoutsection_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'SHOW_TITLE' }>
                	<div class="form-row <{if in_array('SHOW_TITLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_SHOW_TITLE"}><{if in_array('SHOW_TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-show-title">

                                                    <{if isset($formdata.SHOW_TITLE) }>
                            <{assign var='tmp_value' value=$formdata.SHOW_TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-show-title" name="<{$prefix}>adminlayoutsection_formdata_SHOW_TITLE" >
                                    <option value="1" <{if $formdata.SHOW_TITLE}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.SHOW_TITLE}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-show-title" type="radio" name="<{$prefix}>adminlayoutsection_formdata_SHOW_TITLE" value="1" <{if $formdata.SHOW_TITLE}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminlayoutsection_formdata_SHOW_TITLE" value="0" <{if !$formdata.SHOW_TITLE}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminlayoutsection_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminlayoutsectionform').attr('action', '<{$actionurl}>');$('#adminlayoutsectionform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminlayoutsectionform', 'f2', '.button-save');
    	bind_hotkey('#adminlayoutsectionform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminlayoutsectionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
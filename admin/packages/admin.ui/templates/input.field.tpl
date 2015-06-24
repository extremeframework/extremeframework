<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-field">

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

<form name="fieldform" id="fieldform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{label key="L_FIELD_NAME"}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>field_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
  167.6666    9668312   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  173.4278    9795952   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  173.4278    9847792   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  173.4378    9977920   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  167.6666    9668312   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  173.4278    9795952   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  173.4278    9847792   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  173.4378    9977920   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  173.4378    9978208   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`field_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'COLUMN' }>
                	<div class="form-row <{if in_array('COLUMN', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_COLUMN"}><{if in_array('COLUMN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-column">

                                                    <{if isset($formdata.COLUMN) }>
                            <{assign var='tmp_value' value=$formdata.COLUMN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-column" type="text" name="<{$prefix}>field_formdata_COLUMN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TOOLTIP' }>
                	<div class="form-row <{if in_array('TOOLTIP', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_TOOLTIP"}><{if in_array('TOOLTIP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-tooltip">

                                                    <{if isset($formdata.TOOLTIP) }>
                            <{assign var='tmp_value' value=$formdata.TOOLTIP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-tooltip" type="text" name="<{$prefix}>field_formdata_TOOLTIP" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_EXCLUDED' }>
                	<div class="form-row <{if in_array('IS_EXCLUDED', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_IS_EXCLUDED"}><{if in_array('IS_EXCLUDED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-excluded">

                                                    <{if isset($formdata.IS_EXCLUDED) }>
                            <{assign var='tmp_value' value=$formdata.IS_EXCLUDED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-excluded" name="<{$prefix}>field_formdata_IS_EXCLUDED" >
                                    <option value="1" <{if $formdata.IS_EXCLUDED}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_EXCLUDED}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-excluded" type="radio" name="<{$prefix}>field_formdata_IS_EXCLUDED" value="1" <{if $formdata.IS_EXCLUDED}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>field_formdata_IS_EXCLUDED" value="0" <{if !$formdata.IS_EXCLUDED}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#fieldform').attr('action', '<{$actionurl}>');$('#fieldform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/field/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#fieldform', 'f2', '.button-save');
    	bind_hotkey('#fieldform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#fieldform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
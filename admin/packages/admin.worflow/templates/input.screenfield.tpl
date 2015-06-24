<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-screenfield">

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

<form name="screenfieldform" id="screenfieldform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'ID_SCREEN' }>
                	<div class="form-row <{if in_array('ID_SCREEN', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_SCREEN"}><{if in_array('ID_SCREEN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-screen">

                                                    <{if isset($formdata.ID_SCREEN) }>
                            <{assign var='tmp_value' value=$formdata.ID_SCREEN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  202.8198    9793512   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  226.3767    9926464   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  226.3867    9988424   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  226.3887   10118552   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  202.8198    9793512   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  226.3767    9926464   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  226.3867    9988424   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  226.3887   10118552   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  226.3957   10118856   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-screen" name="`$prefix`screenfield_formdata_ID_SCREEN" value=$formdata.ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <input class="input-title" type="text" name="<{$prefix}>screenfield_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-code" type="text" name="<{$prefix}>screenfield_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_VALUE_TYPE' }>
                	<div class="form-row <{if in_array('ID_VALUE_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_VALUE_TYPE"}><{if in_array('ID_VALUE_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-value-type">

                                                    <{if isset($formdata.ID_VALUE_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_VALUE_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  202.8198    9793512   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  226.3767    9926464   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  226.3867    9988424   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  226.4047   10118784   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  202.8198    9793512   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  226.3767    9926464   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  226.3867    9988424   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  226.4047   10118784   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  226.4107   10118856   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-value-type" name="`$prefix`screenfield_formdata_ID_VALUE_TYPE" value=$formdata.ID_VALUE_TYPE datasource="VALUE_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'DATASOURCE' }>
                	<div class="form-row <{if in_array('DATASOURCE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_DATASOURCE"}><{if in_array('DATASOURCE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-datasource">

                                                    <{if isset($formdata.DATASOURCE) }>
                            <{assign var='tmp_value' value=$formdata.DATASOURCE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-datasource" type="text" name="<{$prefix}>screenfield_formdata_DATASOURCE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CONDITION' }>
                	<div class="form-row <{if in_array('CONDITION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_CONDITION"}><{if in_array('CONDITION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-condition">

                                                    <{if isset($formdata.CONDITION) }>
                            <{assign var='tmp_value' value=$formdata.CONDITION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-condition" type="text" name="<{$prefix}>screenfield_formdata_CONDITION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'VALUECOL' }>
                	<div class="form-row <{if in_array('VALUECOL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_VALUECOL"}><{if in_array('VALUECOL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-valuecol">

                                                    <{if isset($formdata.VALUECOL) }>
                            <{assign var='tmp_value' value=$formdata.VALUECOL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-valuecol" type="text" name="<{$prefix}>screenfield_formdata_VALUECOL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TEXTCOL' }>
                	<div class="form-row <{if in_array('TEXTCOL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_TEXTCOL"}><{if in_array('TEXTCOL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-textcol">

                                                    <{if isset($formdata.TEXTCOL) }>
                            <{assign var='tmp_value' value=$formdata.TEXTCOL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-textcol" type="text" name="<{$prefix}>screenfield_formdata_TEXTCOL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_MANDATORY' }>
                	<div class="form-row <{if in_array('IS_MANDATORY', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_IS_MANDATORY"}><{if in_array('IS_MANDATORY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-mandatory">

                                                    <{if isset($formdata.IS_MANDATORY) }>
                            <{assign var='tmp_value' value=$formdata.IS_MANDATORY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-mandatory" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" >
                                    <option value="1" <{if $formdata.IS_MANDATORY}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_MANDATORY}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-mandatory" type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="1" <{if $formdata.IS_MANDATORY}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="0" <{if !$formdata.IS_MANDATORY}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>screenfield_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#screenfieldform').attr('action', '<{$actionurl}>');$('#screenfieldform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/screenfield/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#screenfieldform', 'f2', '.button-save');
    	bind_hotkey('#screenfieldform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#screenfieldform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
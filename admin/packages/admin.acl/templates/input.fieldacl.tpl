<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-fieldacl">

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

<form name="fieldaclform" id="fieldaclform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
  173.4578    9682056   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  177.1009    9811248   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  177.1069    9871736   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  177.1089   10001848   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  173.4578    9682056   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  177.1009    9811248   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  177.1069    9871736   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  177.1089   10001848   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  177.1109   10002136   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`fieldacl_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ACTION' }>
                	<div class="form-row <{if in_array('ACTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_ACTION"}><{if in_array('ACTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-action">

                                                    <{if isset($formdata.ACTION) }>
                            <{assign var='tmp_value' value=$formdata.ACTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-action" type="text" name="<{$prefix}>fieldacl_formdata_ACTION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_USER_GROUP' }>
                	<div class="form-row <{if in_array('ID_USER_GROUP', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_USER_GROUP"}><{if in_array('ID_USER_GROUP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-user-group">

                                                    <{if isset($formdata.ID_USER_GROUP) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER_GROUP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  173.4578    9682056   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  177.1009    9811248   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  177.1069    9871736   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  177.1219   10002064   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  173.4578    9682056   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  177.1009    9811248   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  177.1069    9871736   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  177.1219   10002064   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  177.1259   10002136   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`fieldacl_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
  173.4578    9682056   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  177.1009    9811248   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  177.1069    9871736   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  177.1319   10002064   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  173.4578    9682056   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  177.1009    9811248   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  177.1069    9871736   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  177.1319   10002064   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  177.1359   10002136   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`fieldacl_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'FIELDS' }>
                	<div class="form-row <{if in_array('FIELDS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_FIELDS"}><{if in_array('FIELDS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-fields">

                                                    <{if isset($formdata.FIELDS) }>
                            <{assign var='tmp_value' value=$formdata.FIELDS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-fields" id="<{$prefix}>fieldacl_formdata_FIELDS" name="<{$prefix}>fieldacl_formdata_FIELDS" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>fieldacl_formdata_FIELDS')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ACL_TYPE' }>
                	<div class="form-row <{if in_array('ID_ACL_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_ACL_TYPE"}><{if in_array('ID_ACL_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-acl-type">

                                                    <{if isset($formdata.ID_ACL_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_ACL_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
Notice: Undefined variable: codeboxes in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  173.4578    9682056   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  177.1009    9811248   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  177.1069    9871736   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  177.1439   10002064   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46


Warning: in_array() expects parameter 2 to be array, null given in D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl on line 14

Call Stack:
    0.0000     276640   1. {main}() D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:0
    0.0100    1132928   2. include('D:\wamp\www\generator\generate.php') D:\wamp\www\apps4clouds.com\apps\extremeframework-git\generator.conf.php:126
    0.0300    3051704   3. CliGenerator->execute() D:\wamp\www\generator\generate.php:2516
  113.9968    8777328   4. CliGenerator->generateAllTemplates() D:\wamp\www\generator\generate.php:311
  173.4578    9682056   5. CliGenerator->generateTemplate() D:\wamp\www\generator\generate.php:956
  177.1009    9811248   6. InputTemplateGenerator->generateInputTemplateFile() D:\wamp\www\generator\generate.php:998
  177.1069    9871736   7. include('D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl') D:\wamp\www\generator\base\InputTemplateGenerator.php:47
  177.1439   10002064   8. include('D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl') D:\wamp\www\generator\meta\overriding\vendhq\meta.input.tpl:46
  177.1439   10002136   9. in_array() D:\wamp\www\generator\meta\overriding\vendhq\item.input.tpl:14


                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-acl-type" name="`$prefix`fieldacl_formdata_ID_ACL_TYPE" value=$formdata.ID_ACL_TYPE datasource="ACL_TYPE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#fieldaclform').attr('action', '<{$actionurl}>');$('#fieldaclform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/fieldacl/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#fieldaclform', 'f2', '.button-save');
    	bind_hotkey('#fieldaclform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#fieldaclform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
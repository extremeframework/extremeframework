<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminmodule">

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

<form name="adminmoduleform" id="adminmoduleform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{label key="L_ADMIN_MODULE_NAME"}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminmodule_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-module" type="text" name="<{$prefix}>adminmodule_formdata_MODULE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PREFIX' }>
                	<div class="form-row <{if in_array('PREFIX', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_PREFIX"}><{if in_array('PREFIX', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-prefix">

                                                    <{if isset($formdata.PREFIX) }>
                            <{assign var='tmp_value' value=$formdata.PREFIX}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-prefix" type="text" name="<{$prefix}>adminmodule_formdata_PREFIX" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'AVAILABLE_ACTIONS' }>
                	<div class="form-row <{if in_array('AVAILABLE_ACTIONS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_AVAILABLE_ACTIONS"}><{if in_array('AVAILABLE_ACTIONS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-available-actions">

                                                    <{if isset($formdata.AVAILABLE_ACTIONS) }>
                            <{assign var='tmp_value' value=$formdata.AVAILABLE_ACTIONS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-available-actions" type="text" name="<{$prefix}>adminmodule_formdata_AVAILABLE_ACTIONS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_COMMENT_ENABLED' }>
                	<div class="form-row <{if in_array('IS_COMMENT_ENABLED', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_IS_COMMENT_ENABLED"}><{if in_array('IS_COMMENT_ENABLED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-comment-enabled">

                                                    <{if isset($formdata.IS_COMMENT_ENABLED) }>
                            <{assign var='tmp_value' value=$formdata.IS_COMMENT_ENABLED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-comment-enabled" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" >
                                    <option value="1" <{if $formdata.IS_COMMENT_ENABLED}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_COMMENT_ENABLED}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-comment-enabled" type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="1" <{if $formdata.IS_COMMENT_ENABLED}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="0" <{if !$formdata.IS_COMMENT_ENABLED}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminmoduleform').attr('action', '<{$actionurl}>');$('#adminmoduleform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmoduleform', 'f2', '.button-save');
    	bind_hotkey('#adminmoduleform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmoduleform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
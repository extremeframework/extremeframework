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
                		<label><{_t('L_WORKFLOW')}><{if in_array('ID_WORKFLOW', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-workflow">

                                                    <{if isset($formdata.ID_WORKFLOW) }>
                            <{assign var='tmp_value' value=$formdata.ID_WORKFLOW}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow" name="`$prefix`workflowlog_formdata_ID_WORKFLOW" value=$formdata.ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_WORKFLOW_TRANSITION' }>
                	<div class="form-row <{if in_array('ID_WORKFLOW_TRANSITION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_WORKFLOW_TRANSITION')}><{if in_array('ID_WORKFLOW_TRANSITION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-workflow-transition">

                                                    <{if isset($formdata.ID_WORKFLOW_TRANSITION) }>
                            <{assign var='tmp_value' value=$formdata.ID_WORKFLOW_TRANSITION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow-transition" name="`$prefix`workflowlog_formdata_ID_WORKFLOW_TRANSITION" value=$formdata.ID_WORKFLOW_TRANSITION datasource="WORKFLOW_TRANSITION" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'MODULE' }>
                	<div class="form-row <{if in_array('MODULE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_MODULE')}><{if in_array('MODULE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-module">

                                                    <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`workflowlog_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'OBJECT_ID' }>
                	<div class="form-row <{if in_array('OBJECT_ID', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_OBJECT')}><{if in_array('OBJECT_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
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
                		<label><{_t('L_DATE')}><{if in_array('DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
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
                		<label><{_t('L_USER')}><{if in_array('ID_USER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-user">

                                                    <{if isset($formdata.ID_USER) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`workflowlog_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'DETAILS' }>
                	<div class="form-row <{if in_array('DETAILS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_DETAILS')}><{if in_array('DETAILS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
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
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/cancel/?back=0"><span class="button-face"><{_t('L_CANCEL')}></span></a>
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
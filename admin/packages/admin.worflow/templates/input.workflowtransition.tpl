<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-workflowtransition">

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

<form name="workflowtransitionform" id="workflowtransitionform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow" name="`$prefix`workflowtransition_formdata_ID_WORKFLOW" value=$formdata.ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'NAME' }>
                	<div class="form-row <{if in_array('NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_WORKFLOW_TRANSITION_NAME')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>workflowtransition_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'START_ID_WORKFLOW_STAGE' }>
                	<div class="form-row <{if in_array('START_ID_WORKFLOW_STAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_START_WORKFLOW_STAGE')}><{if in_array('START_ID_WORKFLOW_STAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-start-id-workflow-stage">

                                                    <{if isset($formdata.START_ID_WORKFLOW_STAGE) }>
                            <{assign var='tmp_value' value=$formdata.START_ID_WORKFLOW_STAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-start-id-workflow-stage" name="`$prefix`workflowtransition_formdata_START_ID_WORKFLOW_STAGE" value=$formdata.START_ID_WORKFLOW_STAGE datasource="WORKFLOW_STAGE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'END_ID_WORKFLOW_STAGE' }>
                	<div class="form-row <{if in_array('END_ID_WORKFLOW_STAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_END_WORKFLOW_STAGE')}><{if in_array('END_ID_WORKFLOW_STAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-end-id-workflow-stage">

                                                    <{if isset($formdata.END_ID_WORKFLOW_STAGE) }>
                            <{assign var='tmp_value' value=$formdata.END_ID_WORKFLOW_STAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-end-id-workflow-stage" name="`$prefix`workflowtransition_formdata_END_ID_WORKFLOW_STAGE" value=$formdata.END_ID_WORKFLOW_STAGE datasource="WORKFLOW_STAGE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ACTION' }>
                	<div class="form-row <{if in_array('ACTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ACTION')}><{if in_array('ACTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-action">

                                                    <{if isset($formdata.ACTION) }>
                            <{assign var='tmp_value' value=$formdata.ACTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-action" type="text" name="<{$prefix}>workflowtransition_formdata_ACTION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_USER_GROUP' }>
                	<div class="form-row <{if in_array('ID_USER_GROUP', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_USER_GROUP')}><{if in_array('ID_USER_GROUP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-user-group">

                                                    <{if isset($formdata.ID_USER_GROUP) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER_GROUP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`workflowtransition_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_USER_ROLE' }>
                	<div class="form-row <{if in_array('ID_USER_ROLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_USER_ROLE')}><{if in_array('ID_USER_ROLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-user-role">

                                                    <{if isset($formdata.ID_USER_ROLE) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER_ROLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-role" name="`$prefix`workflowtransition_formdata_ID_USER_ROLE" value=$formdata.ID_USER_ROLE datasource="USER_ROLE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'TRANSITION_ID_SCREEN' }>
                	<div class="form-row <{if in_array('TRANSITION_ID_SCREEN', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TRANSITION_SCREEN')}><{if in_array('TRANSITION_ID_SCREEN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-transition-id-screen">

                                                    <{if isset($formdata.TRANSITION_ID_SCREEN) }>
                            <{assign var='tmp_value' value=$formdata.TRANSITION_ID_SCREEN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-transition-id-screen" name="`$prefix`workflowtransition_formdata_TRANSITION_ID_SCREEN" value=$formdata.TRANSITION_ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#workflowtransitionform').attr('action', '<{$actionurl}>');$('#workflowtransitionform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/cancel/?back=0"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#workflowtransitionform', 'f2', '.button-save');
    	bind_hotkey('#workflowtransitionform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#workflowtransitionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
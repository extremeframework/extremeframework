<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-changelog">

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

<form name="changelogform" id="changelogform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'ACTION' }>
                	<div class="form-row <{if in_array('ACTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ACTION')}><{if in_array('ACTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-action">

                                                    <{if isset($formdata.ACTION) }>
                            <{assign var='tmp_value' value=$formdata.ACTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-action" type="text" name="<{$prefix}>changelog_formdata_ACTION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ITEM' }>
                	<div class="form-row <{if in_array('ITEM', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ITEM')}><{if in_array('ITEM', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-item">

                                                    <{if isset($formdata.ITEM) }>
                            <{assign var='tmp_value' value=$formdata.ITEM}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-item" type="text" name="<{$prefix}>changelog_formdata_ITEM" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`changelog_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'DATE_TIME' }>
                	<div class="form-row <{if in_array('DATE_TIME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_DATE_TIME')}><{if in_array('DATE_TIME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-date-time">

                                                    <{if isset($formdata.DATE_TIME) }>
                            <{assign var='tmp_value' value=$formdata.DATE_TIME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-date-time field-date" type="text" id="<{$prefix}>changelog_formdata_DATE_TIME" name="<{$prefix}>changelog_formdata_DATE_TIME" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                        
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`changelog_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <input class="input-details" type="text" name="<{$prefix}>changelog_formdata_DETAILS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#changelogform').attr('action', '<{$actionurl}>');$('#changelogform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/changelog/cancel/?back=0"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#changelogform', 'f2', '.button-save');
    	bind_hotkey('#changelogform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#changelogform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
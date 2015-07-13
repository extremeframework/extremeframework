<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-usermembership">

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

<form name="usermembershipform" id="usermembershipform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{_t('L_USER')}><{if in_array('ID_USER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-user">

                                                    <{if isset($formdata.ID_USER) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`usermembership_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`usermembership_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-role" name="`$prefix`usermembership_formdata_ID_USER_ROLE" value=$formdata.ID_USER_ROLE datasource="USER_ROLE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'VALID_FROM' }>
                	<div class="form-row <{if in_array('VALID_FROM', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_VALID_FROM')}><{if in_array('VALID_FROM', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-valid-from">

                                                    <{if isset($formdata.VALID_FROM) }>
                            <{assign var='tmp_value' value=$formdata.VALID_FROM}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-valid-from field-date" type="text" id="<{$prefix}>usermembership_formdata_VALID_FROM" name="<{$prefix}>usermembership_formdata_VALID_FROM" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'VALID_UNTIL' }>
                	<div class="form-row <{if in_array('VALID_UNTIL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_VALID_UNTIL')}><{if in_array('VALID_UNTIL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-valid-until">

                                                    <{if isset($formdata.VALID_UNTIL) }>
                            <{assign var='tmp_value' value=$formdata.VALID_UNTIL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-valid-until field-date" type="text" id="<{$prefix}>usermembership_formdata_VALID_UNTIL" name="<{$prefix}>usermembership_formdata_VALID_UNTIL" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#usermembershipform').attr('action', '<{$actionurl}>');$('#usermembershipform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#usermembershipform', 'f2', '.button-save');
    	bind_hotkey('#usermembershipform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#usermembershipform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
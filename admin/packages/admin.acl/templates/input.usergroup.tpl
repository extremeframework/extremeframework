<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-usergroup">

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

<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=field item=message}>
            <li data-error-field="<{$field}>"><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="usergroupform" id="usergroupform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

<!-- Details -->
<div class="section" style="padding: 10px 0;">
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
                		<label><{_t('L_USER_GROUP_NAME')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>usergroup_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'DEFAULT_ID_DASHBOARD' }>
                	<div class="form-row <{if in_array('DEFAULT_ID_DASHBOARD', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_DEFAULT_DASHBOARD')}><{if in_array('DEFAULT_ID_DASHBOARD', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-default-id-dashboard">

                                                    <{if isset($formdata.DEFAULT_ID_DASHBOARD) }>
                            <{assign var='tmp_value' value=$formdata.DEFAULT_ID_DASHBOARD}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-default-id-dashboard" name="`$prefix`usergroup_formdata_DEFAULT_ID_DASHBOARD" value=$formdata.DEFAULT_ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'PARENT' }>
                	<div class="form-row <{if in_array('PARENT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PARENT')}><{if in_array('PARENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-parent">

                                                    <{if isset($formdata.PARENT) }>
                            <{assign var='tmp_value' value=$formdata.PARENT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`usergroup_formdata_PARENT" value=$formdata.PARENT datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#usergroupform').attr('action', '<{$actionurl}>');$('#usergroupform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#usergroupform', 'f2', '.button-save');
    	bind_hotkey('#usergroupform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#usergroupform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
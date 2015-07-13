<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminfilter">

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

<form name="adminfilterform" id="adminfilterform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{_t('L_ADMIN_FILTER_NAME')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>adminfilter_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminfilter_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'COLUMNS' }>
                	<div class="form-row <{if in_array('COLUMNS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_COLUMNS')}><{if in_array('COLUMNS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-columns">

                                                    <{if isset($formdata.COLUMNS) }>
                            <{assign var='tmp_value' value=$formdata.COLUMNS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-columns" type="text" name="<{$prefix}>adminfilter_formdata_COLUMNS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_DEFAULT' }>
                	<div class="form-row <{if in_array('IS_DEFAULT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_DEFAULT')}><{if in_array('IS_DEFAULT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-default">

                                                    <{if isset($formdata.IS_DEFAULT) }>
                            <{assign var='tmp_value' value=$formdata.IS_DEFAULT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-default" name="<{$prefix}>adminfilter_formdata_IS_DEFAULT" >
                                    <option value="1" <{if $formdata.IS_DEFAULT}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_DEFAULT}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-default" type="radio" name="<{$prefix}>adminfilter_formdata_IS_DEFAULT" value="1" <{if $formdata.IS_DEFAULT}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminfilter_formdata_IS_DEFAULT" value="0" <{if !$formdata.IS_DEFAULT}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminfilterform').attr('action', '<{$actionurl}>');$('#adminfilterform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminfilterform', 'f2', '.button-save');
    	bind_hotkey('#adminfilterform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminfilterform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
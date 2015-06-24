<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminlabel">

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

<form name="adminlabelform" id="adminlabelform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'LABEL' }>
                	<div class="form-row <{if in_array('LABEL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_LABEL"}><{if in_array('LABEL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-label">

                                                    <{if isset($formdata.LABEL) }>
                            <{assign var='tmp_value' value=$formdata.LABEL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-label" type="text" name="<{$prefix}>adminlabel_formdata_LABEL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminlabelform').attr('action', '<{$actionurl}>');$('#adminlabelform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminlabelform', 'f2', '.button-save');
    	bind_hotkey('#adminlabelform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminlabelform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
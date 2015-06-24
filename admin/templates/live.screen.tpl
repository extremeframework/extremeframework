<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-screen">

<{include file="top.tpl"}>

<script type="text/javascript">
function remove_attachment(element, attachment, spanid)
{
    element.value = element.value.replace(attachment, '');
    document.getElementById(spanid).style.visibility = 'hidden';
    document.getElementById(spanid).style.display = 'none';
}
</script>

<h1 class="heading"><span class="h"><{$formtitle}></span></h1>

<{if $messages }>
    <ul class="message">
        <{foreach from=$messages key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="screenform" id="screenform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

    <div class="edit-buttons edit-buttons-top">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#screenform').attr('action', '<{$actionurl}>');$('#screenform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
        <div class="clearer"></div>
    </div>

    <!-- Details -->
    <div class="section">
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                <{foreach from=$columns item=column }>
                    <{if $columnsettings.$column }>
                        <tr>
                    		<td class="form-row form-row-<{$columnsettings.$column->code}> form-row-mandatory">
                                <div class="form-field form-field-label">
                        		    <label><{$columnsettings.$column->text}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                </div>
                            </td>
                            <td class="form-row form-row-<{$columnsettings.$column->code}> form-row-mandatory">
                                <div class="form-field form-field-value" colspan="3">
                                    <{include file="input-item.tpl"}>
                                </div>
                            </td>
                        </tr>
                    <{/if}>
                <{/foreach}>
            </tbody>
        </table>
    </div>

    <div class="edit-buttons">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#screenform').attr('action', '<{$actionurl}>');$('#screenform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
        <div class="clearer"></div>
    </div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#screenform', 'f2', '.button-save');
    	bind_hotkey('#screenform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#screenform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
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

<h1 class="heading">
    <span class="h"><{$formtitle}></span>
</h1>

<div class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-top hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#changelogform').attr('action', '<{$actionurl}>');$('#changelogform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/changelog/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>

    <!-- Details -->
    <div class="section" style="padding: 10px 0;">
        <div>
            <div class="edit-main edit_details">
                <{if $messages}>
                    <ul class="message">
                        <{foreach from=$messages key=field item=message}>
                            <li data-error-field="<{$field}>"><{$message}></li>
                        <{/foreach}>
                    </ul>
                <{/if}>

                <form name="changelogform" id="changelogform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$columns item=column }>
                                <{if $columnsettings.$column }>
                                    <tr class="form-row form-row-<{$columnsettings.$column->code}> <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t($columnsettings.$column->text)}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-<{$columnsettings.$column->code}>">
                                                <{include file="input-item.tpl"}>
                                            </div>
                                        </td>
                                    </tr>

                            
                                <{elseif $column == 'ACTION' }>
                                    <tr class="form-row form-row-action <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Action')}><{if in_array('ACTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-action">
                                                                        <{$tmp_value = $formdataACTION}>

                        
                            <input class="input-action" type="text" name="<{$prefix}>changelog_formdata_ACTION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ITEM' }>
                                    <tr class="form-row form-row-item <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Item')}><{if in_array('ITEM', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-item">
                                                                        <{$tmp_value = $formdataITEM}>

                        
                            <input class="input-item" type="text" name="<{$prefix}>changelog_formdata_ITEM" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'MODULE' }>
                                    <tr class="form-row form-row-module <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Module')}><{if in_array('MODULE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-module">
                                                                        <{$tmp_value = $formdataMODULE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`changelog_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'DATE_TIME' }>
                                    <tr class="form-row form-row-date-time <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Date time')}><{if in_array('DATE_TIME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-date-time">
                                                                        <{$tmp_value = $formdataDATE_TIME}>

                                                    <input class="input-date-time field-date" type="text" id="<{$prefix}>changelog_formdata_DATE_TIME" name="<{$prefix}>changelog_formdata_DATE_TIME" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_USER' }>
                                    <tr class="form-row form-row-id-user <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('User')}><{if in_array('ID_USER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-user">
                                                                        <{$tmp_value = $formdataID_USER}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`changelog_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'DETAILS' }>
                                    <tr class="form-row form-row-details <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Details')}><{if in_array('DETAILS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-details">
                                                                        <{$tmp_value = $formdataDETAILS}>

                        
                            <input class="input-details" type="text" name="<{$prefix}>changelog_formdata_DETAILS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{/if}>
                            <{/foreach}>
                        </tbody>
                    </table>
                </form>
            </div>
    	</div>
        <div class="clearer"></div>
    </div>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-bottom hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#changelogform').attr('action', '<{$actionurl}>');$('#changelogform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/changelog/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


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

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
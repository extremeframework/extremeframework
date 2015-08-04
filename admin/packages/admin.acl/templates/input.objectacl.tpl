<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-objectacl">

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
                <a onclick="$('#objectaclform').attr('action', '<{$actionurl}>');$('#objectaclform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/objectacl/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
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

                <form name="objectaclform" id="objectaclform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`objectacl_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'OBJECT_ID' }>
                                    <tr class="form-row form-row-object-id <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Object')}><{if in_array('OBJECT_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-object-id">
                                                                        <{$tmp_value = $formdataOBJECT_ID}>

                        
                            <input class="input-object-id" type="text" name="<{$prefix}>objectacl_formdata_OBJECT_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_USER_GROUP' }>
                                    <tr class="form-row form-row-id-user-group <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('User group')}><{if in_array('ID_USER_GROUP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-user-group">
                                                                        <{$tmp_value = $formdataID_USER_GROUP}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`objectacl_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`objectacl_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ARG_ID_USER_GROUP' }>
                                    <tr class="form-row form-row-arg-id-user-group <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Arg user group')}><{if in_array('ARG_ID_USER_GROUP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-arg-id-user-group">
                                                                        <{$tmp_value = $formdataARG_ID_USER_GROUP}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-arg-id-user-group" name="`$prefix`objectacl_formdata_ARG_ID_USER_GROUP" value=$formdata.ARG_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ARG_ID_USER' }>
                                    <tr class="form-row form-row-arg-id-user <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Arg user')}><{if in_array('ARG_ID_USER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-arg-id-user">
                                                                        <{$tmp_value = $formdataARG_ID_USER}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-arg-id-user" name="`$prefix`objectacl_formdata_ARG_ID_USER" value=$formdata.ARG_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_ACL_TYPE' }>
                                    <tr class="form-row form-row-id-acl-type <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Acl type')}><{if in_array('ID_ACL_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-acl-type">
                                                                        <{$tmp_value = $formdataID_ACL_TYPE}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-acl-type" name="`$prefix`objectacl_formdata_ID_ACL_TYPE" value=$formdata.ID_ACL_TYPE datasource="ACL_TYPE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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
                <a onclick="$('#objectaclform').attr('action', '<{$actionurl}>');$('#objectaclform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/objectacl/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#objectaclform', 'f2', '.button-save');
    	bind_hotkey('#objectaclform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#objectaclform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
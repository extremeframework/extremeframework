<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-menuitem">

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
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{$formtitle}></span>
</h1>

<div class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-top hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#menuitemform').attr('action', '<{$actionurl}>');$('#menuitemform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
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

                <form name="menuitemform" id="menuitemform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
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

                            
                                <{elseif $column == 'TITLE' }>
                                    <tr class="form-row form-row-title <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Menu item title')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-title">
                                                                        <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>menuitem_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CLASS' }>
                                    <tr class="form-row form-row-class <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Class')}><{if in_array('CLASS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-class">
                                                                        <{$tmp_value = $formdataCLASS}>

                        
                            <input class="input-class" type="text" name="<{$prefix}>menuitem_formdata_CLASS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'TAG_LINE' }>
                                    <tr class="form-row form-row-tag-line <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Tag line')}><{if in_array('TAG_LINE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-tag-line">
                                                                        <{$tmp_value = $formdataTAG_LINE}>

                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>menuitem_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_MENU' }>
                                    <tr class="form-row form-row-id-menu <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Menu')}><{if in_array('ID_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-menu">
                                                                        <{$tmp_value = $formdataID_MENU}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-menu" name="`$prefix`menuitem_formdata_ID_MENU" value=$formdata.ID_MENU datasource="MENU" datasourcename="Menu" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PARENT' }>
                                    <tr class="form-row form-row-parent <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Parent')}><{if in_array('PARENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-parent">
                                                                        <{$tmp_value = $formdataPARENT}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`menuitem_formdata_PARENT" value=$formdata.PARENT datasource="MENU_ITEM" datasourcename="MenuItem" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="ID_MENU" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_PAGE' }>
                                    <tr class="form-row form-row-id-page <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Page')}><{if in_array('ID_PAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-page">
                                                                        <{$tmp_value = $formdataID_PAGE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`menuitem_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" datasourcename="Page" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_POST' }>
                                    <tr class="form-row form-row-id-post <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Post')}><{if in_array('ID_POST', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-post">
                                                                        <{$tmp_value = $formdataID_POST}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-post" name="`$prefix`menuitem_formdata_ID_POST" value=$formdata.ID_POST datasource="POST" datasourcename="Post" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_POST_CATEGORY' }>
                                    <tr class="form-row form-row-id-post-category <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Post category')}><{if in_array('ID_POST_CATEGORY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-post-category">
                                                                        <{$tmp_value = $formdataID_POST_CATEGORY}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-post-category" name="`$prefix`menuitem_formdata_ID_POST_CATEGORY" value=$formdata.ID_POST_CATEGORY datasource="POST_CATEGORY" datasourcename="PostCategory" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PATH' }>
                                    <tr class="form-row form-row-path <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Path')}><{if in_array('PATH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-path">
                                                                        <{$tmp_value = $formdataPATH}>

                        
                            <input class="input-path" type="text" name="<{$prefix}>menuitem_formdata_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOM_CONTENT' }>
                                    <tr class="form-row form-row-custom-content <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Custom content')}><{if in_array('CUSTOM_CONTENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-custom-content">
                                                                        <{$tmp_value = $formdataCUSTOM_CONTENT}>

                        
                            <textarea class="input-custom-content" id="<{$prefix}>menuitem_formdata_CUSTOM_CONTENT" name="<{$prefix}>menuitem_formdata_CUSTOM_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>menuitem_formdata_CUSTOM_CONTENT')</script>                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'HAS_BREAK_AFTER' }>
                                    <tr class="form-row form-row-has-break-after <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Has break after?')}><{if in_array('HAS_BREAK_AFTER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-has-break-after">
                                                                        <{$tmp_value = $formdataHAS_BREAK_AFTER}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-has-break-after" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" >
                                    <option value="1" <{if $formdata.HAS_BREAK_AFTER}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.HAS_BREAK_AFTER}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-has-break-after" type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="1" <{if $formdata.HAS_BREAK_AFTER}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="0" <{if !$formdata.HAS_BREAK_AFTER}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ORDERING' }>
                                    <tr class="form-row form-row-ordering <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Ordering')}><{if in_array('ORDERING', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-ordering">
                                                                        <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>menuitem_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ACL_ID_USER_GROUP' }>
                                    <tr class="form-row form-row-acl-id-user-group <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Acl user group')}><{if in_array('ACL_ID_USER_GROUP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-acl-id-user-group">
                                                                        <{$tmp_value = $formdataACL_ID_USER_GROUP}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-acl-id-user-group" name="`$prefix`menuitem_formdata_ACL_ID_USER_GROUP" value=$formdata.ACL_ID_USER_GROUP datasource="USER_GROUP" datasourcename="UserGroup" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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
                <a onclick="$('#menuitemform').attr('action', '<{$actionurl}>');$('#menuitemform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#menuitemform', 'f2', '.button-save');
    	bind_hotkey('#menuitemform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#menuitemform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
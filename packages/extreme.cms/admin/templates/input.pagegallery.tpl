<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-pagegallery">

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
                <a onclick="$('#pagegalleryform').attr('action', '<{$actionurl}>');$('#pagegalleryform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagegallery/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
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

                <form name="pagegalleryform" id="pagegalleryform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
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
                                		        <label><{_t('Page gallery title')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-title">
                                                                        <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>pagegallery_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagegallery_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'IMAGE' }>
                                    <tr class="form-row form-row-image <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Image')}><{if in_array('IMAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-image">
                                                                        <{$tmp_value = $formdataIMAGE}>

                                                    <{if $force_image_input}>
                                <input class="input-image" type="text" name="<{$prefix}>pagegallery_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>pagegallery_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagegallery_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.pagegalleryform.<{$prefix}>pagegallery_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>pagegallery_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagegallery_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'LINK_ID_PAGE' }>
                                    <tr class="form-row form-row-link-id-page <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Link page')}><{if in_array('LINK_ID_PAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-link-id-page">
                                                                        <{$tmp_value = $formdataLINK_ID_PAGE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-link-id-page" name="`$prefix`pagegallery_formdata_LINK_ID_PAGE" value=$formdata.LINK_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'LINK_PATH' }>
                                    <tr class="form-row form-row-link-path <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Link path')}><{if in_array('LINK_PATH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-link-path">
                                                                        <{$tmp_value = $formdataLINK_PATH}>

                        
                            <input class="input-link-path" type="text" name="<{$prefix}>pagegallery_formdata_LINK_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'DESCRIPTION' }>
                                    <tr class="form-row form-row-description <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Description')}><{if in_array('DESCRIPTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-description">
                                                                        <{$tmp_value = $formdataDESCRIPTION}>

                        
                            <textarea class="input-description" id="<{$prefix}>pagegallery_formdata_DESCRIPTION" name="<{$prefix}>pagegallery_formdata_DESCRIPTION" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>pagegallery_formdata_DESCRIPTION')</script>                                                                    </div>
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

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagegallery_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
                <a onclick="$('#pagegalleryform').attr('action', '<{$actionurl}>');$('#pagegalleryform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagegallery/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pagegalleryform', 'f2', '.button-save');
    	bind_hotkey('#pagegalleryform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagegalleryform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
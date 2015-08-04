<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-postsection">

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
                <a onclick="$('#postsectionform').attr('action', '<{$actionurl}>');$('#postsectionform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postsection/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
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

                <form name="postsectionform" id="postsectionform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
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
                                		        <label><{_t('Post section title')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-title">
                                                                        <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>postsection_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-post" name="`$prefix`postsection_formdata_ID_POST" value=$formdata.ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="" blankitem=""}>

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

                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>postsection_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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
                                <input class="input-image" type="text" name="<{$prefix}>postsection_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>postsection_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postsection_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>postsection_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>postsection_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'BACKGROUND_IMAGE' }>
                                    <tr class="form-row form-row-background-image <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Background image')}><{if in_array('BACKGROUND_IMAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-background-image">
                                                                        <{$tmp_value = $formdataBACKGROUND_IMAGE}>

                                                    <{if $force_image_input}>
                                <input class="input-background-image" type="text" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-background-image" type="file" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postsection_BACKGROUND_IMAGE"><{media src=$formdata.BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_BACKGROUND_IMAGE, '<{$tmp_value}>', '<{$prefix}>postsection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'BACKGROUND_COLOR' }>
                                    <tr class="form-row form-row-background-color <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Background color')}><{if in_array('BACKGROUND_COLOR', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-background-color">
                                                                        <{$tmp_value = $formdataBACKGROUND_COLOR}>

                        
                            <input class="input-background-color" type="text" name="<{$prefix}>postsection_formdata_BACKGROUND_COLOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'VIDEO' }>
                                    <tr class="form-row form-row-video <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Video')}><{if in_array('VIDEO', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-video">
                                                                        <{$tmp_value = $formdataVIDEO}>

                                                    <{if $force_image_input}>
                                <input class="input-video" type="text" name="<{$prefix}>postsection_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-video" type="file" name="<{$prefix}>postsection_formdata_VIDEO" />
                                <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.VIDEO}><div style="clear:both"></div><span id="<{$prefix}>postsection_VIDEO"><{media src=$formdata.VIDEO}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_VIDEO, '<{$tmp_value}>', '<{$prefix}>postsection_VIDEO')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>postsection_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CONTENT' }>
                                    <tr class="form-row form-row-content <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Content')}><{if in_array('CONTENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-content">
                                                                        <{$tmp_value = $formdataCONTENT}>

                        
                            <textarea class="input-content" id="<{$prefix}>postsection_formdata_CONTENT" name="<{$prefix}>postsection_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>postsection_formdata_CONTENT')</script>                                                                    </div>
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

                        
                            <input class="input-link-path" type="text" name="<{$prefix}>postsection_formdata_LINK_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>postsection_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
                <a onclick="$('#postsectionform').attr('action', '<{$actionurl}>');$('#postsectionform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postsection/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#postsectionform', 'f2', '.button-save');
    	bind_hotkey('#postsectionform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#postsectionform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
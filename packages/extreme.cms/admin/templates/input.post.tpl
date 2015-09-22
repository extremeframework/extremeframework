<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-post">

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
                <a onclick="$('#postform').attr('action', '<{$actionurl}>');$('#postform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
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

                <form name="postform" id="postform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
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
                                		        <label><{_t('Post title')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-title">
                                                                        <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>post_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'SLUG' }>
                                    <tr class="form-row form-row-slug <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Slug')}><{if in_array('SLUG', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-slug">
                                                                        <{$tmp_value = $formdataSLUG}>

                        
                            <input class="input-slug" type="text" name="<{$prefix}>post_formdata_SLUG" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_POST_TYPE' }>
                                    <tr class="form-row form-row-id-post-type <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Post type')}><{if in_array('ID_POST_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-post-type">
                                                                        <{$tmp_value = $formdataID_POST_TYPE}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-post-type" name="`$prefix`post_formdata_ID_POST_TYPE" value=$formdata.ID_POST_TYPE datasource="POST_TYPE" datasourcename="PostType" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-post-category" name="`$prefix`post_formdata_ID_POST_CATEGORY" value=$formdata.ID_POST_CATEGORY datasource="POST_CATEGORY" datasourcename="PostCategory" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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
                                <input class="input-image" type="text" name="<{$prefix}>post_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>post_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>post_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.postform.<{$prefix}>post_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>post_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>post_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'META_KEYWORDS' }>
                                    <tr class="form-row form-row-meta-keywords <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Meta keywords')}><{if in_array('META_KEYWORDS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-meta-keywords">
                                                                        <{$tmp_value = $formdataMETA_KEYWORDS}>

                        
                            <input class="input-meta-keywords" type="text" name="<{$prefix}>post_formdata_META_KEYWORDS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'META_DESCRIPTION' }>
                                    <tr class="form-row form-row-meta-description <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Meta description')}><{if in_array('META_DESCRIPTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-meta-description">
                                                                        <{$tmp_value = $formdataMETA_DESCRIPTION}>

                        
                            <textarea class="input-meta-description" id="<{$prefix}>post_formdata_META_DESCRIPTION" name="<{$prefix}>post_formdata_META_DESCRIPTION" rows="5" ><{$tmp_value}></textarea>
                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'EXCERPT' }>
                                    <tr class="form-row form-row-excerpt <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Excerpt')}><{if in_array('EXCERPT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-excerpt">
                                                                        <{$tmp_value = $formdataEXCERPT}>

                        
                            <textarea class="input-excerpt" id="<{$prefix}>post_formdata_EXCERPT" name="<{$prefix}>post_formdata_EXCERPT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>post_formdata_EXCERPT')</script>                                                                    </div>
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

                        
                            <textarea class="input-content" id="<{$prefix}>post_formdata_CONTENT" name="<{$prefix}>post_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>post_formdata_CONTENT')</script>                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'TAGS' }>
                                    <tr class="form-row form-row-tags <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Tags')}><{if in_array('TAGS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-tags">
                                                                        <{$tmp_value = $formdataTAGS}>

                        
                            <input class="input-tags" type="text" name="<{$prefix}>post_formdata_TAGS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'AUTHOR' }>
                                    <tr class="form-row form-row-author <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Author')}><{if in_array('AUTHOR', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-author">
                                                                        <{$tmp_value = $formdataAUTHOR}>

                        
                            <input class="input-author" type="text" name="<{$prefix}>post_formdata_AUTHOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'EXTERNAL_LINK' }>
                                    <tr class="form-row form-row-external-link <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('External link')}><{if in_array('EXTERNAL_LINK', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-external-link">
                                                                        <{$tmp_value = $formdataEXTERNAL_LINK}>

                        
                            <input class="input-external-link" type="text" name="<{$prefix}>post_formdata_EXTERNAL_LINK" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_TEMPLATE' }>
                                    <tr class="form-row form-row-id-template <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Template')}><{if in_array('ID_TEMPLATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-template">
                                                                        <{$tmp_value = $formdataID_TEMPLATE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-template" name="`$prefix`post_formdata_ID_TEMPLATE" value=$formdata.ID_TEMPLATE datasource="TEMPLATE" datasourcename="Template" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CREATION_DATE' }>
                                    <tr class="form-row form-row-creation-date <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Creation date')}><{if in_array('CREATION_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-creation-date">
                                                                        <{$tmp_value = $formdataCREATION_DATE}>

                        
                            <input class="input-creation-date" type="text" name="<{$prefix}>post_formdata_CREATION_DATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'LATEST_UPDATE' }>
                                    <tr class="form-row form-row-latest-update <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Latest update')}><{if in_array('LATEST_UPDATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-latest-update">
                                                                        <{$tmp_value = $formdataLATEST_UPDATE}>

                        
                            <input class="input-latest-update" type="text" name="<{$prefix}>post_formdata_LATEST_UPDATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'IS_FEATURED' }>
                                    <tr class="form-row form-row-is-featured <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Featured?')}><{if in_array('IS_FEATURED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-is-featured">
                                                                        <{$tmp_value = $formdataIS_FEATURED}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-featured" name="<{$prefix}>post_formdata_IS_FEATURED" >
                                    <option value="1" <{if $formdata.IS_FEATURED}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_FEATURED}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-featured" type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="1" <{if $formdata.IS_FEATURED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="0" <{if !$formdata.IS_FEATURED}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
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
                <a onclick="$('#postform').attr('action', '<{$actionurl}>');$('#postform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#postform', 'f2', '.button-save');
    	bind_hotkey('#postform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#postform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-page">

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
                <a onclick="$('#pageform').attr('action', '<{$actionurl}>');$('#pageform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
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

                <form name="pageform" id="pageform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
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

                            
                                <{elseif $column == 'NAME' }>
                                    <tr class="form-row form-row-name <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Page name')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-name">
                                                                        <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>page_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'TITLE' }>
                                    <tr class="form-row form-row-title <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Page title')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-title">
                                                                        <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>page_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`page_formdata_PARENT" value=$formdata.PARENT datasource="PAGE" datasourcename="Page" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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

                        
                            <input class="input-slug" type="text" name="<{$prefix}>page_formdata_SLUG" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>page_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'THUMB' }>
                                    <tr class="form-row form-row-thumb <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Thumb')}><{if in_array('THUMB', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-thumb">
                                                                        <{$tmp_value = $formdataTHUMB}>

                                                    <{if $force_image_input}>
                                <input class="input-thumb" type="text" name="<{$prefix}>page_formdata_THUMB" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-thumb" type="file" name="<{$prefix}>page_formdata_THUMB" />
                                <span class="input-sizes-width-height"><input type="text" name="THUMB[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="THUMB[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.THUMB}><div style="clear:both"></div><span id="<{$prefix}>page_THUMB"><{media src=$formdata.THUMB}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_THUMB, '<{$tmp_value}>', '<{$prefix}>page_THUMB')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>page_formdata_THUMB" value="<{$tmp_value}>" />
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
                                <input class="input-background-image" type="text" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-background-image" type="file" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>page_BACKGROUND_IMAGE"><{media src=$formdata.BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_BACKGROUND_IMAGE, '<{$tmp_value}>', '<{$prefix}>page_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
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
                                <input class="input-image" type="text" name="<{$prefix}>page_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>page_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>page_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>page_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>page_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
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
                                <input class="input-video" type="text" name="<{$prefix}>page_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-video" type="file" name="<{$prefix}>page_formdata_VIDEO" />
                                <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.VIDEO}><div style="clear:both"></div><span id="<{$prefix}>page_VIDEO"><{media src=$formdata.VIDEO}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_VIDEO, '<{$tmp_value}>', '<{$prefix}>page_VIDEO')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>page_formdata_VIDEO" value="<{$tmp_value}>" />
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

                        
                            <input class="input-meta-keywords" type="text" name="<{$prefix}>page_formdata_META_KEYWORDS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                        
                            <textarea class="input-meta-description" id="<{$prefix}>page_formdata_META_DESCRIPTION" name="<{$prefix}>page_formdata_META_DESCRIPTION" rows="5" ><{$tmp_value}></textarea>
                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'INTRODUCTION' }>
                                    <tr class="form-row form-row-introduction <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Introduction')}><{if in_array('INTRODUCTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-introduction">
                                                                        <{$tmp_value = $formdataINTRODUCTION}>

                        
                            <textarea class="input-introduction" id="<{$prefix}>page_formdata_INTRODUCTION" name="<{$prefix}>page_formdata_INTRODUCTION" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>page_formdata_INTRODUCTION')</script>                                                                    </div>
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

                        
                            <textarea class="input-content" id="<{$prefix}>page_formdata_CONTENT" name="<{$prefix}>page_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>page_formdata_CONTENT')</script>                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'FOOTER' }>
                                    <tr class="form-row form-row-footer <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Footer')}><{if in_array('FOOTER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-footer">
                                                                        <{$tmp_value = $formdataFOOTER}>

                        
                            <textarea class="input-footer" id="<{$prefix}>page_formdata_FOOTER" name="<{$prefix}>page_formdata_FOOTER" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>page_formdata_FOOTER')</script>                                                                    </div>
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-template" name="`$prefix`page_formdata_ID_TEMPLATE" value=$formdata.ID_TEMPLATE datasource="TEMPLATE" datasourcename="Template" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ADDITIONAL_CSS' }>
                                    <tr class="form-row form-row-additional-css <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Additional css')}><{if in_array('ADDITIONAL_CSS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-additional-css">
                                                                        <{$tmp_value = $formdataADDITIONAL_CSS}>

                        
                            <textarea class="input-additional-css" id="<{$prefix}>page_formdata_ADDITIONAL_CSS" name="<{$prefix}>page_formdata_ADDITIONAL_CSS" rows="5" ><{$tmp_value}></textarea>
                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOM_TOP_ID_MENU' }>
                                    <tr class="form-row form-row-custom-top-id-menu <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Custom top menu')}><{if in_array('CUSTOM_TOP_ID_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-custom-top-id-menu">
                                                                        <{$tmp_value = $formdataCUSTOM_TOP_ID_MENU}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-custom-top-id-menu" name="`$prefix`page_formdata_CUSTOM_TOP_ID_MENU" value=$formdata.CUSTOM_TOP_ID_MENU datasource="MENU" datasourcename="Menu" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOM_SIDE_ID_MENU' }>
                                    <tr class="form-row form-row-custom-side-id-menu <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Custom side menu')}><{if in_array('CUSTOM_SIDE_ID_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-custom-side-id-menu">
                                                                        <{$tmp_value = $formdataCUSTOM_SIDE_ID_MENU}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-custom-side-id-menu" name="`$prefix`page_formdata_CUSTOM_SIDE_ID_MENU" value=$formdata.CUSTOM_SIDE_ID_MENU datasource="MENU" datasourcename="Menu" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'VIEW_MORE_TITLE' }>
                                    <tr class="form-row form-row-view-more-title <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('View more title')}><{if in_array('VIEW_MORE_TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-view-more-title">
                                                                        <{$tmp_value = $formdataVIEW_MORE_TITLE}>

                        
                            <input class="input-view-more-title" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'VIEW_MORE_ID_PAGE' }>
                                    <tr class="form-row form-row-view-more-id-page <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('View more page')}><{if in_array('VIEW_MORE_ID_PAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-view-more-id-page">
                                                                        <{$tmp_value = $formdataVIEW_MORE_ID_PAGE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-view-more-id-page" name="`$prefix`page_formdata_VIEW_MORE_ID_PAGE" value=$formdata.VIEW_MORE_ID_PAGE datasource="PAGE" datasourcename="Page" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'VIEW_MORE_LINK' }>
                                    <tr class="form-row form-row-view-more-link <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('View more link')}><{if in_array('VIEW_MORE_LINK', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-view-more-link">
                                                                        <{$tmp_value = $formdataVIEW_MORE_LINK}>

                        
                            <input class="input-view-more-link" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_LINK" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                        
                            <input class="input-latest-update" type="text" name="<{$prefix}>page_formdata_LATEST_UPDATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
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
                <a onclick="$('#pageform').attr('action', '<{$actionurl}>');$('#pageform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pageform', 'f2', '.button-save');
    	bind_hotkey('#pageform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#pageform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
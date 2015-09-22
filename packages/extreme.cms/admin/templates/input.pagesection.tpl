<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-pagesection">

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
                <a onclick="$('#pagesectionform').attr('action', '<{$actionurl}>');$('#pagesectionform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
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

                <form name="pagesectionform" id="pagesectionform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
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
                                		        <label><{_t('Page section title')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-title">
                                                                        <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>pagesection_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagesection_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" datasourcename="Page" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CODE' }>
                                    <tr class="form-row form-row-code <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Code')}><{if in_array('CODE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-code">
                                                                        <{$tmp_value = $formdataCODE}>

                        
                            <input class="input-code" type="text" name="<{$prefix}>pagesection_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`pagesection_formdata_PARENT" value=$formdata.PARENT datasource="PAGE_SECTION" datasourcename="PageSection" valuecol="CODE" textcol="TITLE" sortcol="TITLE" groupcol="ID_PAGE" blankitem=""}>

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

                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>pagesection_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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
                                <input class="input-image" type="text" name="<{$prefix}>pagesection_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>pagesection_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>pagesection_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagesection_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'FONT_AWESOME_ICON' }>
                                    <tr class="form-row form-row-font-awesome-icon <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Font awesome icon')}><{if in_array('FONT_AWESOME_ICON', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-font-awesome-icon">
                                                                        <{$tmp_value = $formdataFONT_AWESOME_ICON}>

                        
                            <input class="input-font-awesome-icon" type="text" name="<{$prefix}>pagesection_formdata_FONT_AWESOME_ICON" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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
                                <input class="input-background-image" type="text" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-background-image" type="file" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_BACKGROUND_IMAGE"><{media src=$formdata.BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE, '<{$tmp_value}>', '<{$prefix}>pagesection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
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

                        
                            <input class="input-background-color" type="text" name="<{$prefix}>pagesection_formdata_BACKGROUND_COLOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
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
                                <input class="input-video" type="text" name="<{$prefix}>pagesection_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-video" type="file" name="<{$prefix}>pagesection_formdata_VIDEO" />
                                <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.VIDEO}><div style="clear:both"></div><span id="<{$prefix}>pagesection_VIDEO"><{media src=$formdata.VIDEO}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_VIDEO, '<{$tmp_value}>', '<{$prefix}>pagesection_VIDEO')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagesection_formdata_VIDEO" value="<{$tmp_value}>" />
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

                        
                            <textarea class="input-content" id="<{$prefix}>pagesection_formdata_CONTENT" name="<{$prefix}>pagesection_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>pagesection_formdata_CONTENT')</script>                                                                    </div>
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

                        
                            <input class="input-tags" type="text" name="<{$prefix}>pagesection_formdata_TAGS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                        
                            <input class="input-view-more-title" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-view-more-id-page" name="`$prefix`pagesection_formdata_VIEW_MORE_ID_PAGE" value=$formdata.VIEW_MORE_ID_PAGE datasource="PAGE" datasourcename="Page" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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

                        
                            <input class="input-view-more-link" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_LINK" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'HIDE_TITLE' }>
                                    <tr class="form-row form-row-hide-title <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Hide title')}><{if in_array('HIDE_TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-hide-title">
                                                                        <{$tmp_value = $formdataHIDE_TITLE}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-hide-title" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" >
                                    <option value="1" <{if $formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="1" <{if $formdata.HIDE_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="0" <{if !$formdata.HIDE_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'IS_TAB_ANCHOR_SECTION' }>
                                    <tr class="form-row form-row-is-tab-anchor-section <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Tab anchor section?')}><{if in_array('IS_TAB_ANCHOR_SECTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-is-tab-anchor-section">
                                                                        <{$tmp_value = $formdataIS_TAB_ANCHOR_SECTION}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-tab-anchor-section" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" >
                                    <option value="1" <{if $formdata.IS_TAB_ANCHOR_SECTION}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_TAB_ANCHOR_SECTION}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-tab-anchor-section" type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="1" <{if $formdata.IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="0" <{if !$formdata.IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'TAB_ANCHOR_TITLE' }>
                                    <tr class="form-row form-row-tab-anchor-title <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Tab anchor title')}><{if in_array('TAB_ANCHOR_TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-tab-anchor-title">
                                                                        <{$tmp_value = $formdataTAB_ANCHOR_TITLE}>

                        
                            <input class="input-tab-anchor-title" type="text" name="<{$prefix}>pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
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

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagesection_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
                <a onclick="$('#pagesectionform').attr('action', '<{$actionurl}>');$('#pagesectionform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pagesectionform', 'f2', '.button-save');
    	bind_hotkey('#pagesectionform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagesectionform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="pagesectionform" id="pagesectionform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagesection/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pagesection_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="pagesection_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="pagesection_form_top" args=$details}>

                        
    
    
            <!-- Custom layout tabs -->
        <div class="layout-block layout-block-tabs layout-block-tabs-bottom">
            <div id="pagesection-view-layout-tabs-general-image-misc" class="layout-tabs view-layout-tabs pagesection-view-layout-tabs" style="clear:both">
                <ul>
                                            <li><a href="#tab-general"><{_t('L_GENERAL')}></a></li>
                                            <li><a href="#tab-image"><{_t('L_IMAGE')}></a></li>
                                            <li><a href="#tab-misc"><{_t('L_MISC')}></a></li>
                                    </ul>

                                    <div id="tab-general">
                                                
                                                    
            <!-- Custom layout rows -->
        <div class="layout-block layout-block-rows">
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="pagesection_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="pagesection_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Page section title')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PARENT'])}>
    
        <{if $preset == 'PARENT'}>
            <input type="hidden" class="input-parent" name="pagesection_formdata_PARENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PARENT']) && !$acleditablecolumns['PARENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PARENT'])}>
            <input type="hidden" class="input-parent" name="pagesection_formdata_PARENT" value="<{$details->PARENT}>" />
        <{else}>
    		<td class="form-row form-row-parent">
                <div class="form-field form-field-label">
        		    <label><{_t('Parent')}></label>
                </div>
            </td>
            <td class="form-row form-row-parent" colspan="3">
                <div class="form-field form-field-value column-parent">
                                            
            <{if Framework::hasModule('PageSection')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`pagesection_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="PAGE_SECTION" valuecol="CODE" textcol="TITLE" sortcol="" groupcol="ID_PAGE" blankitem=""}>

                            <{if isset($smarty.session.acl.pagesection.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/new" title="Create a New Page Section">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>pagesection_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                            <{if $columntooltips.PARENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PARENT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="pagesection_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="pagesection_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Code')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="pagesection_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>pagesection_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TAG_LINE'])}>
    
        <{if $preset == 'TAG_LINE'}>
            <input type="hidden" class="input-tag-line" name="pagesection_formdata_TAG_LINE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TAG_LINE']) && !$acleditablecolumns['TAG_LINE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TAG_LINE'])}>
            <input type="hidden" class="input-tag-line" name="pagesection_formdata_TAG_LINE" value="<{$details->TAG_LINE}>" />
        <{else}>
    		<td class="form-row form-row-tag-line">
                <div class="form-field form-field-label">
        		    <label><{_t('Tag line')}></label>
                </div>
            </td>
            <td class="form-row form-row-tag-line" colspan="3">
                <div class="form-field form-field-value column-tag-line">
                                            

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
                        <{if $columntooltips.TAG_LINE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TAG_LINE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
                        </tr>                                            <tr>
    
                        </tr>                                            <tr>
    
                        </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CONTENT'])}>
    
        <{if $preset == 'CONTENT'}>
            <input type="hidden" class="input-content" name="pagesection_formdata_CONTENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONTENT']) && !$acleditablecolumns['CONTENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONTENT'])}>
            <input type="hidden" class="input-content" name="pagesection_formdata_CONTENT" value="<{$details->CONTENT}>" />
        <{else}>
    		<td class="form-row form-row-content">
                <div class="form-field form-field-label">
        		    <label><{_t('Content')}></label>
                </div>
            </td>
            <td class="form-row form-row-content" colspan="3">
                <div class="form-field form-field-value column-content">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>pagesection_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>pagesection_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                        <{if $columntooltips.CONTENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CONTENT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TAGS'])}>
    
        <{if $preset == 'TAGS'}>
            <input type="hidden" class="input-tags" name="pagesection_formdata_TAGS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TAGS']) && !$acleditablecolumns['TAGS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TAGS'])}>
            <input type="hidden" class="input-tags" name="pagesection_formdata_TAGS" value="<{$details->TAGS}>" />
        <{else}>
    		<td class="form-row form-row-tags">
                <div class="form-field form-field-label">
        		    <label><{_t('Tags')}></label>
                </div>
            </td>
            <td class="form-row form-row-tags" colspan="3">
                <div class="form-field form-field-value column-tags">
                                            

    <input class="input-tags input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TAGS" value="<{$details->TAGS|escape}>"  />
                        <{if $columntooltips.TAGS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TAGS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
                        </tr>                                            <tr>
    
                        </tr>                                    </tbody>
            </table>
        </div>
        <!-- Custom layout rows end -->
    
    
    

                                                                    </div>
                                    <div id="tab-image">
                                                
                                                    
            <!-- Custom layout rows -->
        <div class="layout-block layout-block-rows">
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['BACKGROUND_IMAGE'])}>
    
        <{if $preset == 'BACKGROUND_IMAGE'}>
            <input type="hidden" class="input-background-image" name="pagesection_formdata_BACKGROUND_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['BACKGROUND_IMAGE']) && !$acleditablecolumns['BACKGROUND_IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['BACKGROUND_IMAGE'])}>
            <input type="hidden" class="input-background-image" name="pagesection_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
        <{else}>
    		<td class="form-row form-row-background-image">
                <div class="form-field form-field-label">
        		    <label><{_t('Background image')}></label>
                </div>
            </td>
            <td class="form-row form-row-background-image" colspan="3">
                <div class="form-field form-field-value column-background-image">
                                            

	<input class="input-background-image input-type-file" type="file" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_BACKGROUND_IMAGE"><{media src=$details->BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE, '<{$details->BACKGROUND_IMAGE}>', '<{$prefix}>pagesection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
                        <{if $columntooltips.BACKGROUND_IMAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.BACKGROUND_IMAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['BACKGROUND_COLOR'])}>
    
        <{if $preset == 'BACKGROUND_COLOR'}>
            <input type="hidden" class="input-background-color" name="pagesection_formdata_BACKGROUND_COLOR" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['BACKGROUND_COLOR']) && !$acleditablecolumns['BACKGROUND_COLOR'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['BACKGROUND_COLOR'])}>
            <input type="hidden" class="input-background-color" name="pagesection_formdata_BACKGROUND_COLOR" value="<{$details->BACKGROUND_COLOR}>" />
        <{else}>
    		<td class="form-row form-row-background-color">
                <div class="form-field form-field-label">
        		    <label><{_t('Background color')}></label>
                </div>
            </td>
            <td class="form-row form-row-background-color" colspan="3">
                <div class="form-field form-field-value column-background-color">
                                            

    <input class="input-background-color input-type-color" type="text" name="<{$prefix}>pagesection_formdata_BACKGROUND_COLOR" value="<{$details->BACKGROUND_COLOR|escape}>"  />
                        <{if $columntooltips.BACKGROUND_COLOR}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.BACKGROUND_COLOR}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['FONT_AWESOME_ICON'])}>
    
        <{if $preset == 'FONT_AWESOME_ICON'}>
            <input type="hidden" class="input-font-awesome-icon" name="pagesection_formdata_FONT_AWESOME_ICON" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FONT_AWESOME_ICON']) && !$acleditablecolumns['FONT_AWESOME_ICON'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FONT_AWESOME_ICON'])}>
            <input type="hidden" class="input-font-awesome-icon" name="pagesection_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON}>" />
        <{else}>
    		<td class="form-row form-row-font-awesome-icon">
                <div class="form-field form-field-label">
        		    <label><{_t('Font awesome icon')}></label>
                </div>
            </td>
            <td class="form-row form-row-font-awesome-icon" colspan="3">
                <div class="form-field form-field-value column-font-awesome-icon">
                                            

    <input class="input-font-awesome-icon input-type-text" type="text" name="<{$prefix}>pagesection_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON|escape}>"  />
                        <{if $columntooltips.FONT_AWESOME_ICON}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.FONT_AWESOME_ICON}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="pagesection_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="pagesection_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-row form-row-image">
                <div class="form-field form-field-label">
        		    <label><{_t('Image')}></label>
                </div>
            </td>
            <td class="form-row form-row-image" colspan="3">
                <div class="form-field form-field-value column-image">
                                            

	<input class="input-image input-type-file" type="file" name="<{$prefix}>pagesection_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>pagesection_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagesection_formdata_IMAGE" value="<{$details->IMAGE}>" />
                        <{if $columntooltips.IMAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VIDEO'])}>
    
        <{if $preset == 'VIDEO'}>
            <input type="hidden" class="input-video" name="pagesection_formdata_VIDEO" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIDEO']) && !$acleditablecolumns['VIDEO'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIDEO'])}>
            <input type="hidden" class="input-video" name="pagesection_formdata_VIDEO" value="<{$details->VIDEO}>" />
        <{else}>
    		<td class="form-row form-row-video">
                <div class="form-field form-field-label">
        		    <label><{_t('Video')}></label>
                </div>
            </td>
            <td class="form-row form-row-video" colspan="3">
                <div class="form-field form-field-value column-video">
                                            

	<input class="input-video input-type-file" type="file" name="<{$prefix}>pagesection_formdata_VIDEO" />
    <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->VIDEO}><div style="clear:both"></div><span id="<{$prefix}>pagesection_VIDEO"><{media src=$details->VIDEO}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_VIDEO, '<{$details->VIDEO}>', '<{$prefix}>pagesection_VIDEO')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagesection_formdata_VIDEO" value="<{$details->VIDEO}>" />
                        <{if $columntooltips.VIDEO}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VIDEO}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        </div>
        <!-- Custom layout rows end -->
    
    
    

                                                                    </div>
                                    <div id="tab-misc">
                                                
                                                    
            <!-- Custom layout rows -->
        <div class="layout-block layout-block-rows">
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                            <tr>
    
                        </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VIEW_MORE_TITLE'])}>
    
        <{if $preset == 'VIEW_MORE_TITLE'}>
            <input type="hidden" class="input-view-more-title" name="pagesection_formdata_VIEW_MORE_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIEW_MORE_TITLE']) && !$acleditablecolumns['VIEW_MORE_TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIEW_MORE_TITLE'])}>
            <input type="hidden" class="input-view-more-title" name="pagesection_formdata_VIEW_MORE_TITLE" value="<{$details->VIEW_MORE_TITLE}>" />
        <{else}>
    		<td class="form-row form-row-view-more-title">
                <div class="form-field form-field-label">
        		    <label><{_t('View more title')}></label>
                </div>
            </td>
            <td class="form-row form-row-view-more-title" colspan="3">
                <div class="form-field form-field-value column-view-more-title">
                                            

    <input class="input-view-more-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_TITLE" value="<{$details->VIEW_MORE_TITLE|escape}>"  />
                        <{if $columntooltips.VIEW_MORE_TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VIEW_MORE_TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VIEW_MORE_ID_PAGE'])}>
    
        <{if $preset == 'VIEW_MORE_ID_PAGE'}>
            <input type="hidden" class="input-view-more-id-page" name="pagesection_formdata_VIEW_MORE_ID_PAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIEW_MORE_ID_PAGE']) && !$acleditablecolumns['VIEW_MORE_ID_PAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIEW_MORE_ID_PAGE'])}>
            <input type="hidden" class="input-view-more-id-page" name="pagesection_formdata_VIEW_MORE_ID_PAGE" value="<{$details->VIEW_MORE_ID_PAGE}>" />
        <{else}>
    		<td class="form-row form-row-view-more-id-page">
                <div class="form-field form-field-label">
        		    <label><{_t('View more page')}></label>
                </div>
            </td>
            <td class="form-row form-row-view-more-id-page" colspan="3">
                <div class="form-field form-field-value column-view-more-id-page">
                                            
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-view-more-id-page" class="input-view-more-id-page" name="`$prefix`pagesection_formdata_VIEW_MORE_ID_PAGE" value=$details->VIEW_MORE_ID_PAGE text=$details->reftext_VIEW_MORE_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-view-more-id-page input-type-text" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_ID_PAGE" value="<{$details->VIEW_MORE_ID_PAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.VIEW_MORE_ID_PAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VIEW_MORE_ID_PAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VIEW_MORE_LINK'])}>
    
        <{if $preset == 'VIEW_MORE_LINK'}>
            <input type="hidden" class="input-view-more-link" name="pagesection_formdata_VIEW_MORE_LINK" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIEW_MORE_LINK']) && !$acleditablecolumns['VIEW_MORE_LINK'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIEW_MORE_LINK'])}>
            <input type="hidden" class="input-view-more-link" name="pagesection_formdata_VIEW_MORE_LINK" value="<{$details->VIEW_MORE_LINK}>" />
        <{else}>
    		<td class="form-row form-row-view-more-link">
                <div class="form-field form-field-label">
        		    <label><{_t('View more link')}></label>
                </div>
            </td>
            <td class="form-row form-row-view-more-link" colspan="3">
                <div class="form-field form-field-value column-view-more-link">
                                            

    <input class="input-view-more-link input-type-text" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_LINK" value="<{$details->VIEW_MORE_LINK|escape}>"  />
                        <{if $columntooltips.VIEW_MORE_LINK}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VIEW_MORE_LINK}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['HIDE_TITLE'])}>
    
        <{if $preset == 'HIDE_TITLE'}>
            <input type="hidden" class="input-hide-title" name="pagesection_formdata_HIDE_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['HIDE_TITLE']) && !$acleditablecolumns['HIDE_TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['HIDE_TITLE'])}>
            <input type="hidden" class="input-hide-title" name="pagesection_formdata_HIDE_TITLE" value="<{$details->HIDE_TITLE}>" />
        <{else}>
    		<td class="form-row form-row-hide-title">
                <div class="form-field form-field-label">
        		    <label><{_t('Hide title')}></label>
                </div>
            </td>
            <td class="form-row form-row-hide-title" colspan="3">
                <div class="form-field form-field-value column-hide-title">
                                            

    <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="1" <{if $details->HIDE_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="0" <{if !$details->HIDE_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.HIDE_TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.HIDE_TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_TAB_ANCHOR_SECTION'])}>
    
        <{if $preset == 'IS_TAB_ANCHOR_SECTION'}>
            <input type="hidden" class="input-is-tab-anchor-section" name="pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_TAB_ANCHOR_SECTION']) && !$acleditablecolumns['IS_TAB_ANCHOR_SECTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_TAB_ANCHOR_SECTION'])}>
            <input type="hidden" class="input-is-tab-anchor-section" name="pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="<{$details->IS_TAB_ANCHOR_SECTION}>" />
        <{else}>
    		<td class="form-row form-row-is-tab-anchor-section">
                <div class="form-field form-field-label">
        		    <label><{_t('Tab anchor section?')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-tab-anchor-section" colspan="3">
                <div class="form-field form-field-value column-is-tab-anchor-section">
                                            

    <span class="input-type-radio"><input class="input-is-tab-anchor-section" type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="1" <{if $details->IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="0" <{if !$details->IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.IS_TAB_ANCHOR_SECTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_TAB_ANCHOR_SECTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TAB_ANCHOR_TITLE'])}>
    
        <{if $preset == 'TAB_ANCHOR_TITLE'}>
            <input type="hidden" class="input-tab-anchor-title" name="pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TAB_ANCHOR_TITLE']) && !$acleditablecolumns['TAB_ANCHOR_TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TAB_ANCHOR_TITLE'])}>
            <input type="hidden" class="input-tab-anchor-title" name="pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$details->TAB_ANCHOR_TITLE}>" />
        <{else}>
    		<td class="form-row form-row-tab-anchor-title">
                <div class="form-field form-field-label">
        		    <label><{_t('Tab anchor title')}></label>
                </div>
            </td>
            <td class="form-row form-row-tab-anchor-title" colspan="3">
                <div class="form-field form-field-value column-tab-anchor-title">
                                            

    <input class="input-tab-anchor-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$details->TAB_ANCHOR_TITLE|escape}>"  />
                        <{if $columntooltips.TAB_ANCHOR_TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TAB_ANCHOR_TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        </div>
        <!-- Custom layout rows end -->
    
    
    

                                                                    </div>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$( "#pagesection-view-layout-tabs-general-image-misc" ).tabs({
                		cookie: {
                			// store cookie for a day, without, it would be a session cookie
                			expires: 1
                		}
                	});
                });
                </script>
            </div>
        </div>
        <!-- Custom layout tabs end -->
    
        
        <{if $customfields}>
            <div class="layout-block layout-block-section">
                <div class="layout-section">
                    <div class="layout-section-header">
                        <span><{_t('Additional information')}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
                                <{foreach from=$customfields item=item}>
                                    <tr class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
                                		<td>
                                            <div class="form-field form-field-label">
                                    		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                                <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                                            </div>
                                        </td>
                            		</tr>
                            	<{/foreach}>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <{/if}>

        <{plugin key="pagesection_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('pagesection_formdata_TITLE', 'pagesection_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagesectionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#pagesectionform :input').change(function() {
        $('#pagesectionform').data('changed', true);
    });

        function saveDraft() {
        if ($('#pagesectionform').length) {
            if ($('#pagesectionform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/pagesection/savedraft/",
                    data: $('#pagesectionform').serialize()
                });

                $('#pagesectionform').data('changed', false);
            }
        }
    }

    $(function() {
        if (window.saveDraftTimer !== 'undefined' && window.saveDraftTimer != null) {
            window.clearInterval(window.saveDraftTimer);
        }

        window.saveDraftTimer = window.setInterval(saveDraft, <{$smarty.const.SAVE_DRAFT_INTERVAL}> * 1000);
    });
    </script>

<script type="text/javascript">
    $(function() {
        $('.message li').each(function(){
            var li = $(this);
            var field = li.data('error-field');
            var target = $('.input-' + field);

            target.closest('tr').addClass('form-row-with-error');

            li.css('cursor', 'pointer').click(function(){
                target.focus();
            });
        });
    });
</script>

<script type="text/javascript">
    ///////////////////////////////////////////////////////////////////////////////
    // VISIBILITY REFLECTION
    pagesection_get_editing_model = function () {
        var model = {};

        var formdata = $('#pagesectionform').find('[name*=pagesection_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('pagesection_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    pagesection_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    pagesection_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            pagesection_apply_block_visibility(key, value);
        });
    }

    pagesection_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    pagesection_update_visibility_settings = function () {
        var model = pagesection_get_editing_model();

        var settings = pagesection_get_visibility_settings(model);

        pagesection_apply_visibility_settings(settings);
    }

    $(function() {
        $('#pagesectionform :input').change(function() {
            pagesection_update_visibility_settings();
        });

        pagesection_update_visibility_settings();
    });
</script>
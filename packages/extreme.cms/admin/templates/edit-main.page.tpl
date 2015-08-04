<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="pageform" id="pageform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/page/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="page_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="page_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="page_form_top" args=$details}>

                        
    
    
            <!-- Custom layout tabs -->
        <div class="layout-block layout-block-tabs layout-block-tabs-bottom">
            <div id="page-view-layout-tabs-general-image-misc" class="layout-tabs view-layout-tabs page-view-layout-tabs" style="clear:both">
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
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="page_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="page_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Page name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>page_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="page_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="page_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Page title')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>page_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PARENT'])}>
    
        <{if $preset == 'PARENT'}>
            <input type="hidden" class="input-parent" name="page_formdata_PARENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PARENT']) && !$acleditablecolumns['PARENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PARENT'])}>
            <input type="hidden" class="input-parent" name="page_formdata_PARENT" value="<{$details->PARENT}>" />
        <{else}>
    		<td class="form-row form-row-parent">
                <div class="form-field form-field-label">
        		    <label><{_t('Parent')}></label>
                </div>
            </td>
            <td class="form-row form-row-parent" colspan="3">
                <div class="form-field form-field-value column-parent">
                                            
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`page_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>page_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                            <{if $columntooltips.PARENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PARENT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['SLUG'])}>
    
        <{if $preset == 'SLUG'}>
            <input type="hidden" class="input-slug" name="page_formdata_SLUG" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['SLUG']) && !$acleditablecolumns['SLUG'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['SLUG'])}>
            <input type="hidden" class="input-slug" name="page_formdata_SLUG" value="<{$details->SLUG}>" />
        <{else}>
    		<td class="form-row form-row-slug form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Slug')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-slug form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-slug">
                                            <{if $details->ID && $details->SLUG != ''}>
                            <input type="hidden" class="input-slug" name="page_formdata_SLUG" value="<{$details->SLUG}>" />
                            
    <{$details->SLUG|escape}>
                        <{else}>
                            

    <input class="input-slug input-type-text" type="text" name="<{$prefix}>page_formdata_SLUG" value="<{$details->SLUG|escape}>"  />
                            <{if $columntooltips.SLUG}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.SLUG}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TAG_LINE'])}>
    
        <{if $preset == 'TAG_LINE'}>
            <input type="hidden" class="input-tag-line" name="page_formdata_TAG_LINE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TAG_LINE']) && !$acleditablecolumns['TAG_LINE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TAG_LINE'])}>
            <input type="hidden" class="input-tag-line" name="page_formdata_TAG_LINE" value="<{$details->TAG_LINE}>" />
        <{else}>
    		<td class="form-row form-row-tag-line">
                <div class="form-field form-field-label">
        		    <label><{_t('Tag line')}></label>
                </div>
            </td>
            <td class="form-row form-row-tag-line" colspan="3">
                <div class="form-field form-field-value column-tag-line">
                                            

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>page_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
                        <{if $columntooltips.TAG_LINE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TAG_LINE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['META_KEYWORDS'])}>
    
        <{if $preset == 'META_KEYWORDS'}>
            <input type="hidden" class="input-meta-keywords" name="page_formdata_META_KEYWORDS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['META_KEYWORDS']) && !$acleditablecolumns['META_KEYWORDS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['META_KEYWORDS'])}>
            <input type="hidden" class="input-meta-keywords" name="page_formdata_META_KEYWORDS" value="<{$details->META_KEYWORDS}>" />
        <{else}>
    		<td class="form-row form-row-meta-keywords">
                <div class="form-field form-field-label">
        		    <label><{_t('Meta keywords')}></label>
                </div>
            </td>
            <td class="form-row form-row-meta-keywords" colspan="3">
                <div class="form-field form-field-value column-meta-keywords">
                                            

    <input class="input-meta-keywords input-type-text" type="text" name="<{$prefix}>page_formdata_META_KEYWORDS" value="<{$details->META_KEYWORDS|escape}>"  />
                        <{if $columntooltips.META_KEYWORDS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.META_KEYWORDS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['META_DESCRIPTION'])}>
    
        <{if $preset == 'META_DESCRIPTION'}>
            <input type="hidden" class="input-meta-description" name="page_formdata_META_DESCRIPTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['META_DESCRIPTION']) && !$acleditablecolumns['META_DESCRIPTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['META_DESCRIPTION'])}>
            <input type="hidden" class="input-meta-description" name="page_formdata_META_DESCRIPTION" value="<{$details->META_DESCRIPTION}>" />
        <{else}>
    		<td class="form-row form-row-meta-description">
                <div class="form-field form-field-label">
        		    <label><{_t('Meta description')}></label>
                </div>
            </td>
            <td class="form-row form-row-meta-description" colspan="3">
                <div class="form-field form-field-value column-meta-description">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-meta-description " id="<{$prefix}>page_formdata_META_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>page_formdata_META_DESCRIPTION" rows="5" ><{$details->META_DESCRIPTION}></textarea>
                        <{if $columntooltips.META_DESCRIPTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.META_DESCRIPTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_TEMPLATE'])}>
    
        <{if $preset == 'ID_TEMPLATE'}>
            <input type="hidden" class="input-id-template" name="page_formdata_ID_TEMPLATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_TEMPLATE']) && !$acleditablecolumns['ID_TEMPLATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_TEMPLATE'])}>
            <input type="hidden" class="input-id-template" name="page_formdata_ID_TEMPLATE" value="<{$details->ID_TEMPLATE}>" />
        <{else}>
    		<td class="form-row form-row-id-template form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Template')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-template form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-template">
                                            
            <{if Framework::hasModule('Template')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-template" class="input-id-template" name="`$prefix`page_formdata_ID_TEMPLATE" value=$details->ID_TEMPLATE text=$details->reftext_ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.template.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/template/new" title="Create a New Template">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-template input-type-text" type="text" name="<{$prefix}>page_formdata_ID_TEMPLATE" value="<{$details->ID_TEMPLATE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_TEMPLATE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_TEMPLATE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CONTENT'])}>
    
        <{if $preset == 'CONTENT'}>
            <input type="hidden" class="input-content" name="page_formdata_CONTENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONTENT']) && !$acleditablecolumns['CONTENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONTENT'])}>
            <input type="hidden" class="input-content" name="page_formdata_CONTENT" value="<{$details->CONTENT}>" />
        <{else}>
    		<td class="form-row form-row-content">
                <div class="form-field form-field-label">
        		    <label><{_t('Content')}></label>
                </div>
            </td>
            <td class="form-row form-row-content" colspan="3">
                <div class="form-field form-field-value column-content">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>page_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>page_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                        <{if $columntooltips.CONTENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CONTENT}>"></i>
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
    
            
        
        
        
        
<{if !isset($excludedcolumns['THUMB'])}>
    
        <{if $preset == 'THUMB'}>
            <input type="hidden" class="input-thumb" name="page_formdata_THUMB" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['THUMB']) && !$acleditablecolumns['THUMB'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['THUMB'])}>
            <input type="hidden" class="input-thumb" name="page_formdata_THUMB" value="<{$details->THUMB}>" />
        <{else}>
    		<td class="form-row form-row-thumb">
                <div class="form-field form-field-label">
        		    <label><{_t('Thumb')}></label>
                </div>
            </td>
            <td class="form-row form-row-thumb" colspan="3">
                <div class="form-field form-field-value column-thumb">
                                            

	<input class="input-thumb input-type-file" type="file" name="<{$prefix}>page_formdata_THUMB" />
    <span class="input-sizes-width-height"><input type="text" name="THUMB[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="THUMB[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->THUMB}><div style="clear:both"></div><span id="<{$prefix}>page_THUMB"><{media src=$details->THUMB}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_THUMB, '<{$details->THUMB}>', '<{$prefix}>page_THUMB')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>page_formdata_THUMB" value="<{$details->THUMB}>" />
                        <{if $columntooltips.THUMB}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.THUMB}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['BACKGROUND_IMAGE'])}>
    
        <{if $preset == 'BACKGROUND_IMAGE'}>
            <input type="hidden" class="input-background-image" name="page_formdata_BACKGROUND_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['BACKGROUND_IMAGE']) && !$acleditablecolumns['BACKGROUND_IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['BACKGROUND_IMAGE'])}>
            <input type="hidden" class="input-background-image" name="page_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
        <{else}>
    		<td class="form-row form-row-background-image">
                <div class="form-field form-field-label">
        		    <label><{_t('Background image')}></label>
                </div>
            </td>
            <td class="form-row form-row-background-image" colspan="3">
                <div class="form-field form-field-value column-background-image">
                                            

	<input class="input-background-image input-type-file" type="file" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>page_BACKGROUND_IMAGE"><{media src=$details->BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_BACKGROUND_IMAGE, '<{$details->BACKGROUND_IMAGE}>', '<{$prefix}>page_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
                        <{if $columntooltips.BACKGROUND_IMAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.BACKGROUND_IMAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
                        </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="page_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="page_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-row form-row-image">
                <div class="form-field form-field-label">
        		    <label><{_t('Image')}></label>
                </div>
            </td>
            <td class="form-row form-row-image" colspan="3">
                <div class="form-field form-field-value column-image">
                                            

	<input class="input-image input-type-file" type="file" name="<{$prefix}>page_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>page_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>page_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>page_formdata_IMAGE" value="<{$details->IMAGE}>" />
                        <{if $columntooltips.IMAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VIDEO'])}>
    
        <{if $preset == 'VIDEO'}>
            <input type="hidden" class="input-video" name="page_formdata_VIDEO" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIDEO']) && !$acleditablecolumns['VIDEO'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIDEO'])}>
            <input type="hidden" class="input-video" name="page_formdata_VIDEO" value="<{$details->VIDEO}>" />
        <{else}>
    		<td class="form-row form-row-video">
                <div class="form-field form-field-label">
        		    <label><{_t('Video')}></label>
                </div>
            </td>
            <td class="form-row form-row-video" colspan="3">
                <div class="form-field form-field-value column-video">
                                            

	<input class="input-video input-type-file" type="file" name="<{$prefix}>page_formdata_VIDEO" />
    <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->VIDEO}><div style="clear:both"></div><span id="<{$prefix}>page_VIDEO"><{media src=$details->VIDEO}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_VIDEO, '<{$details->VIDEO}>', '<{$prefix}>page_VIDEO')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>page_formdata_VIDEO" value="<{$details->VIDEO}>" />
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
    
            
        
        
        
        
<{if !isset($excludedcolumns['INTRODUCTION'])}>
    
        <{if $preset == 'INTRODUCTION'}>
            <input type="hidden" class="input-introduction" name="page_formdata_INTRODUCTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['INTRODUCTION']) && !$acleditablecolumns['INTRODUCTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['INTRODUCTION'])}>
            <input type="hidden" class="input-introduction" name="page_formdata_INTRODUCTION" value="<{$details->INTRODUCTION}>" />
        <{else}>
    		<td class="form-row form-row-introduction">
                <div class="form-field form-field-label">
        		    <label><{_t('Introduction')}></label>
                </div>
            </td>
            <td class="form-row form-row-introduction" colspan="3">
                <div class="form-field form-field-value column-introduction">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-introduction enable-html" id="<{$prefix}>page_formdata_INTRODUCTION_<{$tmpid}>" name="<{$prefix}>page_formdata_INTRODUCTION" rows="5" ><{$details->INTRODUCTION}></textarea>
                        <{if $columntooltips.INTRODUCTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.INTRODUCTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['FOOTER'])}>
    
        <{if $preset == 'FOOTER'}>
            <input type="hidden" class="input-footer" name="page_formdata_FOOTER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FOOTER']) && !$acleditablecolumns['FOOTER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FOOTER'])}>
            <input type="hidden" class="input-footer" name="page_formdata_FOOTER" value="<{$details->FOOTER}>" />
        <{else}>
    		<td class="form-row form-row-footer">
                <div class="form-field form-field-label">
        		    <label><{_t('Footer')}></label>
                </div>
            </td>
            <td class="form-row form-row-footer" colspan="3">
                <div class="form-field form-field-value column-footer">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-footer enable-html" id="<{$prefix}>page_formdata_FOOTER_<{$tmpid}>" name="<{$prefix}>page_formdata_FOOTER" rows="5" ><{$details->FOOTER}></textarea>
                        <{if $columntooltips.FOOTER}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.FOOTER}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ADDITIONAL_CSS'])}>
    
        <{if $preset == 'ADDITIONAL_CSS'}>
            <input type="hidden" class="input-additional-css" name="page_formdata_ADDITIONAL_CSS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ADDITIONAL_CSS']) && !$acleditablecolumns['ADDITIONAL_CSS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ADDITIONAL_CSS'])}>
            <input type="hidden" class="input-additional-css" name="page_formdata_ADDITIONAL_CSS" value="<{$details->ADDITIONAL_CSS}>" />
        <{else}>
    		<td class="form-row form-row-additional-css">
                <div class="form-field form-field-label">
        		    <label><{_t('Additional css')}></label>
                </div>
            </td>
            <td class="form-row form-row-additional-css" colspan="3">
                <div class="form-field form-field-value column-additional-css">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-additional-css " id="<{$prefix}>page_formdata_ADDITIONAL_CSS_<{$tmpid}>" name="<{$prefix}>page_formdata_ADDITIONAL_CSS" rows="5" ><{$details->ADDITIONAL_CSS}></textarea>
                        <{if $columntooltips.ADDITIONAL_CSS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ADDITIONAL_CSS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CUSTOM_TOP_ID_MENU'])}>
    
        <{if $preset == 'CUSTOM_TOP_ID_MENU'}>
            <input type="hidden" class="input-custom-top-id-menu" name="page_formdata_CUSTOM_TOP_ID_MENU" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOM_TOP_ID_MENU']) && !$acleditablecolumns['CUSTOM_TOP_ID_MENU'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOM_TOP_ID_MENU'])}>
            <input type="hidden" class="input-custom-top-id-menu" name="page_formdata_CUSTOM_TOP_ID_MENU" value="<{$details->CUSTOM_TOP_ID_MENU}>" />
        <{else}>
    		<td class="form-row form-row-custom-top-id-menu">
                <div class="form-field form-field-label">
        		    <label><{_t('Custom top menu')}></label>
                </div>
            </td>
            <td class="form-row form-row-custom-top-id-menu" colspan="3">
                <div class="form-field form-field-value column-custom-top-id-menu">
                                            
            <{if Framework::hasModule('Menu')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-custom-top-id-menu" class="input-custom-top-id-menu" name="`$prefix`page_formdata_CUSTOM_TOP_ID_MENU" value=$details->CUSTOM_TOP_ID_MENU text=$details->reftext_CUSTOM_TOP_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.menu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-custom-top-id-menu input-type-text" type="text" name="<{$prefix}>page_formdata_CUSTOM_TOP_ID_MENU" value="<{$details->CUSTOM_TOP_ID_MENU|escape}>"  />
        <{/if}>
                            <{if $columntooltips.CUSTOM_TOP_ID_MENU}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOM_TOP_ID_MENU}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CUSTOM_SIDE_ID_MENU'])}>
    
        <{if $preset == 'CUSTOM_SIDE_ID_MENU'}>
            <input type="hidden" class="input-custom-side-id-menu" name="page_formdata_CUSTOM_SIDE_ID_MENU" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOM_SIDE_ID_MENU']) && !$acleditablecolumns['CUSTOM_SIDE_ID_MENU'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOM_SIDE_ID_MENU'])}>
            <input type="hidden" class="input-custom-side-id-menu" name="page_formdata_CUSTOM_SIDE_ID_MENU" value="<{$details->CUSTOM_SIDE_ID_MENU}>" />
        <{else}>
    		<td class="form-row form-row-custom-side-id-menu">
                <div class="form-field form-field-label">
        		    <label><{_t('Custom side menu')}></label>
                </div>
            </td>
            <td class="form-row form-row-custom-side-id-menu" colspan="3">
                <div class="form-field form-field-value column-custom-side-id-menu">
                                            
            <{if Framework::hasModule('Menu')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-custom-side-id-menu" class="input-custom-side-id-menu" name="`$prefix`page_formdata_CUSTOM_SIDE_ID_MENU" value=$details->CUSTOM_SIDE_ID_MENU text=$details->reftext_CUSTOM_SIDE_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.menu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-custom-side-id-menu input-type-text" type="text" name="<{$prefix}>page_formdata_CUSTOM_SIDE_ID_MENU" value="<{$details->CUSTOM_SIDE_ID_MENU|escape}>"  />
        <{/if}>
                            <{if $columntooltips.CUSTOM_SIDE_ID_MENU}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOM_SIDE_ID_MENU}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VIEW_MORE_TITLE'])}>
    
        <{if $preset == 'VIEW_MORE_TITLE'}>
            <input type="hidden" class="input-view-more-title" name="page_formdata_VIEW_MORE_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIEW_MORE_TITLE']) && !$acleditablecolumns['VIEW_MORE_TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIEW_MORE_TITLE'])}>
            <input type="hidden" class="input-view-more-title" name="page_formdata_VIEW_MORE_TITLE" value="<{$details->VIEW_MORE_TITLE}>" />
        <{else}>
    		<td class="form-row form-row-view-more-title">
                <div class="form-field form-field-label">
        		    <label><{_t('View more title')}></label>
                </div>
            </td>
            <td class="form-row form-row-view-more-title" colspan="3">
                <div class="form-field form-field-value column-view-more-title">
                                            

    <input class="input-view-more-title input-type-text" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_TITLE" value="<{$details->VIEW_MORE_TITLE|escape}>"  />
                        <{if $columntooltips.VIEW_MORE_TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VIEW_MORE_TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VIEW_MORE_ID_PAGE'])}>
    
        <{if $preset == 'VIEW_MORE_ID_PAGE'}>
            <input type="hidden" class="input-view-more-id-page" name="page_formdata_VIEW_MORE_ID_PAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIEW_MORE_ID_PAGE']) && !$acleditablecolumns['VIEW_MORE_ID_PAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIEW_MORE_ID_PAGE'])}>
            <input type="hidden" class="input-view-more-id-page" name="page_formdata_VIEW_MORE_ID_PAGE" value="<{$details->VIEW_MORE_ID_PAGE}>" />
        <{else}>
    		<td class="form-row form-row-view-more-id-page">
                <div class="form-field form-field-label">
        		    <label><{_t('View more page')}></label>
                </div>
            </td>
            <td class="form-row form-row-view-more-id-page" colspan="3">
                <div class="form-field form-field-value column-view-more-id-page">
                                            
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-view-more-id-page" class="input-view-more-id-page" name="`$prefix`page_formdata_VIEW_MORE_ID_PAGE" value=$details->VIEW_MORE_ID_PAGE text=$details->reftext_VIEW_MORE_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-view-more-id-page input-type-text" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_ID_PAGE" value="<{$details->VIEW_MORE_ID_PAGE|escape}>"  />
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
            <input type="hidden" class="input-view-more-link" name="page_formdata_VIEW_MORE_LINK" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIEW_MORE_LINK']) && !$acleditablecolumns['VIEW_MORE_LINK'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIEW_MORE_LINK'])}>
            <input type="hidden" class="input-view-more-link" name="page_formdata_VIEW_MORE_LINK" value="<{$details->VIEW_MORE_LINK}>" />
        <{else}>
    		<td class="form-row form-row-view-more-link">
                <div class="form-field form-field-label">
        		    <label><{_t('View more link')}></label>
                </div>
            </td>
            <td class="form-row form-row-view-more-link" colspan="3">
                <div class="form-field form-field-value column-view-more-link">
                                            

    <input class="input-view-more-link input-type-text" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_LINK" value="<{$details->VIEW_MORE_LINK|escape}>"  />
                        <{if $columntooltips.VIEW_MORE_LINK}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VIEW_MORE_LINK}>"></i>
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
                	$( "#page-view-layout-tabs-general-image-misc" ).tabs({
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

        <{plugin key="page_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('page_formdata_NAME', 'page_formdata_SLUG');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#pageform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#pageform :input').change(function() {
        $('#pageform').data('changed', true);
    });

        function saveDraft() {
        if ($('#pageform').length) {
            if ($('#pageform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/page/savedraft/",
                    data: $('#pageform').serialize()
                });

                $('#pageform').data('changed', false);
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
    page_get_editing_model = function () {
        var model = {};

        var formdata = $('#pageform').find('[name*=page_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('page_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    page_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    page_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            page_apply_block_visibility(key, value);
        });
    }

    page_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    page_update_visibility_settings = function () {
        var model = page_get_editing_model();

        var settings = page_get_visibility_settings(model);

        page_apply_visibility_settings(settings);
    }

    $(function() {
        $('#pageform :input').change(function() {
            page_update_visibility_settings();
        });

        page_update_visibility_settings();
    });
</script>
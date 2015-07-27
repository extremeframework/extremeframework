<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="postform" id="postform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/post/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="post_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="post_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="post_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="post_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="post_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Post title')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>post_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['SLUG'])}>
    
        <{if $preset == 'SLUG'}>
            <input type="hidden" class="input-slug" name="post_formdata_SLUG" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['SLUG']) && !$acleditablecolumns['SLUG'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['SLUG'])}>
            <input type="hidden" class="input-slug" name="post_formdata_SLUG" value="<{$details->SLUG}>" />
        <{else}>
    		<td class="form-row form-row-slug form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Slug')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-slug form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-slug">
                                            <{if $details->ID && $details->SLUG != ''}>
                            <input type="hidden" class="input-slug" name="post_formdata_SLUG" value="<{$details->SLUG}>" />
                            
    <{$details->SLUG|escape}>
                        <{else}>
                            

    <input class="input-slug input-type-text" type="text" name="<{$prefix}>post_formdata_SLUG" value="<{$details->SLUG|escape}>"  />
                            <{if $columntooltips.SLUG}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.SLUG}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_POST_TYPE'])}>
    
        <{if $preset == 'ID_POST_TYPE'}>
            <input type="hidden" class="input-id-post-type" name="post_formdata_ID_POST_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST_TYPE']) && !$acleditablecolumns['ID_POST_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST_TYPE'])}>
            <input type="hidden" class="input-id-post-type" name="post_formdata_ID_POST_TYPE" value="<{$details->ID_POST_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-post-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Post type')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-post-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-post-type">
                                            
            <{if Framework::hasModule('PostType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-post-type" class="input-id-post-type" name="`$prefix`post_formdata_ID_POST_TYPE" value=$details->ID_POST_TYPE text=$details->reftext_ID_POST_TYPE datasource="POST_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.posttype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/posttype/new" title="Create a New Post Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post-type input-type-text" type="text" name="<{$prefix}>post_formdata_ID_POST_TYPE" value="<{$details->ID_POST_TYPE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_POST_TYPE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST_TYPE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_POST_CATEGORY'])}>
    
        <{if $preset == 'ID_POST_CATEGORY'}>
            <input type="hidden" class="input-id-post-category" name="post_formdata_ID_POST_CATEGORY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST_CATEGORY']) && !$acleditablecolumns['ID_POST_CATEGORY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST_CATEGORY'])}>
            <input type="hidden" class="input-id-post-category" name="post_formdata_ID_POST_CATEGORY" value="<{$details->ID_POST_CATEGORY}>" />
        <{else}>
    		<td class="form-row form-row-id-post-category">
                <div class="form-field form-field-label">
        		    <label><{_t('Post category')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-post-category" colspan="3">
                <div class="form-field form-field-value column-id-post-category">
                                            
            <{if Framework::hasModule('PostCategory')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-post-category" class="input-id-post-category" name="`$prefix`post_formdata_ID_POST_CATEGORY" value=$details->ID_POST_CATEGORY text=$details->reftext_ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.postcategory.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new" title="Create a New Post Category">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post-category input-type-text" type="text" name="<{$prefix}>post_formdata_ID_POST_CATEGORY" value="<{$details->ID_POST_CATEGORY|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_POST_CATEGORY}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST_CATEGORY}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="post_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="post_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-row form-row-image">
                <div class="form-field form-field-label">
        		    <label><{_t('Image')}></label>
                </div>
            </td>
            <td class="form-row form-row-image" colspan="3">
                <div class="form-field form-field-value column-image">
                                            

	<input class="input-image input-type-file" type="file" name="<{$prefix}>post_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>post_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.postform.<{$prefix}>post_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>post_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>post_formdata_IMAGE" value="<{$details->IMAGE}>" />
                        <{if $columntooltips.IMAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['META_KEYWORDS'])}>
    
        <{if $preset == 'META_KEYWORDS'}>
            <input type="hidden" class="input-meta-keywords" name="post_formdata_META_KEYWORDS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['META_KEYWORDS']) && !$acleditablecolumns['META_KEYWORDS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['META_KEYWORDS'])}>
            <input type="hidden" class="input-meta-keywords" name="post_formdata_META_KEYWORDS" value="<{$details->META_KEYWORDS}>" />
        <{else}>
    		<td class="form-row form-row-meta-keywords">
                <div class="form-field form-field-label">
        		    <label><{_t('Meta keywords')}></label>
                </div>
            </td>
            <td class="form-row form-row-meta-keywords" colspan="3">
                <div class="form-field form-field-value column-meta-keywords">
                                            

    <input class="input-meta-keywords input-type-text" type="text" name="<{$prefix}>post_formdata_META_KEYWORDS" value="<{$details->META_KEYWORDS|escape}>"  />
                        <{if $columntooltips.META_KEYWORDS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.META_KEYWORDS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['META_DESCRIPTION'])}>
    
        <{if $preset == 'META_DESCRIPTION'}>
            <input type="hidden" class="input-meta-description" name="post_formdata_META_DESCRIPTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['META_DESCRIPTION']) && !$acleditablecolumns['META_DESCRIPTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['META_DESCRIPTION'])}>
            <input type="hidden" class="input-meta-description" name="post_formdata_META_DESCRIPTION" value="<{$details->META_DESCRIPTION}>" />
        <{else}>
    		<td class="form-row form-row-meta-description">
                <div class="form-field form-field-label">
        		    <label><{_t('Meta description')}></label>
                </div>
            </td>
            <td class="form-row form-row-meta-description" colspan="3">
                <div class="form-field form-field-value column-meta-description">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-meta-description " id="<{$prefix}>post_formdata_META_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>post_formdata_META_DESCRIPTION" rows="5" ><{$details->META_DESCRIPTION}></textarea>
                        <{if $columntooltips.META_DESCRIPTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.META_DESCRIPTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['EXCERPT'])}>
    
        <{if $preset == 'EXCERPT'}>
            <input type="hidden" class="input-excerpt" name="post_formdata_EXCERPT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['EXCERPT']) && !$acleditablecolumns['EXCERPT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['EXCERPT'])}>
            <input type="hidden" class="input-excerpt" name="post_formdata_EXCERPT" value="<{$details->EXCERPT}>" />
        <{else}>
    		<td class="form-row form-row-excerpt">
                <div class="form-field form-field-label">
        		    <label><{_t('Excerpt')}></label>
                </div>
            </td>
            <td class="form-row form-row-excerpt" colspan="3">
                <div class="form-field form-field-value column-excerpt">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-excerpt enable-html" id="<{$prefix}>post_formdata_EXCERPT_<{$tmpid}>" name="<{$prefix}>post_formdata_EXCERPT" rows="5" ><{$details->EXCERPT}></textarea>
                        <{if $columntooltips.EXCERPT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.EXCERPT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CONTENT'])}>
    
        <{if $preset == 'CONTENT'}>
            <input type="hidden" class="input-content" name="post_formdata_CONTENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONTENT']) && !$acleditablecolumns['CONTENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONTENT'])}>
            <input type="hidden" class="input-content" name="post_formdata_CONTENT" value="<{$details->CONTENT}>" />
        <{else}>
    		<td class="form-row form-row-content">
                <div class="form-field form-field-label">
        		    <label><{_t('Content')}></label>
                </div>
            </td>
            <td class="form-row form-row-content" colspan="3">
                <div class="form-field form-field-value column-content">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>post_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>post_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                        <{if $columntooltips.CONTENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CONTENT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TAGS'])}>
    
        <{if $preset == 'TAGS'}>
            <input type="hidden" class="input-tags" name="post_formdata_TAGS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TAGS']) && !$acleditablecolumns['TAGS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TAGS'])}>
            <input type="hidden" class="input-tags" name="post_formdata_TAGS" value="<{$details->TAGS}>" />
        <{else}>
    		<td class="form-row form-row-tags">
                <div class="form-field form-field-label">
        		    <label><{_t('Tags')}></label>
                </div>
            </td>
            <td class="form-row form-row-tags" colspan="3">
                <div class="form-field form-field-value column-tags">
                                            

    <input class="input-tags input-type-text" type="text" name="<{$prefix}>post_formdata_TAGS" value="<{$details->TAGS|escape}>"  />
                        <{if $columntooltips.TAGS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TAGS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['AUTHOR'])}>
    
        <{if $preset == 'AUTHOR'}>
            <input type="hidden" class="input-author" name="post_formdata_AUTHOR" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['AUTHOR']) && !$acleditablecolumns['AUTHOR'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['AUTHOR'])}>
            <input type="hidden" class="input-author" name="post_formdata_AUTHOR" value="<{$details->AUTHOR}>" />
        <{else}>
    		<td class="form-row form-row-author">
                <div class="form-field form-field-label">
        		    <label><{_t('Author')}></label>
                </div>
            </td>
            <td class="form-row form-row-author" colspan="3">
                <div class="form-field form-field-value column-author">
                                            

    <input class="input-author input-type-text" type="text" name="<{$prefix}>post_formdata_AUTHOR" value="<{$details->AUTHOR|escape}>"  />
                        <{if $columntooltips.AUTHOR}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.AUTHOR}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['EXTERNAL_LINK'])}>
    
        <{if $preset == 'EXTERNAL_LINK'}>
            <input type="hidden" class="input-external-link" name="post_formdata_EXTERNAL_LINK" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['EXTERNAL_LINK']) && !$acleditablecolumns['EXTERNAL_LINK'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['EXTERNAL_LINK'])}>
            <input type="hidden" class="input-external-link" name="post_formdata_EXTERNAL_LINK" value="<{$details->EXTERNAL_LINK}>" />
        <{else}>
    		<td class="form-row form-row-external-link">
                <div class="form-field form-field-label">
        		    <label><{_t('External link')}></label>
                </div>
            </td>
            <td class="form-row form-row-external-link" colspan="3">
                <div class="form-field form-field-value column-external-link">
                                            

    <input class="input-external-link input-type-text" type="text" name="<{$prefix}>post_formdata_EXTERNAL_LINK" value="<{$details->EXTERNAL_LINK|escape}>"  />
                        <{if $columntooltips.EXTERNAL_LINK}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.EXTERNAL_LINK}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_TEMPLATE'])}>
    
        <{if $preset == 'ID_TEMPLATE'}>
            <input type="hidden" class="input-id-template" name="post_formdata_ID_TEMPLATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_TEMPLATE']) && !$acleditablecolumns['ID_TEMPLATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_TEMPLATE'])}>
            <input type="hidden" class="input-id-template" name="post_formdata_ID_TEMPLATE" value="<{$details->ID_TEMPLATE}>" />
        <{else}>
    		<td class="form-row form-row-id-template form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Template')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-template form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-template">
                                            
            <{if Framework::hasModule('Template')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-template" class="input-id-template" name="`$prefix`post_formdata_ID_TEMPLATE" value=$details->ID_TEMPLATE text=$details->reftext_ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.template.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/template/new" title="Create a New Template">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-template input-type-text" type="text" name="<{$prefix}>post_formdata_ID_TEMPLATE" value="<{$details->ID_TEMPLATE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_TEMPLATE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_TEMPLATE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
                    </tr>                                                                                            <tr>
    
            
        
        
                    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_FEATURED'])}>
    
        <{if $preset == 'IS_FEATURED'}>
            <input type="hidden" class="input-is-featured" name="post_formdata_IS_FEATURED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_FEATURED']) && !$acleditablecolumns['IS_FEATURED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_FEATURED'])}>
            <input type="hidden" class="input-is-featured" name="post_formdata_IS_FEATURED" value="<{$details->IS_FEATURED}>" />
        <{else}>
    		<td class="form-row form-row-is-featured">
                <div class="form-field form-field-label">
        		    <label><{_t('Featured?')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-featured" colspan="3">
                <div class="form-field form-field-value column-is-featured">
                                            

    <span class="input-type-radio"><input class="input-is-featured" type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="1" <{if $details->IS_FEATURED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="0" <{if !$details->IS_FEATURED}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.IS_FEATURED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_FEATURED}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
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

        <{plugin key="post_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('post_formdata_TITLE', 'post_formdata_SLUG');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#postform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#postform :input').change(function() {
        $('#postform').data('changed', true);
    });

        function saveDraft() {
        if ($('#postform').length) {
            if ($('#postform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/post/savedraft/",
                    data: $('#postform').serialize()
                });

                $('#postform').data('changed', false);
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
    post_get_editing_model = function () {
        var model = {};

        var formdata = $('#postform').find('[name*=post_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('post_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    post_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    post_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            post_apply_block_visibility(key, value);
        });
    }

    post_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    post_update_visibility_settings = function () {
        var model = post_get_editing_model();

        var settings = post_get_visibility_settings(model);

        post_apply_visibility_settings(settings);
    }

    $(function() {
        $('#postform :input').change(function() {
            post_update_visibility_settings();
        });

        post_update_visibility_settings();
    });
</script>
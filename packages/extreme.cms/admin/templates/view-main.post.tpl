<div class="view-main">
    <{plugin key="post_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{label key="L_TITLE"}></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
            	<div class="attribute-line column-title type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TITLE']) && $acleditablecolumns['TITLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TITLE']) || $acleditablecolumns['TITLE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TITLE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>post_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TITLE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['SLUG']) && ((isset($aclviewablecolumns['SLUG']) && $aclviewablecolumns['SLUG']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SLUG']) || $aclviewablecolumns['SLUG']))) }>
        <{if !isset($columns2hide) || !in_array('SLUG', $columns2hide) }>
    		<td class="form-field form-field-label column-slug">
	            		        <label class="attribute-name"><{label key="L_SLUG"}></label>
            </td>
            <td class="form-field form-field-value column-slug" colspan="3">
            	<div class="attribute-line column-slug type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['SLUG']) && $acleditablecolumns['SLUG']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['SLUG']) || $acleditablecolumns['SLUG'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->SLUG|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-slug input-type-text" type="text" name="<{$prefix}>post_formdata_SLUG" value="<{$details->SLUG|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->SLUG|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_POST_TYPE']) && ((isset($aclviewablecolumns['ID_POST_TYPE']) && $aclviewablecolumns['ID_POST_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_TYPE']) || $aclviewablecolumns['ID_POST_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_POST_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-post-type">
	                    		                    		        <label class="attribute-name"><{label key="L_POST_TYPE"}></label>
            </td>
            <td class="form-field form-field-value column-id-post-type" colspan="3">
            	<div class="attribute-line column-id-post-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_POST_TYPE']) && $acleditablecolumns['ID_POST_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_POST_TYPE']) || $acleditablecolumns['ID_POST_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_POST_TYPE}>
        <{if isset($smarty.session.acl.posttype.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/posttype/view/<{$details->refuuid_ID_POST_TYPE}>"><{$details->reftext_ID_POST_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('PostType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-post-type" class="input-id-post-type" name="`$prefix`post_formdata_ID_POST_TYPE" value=$details->ID_POST_TYPE text=$details->reftext_ID_POST_TYPE datasource="POST_TYPE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/posttype/new" title="Create a New Post Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-post-type input-type-text" type="text" name="<{$prefix}>post_formdata_ID_POST_TYPE" value="<{$details->ID_POST_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_POST_TYPE}>
        <{if isset($smarty.session.acl.posttype.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/posttype/view/<{$details->refuuid_ID_POST_TYPE}>"><{$details->reftext_ID_POST_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST_TYPE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_POST_CATEGORY']) && ((isset($aclviewablecolumns['ID_POST_CATEGORY']) && $aclviewablecolumns['ID_POST_CATEGORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_CATEGORY']) || $aclviewablecolumns['ID_POST_CATEGORY']))) }>
        <{if !isset($columns2hide) || !in_array('ID_POST_CATEGORY', $columns2hide) }>
    		<td class="form-field form-field-label column-id-post-category">
	                    		        	                <{if isset($smarty.session.acl.postcategory.view)}>
    	                    <{if $details->ID_POST_CATEGORY}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="postcategory" data-id="<{$details->refuuid_ID_POST_CATEGORY}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{label key="L_POST_CATEGORY"}></label>
            </td>
            <td class="form-field form-field-value column-id-post-category" colspan="3">
            	<div class="attribute-line column-id-post-category type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_POST_CATEGORY']) && $acleditablecolumns['ID_POST_CATEGORY']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_POST_CATEGORY']) || $acleditablecolumns['ID_POST_CATEGORY'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_POST_CATEGORY}>
        <{if isset($smarty.session.acl.postcategory.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/view/<{$details->refuuid_ID_POST_CATEGORY}>"><{$details->reftext_ID_POST_CATEGORY|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST_CATEGORY|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST_CATEGORY}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('PostCategory')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-post-category" class="input-id-post-category" name="`$prefix`post_formdata_ID_POST_CATEGORY" value=$details->ID_POST_CATEGORY text=$details->reftext_ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new" title="Create a New Post Category">+</a>
                </span>
                    <{else}>
            <input class="input-id-post-category input-type-text" type="text" name="<{$prefix}>post_formdata_ID_POST_CATEGORY" value="<{$details->ID_POST_CATEGORY|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_POST_CATEGORY}>
        <{if isset($smarty.session.acl.postcategory.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/view/<{$details->refuuid_ID_POST_CATEGORY}>"><{$details->reftext_ID_POST_CATEGORY|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST_CATEGORY|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST_CATEGORY}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-image">
	            		        <label class="attribute-name"><{label key="L_IMAGE"}></label>
            </td>
            <td class="form-field form-field-value column-image" colspan="3">
            	<div class="attribute-line column-image type-image">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IMAGE']) && $acleditablecolumns['IMAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IMAGE']) || $acleditablecolumns['IMAGE'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->IMAGE thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>post_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>post_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.postform.<{$prefix}>post_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>post_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>post_formdata_IMAGE" value="<{$details->IMAGE}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->IMAGE thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
        <{if !isset($columns2hide) || !in_array('META_KEYWORDS', $columns2hide) }>
    		<td class="form-field form-field-label column-meta-keywords">
	            		        <label class="attribute-name"><{label key="L_META_KEYWORDS"}></label>
            </td>
            <td class="form-field form-field-value column-meta-keywords" colspan="3">
            	<div class="attribute-line column-meta-keywords type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['META_KEYWORDS']) && $acleditablecolumns['META_KEYWORDS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['META_KEYWORDS']) || $acleditablecolumns['META_KEYWORDS'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->META_KEYWORDS|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-meta-keywords input-type-text" type="text" name="<{$prefix}>post_formdata_META_KEYWORDS" value="<{$details->META_KEYWORDS|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->META_KEYWORDS|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['META_DESCRIPTION']) && ((isset($aclviewablecolumns['META_DESCRIPTION']) && $aclviewablecolumns['META_DESCRIPTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_DESCRIPTION']) || $aclviewablecolumns['META_DESCRIPTION']))) }>
        <{if !isset($columns2hide) || !in_array('META_DESCRIPTION', $columns2hide) }>
    		<td class="form-field form-field-label column-meta-description">
	            		        <label class="attribute-name"><{label key="L_META_DESCRIPTION"}></label>
            </td>
            <td class="form-field form-field-value column-meta-description" colspan="3">
            	<div class="attribute-line column-meta-description type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['META_DESCRIPTION']) && $acleditablecolumns['META_DESCRIPTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['META_DESCRIPTION']) || $acleditablecolumns['META_DESCRIPTION'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->META_DESCRIPTION|escape|nl2br|plugin:"post_view_field_META_DESCRIPTION":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-meta-description " id="<{$prefix}>post_formdata_META_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>post_formdata_META_DESCRIPTION" rows="5" ><{$details->META_DESCRIPTION}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->META_DESCRIPTION|escape|nl2br|plugin:"post_view_field_META_DESCRIPTION":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['EXCERPT']) && ((isset($aclviewablecolumns['EXCERPT']) && $aclviewablecolumns['EXCERPT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EXCERPT']) || $aclviewablecolumns['EXCERPT']))) }>
        <{if !isset($columns2hide) || !in_array('EXCERPT', $columns2hide) }>
    		<td class="form-field form-field-label column-excerpt">
	            		        <label class="attribute-name"><{label key="L_EXCERPT"}></label>
            </td>
            <td class="form-field form-field-value column-excerpt" colspan="3">
            	<div class="attribute-line column-excerpt type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['EXCERPT']) && $acleditablecolumns['EXCERPT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['EXCERPT']) || $acleditablecolumns['EXCERPT'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->EXCERPT|plugin:"post_view_field_EXCERPT":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-excerpt enable-html" id="<{$prefix}>post_formdata_EXCERPT_<{$tmpid}>" name="<{$prefix}>post_formdata_EXCERPT" rows="5" ><{$details->EXCERPT}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->EXCERPT|plugin:"post_view_field_EXCERPT":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CONTENT']) && ((isset($aclviewablecolumns['CONTENT']) && $aclviewablecolumns['CONTENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONTENT']) || $aclviewablecolumns['CONTENT']))) }>
        <{if !isset($columns2hide) || !in_array('CONTENT', $columns2hide) }>
    		<td class="form-field form-field-label column-content">
	            		        <label class="attribute-name"><{label key="L_CONTENT"}></label>
            </td>
            <td class="form-field form-field-value column-content" colspan="3">
            	<div class="attribute-line column-content type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CONTENT']) && $acleditablecolumns['CONTENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CONTENT']) || $acleditablecolumns['CONTENT'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->CONTENT|plugin:"post_view_field_CONTENT":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>post_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>post_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->CONTENT|plugin:"post_view_field_CONTENT":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TAGS']) && ((isset($aclviewablecolumns['TAGS']) && $aclviewablecolumns['TAGS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAGS']) || $aclviewablecolumns['TAGS']))) }>
        <{if !isset($columns2hide) || !in_array('TAGS', $columns2hide) }>
    		<td class="form-field form-field-label column-tags">
	            		        <label class="attribute-name"><{label key="L_TAGS"}></label>
            </td>
            <td class="form-field form-field-value column-tags" colspan="3">
            	<div class="attribute-line column-tags type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TAGS']) && $acleditablecolumns['TAGS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TAGS']) || $acleditablecolumns['TAGS'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TAGS|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-tags input-type-text" type="text" name="<{$prefix}>post_formdata_TAGS" value="<{$details->TAGS|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TAGS|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['AUTHOR']) && ((isset($aclviewablecolumns['AUTHOR']) && $aclviewablecolumns['AUTHOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AUTHOR']) || $aclviewablecolumns['AUTHOR']))) }>
        <{if !isset($columns2hide) || !in_array('AUTHOR', $columns2hide) }>
    		<td class="form-field form-field-label column-author">
	            		        <label class="attribute-name"><{label key="L_AUTHOR"}></label>
            </td>
            <td class="form-field form-field-value column-author" colspan="3">
            	<div class="attribute-line column-author type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['AUTHOR']) && $acleditablecolumns['AUTHOR']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['AUTHOR']) || $acleditablecolumns['AUTHOR'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->AUTHOR|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-author input-type-text" type="text" name="<{$prefix}>post_formdata_AUTHOR" value="<{$details->AUTHOR|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->AUTHOR|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['EXTERNAL_LINK']) && ((isset($aclviewablecolumns['EXTERNAL_LINK']) && $aclviewablecolumns['EXTERNAL_LINK']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EXTERNAL_LINK']) || $aclviewablecolumns['EXTERNAL_LINK']))) }>
        <{if !isset($columns2hide) || !in_array('EXTERNAL_LINK', $columns2hide) }>
    		<td class="form-field form-field-label column-external-link">
	            		        <label class="attribute-name"><{label key="L_EXTERNAL_LINK"}></label>
            </td>
            <td class="form-field form-field-value column-external-link" colspan="3">
            	<div class="attribute-line column-external-link type-url">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['EXTERNAL_LINK']) && $acleditablecolumns['EXTERNAL_LINK']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['EXTERNAL_LINK']) || $acleditablecolumns['EXTERNAL_LINK'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->EXTERNAL_LINK|shorten_link:128}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-external-link input-type-text" type="text" name="<{$prefix}>post_formdata_EXTERNAL_LINK" value="<{$details->EXTERNAL_LINK|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->EXTERNAL_LINK|shorten_link:128}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_TEMPLATE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-template">
	                    		                    		        <label class="attribute-name"><{label key="L_TEMPLATE"}></label>
            </td>
            <td class="form-field form-field-value column-id-template" colspan="3">
            	<div class="attribute-line column-id-template type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_TEMPLATE']) && $acleditablecolumns['ID_TEMPLATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_TEMPLATE']) || $acleditablecolumns['ID_TEMPLATE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_TEMPLATE}>
        <{if isset($smarty.session.acl.template.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/template/view/<{$details->refuuid_ID_TEMPLATE}>"><{$details->reftext_ID_TEMPLATE|escape}></a>
        <{else}>
            <{$details->reftext_ID_TEMPLATE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_TEMPLATE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Template')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-template" class="input-id-template" name="`$prefix`post_formdata_ID_TEMPLATE" value=$details->ID_TEMPLATE text=$details->reftext_ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/template/new" title="Create a New Template">+</a>
                </span>
                    <{else}>
            <input class="input-id-template input-type-text" type="text" name="<{$prefix}>post_formdata_ID_TEMPLATE" value="<{$details->ID_TEMPLATE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_TEMPLATE}>
        <{if isset($smarty.session.acl.template.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/template/view/<{$details->refuuid_ID_TEMPLATE}>"><{$details->reftext_ID_TEMPLATE|escape}></a>
        <{else}>
            <{$details->reftext_ID_TEMPLATE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_TEMPLATE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
        <{if !isset($columns2hide) || !in_array('CREATION_DATE', $columns2hide) }>
    		<td class="form-field form-field-label column-creation-date">
	            		        <label class="attribute-name"><{label key="L_CREATION_DATE"}></label>
            </td>
            <td class="form-field form-field-value column-creation-date" colspan="3">
            	<div class="attribute-line column-creation-date type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CREATION_DATE']) && $acleditablecolumns['CREATION_DATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CREATION_DATE']) || $acleditablecolumns['CREATION_DATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CREATION_DATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-creation-date input-type-date field-date" type="text" id="<{$prefix}>post_formdata_CREATION_DATE" name="<{$prefix}>post_formdata_CREATION_DATE" value="<{$details->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CREATION_DATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
        <{if !isset($columns2hide) || !in_array('LATEST_UPDATE', $columns2hide) }>
    		<td class="form-field form-field-label column-latest-update">
	            		        <label class="attribute-name"><{label key="L_LATEST_UPDATE"}></label>
            </td>
            <td class="form-field form-field-value column-latest-update" colspan="3">
            	<div class="attribute-line column-latest-update type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LATEST_UPDATE']) && $acleditablecolumns['LATEST_UPDATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LATEST_UPDATE']) || $acleditablecolumns['LATEST_UPDATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->LATEST_UPDATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-latest-update input-type-date field-date" type="text" id="<{$prefix}>post_formdata_LATEST_UPDATE" name="<{$prefix}>post_formdata_LATEST_UPDATE" value="<{$details->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->LATEST_UPDATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IS_FEATURED']) && ((isset($aclviewablecolumns['IS_FEATURED']) && $aclviewablecolumns['IS_FEATURED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_FEATURED']) || $aclviewablecolumns['IS_FEATURED']))) }>
        <{if !isset($columns2hide) || !in_array('IS_FEATURED', $columns2hide) }>
    		<td class="form-field form-field-label column-is-featured">
	            		        <label class="attribute-name"><{label key="L_IS_FEATURED"}></label>
            </td>
            <td class="form-field form-field-value column-is-featured" colspan="3">
            	<div class="attribute-line column-is-featured type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IS_FEATURED']) && $acleditablecolumns['IS_FEATURED']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IS_FEATURED']) || $acleditablecolumns['IS_FEATURED'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->IS_FEATURED}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-is-featured" type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="1" <{if $details->IS_FEATURED}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="0" <{if !$details->IS_FEATURED}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->IS_FEATURED}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
        <{if !isset($columns2hide) || !in_array('NBR_VIEWS', $columns2hide) }>
    		<td class="form-field form-field-label column-nbr-views">
	            		        <label class="attribute-name"><{label key="L_NBR_VIEWS"}></label>
            </td>
            <td class="form-field form-field-value column-nbr-views" colspan="3">
            	<div class="attribute-line column-nbr-views type-number">
            		<div class="attribute-value">
            		                                
        <span class="number number-format"><{if $details->NBR_VIEWS != 0}><{$details->NBR_VIEWS}><{/if}></span>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                            </tbody>
        </table>
    	<!-- Standard layout columns end -->
    
    <{if $customfields}>
        <div class="layout-block layout-block-section">
            <div class="layout-section">
                <div class="layout-section-header">
                    <span><{label text="L_ADDITIONAL_INFORMATION"}></span>
                    <div class="header-arrow"></div>
                    <div class="clearer"></div>
                </div>
                <div class="layout-section-content">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$customfields item=item}>
                                <tr>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{label text=$item->NAME}></label>
                                    </td>
                                    <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                    	<div class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>>
                                    		<div class="attribute-value">
                                                <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                                    		</div>
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

    <{foreach from=$additional_view_fields item=item}>
    	<div class="attribute-line custom-field type-<{$item.type}>">
    		<label class="attribute-name"><{$item.label}></label>
    		<div class="attribute-value">
                <{$item.value}>
    		</div>
    	</div>
	<{/foreach}>

    <{plugin key="post_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        postview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        postview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                postview_apply_block_visibility(key, value);
            });
        }

        postview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        postview_update_visibility_settings = function () {
            var settings = postview_get_visibility_settings();

            postview_apply_visibility_settings(settings);
        }

        $(function() {
            postview_update_visibility_settings();
        });

        $(function() {
            // x. Row expanders
            $('.view-main .view-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);
                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var module = expander.data('module');
                var id = expander.data('id');

                // Hide others
                table.find('tr').not(tr).find('.view-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.view-embedded-view').not('tr.' + module + '-view-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.' + module + '-view-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/" + module + "/rowExpandedView/" + id + "?source=view&colcount=4"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
            });

//            // x. Onfly view edit
//            $('td.form-field-value').die('click').live('click', function(){
//                var td = $(this);
//
//                var view = $(this).find('.value-mode');
//                var edit = $(this).find('.edit-mode');
//                var input = $(this).find('.edit-mode>:input');
//
//                if (view.length == 0 || edit.length == 0) {
//                    return;
//                }
//
//                if (edit.is(":visible")) {
//                    return;
//                }
//
//                view.hide();
//                edit.show();
//
//                input.css('max-width', td.width() - 10);
//                input.focus();
//
//                var saved = false;
//
//                input.off('blur').on('blur', function(event) {
//                    event.preventDefault();
//
//                    // Workaround in case of an unexpected blur event from an auto-complete selection box
//                    if (input.is("select") && event.type == 'blur') {
//                        return;
//                    }
//
//                    var saved = false;
//                    input.change();
//                    saved = true;
//                });
//
//                input.off('change').on('change', function(event) {
//                    event.preventDefault();
//
//                    if (saved) {
//                        return;
//                    }
//
//                    var message = edit.find('.message');
//
//                    if (message.length == 0) {
//                        message = $('<div class="message"></div>').insertBefore(input);
//                    }
//
//                    $.ajax({
//                        type: "post",
//                        dataType: "json",
//                        url: "<{$smarty.const.APPLICATION_URL}>/post/fieldSave",
//                        data: td.find(':input').serialize() + "&post_formdata_UUID=<{$details->UUID}>"
//                    }).done(function(data) {
//                        if (data.success) {
//                            if (input.is("select")) {
//                                var txt = input.find('option:selected').map(function () {
//                                    return $(this).text().trim();
//                                }).get().join(', ');
//
//                                view.html(txt);
//                            } else {
//                                view.html(input.val());
//                            }
//
//                            view.show();
//                            edit.hide();
//
//                            message.remove();
//                        } else {
//                            input.focus();
//
//                            message.html('<span>' + data.message + '</span>');
//                        }
//                    });
//                });
//            });
        });

    </script>
</div>
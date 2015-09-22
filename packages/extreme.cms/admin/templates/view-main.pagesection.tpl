<div class="view-main">
    <{plugin key="pagesection_view_top" args=$details}>

                
    
    
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
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('Page section title')}></label>
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
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
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
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PARENT']) && ((isset($aclviewablecolumns['PARENT']) && $aclviewablecolumns['PARENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PARENT']) || $aclviewablecolumns['PARENT']))) }>
        <{if !isset($columns2hide) || !in_array('PARENT', $columns2hide) }>
    		<td class="form-field form-field-label column-parent">
	                    		        	                <{if isset($smarty.session.acl.pagesection.view)}>
    	                    <{if $details->PARENT}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="pagesection" data-id="<{$details->refuuid_PARENT}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Parent')}></label>
            </td>
            <td class="form-field form-field-value column-parent" colspan="3">
            	<div class="attribute-line column-parent type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PARENT']) && $acleditablecolumns['PARENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PARENT']) || $acleditablecolumns['PARENT'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_PARENT}>
        <{if isset($smarty.session.acl.pagesection.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
        <{else}>
            <{$details->reftext_PARENT|escape}>        <{/if}>
    <{else}>
		<{$details->PARENT}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('PageSection')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`pagesection_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="PAGE_SECTION" datasourcename="PageSection" valuecol="CODE" textcol="TITLE" sortcol="TITLE"}>

                            <{if isset($smarty.session.acl.pagesection.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/new" title="Create a New Page Section">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>pagesection_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_PARENT}>
        <{if isset($smarty.session.acl.pagesection.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
        <{else}>
            <{$details->reftext_PARENT|escape}>        <{/if}>
    <{else}>
		<{$details->PARENT}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
        <{if !isset($columns2hide) || !in_array('CODE', $columns2hide) }>
    		<td class="form-field form-field-label column-code">
	            		        <label class="attribute-name"><{_t('Code')}></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
            	<div class="attribute-line column-code type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CODE']) && $acleditablecolumns['CODE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CODE']) || $acleditablecolumns['CODE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CODE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-code input-type-text" type="text" name="<{$prefix}>pagesection_formdata_CODE" value="<{$details->CODE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CODE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TAG_LINE']) && ((isset($aclviewablecolumns['TAG_LINE']) && $aclviewablecolumns['TAG_LINE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAG_LINE']) || $aclviewablecolumns['TAG_LINE']))) }>
        <{if !isset($columns2hide) || !in_array('TAG_LINE', $columns2hide) }>
    		<td class="form-field form-field-label column-tag-line">
	            		        <label class="attribute-name"><{_t('Tag line')}></label>
            </td>
            <td class="form-field form-field-value column-tag-line" colspan="3">
            	<div class="attribute-line column-tag-line type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TAG_LINE']) && $acleditablecolumns['TAG_LINE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TAG_LINE']) || $acleditablecolumns['TAG_LINE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TAG_LINE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TAG_LINE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
                        </tr>                                            <tr>
    
                        </tr>                                            <tr>
    
                        </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CONTENT']) && ((isset($aclviewablecolumns['CONTENT']) && $aclviewablecolumns['CONTENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONTENT']) || $aclviewablecolumns['CONTENT']))) }>
        <{if !isset($columns2hide) || !in_array('CONTENT', $columns2hide) }>
    		<td class="form-field form-field-label column-content">
	            		        <label class="attribute-name"><{_t('Content')}></label>
            </td>
            <td class="form-field form-field-value column-content" colspan="3">
            	<div class="attribute-line column-content type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CONTENT']) && $acleditablecolumns['CONTENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CONTENT']) || $acleditablecolumns['CONTENT'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->CONTENT|plugin:"pagesection_view_field_CONTENT":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>pagesection_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>pagesection_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->CONTENT|plugin:"pagesection_view_field_CONTENT":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TAGS']) && ((isset($aclviewablecolumns['TAGS']) && $aclviewablecolumns['TAGS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAGS']) || $aclviewablecolumns['TAGS']))) }>
        <{if !isset($columns2hide) || !in_array('TAGS', $columns2hide) }>
    		<td class="form-field form-field-label column-tags">
	            		        <label class="attribute-name"><{_t('Tags')}></label>
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
                                    

    <input class="input-tags input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TAGS" value="<{$details->TAGS|escape}>"  />
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
    </tr>                                            <tr>
    
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
    
            
        
        
            <{if !isset($excludedcolumns['BACKGROUND_IMAGE']) && ((isset($aclviewablecolumns['BACKGROUND_IMAGE']) && $aclviewablecolumns['BACKGROUND_IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_IMAGE']) || $aclviewablecolumns['BACKGROUND_IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('BACKGROUND_IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-background-image">
	            		        <label class="attribute-name"><{_t('Background image')}></label>
            </td>
            <td class="form-field form-field-value column-background-image" colspan="3">
            	<div class="attribute-line column-background-image type-image">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['BACKGROUND_IMAGE']) && $acleditablecolumns['BACKGROUND_IMAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['BACKGROUND_IMAGE']) || $acleditablecolumns['BACKGROUND_IMAGE'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->BACKGROUND_IMAGE thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-background-image input-type-file" type="file" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_BACKGROUND_IMAGE"><{media src=$details->BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE, '<{$details->BACKGROUND_IMAGE}>', '<{$prefix}>pagesection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->BACKGROUND_IMAGE thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['BACKGROUND_COLOR']) && ((isset($aclviewablecolumns['BACKGROUND_COLOR']) && $aclviewablecolumns['BACKGROUND_COLOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_COLOR']) || $aclviewablecolumns['BACKGROUND_COLOR']))) }>
        <{if !isset($columns2hide) || !in_array('BACKGROUND_COLOR', $columns2hide) }>
    		<td class="form-field form-field-label column-background-color">
	            		        <label class="attribute-name"><{_t('Background color')}></label>
            </td>
            <td class="form-field form-field-value column-background-color" colspan="3">
            	<div class="attribute-line column-background-color type-color">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['BACKGROUND_COLOR']) && $acleditablecolumns['BACKGROUND_COLOR']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['BACKGROUND_COLOR']) || $acleditablecolumns['BACKGROUND_COLOR'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->BACKGROUND_COLOR|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-background-color input-type-color" type="text" name="<{$prefix}>pagesection_formdata_BACKGROUND_COLOR" value="<{$details->BACKGROUND_COLOR|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->BACKGROUND_COLOR|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
        <{if !isset($columns2hide) || !in_array('FONT_AWESOME_ICON', $columns2hide) }>
    		<td class="form-field form-field-label column-font-awesome-icon">
	            		        <label class="attribute-name"><{_t('Font awesome icon')}></label>
            </td>
            <td class="form-field form-field-value column-font-awesome-icon" colspan="3">
            	<div class="attribute-line column-font-awesome-icon type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['FONT_AWESOME_ICON']) && $acleditablecolumns['FONT_AWESOME_ICON']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['FONT_AWESOME_ICON']) || $acleditablecolumns['FONT_AWESOME_ICON'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->FONT_AWESOME_ICON|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-font-awesome-icon input-type-text" type="text" name="<{$prefix}>pagesection_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->FONT_AWESOME_ICON|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-image">
	            		        <label class="attribute-name"><{_t('Image')}></label>
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
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>pagesection_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>pagesection_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagesection_formdata_IMAGE" value="<{$details->IMAGE}>" />
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
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VIDEO']) && ((isset($aclviewablecolumns['VIDEO']) && $aclviewablecolumns['VIDEO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIDEO']) || $aclviewablecolumns['VIDEO']))) }>
        <{if !isset($columns2hide) || !in_array('VIDEO', $columns2hide) }>
    		<td class="form-field form-field-label column-video">
	            		        <label class="attribute-name"><{_t('Video')}></label>
            </td>
            <td class="form-field form-field-value column-video" colspan="3">
            	<div class="attribute-line column-video type-video">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VIDEO']) && $acleditablecolumns['VIDEO']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VIDEO']) || $acleditablecolumns['VIDEO'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->VIDEO thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-video input-type-file" type="file" name="<{$prefix}>pagesection_formdata_VIDEO" />
    <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->VIDEO}><div style="clear:both"></div><span id="<{$prefix}>pagesection_VIDEO"><{media src=$details->VIDEO}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_VIDEO, '<{$details->VIDEO}>', '<{$prefix}>pagesection_VIDEO')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagesection_formdata_VIDEO" value="<{$details->VIDEO}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->VIDEO thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                    </tbody>
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
    
            
        
        
            <{if !isset($excludedcolumns['VIEW_MORE_TITLE']) && ((isset($aclviewablecolumns['VIEW_MORE_TITLE']) && $aclviewablecolumns['VIEW_MORE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_TITLE']) || $aclviewablecolumns['VIEW_MORE_TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('VIEW_MORE_TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-view-more-title">
	            		        <label class="attribute-name"><{_t('View more title')}></label>
            </td>
            <td class="form-field form-field-value column-view-more-title" colspan="3">
            	<div class="attribute-line column-view-more-title type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VIEW_MORE_TITLE']) && $acleditablecolumns['VIEW_MORE_TITLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VIEW_MORE_TITLE']) || $acleditablecolumns['VIEW_MORE_TITLE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->VIEW_MORE_TITLE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-view-more-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_TITLE" value="<{$details->VIEW_MORE_TITLE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->VIEW_MORE_TITLE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VIEW_MORE_ID_PAGE']) && ((isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) && $aclviewablecolumns['VIEW_MORE_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) || $aclviewablecolumns['VIEW_MORE_ID_PAGE']))) }>
        <{if !isset($columns2hide) || !in_array('VIEW_MORE_ID_PAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-view-more-id-page">
	                    		        	                <{if isset($smarty.session.acl.page.view)}>
    	                    <{if $details->VIEW_MORE_ID_PAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="page" data-id="<{$details->refuuid_VIEW_MORE_ID_PAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('View more page')}></label>
            </td>
            <td class="form-field form-field-value column-view-more-id-page" colspan="3">
            	<div class="attribute-line column-view-more-id-page type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VIEW_MORE_ID_PAGE']) && $acleditablecolumns['VIEW_MORE_ID_PAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VIEW_MORE_ID_PAGE']) || $acleditablecolumns['VIEW_MORE_ID_PAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_VIEW_MORE_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_VIEW_MORE_ID_PAGE}>"><{$details->reftext_VIEW_MORE_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_VIEW_MORE_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->VIEW_MORE_ID_PAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-view-more-id-page" class="input-view-more-id-page" name="`$prefix`pagesection_formdata_VIEW_MORE_ID_PAGE" value=$details->VIEW_MORE_ID_PAGE text=$details->reftext_VIEW_MORE_ID_PAGE datasource="PAGE" datasourcename="Page" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-view-more-id-page input-type-text" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_ID_PAGE" value="<{$details->VIEW_MORE_ID_PAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_VIEW_MORE_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_VIEW_MORE_ID_PAGE}>"><{$details->reftext_VIEW_MORE_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_VIEW_MORE_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->VIEW_MORE_ID_PAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VIEW_MORE_LINK']) && ((isset($aclviewablecolumns['VIEW_MORE_LINK']) && $aclviewablecolumns['VIEW_MORE_LINK']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_LINK']) || $aclviewablecolumns['VIEW_MORE_LINK']))) }>
        <{if !isset($columns2hide) || !in_array('VIEW_MORE_LINK', $columns2hide) }>
    		<td class="form-field form-field-label column-view-more-link">
	            		        <label class="attribute-name"><{_t('View more link')}></label>
            </td>
            <td class="form-field form-field-value column-view-more-link" colspan="3">
            	<div class="attribute-line column-view-more-link type-url">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VIEW_MORE_LINK']) && $acleditablecolumns['VIEW_MORE_LINK']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VIEW_MORE_LINK']) || $acleditablecolumns['VIEW_MORE_LINK'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->VIEW_MORE_LINK|shorten_link:128}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-view-more-link input-type-text" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_LINK" value="<{$details->VIEW_MORE_LINK|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->VIEW_MORE_LINK|shorten_link:128}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['HIDE_TITLE']) && ((isset($aclviewablecolumns['HIDE_TITLE']) && $aclviewablecolumns['HIDE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HIDE_TITLE']) || $aclviewablecolumns['HIDE_TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('HIDE_TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-hide-title">
	            		        <label class="attribute-name"><{_t('Hide title')}></label>
            </td>
            <td class="form-field form-field-value column-hide-title" colspan="3">
            	<div class="attribute-line column-hide-title type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['HIDE_TITLE']) && $acleditablecolumns['HIDE_TITLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['HIDE_TITLE']) || $acleditablecolumns['HIDE_TITLE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->HIDE_TITLE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="1" <{if $details->HIDE_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="0" <{if !$details->HIDE_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->HIDE_TITLE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IS_TAB_ANCHOR_SECTION']) && ((isset($aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) && $aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) || $aclviewablecolumns['IS_TAB_ANCHOR_SECTION']))) }>
        <{if !isset($columns2hide) || !in_array('IS_TAB_ANCHOR_SECTION', $columns2hide) }>
    		<td class="form-field form-field-label column-is-tab-anchor-section">
	            		        <label class="attribute-name"><{_t('Tab anchor section?')}></label>
            </td>
            <td class="form-field form-field-value column-is-tab-anchor-section" colspan="3">
            	<div class="attribute-line column-is-tab-anchor-section type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IS_TAB_ANCHOR_SECTION']) && $acleditablecolumns['IS_TAB_ANCHOR_SECTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IS_TAB_ANCHOR_SECTION']) || $acleditablecolumns['IS_TAB_ANCHOR_SECTION'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->IS_TAB_ANCHOR_SECTION}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-is-tab-anchor-section" type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="1" <{if $details->IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="0" <{if !$details->IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->IS_TAB_ANCHOR_SECTION}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TAB_ANCHOR_TITLE']) && ((isset($aclviewablecolumns['TAB_ANCHOR_TITLE']) && $aclviewablecolumns['TAB_ANCHOR_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAB_ANCHOR_TITLE']) || $aclviewablecolumns['TAB_ANCHOR_TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TAB_ANCHOR_TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-tab-anchor-title">
	            		        <label class="attribute-name"><{_t('Tab anchor title')}></label>
            </td>
            <td class="form-field form-field-value column-tab-anchor-title" colspan="3">
            	<div class="attribute-line column-tab-anchor-title type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TAB_ANCHOR_TITLE']) && $acleditablecolumns['TAB_ANCHOR_TITLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TAB_ANCHOR_TITLE']) || $acleditablecolumns['TAB_ANCHOR_TITLE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TAB_ANCHOR_TITLE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-tab-anchor-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$details->TAB_ANCHOR_TITLE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TAB_ANCHOR_TITLE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                    </tbody>
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
    

        <!-- Custom fields -->
        <div class="layout-block layout-block-rows">
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                    <{if $customfields}>
    <{foreach from=$customfields item=item}>
        <tr class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>">
    		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
		        <label class="attribute-name"><{_t($item->NAME)}></label>
            </td>
            <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
        		<div class="attribute-value">
                    <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
        		</div>
            </td>
		</tr>
	<{/foreach}>
<{/if}>

<{if $additional_view_fields}>
    <{foreach from=$additional_view_fields item=item}>
        <tr class="attribute-line">
    		<td class="form-field form-field-label">
		        <label class="attribute-name"><{$item.label}></label>
            </td>
            <td class="form-field form-field-value">
        		<div class="attribute-value">
                    <{$item.value}>
        		</div>
            </td>
		</tr>
	<{/foreach}>
<{/if}>                </tbody>
            </table>
        </div>
    
    <{plugin key="pagesection_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        pagesectionview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        pagesectionview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                pagesectionview_apply_block_visibility(key, value);
            });
        }

        pagesectionview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        pagesectionview_update_visibility_settings = function () {
            var settings = pagesectionview_get_visibility_settings();

            pagesectionview_apply_visibility_settings(settings);
        }

        $(function() {
            pagesectionview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/pagesection/fieldSave",
//                        data: td.find(':input').serialize() + "&pagesection_formdata_UUID=<{$details->UUID}>"
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
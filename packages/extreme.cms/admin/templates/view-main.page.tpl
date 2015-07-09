<div class="view-main">
    <{plugin key="page_view_top" args=$details}>

                
    
    
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
    
            
        
        
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
        <{if !isset($columns2hide) || !in_array('NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-name">
	            		        <label class="attribute-name"><{_t('L_PAGE_NAME')}></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
            	<div class="attribute-line column-name type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['NAME']) && $acleditablecolumns['NAME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['NAME']) || $acleditablecolumns['NAME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->NAME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>page_formdata_NAME" value="<{$details->NAME|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->NAME|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('L_TITLE')}></label>
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
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>page_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
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
	                    		        	                <{if isset($smarty.session.acl.page.view)}>
    	                    <{if $details->PARENT}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="page" data-id="<{$details->refuuid_PARENT}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('L_PARENT')}></label>
            </td>
            <td class="form-field form-field-value column-parent" colspan="3">
            	<div class="attribute-line column-parent type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PARENT']) && $acleditablecolumns['PARENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PARENT']) || $acleditablecolumns['PARENT'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_PARENT}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
        <{else}>
            <{$details->reftext_PARENT|escape}>        <{/if}>
    <{else}>
		<{$details->PARENT}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`page_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="PAGE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                </span>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>page_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_PARENT}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
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
    
            
        
        
            <{if !isset($excludedcolumns['SLUG']) && ((isset($aclviewablecolumns['SLUG']) && $aclviewablecolumns['SLUG']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SLUG']) || $aclviewablecolumns['SLUG']))) }>
        <{if !isset($columns2hide) || !in_array('SLUG', $columns2hide) }>
    		<td class="form-field form-field-label column-slug">
	            		        <label class="attribute-name"><{_t('L_SLUG')}></label>
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
                                    

    <input class="input-slug input-type-text" type="text" name="<{$prefix}>page_formdata_SLUG" value="<{$details->SLUG|escape}>"  />
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
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TAG_LINE']) && ((isset($aclviewablecolumns['TAG_LINE']) && $aclviewablecolumns['TAG_LINE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAG_LINE']) || $aclviewablecolumns['TAG_LINE']))) }>
        <{if !isset($columns2hide) || !in_array('TAG_LINE', $columns2hide) }>
    		<td class="form-field form-field-label column-tag-line">
	            		        <label class="attribute-name"><{_t('L_TAG_LINE')}></label>
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
                                    

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>page_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
        <{if !isset($columns2hide) || !in_array('META_KEYWORDS', $columns2hide) }>
    		<td class="form-field form-field-label column-meta-keywords">
	            		        <label class="attribute-name"><{_t('L_META_KEYWORDS')}></label>
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
                                    

    <input class="input-meta-keywords input-type-text" type="text" name="<{$prefix}>page_formdata_META_KEYWORDS" value="<{$details->META_KEYWORDS|escape}>"  />
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
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['META_DESCRIPTION']) && ((isset($aclviewablecolumns['META_DESCRIPTION']) && $aclviewablecolumns['META_DESCRIPTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_DESCRIPTION']) || $aclviewablecolumns['META_DESCRIPTION']))) }>
        <{if !isset($columns2hide) || !in_array('META_DESCRIPTION', $columns2hide) }>
    		<td class="form-field form-field-label column-meta-description">
	            		        <label class="attribute-name"><{_t('L_META_DESCRIPTION')}></label>
            </td>
            <td class="form-field form-field-value column-meta-description" colspan="3">
            	<div class="attribute-line column-meta-description type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['META_DESCRIPTION']) && $acleditablecolumns['META_DESCRIPTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['META_DESCRIPTION']) || $acleditablecolumns['META_DESCRIPTION'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->META_DESCRIPTION|escape|nl2br|plugin:"page_view_field_META_DESCRIPTION":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-meta-description " id="<{$prefix}>page_formdata_META_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>page_formdata_META_DESCRIPTION" rows="5" ><{$details->META_DESCRIPTION}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->META_DESCRIPTION|escape|nl2br|plugin:"page_view_field_META_DESCRIPTION":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_TEMPLATE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-template">
	                    		                    		        <label class="attribute-name"><{_t('L_TEMPLATE')}></label>
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
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-template" class="input-id-template" name="`$prefix`page_formdata_ID_TEMPLATE" value=$details->ID_TEMPLATE text=$details->reftext_ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/template/new" title="Create a New Template">+</a>
                </span>
                    <{else}>
            <input class="input-id-template input-type-text" type="text" name="<{$prefix}>page_formdata_ID_TEMPLATE" value="<{$details->ID_TEMPLATE|escape}>"  />
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
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CONTENT']) && ((isset($aclviewablecolumns['CONTENT']) && $aclviewablecolumns['CONTENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONTENT']) || $aclviewablecolumns['CONTENT']))) }>
        <{if !isset($columns2hide) || !in_array('CONTENT', $columns2hide) }>
    		<td class="form-field form-field-label column-content">
	            		        <label class="attribute-name"><{_t('L_CONTENT')}></label>
            </td>
            <td class="form-field form-field-value column-content" colspan="3">
            	<div class="attribute-line column-content type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CONTENT']) && $acleditablecolumns['CONTENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CONTENT']) || $acleditablecolumns['CONTENT'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->CONTENT|plugin:"page_view_field_CONTENT":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>page_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>page_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->CONTENT|plugin:"page_view_field_CONTENT":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
        <{if !isset($columns2hide) || !in_array('LATEST_UPDATE', $columns2hide) }>
    		<td class="form-field form-field-label column-latest-update">
	            		        <label class="attribute-name"><{_t('L_LATEST_UPDATE')}></label>
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
                                    
    <input class="input-latest-update input-type-date field-date" type="text" id="<{$prefix}>page_formdata_LATEST_UPDATE" name="<{$prefix}>page_formdata_LATEST_UPDATE" value="<{$details->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
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
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
        <{if !isset($columns2hide) || !in_array('NBR_VIEWS', $columns2hide) }>
    		<td class="form-field form-field-label column-nbr-views">
	            		        <label class="attribute-name"><{_t('L_NBR_VIEWS')}></label>
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
    
            
        
        
            <{if !isset($excludedcolumns['THUMB']) && ((isset($aclviewablecolumns['THUMB']) && $aclviewablecolumns['THUMB']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['THUMB']) || $aclviewablecolumns['THUMB']))) }>
        <{if !isset($columns2hide) || !in_array('THUMB', $columns2hide) }>
    		<td class="form-field form-field-label column-thumb">
	            		        <label class="attribute-name"><{_t('L_THUMB')}></label>
            </td>
            <td class="form-field form-field-value column-thumb" colspan="3">
            	<div class="attribute-line column-thumb type-image">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['THUMB']) && $acleditablecolumns['THUMB']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['THUMB']) || $acleditablecolumns['THUMB'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->THUMB thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-thumb input-type-file" type="file" name="<{$prefix}>page_formdata_THUMB" />
    <span class="input-sizes-width-height"><input type="text" name="THUMB[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="THUMB[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->THUMB}><div style="clear:both"></div><span id="<{$prefix}>page_THUMB"><{media src=$details->THUMB}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_THUMB, '<{$details->THUMB}>', '<{$prefix}>page_THUMB')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>page_formdata_THUMB" value="<{$details->THUMB}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->THUMB thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['BACKGROUND_IMAGE']) && ((isset($aclviewablecolumns['BACKGROUND_IMAGE']) && $aclviewablecolumns['BACKGROUND_IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_IMAGE']) || $aclviewablecolumns['BACKGROUND_IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('BACKGROUND_IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-background-image">
	            		        <label class="attribute-name"><{_t('L_BACKGROUND_IMAGE')}></label>
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
                                    

	<input class="input-background-image input-type-file" type="file" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>page_BACKGROUND_IMAGE"><{media src=$details->BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_BACKGROUND_IMAGE, '<{$details->BACKGROUND_IMAGE}>', '<{$prefix}>page_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
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
    
                        </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-image">
	            		        <label class="attribute-name"><{_t('L_IMAGE')}></label>
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
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>page_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>page_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>page_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>page_formdata_IMAGE" value="<{$details->IMAGE}>" />
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
	            		        <label class="attribute-name"><{_t('L_VIDEO')}></label>
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
                                    

	<input class="input-video input-type-file" type="file" name="<{$prefix}>page_formdata_VIDEO" />
    <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->VIDEO}><div style="clear:both"></div><span id="<{$prefix}>page_VIDEO"><{media src=$details->VIDEO}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_VIDEO, '<{$details->VIDEO}>', '<{$prefix}>page_VIDEO')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>page_formdata_VIDEO" value="<{$details->VIDEO}>" />
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
    
            
        
        
            <{if !isset($excludedcolumns['INTRODUCTION']) && ((isset($aclviewablecolumns['INTRODUCTION']) && $aclviewablecolumns['INTRODUCTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INTRODUCTION']) || $aclviewablecolumns['INTRODUCTION']))) }>
        <{if !isset($columns2hide) || !in_array('INTRODUCTION', $columns2hide) }>
    		<td class="form-field form-field-label column-introduction">
	            		        <label class="attribute-name"><{_t('L_INTRODUCTION')}></label>
            </td>
            <td class="form-field form-field-value column-introduction" colspan="3">
            	<div class="attribute-line column-introduction type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['INTRODUCTION']) && $acleditablecolumns['INTRODUCTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['INTRODUCTION']) || $acleditablecolumns['INTRODUCTION'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->INTRODUCTION|plugin:"page_view_field_INTRODUCTION":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-introduction enable-html" id="<{$prefix}>page_formdata_INTRODUCTION_<{$tmpid}>" name="<{$prefix}>page_formdata_INTRODUCTION" rows="5" ><{$details->INTRODUCTION}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->INTRODUCTION|plugin:"page_view_field_INTRODUCTION":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['FOOTER']) && ((isset($aclviewablecolumns['FOOTER']) && $aclviewablecolumns['FOOTER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FOOTER']) || $aclviewablecolumns['FOOTER']))) }>
        <{if !isset($columns2hide) || !in_array('FOOTER', $columns2hide) }>
    		<td class="form-field form-field-label column-footer">
	            		        <label class="attribute-name"><{_t('L_FOOTER')}></label>
            </td>
            <td class="form-field form-field-value column-footer" colspan="3">
            	<div class="attribute-line column-footer type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['FOOTER']) && $acleditablecolumns['FOOTER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['FOOTER']) || $acleditablecolumns['FOOTER'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->FOOTER|plugin:"page_view_field_FOOTER":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-footer enable-html" id="<{$prefix}>page_formdata_FOOTER_<{$tmpid}>" name="<{$prefix}>page_formdata_FOOTER" rows="5" ><{$details->FOOTER}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->FOOTER|plugin:"page_view_field_FOOTER":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ADDITIONAL_CSS']) && ((isset($aclviewablecolumns['ADDITIONAL_CSS']) && $aclviewablecolumns['ADDITIONAL_CSS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ADDITIONAL_CSS']) || $aclviewablecolumns['ADDITIONAL_CSS']))) }>
        <{if !isset($columns2hide) || !in_array('ADDITIONAL_CSS', $columns2hide) }>
    		<td class="form-field form-field-label column-additional-css">
	            		        <label class="attribute-name"><{_t('L_ADDITIONAL_CSS')}></label>
            </td>
            <td class="form-field form-field-value column-additional-css" colspan="3">
            	<div class="attribute-line column-additional-css type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ADDITIONAL_CSS']) && $acleditablecolumns['ADDITIONAL_CSS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ADDITIONAL_CSS']) || $acleditablecolumns['ADDITIONAL_CSS'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->ADDITIONAL_CSS|escape|nl2br|plugin:"page_view_field_ADDITIONAL_CSS":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-additional-css " id="<{$prefix}>page_formdata_ADDITIONAL_CSS_<{$tmpid}>" name="<{$prefix}>page_formdata_ADDITIONAL_CSS" rows="5" ><{$details->ADDITIONAL_CSS}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->ADDITIONAL_CSS|escape|nl2br|plugin:"page_view_field_ADDITIONAL_CSS":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOM_TOP_ID_MENU']) && ((isset($aclviewablecolumns['CUSTOM_TOP_ID_MENU']) && $aclviewablecolumns['CUSTOM_TOP_ID_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOM_TOP_ID_MENU']) || $aclviewablecolumns['CUSTOM_TOP_ID_MENU']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOM_TOP_ID_MENU', $columns2hide) }>
    		<td class="form-field form-field-label column-custom-top-id-menu">
	                    		                    		        <label class="attribute-name"><{_t('L_CUSTOM_TOP_MENU')}></label>
            </td>
            <td class="form-field form-field-value column-custom-top-id-menu" colspan="3">
            	<div class="attribute-line column-custom-top-id-menu type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOM_TOP_ID_MENU']) && $acleditablecolumns['CUSTOM_TOP_ID_MENU']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOM_TOP_ID_MENU']) || $acleditablecolumns['CUSTOM_TOP_ID_MENU'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_CUSTOM_TOP_ID_MENU}>
        <{if isset($smarty.session.acl.menu.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$details->refuuid_CUSTOM_TOP_ID_MENU}>"><{$details->reftext_CUSTOM_TOP_ID_MENU|escape}></a>
        <{else}>
            <{$details->reftext_CUSTOM_TOP_ID_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->CUSTOM_TOP_ID_MENU}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Menu')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-custom-top-id-menu" class="input-custom-top-id-menu" name="`$prefix`page_formdata_CUSTOM_TOP_ID_MENU" value=$details->CUSTOM_TOP_ID_MENU text=$details->reftext_CUSTOM_TOP_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                </span>
                    <{else}>
            <input class="input-custom-top-id-menu input-type-text" type="text" name="<{$prefix}>page_formdata_CUSTOM_TOP_ID_MENU" value="<{$details->CUSTOM_TOP_ID_MENU|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_CUSTOM_TOP_ID_MENU}>
        <{if isset($smarty.session.acl.menu.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$details->refuuid_CUSTOM_TOP_ID_MENU}>"><{$details->reftext_CUSTOM_TOP_ID_MENU|escape}></a>
        <{else}>
            <{$details->reftext_CUSTOM_TOP_ID_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->CUSTOM_TOP_ID_MENU}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOM_SIDE_ID_MENU']) && ((isset($aclviewablecolumns['CUSTOM_SIDE_ID_MENU']) && $aclviewablecolumns['CUSTOM_SIDE_ID_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOM_SIDE_ID_MENU']) || $aclviewablecolumns['CUSTOM_SIDE_ID_MENU']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOM_SIDE_ID_MENU', $columns2hide) }>
    		<td class="form-field form-field-label column-custom-side-id-menu">
	                    		                    		        <label class="attribute-name"><{_t('L_CUSTOM_SIDE_MENU')}></label>
            </td>
            <td class="form-field form-field-value column-custom-side-id-menu" colspan="3">
            	<div class="attribute-line column-custom-side-id-menu type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOM_SIDE_ID_MENU']) && $acleditablecolumns['CUSTOM_SIDE_ID_MENU']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOM_SIDE_ID_MENU']) || $acleditablecolumns['CUSTOM_SIDE_ID_MENU'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_CUSTOM_SIDE_ID_MENU}>
        <{if isset($smarty.session.acl.menu.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$details->refuuid_CUSTOM_SIDE_ID_MENU}>"><{$details->reftext_CUSTOM_SIDE_ID_MENU|escape}></a>
        <{else}>
            <{$details->reftext_CUSTOM_SIDE_ID_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->CUSTOM_SIDE_ID_MENU}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Menu')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-custom-side-id-menu" class="input-custom-side-id-menu" name="`$prefix`page_formdata_CUSTOM_SIDE_ID_MENU" value=$details->CUSTOM_SIDE_ID_MENU text=$details->reftext_CUSTOM_SIDE_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                </span>
                    <{else}>
            <input class="input-custom-side-id-menu input-type-text" type="text" name="<{$prefix}>page_formdata_CUSTOM_SIDE_ID_MENU" value="<{$details->CUSTOM_SIDE_ID_MENU|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_CUSTOM_SIDE_ID_MENU}>
        <{if isset($smarty.session.acl.menu.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$details->refuuid_CUSTOM_SIDE_ID_MENU}>"><{$details->reftext_CUSTOM_SIDE_ID_MENU|escape}></a>
        <{else}>
            <{$details->reftext_CUSTOM_SIDE_ID_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->CUSTOM_SIDE_ID_MENU}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                            <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VIEW_MORE_TITLE']) && ((isset($aclviewablecolumns['VIEW_MORE_TITLE']) && $aclviewablecolumns['VIEW_MORE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_TITLE']) || $aclviewablecolumns['VIEW_MORE_TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('VIEW_MORE_TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-view-more-title">
	            		        <label class="attribute-name"><{_t('L_VIEW_MORE_TITLE')}></label>
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
                                    

    <input class="input-view-more-title input-type-text" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_TITLE" value="<{$details->VIEW_MORE_TITLE|escape}>"  />
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
    	                            		        <label class="attribute-name"><{_t('L_VIEW_MORE_PAGE')}></label>
            </td>
            <td class="form-field form-field-value column-view-more-id-page" colspan="3">
            	<div class="attribute-line column-view-more-id-page type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VIEW_MORE_ID_PAGE']) && $acleditablecolumns['VIEW_MORE_ID_PAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VIEW_MORE_ID_PAGE']) || $acleditablecolumns['VIEW_MORE_ID_PAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_VIEW_MORE_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_VIEW_MORE_ID_PAGE}>"><{$details->reftext_VIEW_MORE_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_VIEW_MORE_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->VIEW_MORE_ID_PAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-view-more-id-page" class="input-view-more-id-page" name="`$prefix`page_formdata_VIEW_MORE_ID_PAGE" value=$details->VIEW_MORE_ID_PAGE text=$details->reftext_VIEW_MORE_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                </span>
                    <{else}>
            <input class="input-view-more-id-page input-type-text" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_ID_PAGE" value="<{$details->VIEW_MORE_ID_PAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_VIEW_MORE_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_VIEW_MORE_ID_PAGE}>"><{$details->reftext_VIEW_MORE_ID_PAGE|escape}></a>
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
	            		        <label class="attribute-name"><{_t('L_VIEW_MORE_LINK')}></label>
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
                                    

    <input class="input-view-more-link input-type-text" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_LINK" value="<{$details->VIEW_MORE_LINK|escape}>"  />
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
    </tr>                                    </tbody>
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
                    <span><{_t('L_ADDITIONAL_INFORMATION')}></span>
                    <div class="header-arrow"></div>
                    <div class="clearer"></div>
                </div>
                <div class="layout-section-content">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$customfields item=item}>
                                <tr>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{_t($item->NAME)}></label>
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

    <{plugin key="page_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        pageview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        pageview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                pageview_apply_block_visibility(key, value);
            });
        }

        pageview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        pageview_update_visibility_settings = function () {
            var settings = pageview_get_visibility_settings();

            pageview_apply_visibility_settings(settings);
        }

        $(function() {
            pageview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/page/fieldSave",
//                        data: td.find(':input').serialize() + "&page_formdata_UUID=<{$details->UUID}>"
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
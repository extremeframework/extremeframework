<div class="view-main">
    <{plugin key="menuitem_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('Menu item title')}></label>
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
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>menuitem_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['CLASS']) && ((isset($aclviewablecolumns['CLASS']) && $aclviewablecolumns['CLASS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CLASS']) || $aclviewablecolumns['CLASS']))) }>
        <{if !isset($columns2hide) || !in_array('CLASS', $columns2hide) }>
    		<td class="form-field form-field-label column-class">
	            		        <label class="attribute-name"><{_t('Class')}></label>
            </td>
            <td class="form-field form-field-value column-class" colspan="3">
            	<div class="attribute-line column-class type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CLASS']) && $acleditablecolumns['CLASS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CLASS']) || $acleditablecolumns['CLASS'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CLASS|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-class input-type-text" type="text" name="<{$prefix}>menuitem_formdata_CLASS" value="<{$details->CLASS|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CLASS|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
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
                                    

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>menuitem_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
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
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_MENU']) && ((isset($aclviewablecolumns['ID_MENU']) && $aclviewablecolumns['ID_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_MENU']) || $aclviewablecolumns['ID_MENU']))) }>
        <{if !isset($columns2hide) || !in_array('ID_MENU', $columns2hide) }>
    		<td class="form-field form-field-label column-id-menu">
	                    		                    		        <label class="attribute-name"><{_t('Menu')}></label>
            </td>
            <td class="form-field form-field-value column-id-menu" colspan="3">
            	<div class="attribute-line column-id-menu type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_MENU']) && $acleditablecolumns['ID_MENU']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_MENU']) || $acleditablecolumns['ID_MENU'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_MENU}>
        <{if isset($smarty.session.acl.menu.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$details->refuuid_ID_MENU}>"><{$details->reftext_ID_MENU|escape}></a>
        <{else}>
            <{$details->reftext_ID_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->ID_MENU}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Menu')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-menu" class="input-id-menu" name="`$prefix`menuitem_formdata_ID_MENU" value=$details->ID_MENU text=$details->reftext_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.menu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-menu input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_MENU" value="<{$details->ID_MENU|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_MENU}>
        <{if isset($smarty.session.acl.menu.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$details->refuuid_ID_MENU}>"><{$details->reftext_ID_MENU|escape}></a>
        <{else}>
            <{$details->reftext_ID_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->ID_MENU}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PARENT']) && ((isset($aclviewablecolumns['PARENT']) && $aclviewablecolumns['PARENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PARENT']) || $aclviewablecolumns['PARENT']))) }>
        <{if !isset($columns2hide) || !in_array('PARENT', $columns2hide) }>
    		<td class="form-field form-field-label column-parent">
	                    		        	                <{if isset($smarty.session.acl.menuitem.view)}>
    	                    <{if $details->PARENT}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="menuitem" data-id="<{$details->refuuid_PARENT}>"></i>
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
        <{if isset($smarty.session.acl.menuitem.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
        <{else}>
            <{$details->reftext_PARENT|escape}>        <{/if}>
    <{else}>
		<{$details->PARENT}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('MenuItem')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`menuitem_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="MENU_ITEM" valuecol="ID" textcol="TITLE" sortcol="TITLE"}>

                            <{if isset($smarty.session.acl.menuitem.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/new" title="Create a New Menu Item">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>menuitem_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_PARENT}>
        <{if isset($smarty.session.acl.menuitem.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
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
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_PAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-page">
	                    		        	                <{if isset($smarty.session.acl.page.view)}>
    	                    <{if $details->ID_PAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="page" data-id="<{$details->refuuid_ID_PAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Page')}></label>
            </td>
            <td class="form-field form-field-value column-id-page" colspan="3">
            	<div class="attribute-line column-id-page type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_PAGE']) && $acleditablecolumns['ID_PAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_PAGE']) || $acleditablecolumns['ID_PAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_ID_PAGE}>"><{$details->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-page" class="input-id-page" name="`$prefix`menuitem_formdata_ID_PAGE" value=$details->ID_PAGE text=$details->reftext_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-page input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_PAGE" value="<{$details->ID_PAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_ID_PAGE}>"><{$details->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
        <{if !isset($columns2hide) || !in_array('ID_POST', $columns2hide) }>
    		<td class="form-field form-field-label column-id-post">
	                    		        	                <{if isset($smarty.session.acl.post.view)}>
    	                    <{if $details->ID_POST}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="post" data-id="<{$details->refuuid_ID_POST}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Post')}></label>
            </td>
            <td class="form-field form-field-value column-id-post" colspan="3">
            	<div class="attribute-line column-id-post type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_POST']) && $acleditablecolumns['ID_POST']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_POST']) || $acleditablecolumns['ID_POST'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_POST}>
        <{if isset($smarty.session.acl.post.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->refuuid_ID_POST}>"><{$details->reftext_ID_POST|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Post')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-post" class="input-id-post" name="`$prefix`menuitem_formdata_ID_POST" value=$details->ID_POST text=$details->reftext_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="TITLE"}>

                            <{if isset($smarty.session.acl.post.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_POST" value="<{$details->ID_POST|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_POST}>
        <{if isset($smarty.session.acl.post.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->refuuid_ID_POST}>"><{$details->reftext_ID_POST|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST}>
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
    	                            		        <label class="attribute-name"><{_t('Post category')}></label>
            </td>
            <td class="form-field form-field-value column-id-post-category" colspan="3">
            	<div class="attribute-line column-id-post-category type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_POST_CATEGORY']) && $acleditablecolumns['ID_POST_CATEGORY']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_POST_CATEGORY']) || $acleditablecolumns['ID_POST_CATEGORY'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_POST_CATEGORY}>
        <{if isset($smarty.session.acl.postcategory.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/view/<{$details->refuuid_ID_POST_CATEGORY}>"><{$details->reftext_ID_POST_CATEGORY|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST_CATEGORY|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST_CATEGORY}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('PostCategory')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-post-category" class="input-id-post-category" name="`$prefix`menuitem_formdata_ID_POST_CATEGORY" value=$details->ID_POST_CATEGORY text=$details->reftext_ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.postcategory.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new" title="Create a New Post Category">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post-category input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_POST_CATEGORY" value="<{$details->ID_POST_CATEGORY|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_POST_CATEGORY}>
        <{if isset($smarty.session.acl.postcategory.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/view/<{$details->refuuid_ID_POST_CATEGORY}>"><{$details->reftext_ID_POST_CATEGORY|escape}></a>
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
    
            
        
        
            <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
        <{if !isset($columns2hide) || !in_array('PATH', $columns2hide) }>
    		<td class="form-field form-field-label column-path">
	            		        <label class="attribute-name"><{_t('Path')}></label>
            </td>
            <td class="form-field form-field-value column-path" colspan="3">
            	<div class="attribute-line column-path type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PATH']) && $acleditablecolumns['PATH']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PATH']) || $acleditablecolumns['PATH'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->PATH|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-path input-type-text" type="text" name="<{$prefix}>menuitem_formdata_PATH" value="<{$details->PATH|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->PATH|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOM_CONTENT']) && ((isset($aclviewablecolumns['CUSTOM_CONTENT']) && $aclviewablecolumns['CUSTOM_CONTENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOM_CONTENT']) || $aclviewablecolumns['CUSTOM_CONTENT']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOM_CONTENT', $columns2hide) }>
    		<td class="form-field form-field-label column-custom-content">
	            		        <label class="attribute-name"><{_t('Custom content')}></label>
            </td>
            <td class="form-field form-field-value column-custom-content" colspan="3">
            	<div class="attribute-line column-custom-content type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOM_CONTENT']) && $acleditablecolumns['CUSTOM_CONTENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOM_CONTENT']) || $acleditablecolumns['CUSTOM_CONTENT'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->CUSTOM_CONTENT|plugin:"menuitem_view_field_CUSTOM_CONTENT":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-custom-content enable-html" id="<{$prefix}>menuitem_formdata_CUSTOM_CONTENT_<{$tmpid}>" name="<{$prefix}>menuitem_formdata_CUSTOM_CONTENT" rows="5" ><{$details->CUSTOM_CONTENT}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->CUSTOM_CONTENT|plugin:"menuitem_view_field_CUSTOM_CONTENT":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['HAS_BREAK_AFTER']) && ((isset($aclviewablecolumns['HAS_BREAK_AFTER']) && $aclviewablecolumns['HAS_BREAK_AFTER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HAS_BREAK_AFTER']) || $aclviewablecolumns['HAS_BREAK_AFTER']))) }>
        <{if !isset($columns2hide) || !in_array('HAS_BREAK_AFTER', $columns2hide) }>
    		<td class="form-field form-field-label column-has-break-after">
	            		        <label class="attribute-name"><{_t('Has break after?')}></label>
            </td>
            <td class="form-field form-field-value column-has-break-after" colspan="3">
            	<div class="attribute-line column-has-break-after type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['HAS_BREAK_AFTER']) && $acleditablecolumns['HAS_BREAK_AFTER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['HAS_BREAK_AFTER']) || $acleditablecolumns['HAS_BREAK_AFTER'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->HAS_BREAK_AFTER}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-has-break-after" type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="1" <{if $details->HAS_BREAK_AFTER}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="0" <{if !$details->HAS_BREAK_AFTER}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->HAS_BREAK_AFTER}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ACL_ID_USER_GROUP']) && ((isset($aclviewablecolumns['ACL_ID_USER_GROUP']) && $aclviewablecolumns['ACL_ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACL_ID_USER_GROUP']) || $aclviewablecolumns['ACL_ID_USER_GROUP']))) }>
        <{if !isset($columns2hide) || !in_array('ACL_ID_USER_GROUP', $columns2hide) }>
    		<td class="form-field form-field-label column-acl-id-user-group">
	                    		                    		        <label class="attribute-name"><{_t('Acl user group')}></label>
            </td>
            <td class="form-field form-field-value column-acl-id-user-group" colspan="3">
            	<div class="attribute-line column-acl-id-user-group type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ACL_ID_USER_GROUP']) && $acleditablecolumns['ACL_ID_USER_GROUP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ACL_ID_USER_GROUP']) || $acleditablecolumns['ACL_ID_USER_GROUP'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ACL_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ACL_ID_USER_GROUP}>"><{$details->reftext_ACL_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ACL_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ACL_ID_USER_GROUP}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-acl-id-user-group" class="input-acl-id-user-group" name="`$prefix`menuitem_formdata_ACL_ID_USER_GROUP" value=$details->ACL_ID_USER_GROUP text=$details->reftext_ACL_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-acl-id-user-group input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ACL_ID_USER_GROUP" value="<{$details->ACL_ID_USER_GROUP|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ACL_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ACL_ID_USER_GROUP}>"><{$details->reftext_ACL_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ACL_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ACL_ID_USER_GROUP}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                
                <!-- Custom fields -->
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
<{/if}>            </tbody>
        </table>
    	<!-- Standard layout columns end -->
    
    <{plugin key="menuitem_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        menuitemview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        menuitemview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                menuitemview_apply_block_visibility(key, value);
            });
        }

        menuitemview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        menuitemview_update_visibility_settings = function () {
            var settings = menuitemview_get_visibility_settings();

            menuitemview_apply_visibility_settings(settings);
        }

        $(function() {
            menuitemview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/menuitem/fieldSave",
//                        data: td.find(':input').serialize() + "&menuitem_formdata_UUID=<{$details->UUID}>"
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
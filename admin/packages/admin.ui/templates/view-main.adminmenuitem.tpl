<div class="view-main">
    <{plugin key="adminmenuitem_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
        <{if !isset($columns2hide) || !in_array('NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-name">
	            		        <label class="attribute-name"><{_t('Admin menu item name')}></label>
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
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_NAME" value="<{$details->NAME|escape}>"  />
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
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_MENU']) && ((isset($aclviewablecolumns['ID_ADMIN_MENU']) && $aclviewablecolumns['ID_ADMIN_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_MENU']) || $aclviewablecolumns['ID_ADMIN_MENU']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_MENU', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-menu">
	                    		                    		        <label class="attribute-name"><{_t('Admin menu')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-menu" colspan="3">
            	<div class="attribute-line column-id-admin-menu type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_MENU']) && $acleditablecolumns['ID_ADMIN_MENU']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_MENU']) || $acleditablecolumns['ID_ADMIN_MENU'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_MENU}>
        <{if isset($smarty.session.acl.adminmenu.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$details->refuuid_ID_ADMIN_MENU}>"><{$details->reftext_ID_ADMIN_MENU|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_MENU}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminMenu')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-menu" class="input-id-admin-menu" name="`$prefix`adminmenuitem_formdata_ID_ADMIN_MENU" value=$details->ID_ADMIN_MENU text=$details->reftext_ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminmenu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new" title="Create a New Admin Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-menu input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_MENU}>
        <{if isset($smarty.session.acl.adminmenu.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$details->refuuid_ID_ADMIN_MENU}>"><{$details->reftext_ID_ADMIN_MENU|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_MENU}>
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
	                    		        	                <{if isset($smarty.session.acl.adminmenuitem.view)}>
    	                    <{if $details->PARENT}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminmenuitem" data-id="<{$details->refuuid_PARENT}>"></i>
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
        <{if isset($smarty.session.acl.adminmenuitem.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
        <{else}>
            <{$details->reftext_PARENT|escape}>        <{/if}>
    <{else}>
		<{$details->PARENT}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminMenuItem')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`adminmenuitem_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="ADMIN_MENU_ITEM" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminmenuitem.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/new" title="Create a New Admin Menu Item">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_PARENT}>
        <{if isset($smarty.session.acl.adminmenuitem.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
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
    
            
        
        
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
        <{if !isset($columns2hide) || !in_array('MODULE', $columns2hide) }>
    		<td class="form-field form-field-label column-module">
	                    		        	                <{if isset($smarty.session.acl.adminmodule.view)}>
    	                    <{if $details->MODULE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminmodule" data-id="<{$details->refuuid_MODULE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Module')}></label>
            </td>
            <td class="form-field form-field-value column-module" colspan="3">
            	<div class="attribute-line column-module type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['MODULE']) && $acleditablecolumns['MODULE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['MODULE']) || $acleditablecolumns['MODULE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_MODULE}>
        <{if isset($smarty.session.acl.adminmodule.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->refuuid_MODULE}>"><{$details->reftext_MODULE|escape}></a>
        <{else}>
            <{$details->reftext_MODULE|escape}>        <{/if}>
    <{else}>
		<{$details->MODULE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminmenuitem_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_MODULE}>
        <{if isset($smarty.session.acl.adminmodule.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->refuuid_MODULE}>"><{$details->reftext_MODULE|escape}></a>
        <{else}>
            <{$details->reftext_MODULE|escape}>        <{/if}>
    <{else}>
		<{$details->MODULE}>
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
                                    

    <input class="input-path input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_PATH" value="<{$details->PATH|escape}>"  />
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
                                    

    <input class="input-font-awesome-icon input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON|escape}>"  />
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
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ENABLE_LEFT']) && ((isset($aclviewablecolumns['ENABLE_LEFT']) && $aclviewablecolumns['ENABLE_LEFT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_LEFT']) || $aclviewablecolumns['ENABLE_LEFT']))) }>
        <{if !isset($columns2hide) || !in_array('ENABLE_LEFT', $columns2hide) }>
    		<td class="form-field form-field-label column-enable-left">
	            		        <label class="attribute-name"><{_t('Enable left?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-left" colspan="3">
            	<div class="attribute-line column-enable-left type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ENABLE_LEFT']) && $acleditablecolumns['ENABLE_LEFT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ENABLE_LEFT']) || $acleditablecolumns['ENABLE_LEFT'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->ENABLE_LEFT}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-enable-left" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="1" <{if $details->ENABLE_LEFT}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="0" <{if !$details->ENABLE_LEFT}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->ENABLE_LEFT}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ENABLE_TOP']) && ((isset($aclviewablecolumns['ENABLE_TOP']) && $aclviewablecolumns['ENABLE_TOP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_TOP']) || $aclviewablecolumns['ENABLE_TOP']))) }>
        <{if !isset($columns2hide) || !in_array('ENABLE_TOP', $columns2hide) }>
    		<td class="form-field form-field-label column-enable-top">
	            		        <label class="attribute-name"><{_t('Enable top?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-top" colspan="3">
            	<div class="attribute-line column-enable-top type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ENABLE_TOP']) && $acleditablecolumns['ENABLE_TOP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ENABLE_TOP']) || $acleditablecolumns['ENABLE_TOP'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->ENABLE_TOP}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-enable-top" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="1" <{if $details->ENABLE_TOP}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="0" <{if !$details->ENABLE_TOP}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->ENABLE_TOP}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ENABLE_QUICK']) && ((isset($aclviewablecolumns['ENABLE_QUICK']) && $aclviewablecolumns['ENABLE_QUICK']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_QUICK']) || $aclviewablecolumns['ENABLE_QUICK']))) }>
        <{if !isset($columns2hide) || !in_array('ENABLE_QUICK', $columns2hide) }>
    		<td class="form-field form-field-label column-enable-quick">
	            		        <label class="attribute-name"><{_t('Enable quick?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-quick" colspan="3">
            	<div class="attribute-line column-enable-quick type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ENABLE_QUICK']) && $acleditablecolumns['ENABLE_QUICK']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ENABLE_QUICK']) || $acleditablecolumns['ENABLE_QUICK'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->ENABLE_QUICK}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-enable-quick" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="1" <{if $details->ENABLE_QUICK}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="0" <{if !$details->ENABLE_QUICK}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->ENABLE_QUICK}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ENABLE_ALL']) && ((isset($aclviewablecolumns['ENABLE_ALL']) && $aclviewablecolumns['ENABLE_ALL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_ALL']) || $aclviewablecolumns['ENABLE_ALL']))) }>
        <{if !isset($columns2hide) || !in_array('ENABLE_ALL', $columns2hide) }>
    		<td class="form-field form-field-label column-enable-all">
	            		        <label class="attribute-name"><{_t('Enable all?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-all" colspan="3">
            	<div class="attribute-line column-enable-all type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ENABLE_ALL']) && $acleditablecolumns['ENABLE_ALL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ENABLE_ALL']) || $acleditablecolumns['ENABLE_ALL'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->ENABLE_ALL}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-enable-all" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="1" <{if $details->ENABLE_ALL}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="0" <{if !$details->ENABLE_ALL}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->ENABLE_ALL}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ENABLE_SETTINGS']) && ((isset($aclviewablecolumns['ENABLE_SETTINGS']) && $aclviewablecolumns['ENABLE_SETTINGS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_SETTINGS']) || $aclviewablecolumns['ENABLE_SETTINGS']))) }>
        <{if !isset($columns2hide) || !in_array('ENABLE_SETTINGS', $columns2hide) }>
    		<td class="form-field form-field-label column-enable-settings">
	            		        <label class="attribute-name"><{_t('Enable settings?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-settings" colspan="3">
            	<div class="attribute-line column-enable-settings type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ENABLE_SETTINGS']) && $acleditablecolumns['ENABLE_SETTINGS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ENABLE_SETTINGS']) || $acleditablecolumns['ENABLE_SETTINGS'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->ENABLE_SETTINGS}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-enable-settings" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="1" <{if $details->ENABLE_SETTINGS}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="0" <{if !$details->ENABLE_SETTINGS}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->ENABLE_SETTINGS}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['OPEN_IN_NEW_WINDOW']) && ((isset($aclviewablecolumns['OPEN_IN_NEW_WINDOW']) && $aclviewablecolumns['OPEN_IN_NEW_WINDOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OPEN_IN_NEW_WINDOW']) || $aclviewablecolumns['OPEN_IN_NEW_WINDOW']))) }>
        <{if !isset($columns2hide) || !in_array('OPEN_IN_NEW_WINDOW', $columns2hide) }>
    		<td class="form-field form-field-label column-open-in-new-window">
	            		        <label class="attribute-name"><{_t('Open in new window')}></label>
            </td>
            <td class="form-field form-field-value column-open-in-new-window" colspan="3">
            	<div class="attribute-line column-open-in-new-window type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['OPEN_IN_NEW_WINDOW']) && $acleditablecolumns['OPEN_IN_NEW_WINDOW']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['OPEN_IN_NEW_WINDOW']) || $acleditablecolumns['OPEN_IN_NEW_WINDOW'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->OPEN_IN_NEW_WINDOW}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-open-in-new-window" type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="1" <{if $details->OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="0" <{if !$details->OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->OPEN_IN_NEW_WINDOW}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IS_STARRED']) && ((isset($aclviewablecolumns['IS_STARRED']) && $aclviewablecolumns['IS_STARRED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_STARRED']) || $aclviewablecolumns['IS_STARRED']))) }>
        <{if !isset($columns2hide) || !in_array('IS_STARRED', $columns2hide) }>
    		<td class="form-field form-field-label column-is-starred">
	            		        <label class="attribute-name"><{_t('Starred?')}></label>
            </td>
            <td class="form-field form-field-value column-is-starred" colspan="3">
            	<div class="attribute-line column-is-starred type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IS_STARRED']) && $acleditablecolumns['IS_STARRED']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IS_STARRED']) || $acleditablecolumns['IS_STARRED'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->IS_STARRED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-is-starred" type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="1" <{if $details->IS_STARRED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="0" <{if !$details->IS_STARRED}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->IS_STARRED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
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
    
    <{plugin key="adminmenuitem_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminmenuitemview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminmenuitemview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminmenuitemview_apply_block_visibility(key, value);
            });
        }

        adminmenuitemview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminmenuitemview_update_visibility_settings = function () {
            var settings = adminmenuitemview_get_visibility_settings();

            adminmenuitemview_apply_visibility_settings(settings);
        }

        $(function() {
            adminmenuitemview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/fieldSave",
//                        data: td.find(':input').serialize() + "&adminmenuitem_formdata_UUID=<{$details->UUID}>"
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
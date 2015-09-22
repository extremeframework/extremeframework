<div class="view-main">
    <{plugin key="adminpackage_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
        <{if !isset($columns2hide) || !in_array('NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-name">
	            		        <label class="attribute-name"><{_t('Admin package name')}></label>
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
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_NAME" value="<{$details->NAME|escape}>"  />
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
                                    

    <input class="input-code input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_CODE" value="<{$details->CODE|escape}>"  />
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
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_TYPE']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE_TYPE']) && $aclviewablecolumns['ID_ADMIN_PACKAGE_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE_TYPE']) || $aclviewablecolumns['ID_ADMIN_PACKAGE_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_PACKAGE_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-package-type">
	                    		                    		        <label class="attribute-name"><{_t('Admin package type')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-package-type" colspan="3">
            	<div class="attribute-line column-id-admin-package-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_PACKAGE_TYPE']) && $acleditablecolumns['ID_ADMIN_PACKAGE_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_PACKAGE_TYPE']) || $acleditablecolumns['ID_ADMIN_PACKAGE_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_PACKAGE_TYPE}>
        <{if isset($smarty.session.acl.adminpackagetype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagetype/view/<{$details->refuuid_ID_ADMIN_PACKAGE_TYPE}>"><{$details->reftext_ID_ADMIN_PACKAGE_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PACKAGE_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PACKAGE_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminPackageType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-admin-package-type" class="input-id-admin-package-type" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_TYPE" value=$details->ID_ADMIN_PACKAGE_TYPE text=$details->reftext_ID_ADMIN_PACKAGE_TYPE datasource="ADMIN_PACKAGE_TYPE" datasourcename="AdminPackageType" valuecol="CODE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminpackagetype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagetype/new" title="Create a New Admin Package Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package-type input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_ID_ADMIN_PACKAGE_TYPE" value="<{$details->ID_ADMIN_PACKAGE_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_PACKAGE_TYPE}>
        <{if isset($smarty.session.acl.adminpackagetype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagetype/view/<{$details->refuuid_ID_ADMIN_PACKAGE_TYPE}>"><{$details->reftext_ID_ADMIN_PACKAGE_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PACKAGE_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PACKAGE_TYPE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_CATEGORY']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) && $aclviewablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) || $aclviewablecolumns['ID_ADMIN_PACKAGE_CATEGORY']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_PACKAGE_CATEGORY', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-package-category">
	                    		                    		        <label class="attribute-name"><{_t('Admin package category')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-package-category" colspan="3">
            	<div class="attribute-line column-id-admin-package-category type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) && $acleditablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) || $acleditablecolumns['ID_ADMIN_PACKAGE_CATEGORY'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_PACKAGE_CATEGORY}>
        <{if isset($smarty.session.acl.adminpackagecategory.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/view/<{$details->refuuid_ID_ADMIN_PACKAGE_CATEGORY}>"><{$details->reftext_ID_ADMIN_PACKAGE_CATEGORY|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PACKAGE_CATEGORY|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PACKAGE_CATEGORY}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminPackageCategory')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-admin-package-category" class="input-id-admin-package-category" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_CATEGORY" value=$details->ID_ADMIN_PACKAGE_CATEGORY text=$details->reftext_ID_ADMIN_PACKAGE_CATEGORY datasource="ADMIN_PACKAGE_CATEGORY" datasourcename="AdminPackageCategory" valuecol="CODE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminpackagecategory.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/new" title="Create a New Admin Package Category">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package-category input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_ID_ADMIN_PACKAGE_CATEGORY" value="<{$details->ID_ADMIN_PACKAGE_CATEGORY|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_PACKAGE_CATEGORY}>
        <{if isset($smarty.session.acl.adminpackagecategory.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/view/<{$details->refuuid_ID_ADMIN_PACKAGE_CATEGORY}>"><{$details->reftext_ID_ADMIN_PACKAGE_CATEGORY|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PACKAGE_CATEGORY|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PACKAGE_CATEGORY}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_INDUSTRY']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) && $aclviewablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) || $aclviewablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_PACKAGE_INDUSTRY', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-package-industry">
	                    		                    		        <label class="attribute-name"><{_t('Admin package industry')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-package-industry" colspan="3">
            	<div class="attribute-line column-id-admin-package-industry type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) && $acleditablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) || $acleditablecolumns['ID_ADMIN_PACKAGE_INDUSTRY'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_PACKAGE_INDUSTRY}>
        <{if isset($smarty.session.acl.adminpackageindustry.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackageindustry/view/<{$details->refuuid_ID_ADMIN_PACKAGE_INDUSTRY}>"><{$details->reftext_ID_ADMIN_PACKAGE_INDUSTRY|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PACKAGE_INDUSTRY|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PACKAGE_INDUSTRY}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminPackageIndustry')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-package-industry" class="input-id-admin-package-industry" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_INDUSTRY" value=$details->ID_ADMIN_PACKAGE_INDUSTRY text=$details->reftext_ID_ADMIN_PACKAGE_INDUSTRY datasource="ADMIN_PACKAGE_INDUSTRY" datasourcename="AdminPackageIndustry" valuecol="CODE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminpackageindustry.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackageindustry/new" title="Create a New Admin Package Industry">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package-industry input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_ID_ADMIN_PACKAGE_INDUSTRY" value="<{$details->ID_ADMIN_PACKAGE_INDUSTRY|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_PACKAGE_INDUSTRY}>
        <{if isset($smarty.session.acl.adminpackageindustry.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackageindustry/view/<{$details->refuuid_ID_ADMIN_PACKAGE_INDUSTRY}>"><{$details->reftext_ID_ADMIN_PACKAGE_INDUSTRY|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PACKAGE_INDUSTRY|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PACKAGE_INDUSTRY}>
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
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>adminpackage_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>adminpackage_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.adminpackageform.<{$prefix}>adminpackage_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>adminpackage_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>adminpackage_formdata_IMAGE" value="<{$details->IMAGE}>" />
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
    
            
        
        
            <{if !isset($excludedcolumns['DESCRIPTION']) && ((isset($aclviewablecolumns['DESCRIPTION']) && $aclviewablecolumns['DESCRIPTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DESCRIPTION']) || $aclviewablecolumns['DESCRIPTION']))) }>
        <{if !isset($columns2hide) || !in_array('DESCRIPTION', $columns2hide) }>
    		<td class="form-field form-field-label column-description">
	            		        <label class="attribute-name"><{_t('Description')}></label>
            </td>
            <td class="form-field form-field-value column-description" colspan="3">
            	<div class="attribute-line column-description type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DESCRIPTION']) && $acleditablecolumns['DESCRIPTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DESCRIPTION']) || $acleditablecolumns['DESCRIPTION'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->DESCRIPTION|plugin:"adminpackage_view_field_DESCRIPTION":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-description enable-html" id="<{$prefix}>adminpackage_formdata_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>adminpackage_formdata_DESCRIPTION" rows="5" ><{$details->DESCRIPTION}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->DESCRIPTION|plugin:"adminpackage_view_field_DESCRIPTION":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ENTRY_PATH']) && ((isset($aclviewablecolumns['ENTRY_PATH']) && $aclviewablecolumns['ENTRY_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENTRY_PATH']) || $aclviewablecolumns['ENTRY_PATH']))) }>
        <{if !isset($columns2hide) || !in_array('ENTRY_PATH', $columns2hide) }>
    		<td class="form-field form-field-label column-entry-path">
	            		        <label class="attribute-name"><{_t('Entry path')}></label>
            </td>
            <td class="form-field form-field-value column-entry-path" colspan="3">
            	<div class="attribute-line column-entry-path type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ENTRY_PATH']) && $acleditablecolumns['ENTRY_PATH']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ENTRY_PATH']) || $acleditablecolumns['ENTRY_PATH'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->ENTRY_PATH|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-entry-path input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_ENTRY_PATH" value="<{$details->ENTRY_PATH|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->ENTRY_PATH|escape}>
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
	            		        <label class="attribute-name"><{_t('Author')}></label>
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
                                    

    <input class="input-author input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_AUTHOR" value="<{$details->AUTHOR|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['VERSION']) && ((isset($aclviewablecolumns['VERSION']) && $aclviewablecolumns['VERSION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VERSION']) || $aclviewablecolumns['VERSION']))) }>
        <{if !isset($columns2hide) || !in_array('VERSION', $columns2hide) }>
    		<td class="form-field form-field-label column-version">
	            		        <label class="attribute-name"><{_t('Version')}></label>
            </td>
            <td class="form-field form-field-value column-version" colspan="3">
            	<div class="attribute-line column-version type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VERSION']) && $acleditablecolumns['VERSION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VERSION']) || $acleditablecolumns['VERSION'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->VERSION|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-version input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_VERSION" value="<{$details->VERSION|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->VERSION|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PACKAGE_URL']) && ((isset($aclviewablecolumns['PACKAGE_URL']) && $aclviewablecolumns['PACKAGE_URL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PACKAGE_URL']) || $aclviewablecolumns['PACKAGE_URL']))) }>
        <{if !isset($columns2hide) || !in_array('PACKAGE_URL', $columns2hide) }>
    		<td class="form-field form-field-label column-package-url">
	            		        <label class="attribute-name"><{_t('Package url')}></label>
            </td>
            <td class="form-field form-field-value column-package-url" colspan="3">
            	<div class="attribute-line column-package-url type-url">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PACKAGE_URL']) && $acleditablecolumns['PACKAGE_URL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PACKAGE_URL']) || $acleditablecolumns['PACKAGE_URL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->PACKAGE_URL|shorten_link:128}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-package-url input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_PACKAGE_URL" value="<{$details->PACKAGE_URL|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->PACKAGE_URL|shorten_link:128}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['AUTHOR_URL']) && ((isset($aclviewablecolumns['AUTHOR_URL']) && $aclviewablecolumns['AUTHOR_URL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AUTHOR_URL']) || $aclviewablecolumns['AUTHOR_URL']))) }>
        <{if !isset($columns2hide) || !in_array('AUTHOR_URL', $columns2hide) }>
    		<td class="form-field form-field-label column-author-url">
	            		        <label class="attribute-name"><{_t('Author url')}></label>
            </td>
            <td class="form-field form-field-value column-author-url" colspan="3">
            	<div class="attribute-line column-author-url type-url">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['AUTHOR_URL']) && $acleditablecolumns['AUTHOR_URL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['AUTHOR_URL']) || $acleditablecolumns['AUTHOR_URL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->AUTHOR_URL|shorten_link:128}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-author-url input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_AUTHOR_URL" value="<{$details->AUTHOR_URL|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->AUTHOR_URL|shorten_link:128}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PACKAGE_PATH']) && ((isset($aclviewablecolumns['PACKAGE_PATH']) && $aclviewablecolumns['PACKAGE_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PACKAGE_PATH']) || $aclviewablecolumns['PACKAGE_PATH']))) }>
        <{if !isset($columns2hide) || !in_array('PACKAGE_PATH', $columns2hide) }>
    		<td class="form-field form-field-label column-package-path">
	            		        <label class="attribute-name"><{_t('Package path')}></label>
            </td>
            <td class="form-field form-field-value column-package-path" colspan="3">
            	<div class="attribute-line column-package-path type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PACKAGE_PATH']) && $acleditablecolumns['PACKAGE_PATH']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PACKAGE_PATH']) || $acleditablecolumns['PACKAGE_PATH'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->PACKAGE_PATH|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-package-path input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_PACKAGE_PATH" value="<{$details->PACKAGE_PATH|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->PACKAGE_PATH|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['INSTALLATION_DATE']) && ((isset($aclviewablecolumns['INSTALLATION_DATE']) && $aclviewablecolumns['INSTALLATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INSTALLATION_DATE']) || $aclviewablecolumns['INSTALLATION_DATE']))) }>
        <{if !isset($columns2hide) || !in_array('INSTALLATION_DATE', $columns2hide) }>
    		<td class="form-field form-field-label column-installation-date">
	            		        <label class="attribute-name"><{_t('Installation date')}></label>
            </td>
            <td class="form-field form-field-value column-installation-date" colspan="3">
            	<div class="attribute-line column-installation-date type-date">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['INSTALLATION_DATE']) && $acleditablecolumns['INSTALLATION_DATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['INSTALLATION_DATE']) || $acleditablecolumns['INSTALLATION_DATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->INSTALLATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-installation-date input-type-date field-date" type="text" id="<{$prefix}>adminpackage_formdata_INSTALLATION_DATE" name="<{$prefix}>adminpackage_formdata_INSTALLATION_DATE" value="<{$details->INSTALLATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->INSTALLATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
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
	            		        <label class="attribute-name"><{_t('Latest update')}></label>
            </td>
            <td class="form-field form-field-value column-latest-update" colspan="3">
            	<div class="attribute-line column-latest-update type-date">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LATEST_UPDATE']) && $acleditablecolumns['LATEST_UPDATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LATEST_UPDATE']) || $acleditablecolumns['LATEST_UPDATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-latest-update input-type-date field-date" type="text" id="<{$prefix}>adminpackage_formdata_LATEST_UPDATE" name="<{$prefix}>adminpackage_formdata_LATEST_UPDATE" value="<{$details->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
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
    
    <{plugin key="adminpackage_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminpackageview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminpackageview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminpackageview_apply_block_visibility(key, value);
            });
        }

        adminpackageview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminpackageview_update_visibility_settings = function () {
            var settings = adminpackageview_get_visibility_settings();

            adminpackageview_apply_visibility_settings(settings);
        }

        $(function() {
            adminpackageview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminpackage/fieldSave",
//                        data: td.find(':input').serialize() + "&adminpackage_formdata_UUID=<{$details->UUID}>"
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
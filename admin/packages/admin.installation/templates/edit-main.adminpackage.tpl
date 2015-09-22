<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminpackageform" id="adminpackageform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpackage/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminpackage_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminpackage_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminpackage_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminpackage_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminpackage_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Admin package name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_NAME" value="<{$details->NAME|escape}>"  />
                    <{if $columntooltips.NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-code form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="adminpackage_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="adminpackage_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Code')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
                                    <{if $details->ID && $details->CODE != ''}>
                        <input type="hidden" class="input-code" name="adminpackage_formdata_CODE" value="<{$details->CODE}>" />
                        
    <{$details->CODE|escape}>
                    <{else}>
                        

    <input class="input-code input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_CODE" value="<{$details->CODE|escape}>"  />
                        <{if $columntooltips.CODE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                        <{/if}>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-admin-package-type form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_TYPE'])}>
    
        <{if $preset == 'ID_ADMIN_PACKAGE_TYPE'}>
            <input type="hidden" class="input-id-admin-package-type" name="adminpackage_formdata_ID_ADMIN_PACKAGE_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_PACKAGE_TYPE']) && !$acleditablecolumns['ID_ADMIN_PACKAGE_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_PACKAGE_TYPE'])}>
            <input type="hidden" class="input-id-admin-package-type" name="adminpackage_formdata_ID_ADMIN_PACKAGE_TYPE" value="<{$details->ID_ADMIN_PACKAGE_TYPE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Admin package type')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-id-admin-package-type" colspan="3">
                                    
            <{if Framework::hasModule('AdminPackageType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-admin-package-type" class="input-id-admin-package-type" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_TYPE" value=$details->ID_ADMIN_PACKAGE_TYPE text=$details->reftext_ID_ADMIN_PACKAGE_TYPE datasource="ADMIN_PACKAGE_TYPE" datasourcename="AdminPackageType" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminpackagetype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagetype/new" title="Create a New Admin Package Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package-type input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_ID_ADMIN_PACKAGE_TYPE" value="<{$details->ID_ADMIN_PACKAGE_TYPE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_ADMIN_PACKAGE_TYPE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_PACKAGE_TYPE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-admin-package-category">
            
        
        
        
        <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_CATEGORY'])}>
    
        <{if $preset == 'ID_ADMIN_PACKAGE_CATEGORY'}>
            <input type="hidden" class="input-id-admin-package-category" name="adminpackage_formdata_ID_ADMIN_PACKAGE_CATEGORY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_PACKAGE_CATEGORY']) && !$acleditablecolumns['ID_ADMIN_PACKAGE_CATEGORY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_PACKAGE_CATEGORY'])}>
            <input type="hidden" class="input-id-admin-package-category" name="adminpackage_formdata_ID_ADMIN_PACKAGE_CATEGORY" value="<{$details->ID_ADMIN_PACKAGE_CATEGORY}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Admin package category')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-package-category" colspan="3">
                                    
            <{if Framework::hasModule('AdminPackageCategory')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-admin-package-category" class="input-id-admin-package-category" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_CATEGORY" value=$details->ID_ADMIN_PACKAGE_CATEGORY text=$details->reftext_ID_ADMIN_PACKAGE_CATEGORY datasource="ADMIN_PACKAGE_CATEGORY" datasourcename="AdminPackageCategory" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminpackagecategory.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/new" title="Create a New Admin Package Category">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package-category input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_ID_ADMIN_PACKAGE_CATEGORY" value="<{$details->ID_ADMIN_PACKAGE_CATEGORY|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_ADMIN_PACKAGE_CATEGORY}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_PACKAGE_CATEGORY}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-admin-package-industry">
            
        
        
        
        <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE_INDUSTRY'])}>
    
        <{if $preset == 'ID_ADMIN_PACKAGE_INDUSTRY'}>
            <input type="hidden" class="input-id-admin-package-industry" name="adminpackage_formdata_ID_ADMIN_PACKAGE_INDUSTRY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_PACKAGE_INDUSTRY']) && !$acleditablecolumns['ID_ADMIN_PACKAGE_INDUSTRY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_PACKAGE_INDUSTRY'])}>
            <input type="hidden" class="input-id-admin-package-industry" name="adminpackage_formdata_ID_ADMIN_PACKAGE_INDUSTRY" value="<{$details->ID_ADMIN_PACKAGE_INDUSTRY}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Admin package industry')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-package-industry" colspan="3">
                                    
            <{if Framework::hasModule('AdminPackageIndustry')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-package-industry" class="input-id-admin-package-industry" name="`$prefix`adminpackage_formdata_ID_ADMIN_PACKAGE_INDUSTRY" value=$details->ID_ADMIN_PACKAGE_INDUSTRY text=$details->reftext_ID_ADMIN_PACKAGE_INDUSTRY datasource="ADMIN_PACKAGE_INDUSTRY" datasourcename="AdminPackageIndustry" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminpackageindustry.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackageindustry/new" title="Create a New Admin Package Industry">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package-industry input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_ID_ADMIN_PACKAGE_INDUSTRY" value="<{$details->ID_ADMIN_PACKAGE_INDUSTRY|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_ADMIN_PACKAGE_INDUSTRY}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_PACKAGE_INDUSTRY}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-image">
            
        
        
        
        <{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="adminpackage_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="adminpackage_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Image')}></label>
            </td>
            <td class="form-field form-field-value column-image" colspan="3">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>adminpackage_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>adminpackage_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.adminpackageform.<{$prefix}>adminpackage_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>adminpackage_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>adminpackage_formdata_IMAGE" value="<{$details->IMAGE}>" />
                    <{if $columntooltips.IMAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-description">
            
        
        
        
        <{if !isset($excludedcolumns['DESCRIPTION'])}>
    
        <{if $preset == 'DESCRIPTION'}>
            <input type="hidden" class="input-description" name="adminpackage_formdata_DESCRIPTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DESCRIPTION']) && !$acleditablecolumns['DESCRIPTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DESCRIPTION'])}>
            <input type="hidden" class="input-description" name="adminpackage_formdata_DESCRIPTION" value="<{$details->DESCRIPTION}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Description')}></label>
            </td>
            <td class="form-field form-field-value column-description" colspan="3">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-description enable-html" id="<{$prefix}>adminpackage_formdata_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>adminpackage_formdata_DESCRIPTION" rows="5" ><{$details->DESCRIPTION}></textarea>
                    <{if $columntooltips.DESCRIPTION}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.DESCRIPTION}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-entry-path form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['ENTRY_PATH'])}>
    
        <{if $preset == 'ENTRY_PATH'}>
            <input type="hidden" class="input-entry-path" name="adminpackage_formdata_ENTRY_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENTRY_PATH']) && !$acleditablecolumns['ENTRY_PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENTRY_PATH'])}>
            <input type="hidden" class="input-entry-path" name="adminpackage_formdata_ENTRY_PATH" value="<{$details->ENTRY_PATH}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Entry path')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-entry-path" colspan="3">
                                    

    <input class="input-entry-path input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_ENTRY_PATH" value="<{$details->ENTRY_PATH|escape}>"  />
                    <{if $columntooltips.ENTRY_PATH}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ENTRY_PATH}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-author">
            
        
        
        
        <{if !isset($excludedcolumns['AUTHOR'])}>
    
        <{if $preset == 'AUTHOR'}>
            <input type="hidden" class="input-author" name="adminpackage_formdata_AUTHOR" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['AUTHOR']) && !$acleditablecolumns['AUTHOR'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['AUTHOR'])}>
            <input type="hidden" class="input-author" name="adminpackage_formdata_AUTHOR" value="<{$details->AUTHOR}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Author')}></label>
            </td>
            <td class="form-field form-field-value column-author" colspan="3">
                                    

    <input class="input-author input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_AUTHOR" value="<{$details->AUTHOR|escape}>"  />
                    <{if $columntooltips.AUTHOR}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.AUTHOR}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-version">
            
        
        
        
        <{if !isset($excludedcolumns['VERSION'])}>
    
        <{if $preset == 'VERSION'}>
            <input type="hidden" class="input-version" name="adminpackage_formdata_VERSION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VERSION']) && !$acleditablecolumns['VERSION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VERSION'])}>
            <input type="hidden" class="input-version" name="adminpackage_formdata_VERSION" value="<{$details->VERSION}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Version')}></label>
            </td>
            <td class="form-field form-field-value column-version" colspan="3">
                                    

    <input class="input-version input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_VERSION" value="<{$details->VERSION|escape}>"  />
                    <{if $columntooltips.VERSION}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.VERSION}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-package-url">
            
        
        
        
        <{if !isset($excludedcolumns['PACKAGE_URL'])}>
    
        <{if $preset == 'PACKAGE_URL'}>
            <input type="hidden" class="input-package-url" name="adminpackage_formdata_PACKAGE_URL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PACKAGE_URL']) && !$acleditablecolumns['PACKAGE_URL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PACKAGE_URL'])}>
            <input type="hidden" class="input-package-url" name="adminpackage_formdata_PACKAGE_URL" value="<{$details->PACKAGE_URL}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Package url')}></label>
            </td>
            <td class="form-field form-field-value column-package-url" colspan="3">
                                    

    <input class="input-package-url input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_PACKAGE_URL" value="<{$details->PACKAGE_URL|escape}>"  />
                    <{if $columntooltips.PACKAGE_URL}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PACKAGE_URL}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-author-url">
            
        
        
        
        <{if !isset($excludedcolumns['AUTHOR_URL'])}>
    
        <{if $preset == 'AUTHOR_URL'}>
            <input type="hidden" class="input-author-url" name="adminpackage_formdata_AUTHOR_URL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['AUTHOR_URL']) && !$acleditablecolumns['AUTHOR_URL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['AUTHOR_URL'])}>
            <input type="hidden" class="input-author-url" name="adminpackage_formdata_AUTHOR_URL" value="<{$details->AUTHOR_URL}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Author url')}></label>
            </td>
            <td class="form-field form-field-value column-author-url" colspan="3">
                                    

    <input class="input-author-url input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_AUTHOR_URL" value="<{$details->AUTHOR_URL|escape}>"  />
                    <{if $columntooltips.AUTHOR_URL}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.AUTHOR_URL}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-package-path">
            
        
        
        
        <{if !isset($excludedcolumns['PACKAGE_PATH'])}>
    
        <{if $preset == 'PACKAGE_PATH'}>
            <input type="hidden" class="input-package-path" name="adminpackage_formdata_PACKAGE_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PACKAGE_PATH']) && !$acleditablecolumns['PACKAGE_PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PACKAGE_PATH'])}>
            <input type="hidden" class="input-package-path" name="adminpackage_formdata_PACKAGE_PATH" value="<{$details->PACKAGE_PATH}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Package path')}></label>
            </td>
            <td class="form-field form-field-value column-package-path" colspan="3">
                                    

    <input class="input-package-path input-type-text" type="text" name="<{$prefix}>adminpackage_formdata_PACKAGE_PATH" value="<{$details->PACKAGE_PATH|escape}>"  />
                    <{if $columntooltips.PACKAGE_PATH}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PACKAGE_PATH}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-installation-date">
            
        
        
        
        <{if !isset($excludedcolumns['INSTALLATION_DATE'])}>
    
        <{if $preset == 'INSTALLATION_DATE'}>
            <input type="hidden" class="input-installation-date" name="adminpackage_formdata_INSTALLATION_DATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['INSTALLATION_DATE']) && !$acleditablecolumns['INSTALLATION_DATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['INSTALLATION_DATE'])}>
            <input type="hidden" class="input-installation-date" name="adminpackage_formdata_INSTALLATION_DATE" value="<{$details->INSTALLATION_DATE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Installation date')}></label>
            </td>
            <td class="form-field form-field-value column-installation-date" colspan="3">
                                    
    <input class="input-installation-date input-type-date field-date" type="text" id="<{$prefix}>adminpackage_formdata_INSTALLATION_DATE" name="<{$prefix}>adminpackage_formdata_INSTALLATION_DATE" value="<{$details->INSTALLATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.INSTALLATION_DATE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.INSTALLATION_DATE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-latest-update">
            
        
        
                    </tr>                    
                    <!-- Custom fields -->
                    <{if $customfields}>
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
                    <{if $item->TOOLTIP}>
                        <i class="fa fa-info-circle" title="<{$item->TOOLTIP}>"></i>
                    <{/if}>
                </div>
            </td>
		</tr>
	<{/foreach}>
<{/if}>                </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{plugin key="adminpackage_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('adminpackage_formdata_NAME', 'adminpackage_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminpackageform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminpackageform :input').change(function() {
        $('#adminpackageform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminpackageform').length) {
            if ($('#adminpackageform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminpackage/savedraft/",
                    data: $('#adminpackageform').serialize()
                });

                $('#adminpackageform').data('changed', false);
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
    adminpackage_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminpackageform').find('[name*=adminpackage_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminpackage_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminpackage_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminpackage_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminpackage_apply_block_visibility(key, value);
        });
    }

    adminpackage_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminpackage_update_visibility_settings = function () {
        var model = adminpackage_get_editing_model();

        var settings = adminpackage_get_visibility_settings(model);

        adminpackage_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminpackageform :input').change(function() {
            adminpackage_update_visibility_settings();
        });

        adminpackage_update_visibility_settings();
    });
</script>
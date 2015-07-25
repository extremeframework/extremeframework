<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminmenuitemform" id="adminmenuitemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminmenuitem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminmenuitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminmenuitem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminmenuitem_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminmenuitem_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_MENU'])}>
    
        <{if $preset == 'ID_ADMIN_MENU'}>
            <input type="hidden" class="input-id-admin-menu" name="adminmenuitem_formdata_ID_ADMIN_MENU" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_MENU']) && !$acleditablecolumns['ID_ADMIN_MENU'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_MENU'])}>
            <input type="hidden" class="input-id-admin-menu" name="adminmenuitem_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-menu">
                <div class="form-field form-field-label">
        		    <label><{_t('Admin menu')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-menu" colspan="3">
                <div class="form-field form-field-value column-id-admin-menu">
                                            
            <{if Framework::hasModule('AdminMenu')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-menu" class="input-id-admin-menu" name="`$prefix`adminmenuitem_formdata_ID_ADMIN_MENU" value=$details->ID_ADMIN_MENU text=$details->reftext_ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmenu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new" title="Create a New Admin Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-menu input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_MENU}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_MENU}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PARENT'])}>
    
        <{if $preset == 'PARENT'}>
            <input type="hidden" class="input-parent" name="adminmenuitem_formdata_PARENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PARENT']) && !$acleditablecolumns['PARENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PARENT'])}>
            <input type="hidden" class="input-parent" name="adminmenuitem_formdata_PARENT" value="<{$details->PARENT}>" />
        <{else}>
    		<td class="form-row form-row-parent">
                <div class="form-field form-field-label">
        		    <label><{_t('Parent')}></label>
                </div>
            </td>
            <td class="form-row form-row-parent" colspan="3">
                <div class="form-field form-field-value column-parent">
                                            
            <{if Framework::hasModule('AdminMenuItem')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`adminmenuitem_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="ADMIN_MENU_ITEM" valuecol="ID" textcol="NAME" sortcol="" groupcol="ID_ADMIN_MENU" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmenuitem.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/new" title="Create a New Admin Menu Item">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                            <{if $columntooltips.PARENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PARENT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="adminmenuitem_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="adminmenuitem_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module">
                <div class="form-field form-field-label">
        		    <label><{_t('Module')}></label>
                </div>
            </td>
            <td class="form-row form-row-module" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminmenuitem_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PATH'])}>
    
        <{if $preset == 'PATH'}>
            <input type="hidden" class="input-path" name="adminmenuitem_formdata_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PATH']) && !$acleditablecolumns['PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PATH'])}>
            <input type="hidden" class="input-path" name="adminmenuitem_formdata_PATH" value="<{$details->PATH}>" />
        <{else}>
    		<td class="form-row form-row-path">
                <div class="form-field form-field-label">
        		    <label><{_t('Path')}></label>
                </div>
            </td>
            <td class="form-row form-row-path" colspan="3">
                <div class="form-field form-field-value column-path">
                                            

    <input class="input-path input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_PATH" value="<{$details->PATH|escape}>"  />
                        <{if $columntooltips.PATH}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PATH}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['FONT_AWESOME_ICON'])}>
    
        <{if $preset == 'FONT_AWESOME_ICON'}>
            <input type="hidden" class="input-font-awesome-icon" name="adminmenuitem_formdata_FONT_AWESOME_ICON" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FONT_AWESOME_ICON']) && !$acleditablecolumns['FONT_AWESOME_ICON'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FONT_AWESOME_ICON'])}>
            <input type="hidden" class="input-font-awesome-icon" name="adminmenuitem_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON}>" />
        <{else}>
    		<td class="form-row form-row-font-awesome-icon">
                <div class="form-field form-field-label">
        		    <label><{_t('Font awesome icon')}></label>
                </div>
            </td>
            <td class="form-row form-row-font-awesome-icon" colspan="3">
                <div class="form-field form-field-value column-font-awesome-icon">
                                            

    <input class="input-font-awesome-icon input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON|escape}>"  />
                        <{if $columntooltips.FONT_AWESOME_ICON}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.FONT_AWESOME_ICON}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_LEFT'])}>
    
        <{if $preset == 'ENABLE_LEFT'}>
            <input type="hidden" class="input-enable-left" name="adminmenuitem_formdata_ENABLE_LEFT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_LEFT']) && !$acleditablecolumns['ENABLE_LEFT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_LEFT'])}>
            <input type="hidden" class="input-enable-left" name="adminmenuitem_formdata_ENABLE_LEFT" value="<{$details->ENABLE_LEFT}>" />
        <{else}>
    		<td class="form-row form-row-enable-left">
                <div class="form-field form-field-label">
        		    <label><{_t('Enable left?')}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-left" colspan="3">
                <div class="form-field form-field-value column-enable-left">
                                            

    <span class="input-type-radio"><input class="input-enable-left" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="1" <{if $details->ENABLE_LEFT}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="0" <{if !$details->ENABLE_LEFT}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.ENABLE_LEFT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_LEFT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_TOP'])}>
    
        <{if $preset == 'ENABLE_TOP'}>
            <input type="hidden" class="input-enable-top" name="adminmenuitem_formdata_ENABLE_TOP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_TOP']) && !$acleditablecolumns['ENABLE_TOP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_TOP'])}>
            <input type="hidden" class="input-enable-top" name="adminmenuitem_formdata_ENABLE_TOP" value="<{$details->ENABLE_TOP}>" />
        <{else}>
    		<td class="form-row form-row-enable-top">
                <div class="form-field form-field-label">
        		    <label><{_t('Enable top?')}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-top" colspan="3">
                <div class="form-field form-field-value column-enable-top">
                                            

    <span class="input-type-radio"><input class="input-enable-top" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="1" <{if $details->ENABLE_TOP}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="0" <{if !$details->ENABLE_TOP}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.ENABLE_TOP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_TOP}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_QUICK'])}>
    
        <{if $preset == 'ENABLE_QUICK'}>
            <input type="hidden" class="input-enable-quick" name="adminmenuitem_formdata_ENABLE_QUICK" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_QUICK']) && !$acleditablecolumns['ENABLE_QUICK'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_QUICK'])}>
            <input type="hidden" class="input-enable-quick" name="adminmenuitem_formdata_ENABLE_QUICK" value="<{$details->ENABLE_QUICK}>" />
        <{else}>
    		<td class="form-row form-row-enable-quick">
                <div class="form-field form-field-label">
        		    <label><{_t('Enable quick?')}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-quick" colspan="3">
                <div class="form-field form-field-value column-enable-quick">
                                            

    <span class="input-type-radio"><input class="input-enable-quick" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="1" <{if $details->ENABLE_QUICK}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="0" <{if !$details->ENABLE_QUICK}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.ENABLE_QUICK}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_QUICK}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_ALL'])}>
    
        <{if $preset == 'ENABLE_ALL'}>
            <input type="hidden" class="input-enable-all" name="adminmenuitem_formdata_ENABLE_ALL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_ALL']) && !$acleditablecolumns['ENABLE_ALL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_ALL'])}>
            <input type="hidden" class="input-enable-all" name="adminmenuitem_formdata_ENABLE_ALL" value="<{$details->ENABLE_ALL}>" />
        <{else}>
    		<td class="form-row form-row-enable-all">
                <div class="form-field form-field-label">
        		    <label><{_t('Enable all?')}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-all" colspan="3">
                <div class="form-field form-field-value column-enable-all">
                                            

    <span class="input-type-radio"><input class="input-enable-all" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="1" <{if $details->ENABLE_ALL}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="0" <{if !$details->ENABLE_ALL}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.ENABLE_ALL}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_ALL}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_SETTINGS'])}>
    
        <{if $preset == 'ENABLE_SETTINGS'}>
            <input type="hidden" class="input-enable-settings" name="adminmenuitem_formdata_ENABLE_SETTINGS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_SETTINGS']) && !$acleditablecolumns['ENABLE_SETTINGS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_SETTINGS'])}>
            <input type="hidden" class="input-enable-settings" name="adminmenuitem_formdata_ENABLE_SETTINGS" value="<{$details->ENABLE_SETTINGS}>" />
        <{else}>
    		<td class="form-row form-row-enable-settings">
                <div class="form-field form-field-label">
        		    <label><{_t('Enable settings?')}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-settings" colspan="3">
                <div class="form-field form-field-value column-enable-settings">
                                            

    <span class="input-type-radio"><input class="input-enable-settings" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="1" <{if $details->ENABLE_SETTINGS}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="0" <{if !$details->ENABLE_SETTINGS}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.ENABLE_SETTINGS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_SETTINGS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['OPEN_IN_NEW_WINDOW'])}>
    
        <{if $preset == 'OPEN_IN_NEW_WINDOW'}>
            <input type="hidden" class="input-open-in-new-window" name="adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['OPEN_IN_NEW_WINDOW']) && !$acleditablecolumns['OPEN_IN_NEW_WINDOW'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['OPEN_IN_NEW_WINDOW'])}>
            <input type="hidden" class="input-open-in-new-window" name="adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="<{$details->OPEN_IN_NEW_WINDOW}>" />
        <{else}>
    		<td class="form-row form-row-open-in-new-window">
                <div class="form-field form-field-label">
        		    <label><{_t('Open in new window')}></label>
                </div>
            </td>
            <td class="form-row form-row-open-in-new-window" colspan="3">
                <div class="form-field form-field-value column-open-in-new-window">
                                            

    <span class="input-type-radio"><input class="input-open-in-new-window" type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="1" <{if $details->OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="0" <{if !$details->OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.OPEN_IN_NEW_WINDOW}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.OPEN_IN_NEW_WINDOW}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_STARRED'])}>
    
        <{if $preset == 'IS_STARRED'}>
            <input type="hidden" class="input-is-starred" name="adminmenuitem_formdata_IS_STARRED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_STARRED']) && !$acleditablecolumns['IS_STARRED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_STARRED'])}>
            <input type="hidden" class="input-is-starred" name="adminmenuitem_formdata_IS_STARRED" value="<{$details->IS_STARRED}>" />
        <{else}>
    		<td class="form-row form-row-is-starred">
                <div class="form-field form-field-label">
        		    <label><{_t('Starred?')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-starred" colspan="3">
                <div class="form-field form-field-value column-is-starred">
                                            

    <span class="input-type-radio"><input class="input-is-starred" type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="1" <{if $details->IS_STARRED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="0" <{if !$details->IS_STARRED}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.IS_STARRED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_STARRED}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="adminmenuitem_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="adminmenuitem_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('Ordering')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>adminmenuitem_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                        <{if $columntooltips.ORDERING}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
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

        <{plugin key="adminmenuitem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmenuitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminmenuitemform :input').change(function() {
        $('#adminmenuitemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminmenuitemform').length) {
            if ($('#adminmenuitemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/savedraft/",
                    data: $('#adminmenuitemform').serialize()
                });

                $('#adminmenuitemform').data('changed', false);
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
    adminmenuitem_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminmenuitemform').find('[name*=adminmenuitem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminmenuitem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminmenuitem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminmenuitem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminmenuitem_apply_block_visibility(key, value);
        });
    }

    adminmenuitem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminmenuitem_update_visibility_settings = function () {
        var model = adminmenuitem_get_editing_model();

        var settings = adminmenuitem_get_visibility_settings(model);

        adminmenuitem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminmenuitemform :input').change(function() {
            adminmenuitem_update_visibility_settings();
        });

        adminmenuitem_update_visibility_settings();
    });
</script>
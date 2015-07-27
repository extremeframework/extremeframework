<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminmenuitem-rowedit <{if $row->UUID}>adminmenuitem-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminmenuitem.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminmenuitemlistchk" name="adminmenuitemlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminmenuitem_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminmenuitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminmenuitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>adminmenuitem_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>"><{/if}>    	    <{$row->NAME|escape}>
    <{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_MENU', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_MENU']) && ((isset($aclviewablecolumns['ID_ADMIN_MENU']) && $aclviewablecolumns['ID_ADMIN_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_MENU']) || $aclviewablecolumns['ID_ADMIN_MENU']))) }>
                <td class="column column-id-admin-menu reftext" >
                                            <{if (in_array('ID_ADMIN_MENU', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_ADMIN_MENU}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-admin-menu" name="`$prefix`adminmenuitem_formdata_ID_ADMIN_MENU" value=$formdata.ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminmenu.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new" title="Create a New Admin Menu">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_MENU}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmenu.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$row->refuuid_ID_ADMIN_MENU}>"><{$row->reftext_ID_ADMIN_MENU|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_MENU|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_MENU}><{$row->ID_ADMIN_MENU|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module reftext" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataMODULE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminmenuitem_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.adminmodule.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_MODULE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminmodule.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$row->refuuid_MODULE}>"><{$row->reftext_MODULE|escape}></a>
        <{else}>
            <{$row->reftext_MODULE|escape}>        <{/if}>
    <{else}>
    	<{if $row->MODULE}><{$row->MODULE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
                <td class="column column-path text" >
                                            <{if (in_array('PATH', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataPATH}>

                        
                            <input class="input-path" type="text" name="<{$prefix}>adminmenuitem_formdata_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/view/<{$row->UUID}>"><{/if}>    	    <{$row->PATH|escape}>
    <{if isset($smarty.session.acl.adminmenuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('FONT_AWESOME_ICON', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
                <td class="column column-font-awesome-icon text" >
                                            <{if (in_array('FONT_AWESOME_ICON', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataFONT_AWESOME_ICON}>

                        
                            <input class="input-font-awesome-icon" type="text" name="<{$prefix}>adminmenuitem_formdata_FONT_AWESOME_ICON" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->FONT_AWESOME_ICON|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ENABLE_LEFT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_LEFT']) && ((isset($aclviewablecolumns['ENABLE_LEFT']) && $aclviewablecolumns['ENABLE_LEFT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_LEFT']) || $aclviewablecolumns['ENABLE_LEFT']))) }>
                <td class="column column-enable-left yesno" data-value="<{$row->ENABLE_LEFT}>" data-column="ENABLE_LEFT" data-module="adminmenuitem">
                                            <{if (in_array('ENABLE_LEFT', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataENABLE_LEFT}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-left" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" >
                                    <option value="1" <{if $formdata.ENABLE_LEFT}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_LEFT}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-left" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="1" <{if $formdata.ENABLE_LEFT}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="0" <{if !$formdata.ENABLE_LEFT}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->ENABLE_LEFT}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ENABLE_TOP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_TOP']) && ((isset($aclviewablecolumns['ENABLE_TOP']) && $aclviewablecolumns['ENABLE_TOP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_TOP']) || $aclviewablecolumns['ENABLE_TOP']))) }>
                <td class="column column-enable-top yesno" data-value="<{$row->ENABLE_TOP}>" data-column="ENABLE_TOP" data-module="adminmenuitem">
                                            <{if (in_array('ENABLE_TOP', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataENABLE_TOP}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-top" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" >
                                    <option value="1" <{if $formdata.ENABLE_TOP}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_TOP}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-top" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="1" <{if $formdata.ENABLE_TOP}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="0" <{if !$formdata.ENABLE_TOP}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->ENABLE_TOP}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ENABLE_QUICK', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_QUICK']) && ((isset($aclviewablecolumns['ENABLE_QUICK']) && $aclviewablecolumns['ENABLE_QUICK']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_QUICK']) || $aclviewablecolumns['ENABLE_QUICK']))) }>
                <td class="column column-enable-quick yesno" data-value="<{$row->ENABLE_QUICK}>" data-column="ENABLE_QUICK" data-module="adminmenuitem">
                                            <{if (in_array('ENABLE_QUICK', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataENABLE_QUICK}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-quick" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" >
                                    <option value="1" <{if $formdata.ENABLE_QUICK}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_QUICK}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-quick" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="1" <{if $formdata.ENABLE_QUICK}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="0" <{if !$formdata.ENABLE_QUICK}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->ENABLE_QUICK}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ENABLE_ALL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_ALL']) && ((isset($aclviewablecolumns['ENABLE_ALL']) && $aclviewablecolumns['ENABLE_ALL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_ALL']) || $aclviewablecolumns['ENABLE_ALL']))) }>
                <td class="column column-enable-all yesno" data-value="<{$row->ENABLE_ALL}>" data-column="ENABLE_ALL" data-module="adminmenuitem">
                                            <{if (in_array('ENABLE_ALL', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataENABLE_ALL}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-all" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" >
                                    <option value="1" <{if $formdata.ENABLE_ALL}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_ALL}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-all" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="1" <{if $formdata.ENABLE_ALL}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="0" <{if !$formdata.ENABLE_ALL}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->ENABLE_ALL}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ENABLE_SETTINGS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ENABLE_SETTINGS']) && ((isset($aclviewablecolumns['ENABLE_SETTINGS']) && $aclviewablecolumns['ENABLE_SETTINGS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_SETTINGS']) || $aclviewablecolumns['ENABLE_SETTINGS']))) }>
                <td class="column column-enable-settings yesno" data-value="<{$row->ENABLE_SETTINGS}>" data-column="ENABLE_SETTINGS" data-module="adminmenuitem">
                                            <{if (in_array('ENABLE_SETTINGS', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataENABLE_SETTINGS}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-enable-settings" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" >
                                    <option value="1" <{if $formdata.ENABLE_SETTINGS}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.ENABLE_SETTINGS}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-enable-settings" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="1" <{if $formdata.ENABLE_SETTINGS}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="0" <{if !$formdata.ENABLE_SETTINGS}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->ENABLE_SETTINGS}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('OPEN_IN_NEW_WINDOW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['OPEN_IN_NEW_WINDOW']) && ((isset($aclviewablecolumns['OPEN_IN_NEW_WINDOW']) && $aclviewablecolumns['OPEN_IN_NEW_WINDOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OPEN_IN_NEW_WINDOW']) || $aclviewablecolumns['OPEN_IN_NEW_WINDOW']))) }>
                <td class="column column-open-in-new-window yesno" data-value="<{$row->OPEN_IN_NEW_WINDOW}>" data-column="OPEN_IN_NEW_WINDOW" data-module="adminmenuitem">
                                            <{if (in_array('OPEN_IN_NEW_WINDOW', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataOPEN_IN_NEW_WINDOW}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-open-in-new-window" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" >
                                    <option value="1" <{if $formdata.OPEN_IN_NEW_WINDOW}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.OPEN_IN_NEW_WINDOW}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-open-in-new-window" type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="1" <{if $formdata.OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_OPEN_IN_NEW_WINDOW" value="0" <{if !$formdata.OPEN_IN_NEW_WINDOW}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->OPEN_IN_NEW_WINDOW}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_STARRED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_STARRED']) && ((isset($aclviewablecolumns['IS_STARRED']) && $aclviewablecolumns['IS_STARRED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_STARRED']) || $aclviewablecolumns['IS_STARRED']))) }>
                <td class="column column-is-starred yesno" data-value="<{$row->IS_STARRED}>" data-column="IS_STARRED" data-module="adminmenuitem">
                                            <{if (in_array('IS_STARRED', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataIS_STARRED}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-starred" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" >
                                    <option value="1" <{if $formdata.IS_STARRED}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_STARRED}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-starred" type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="1" <{if $formdata.IS_STARRED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_IS_STARRED" value="0" <{if !$formdata.IS_STARRED}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_STARRED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminmenuitem_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="number number-format"><{if $row->ORDERING != 0}><{$row->ORDERING}><{/if}></span>
    
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{include file="item.edit.tpl" customfield=$item id=$row->UUID value=CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<td class="actions">
	    <{if $row->UUID}>
    	    <div class="adminmenuitem-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminmenuitem.0}>
        $('.adminmenuitem-rowedit-message').html('<{$messages.adminmenuitem.0}>').show();
    <{/if}>

    $('#adminmenuitemlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminmenuitemlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminmenuitemlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminmenuitemlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminmenuitem-rowedit-save').click();
        }
    });

    bind_hotkey("#adminmenuitemlist > tbody tr.rowedit input[type=text]", 'f2', '.adminmenuitem-rowedit-save');
    bind_hotkey("#adminmenuitemlist > tbody tr.rowedit input[type=text]", 'esc', '.adminmenuitem-rowedit-cancel');
</script>



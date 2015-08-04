<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="pagesection-rowedit <{if $row->UUID}>pagesection-rowedit-existing rowedit-existing<{/if}> <{if $messages.pagesection.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="pagesectionlistchk" name="pagesectionlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="pagesection_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>pagesection_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="pagesection_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>pagesection_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$row->UUID}>"><{/if}>    	    <{$row->TITLE|escape}>
    <{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
                <td class="column column-id-page reftext" >
                                            <{if (in_array('ID_PAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_PAGE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagesection_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.page.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_ID_PAGE}>"><{$row->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE}><{$row->ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text" >
                                            <{if (in_array('CODE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCODE}>

                        
                            <input class="input-code" type="text" name="<{$prefix}>pagesection_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$row->UUID}>"><{/if}>    	    <{$row->CODE|escape}>
    <{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image" >
                                            <span>    <{media src=$row->IMAGE thumbnail=1}>
</span>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('FONT_AWESOME_ICON', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
                <td class="column column-font-awesome-icon text" >
                                            <{if (in_array('FONT_AWESOME_ICON', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataFONT_AWESOME_ICON}>

                        
                            <input class="input-font-awesome-icon" type="text" name="<{$prefix}>pagesection_formdata_FONT_AWESOME_ICON" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->FONT_AWESOME_ICON|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('BACKGROUND_IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['BACKGROUND_IMAGE']) && ((isset($aclviewablecolumns['BACKGROUND_IMAGE']) && $aclviewablecolumns['BACKGROUND_IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_IMAGE']) || $aclviewablecolumns['BACKGROUND_IMAGE']))) }>
                <td class="column column-background-image image" >
                                            <span>    <{media src=$row->BACKGROUND_IMAGE thumbnail=1}>
</span>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('BACKGROUND_COLOR', $filtercolumns)) }>
            <{if !isset($excludedcolumns['BACKGROUND_COLOR']) && ((isset($aclviewablecolumns['BACKGROUND_COLOR']) && $aclviewablecolumns['BACKGROUND_COLOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_COLOR']) || $aclviewablecolumns['BACKGROUND_COLOR']))) }>
                <td class="column column-background-color color" >
                                            <{if (in_array('BACKGROUND_COLOR', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataBACKGROUND_COLOR}>

                        
                            <input class="input-background-color" type="text" name="<{$prefix}>pagesection_formdata_BACKGROUND_COLOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->BACKGROUND_COLOR|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VIDEO', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VIDEO']) && ((isset($aclviewablecolumns['VIDEO']) && $aclviewablecolumns['VIDEO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIDEO']) || $aclviewablecolumns['VIDEO']))) }>
                <td class="column column-video video" >
                                            <span>    <{media src=$row->VIDEO thumbnail=1}>
</span>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VIEW_MORE_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VIEW_MORE_TITLE']) && ((isset($aclviewablecolumns['VIEW_MORE_TITLE']) && $aclviewablecolumns['VIEW_MORE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_TITLE']) || $aclviewablecolumns['VIEW_MORE_TITLE']))) }>
                <td class="column column-view-more-title text" >
                                            <{if (in_array('VIEW_MORE_TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVIEW_MORE_TITLE}>

                        
                            <input class="input-view-more-title" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->VIEW_MORE_TITLE|escape}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VIEW_MORE_ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VIEW_MORE_ID_PAGE']) && ((isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) && $aclviewablecolumns['VIEW_MORE_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) || $aclviewablecolumns['VIEW_MORE_ID_PAGE']))) }>
                <td class="column column-view-more-id-page reftext" >
                                            <{if (in_array('VIEW_MORE_ID_PAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVIEW_MORE_ID_PAGE}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-view-more-id-page" name="`$prefix`pagesection_formdata_VIEW_MORE_ID_PAGE" value=$formdata.VIEW_MORE_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.page.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_VIEW_MORE_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_VIEW_MORE_ID_PAGE}>"><{$row->reftext_VIEW_MORE_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_VIEW_MORE_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->VIEW_MORE_ID_PAGE}><{$row->VIEW_MORE_ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('HIDE_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['HIDE_TITLE']) && ((isset($aclviewablecolumns['HIDE_TITLE']) && $aclviewablecolumns['HIDE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HIDE_TITLE']) || $aclviewablecolumns['HIDE_TITLE']))) }>
                <td class="column column-hide-title yesno" data-value="<{$row->HIDE_TITLE}>" data-column="HIDE_TITLE" data-module="pagesection">
                                            <{if (in_array('HIDE_TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataHIDE_TITLE}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-hide-title" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" >
                                    <option value="1" <{if $formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="1" <{if $formdata.HIDE_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="0" <{if !$formdata.HIDE_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->HIDE_TITLE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_TAB_ANCHOR_SECTION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_TAB_ANCHOR_SECTION']) && ((isset($aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) && $aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) || $aclviewablecolumns['IS_TAB_ANCHOR_SECTION']))) }>
                <td class="column column-is-tab-anchor-section yesno" data-value="<{$row->IS_TAB_ANCHOR_SECTION}>" data-column="IS_TAB_ANCHOR_SECTION" data-module="pagesection">
                                            <{if (in_array('IS_TAB_ANCHOR_SECTION', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataIS_TAB_ANCHOR_SECTION}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-tab-anchor-section" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" >
                                    <option value="1" <{if $formdata.IS_TAB_ANCHOR_SECTION}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_TAB_ANCHOR_SECTION}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-tab-anchor-section" type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="1" <{if $formdata.IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="0" <{if !$formdata.IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_TAB_ANCHOR_SECTION}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TAB_ANCHOR_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TAB_ANCHOR_TITLE']) && ((isset($aclviewablecolumns['TAB_ANCHOR_TITLE']) && $aclviewablecolumns['TAB_ANCHOR_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAB_ANCHOR_TITLE']) || $aclviewablecolumns['TAB_ANCHOR_TITLE']))) }>
                <td class="column column-tab-anchor-title text" >
                                            <{if (in_array('TAB_ANCHOR_TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTAB_ANCHOR_TITLE}>

                        
                            <input class="input-tab-anchor-title" type="text" name="<{$prefix}>pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->TAB_ANCHOR_TITLE|escape}>
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

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagesection_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="pagesection-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.pagesection.0}>
        $('.pagesection-rowedit-message').html('<{$messages.pagesection.0}>').show();
    <{/if}>

    $('#pagesectionlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#pagesectionlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#pagesectionlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#pagesectionlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.pagesection-rowedit-save').click();
        }
    });

    bind_hotkey("#pagesectionlist > tbody tr.rowedit input[type=text]", 'f2', '.pagesection-rowedit-save');
    bind_hotkey("#pagesectionlist > tbody tr.rowedit input[type=text]", 'esc', '.pagesection-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('pagesection_formdata_TITLE', 'pagesection_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


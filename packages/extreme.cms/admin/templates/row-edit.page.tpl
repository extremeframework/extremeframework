<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="page-rowedit <{if $row->UUID}>page-rowedit-existing rowedit-existing<{/if}> <{if $messages.page.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="pagelistchk" name="pagelist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="page_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>page_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="page_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>page_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.page.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.page.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>page_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.page.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.page.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('THUMB', $filtercolumns)) }>
            <{if !isset($excludedcolumns['THUMB']) && ((isset($aclviewablecolumns['THUMB']) && $aclviewablecolumns['THUMB']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['THUMB']) || $aclviewablecolumns['THUMB']))) }>
                <td class="column column-thumb image" >
                                            <span>    <{media src=$row->THUMB thumbnail=1}>
</span>
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
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image" >
                                            <span>    <{media src=$row->IMAGE thumbnail=1}>
</span>
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
	        <{if (in_array('META_KEYWORDS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
                <td class="column column-meta-keywords text" >
                                            <{if (in_array('META_KEYWORDS', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataMETA_KEYWORDS}>

                        
                            <input class="input-meta-keywords" type="text" name="<{$prefix}>page_formdata_META_KEYWORDS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->META_KEYWORDS|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_TEMPLATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
                <td class="column column-id-template reftext" >
                                            <{if (in_array('ID_TEMPLATE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_TEMPLATE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-template" name="`$prefix`page_formdata_ID_TEMPLATE" value=$formdata.ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/template/new" title="Create a New Template">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.page.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_TEMPLATE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.template.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/template/view/<{$row->refuuid_ID_TEMPLATE}>"><{$row->reftext_ID_TEMPLATE|escape}></a>
        <{else}>
            <{$row->reftext_ID_TEMPLATE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_TEMPLATE}><{$row->ID_TEMPLATE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.page.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOM_TOP_ID_MENU', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOM_TOP_ID_MENU']) && ((isset($aclviewablecolumns['CUSTOM_TOP_ID_MENU']) && $aclviewablecolumns['CUSTOM_TOP_ID_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOM_TOP_ID_MENU']) || $aclviewablecolumns['CUSTOM_TOP_ID_MENU']))) }>
                <td class="column column-custom-top-id-menu reftext" >
                                            <{if (in_array('CUSTOM_TOP_ID_MENU', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCUSTOM_TOP_ID_MENU}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-custom-top-id-menu" name="`$prefix`page_formdata_CUSTOM_TOP_ID_MENU" value=$formdata.CUSTOM_TOP_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.page.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_CUSTOM_TOP_ID_MENU}>
        <{if $alreadyhaslink && isset($smarty.session.acl.menu.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$row->refuuid_CUSTOM_TOP_ID_MENU}>"><{$row->reftext_CUSTOM_TOP_ID_MENU|escape}></a>
        <{else}>
            <{$row->reftext_CUSTOM_TOP_ID_MENU|escape}>        <{/if}>
    <{else}>
    	<{if $row->CUSTOM_TOP_ID_MENU}><{$row->CUSTOM_TOP_ID_MENU|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.page.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOM_SIDE_ID_MENU', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOM_SIDE_ID_MENU']) && ((isset($aclviewablecolumns['CUSTOM_SIDE_ID_MENU']) && $aclviewablecolumns['CUSTOM_SIDE_ID_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOM_SIDE_ID_MENU']) || $aclviewablecolumns['CUSTOM_SIDE_ID_MENU']))) }>
                <td class="column column-custom-side-id-menu reftext" >
                                            <{if (in_array('CUSTOM_SIDE_ID_MENU', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCUSTOM_SIDE_ID_MENU}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-custom-side-id-menu" name="`$prefix`page_formdata_CUSTOM_SIDE_ID_MENU" value=$formdata.CUSTOM_SIDE_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.page.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_CUSTOM_SIDE_ID_MENU}>
        <{if $alreadyhaslink && isset($smarty.session.acl.menu.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$row->refuuid_CUSTOM_SIDE_ID_MENU}>"><{$row->reftext_CUSTOM_SIDE_ID_MENU|escape}></a>
        <{else}>
            <{$row->reftext_CUSTOM_SIDE_ID_MENU|escape}>        <{/if}>
    <{else}>
    	<{if $row->CUSTOM_SIDE_ID_MENU}><{$row->CUSTOM_SIDE_ID_MENU|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.page.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('VIEW_MORE_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VIEW_MORE_TITLE']) && ((isset($aclviewablecolumns['VIEW_MORE_TITLE']) && $aclviewablecolumns['VIEW_MORE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_TITLE']) || $aclviewablecolumns['VIEW_MORE_TITLE']))) }>
                <td class="column column-view-more-title text" >
                                            <{if (in_array('VIEW_MORE_TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataVIEW_MORE_TITLE}>

                        
                            <input class="input-view-more-title" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span>	<{$row->VIEW_MORE_TITLE|escape}>
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

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-view-more-id-page" name="`$prefix`page_formdata_VIEW_MORE_ID_PAGE" value=$formdata.VIEW_MORE_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.page.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_VIEW_MORE_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_VIEW_MORE_ID_PAGE}>"><{$row->reftext_VIEW_MORE_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_VIEW_MORE_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->VIEW_MORE_ID_PAGE}><{$row->VIEW_MORE_ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.page.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
                <td class="column column-latest-update datetime" >
                                            <{if (in_array('LATEST_UPDATE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataLATEST_UPDATE}>

                                                    <input class="input-latest-update field-date" type="text" id="<{$prefix}>page_formdata_LATEST_UPDATE" name="<{$prefix}>page_formdata_LATEST_UPDATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('NBR_VIEWS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
                <td class="column column-nbr-views number" >
                                            <{if (in_array('NBR_VIEWS', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNBR_VIEWS}>

                                                    
                            <input class="input-nbr-views number-format" type="text" name="<{$prefix}>page_formdata_NBR_VIEWS" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="number number-format"><{if $row->NBR_VIEWS != 0}><{$row->NBR_VIEWS}><{/if}></span>
    
            <{$summable.NBR_VIEWS = $summable.NBR_VIEWS + $row->NBR_VIEWS scope=parent}>
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
    	    <div class="page-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.page.0}>
        $('.page-rowedit-message').html('<{$messages.page.0}>').show();
    <{/if}>

    $('#pagelist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#pagelist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#pagelist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#pagelist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.page-rowedit-save').click();
        }
    });

    bind_hotkey("#pagelist > tbody tr.rowedit input[type=text]", 'f2', '.page-rowedit-save');
    bind_hotkey("#pagelist > tbody tr.rowedit input[type=text]", 'esc', '.page-rowedit-cancel');
</script>



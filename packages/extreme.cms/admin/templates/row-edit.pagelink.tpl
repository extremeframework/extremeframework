<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="pagelink-rowedit <{if $row->UUID}>pagelink-rowedit-existing rowedit-existing<{/if}> <{if $messages.pagelink.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="pagelinklistchk" name="pagelinklist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="pagelink_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>pagelink_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="pagelink_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>pagelink_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
                <td class="column column-id-page reftext" >
                                            <{if (in_array('ID_PAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_PAGE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagelink_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_ID_PAGE}>"><{$row->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE}><{$row->ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('FONT_AWESOME_ICON', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
                <td class="column column-font-awesome-icon text" >
                                            <{if (in_array('FONT_AWESOME_ICON', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataFONT_AWESOME_ICON}>

                        
                            <input class="input-font-awesome-icon" type="text" name="<{$prefix}>pagelink_formdata_FONT_AWESOME_ICON" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>	<{$row->FONT_AWESOME_ICON|escape}>
<{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LINK_ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LINK_ID_PAGE']) && ((isset($aclviewablecolumns['LINK_ID_PAGE']) && $aclviewablecolumns['LINK_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_ID_PAGE']) || $aclviewablecolumns['LINK_ID_PAGE']))) }>
                <td class="column column-link-id-page reftext" >
                                            <{if (in_array('LINK_ID_PAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataLINK_ID_PAGE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-link-id-page" name="`$prefix`pagelink_formdata_LINK_ID_PAGE" value=$formdata.LINK_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_LINK_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_LINK_ID_PAGE}>"><{$row->reftext_LINK_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_LINK_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->LINK_ID_PAGE}><{$row->LINK_ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LINK_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LINK_PATH']) && ((isset($aclviewablecolumns['LINK_PATH']) && $aclviewablecolumns['LINK_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_PATH']) || $aclviewablecolumns['LINK_PATH']))) }>
                <td class="column column-link-path text" >
                                            <{if (in_array('LINK_PATH', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataLINK_PATH}>

                        
                            <input class="input-link-path" type="text" name="<{$prefix}>pagelink_formdata_LINK_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->LINK_PATH|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_PAGE_LINK_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE_LINK_TYPE']) && ((isset($aclviewablecolumns['ID_PAGE_LINK_TYPE']) && $aclviewablecolumns['ID_PAGE_LINK_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE_LINK_TYPE']) || $aclviewablecolumns['ID_PAGE_LINK_TYPE']))) }>
                <td class="column column-id-page-link-type reftext" >
                                            <{if (in_array('ID_PAGE_LINK_TYPE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_PAGE_LINK_TYPE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page-link-type" name="`$prefix`pagelink_formdata_ID_PAGE_LINK_TYPE" value=$formdata.ID_PAGE_LINK_TYPE datasource="PAGE_LINK_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/new" title="Create a New Page Link Type">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE_LINK_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.pagelinktype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/view/<{$row->refuuid_ID_PAGE_LINK_TYPE}>"><{$row->reftext_ID_PAGE_LINK_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE_LINK_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE_LINK_TYPE}><{$row->ID_PAGE_LINK_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagelink.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagelink_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="pagelink-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.pagelink.0}>
        $('.pagelink-rowedit-message').html('<{$messages.pagelink.0}>').show();
    <{/if}>

    $('#pagelinklist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#pagelinklist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#pagelinklist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#pagelinklist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.pagelink-rowedit-save').click();
        }
    });

    bind_hotkey("#pagelinklist > tbody tr.rowedit input[type=text]", 'f2', '.pagelink-rowedit-save');
    bind_hotkey("#pagelinklist > tbody tr.rowedit input[type=text]", 'esc', '.pagelink-rowedit-cancel');
</script>



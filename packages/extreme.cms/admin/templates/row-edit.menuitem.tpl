<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="menuitem-rowedit <{if $row->UUID}>menuitem-rowedit-existing rowedit-existing<{/if}> <{if $messages.menuitem.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="menuitemlistchk" name="menuitemlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="menuitem_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>menuitem_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="menuitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-title" type="text" name="<{$prefix}>menuitem_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CLASS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CLASS']) && ((isset($aclviewablecolumns['CLASS']) && $aclviewablecolumns['CLASS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CLASS']) || $aclviewablecolumns['CLASS']))) }>
                <td class="column column-class text" >
                                            <{if (in_array('CLASS', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CLASS) }>
                            <{assign var='tmp_value' value=$formdata.CLASS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-class" type="text" name="<{$prefix}>menuitem_formdata_CLASS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>	<{$row->CLASS|escape}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_MENU', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_MENU']) && ((isset($aclviewablecolumns['ID_MENU']) && $aclviewablecolumns['ID_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_MENU']) || $aclviewablecolumns['ID_MENU']))) }>
                <td class="column column-id-menu reftext" >
                                            <{if (in_array('ID_MENU', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_MENU) }>
                            <{assign var='tmp_value' value=$formdata.ID_MENU}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-menu" name="`$prefix`menuitem_formdata_ID_MENU" value=$formdata.ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_MENU}>
        <{if $alreadyhaslink && isset($smarty.session.acl.menu.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/view/<{$row->refuuid_ID_MENU}>"><{$row->reftext_ID_MENU|escape}></a>
        <{else}>
            <{$row->reftext_ID_MENU|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_MENU}><{$row->ID_MENU|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
                <td class="column column-id-page reftext" >
                                            <{if (in_array('ID_PAGE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_PAGE) }>
                            <{assign var='tmp_value' value=$formdata.ID_PAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`menuitem_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_ID_PAGE}>"><{$row->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE}><{$row->ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_POST', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
                <td class="column column-id-post reftext" >
                                            <{if (in_array('ID_POST', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_POST) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post" name="`$prefix`menuitem_formdata_ID_POST" value=$formdata.ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST}>
        <{if $alreadyhaslink && isset($smarty.session.acl.post.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->refuuid_ID_POST}>"><{$row->reftext_ID_POST|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST}><{$row->ID_POST|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_POST_CATEGORY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST_CATEGORY']) && ((isset($aclviewablecolumns['ID_POST_CATEGORY']) && $aclviewablecolumns['ID_POST_CATEGORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_CATEGORY']) || $aclviewablecolumns['ID_POST_CATEGORY']))) }>
                <td class="column column-id-post-category reftext" >
                                            <{if (in_array('ID_POST_CATEGORY', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_POST_CATEGORY) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST_CATEGORY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post-category" name="`$prefix`menuitem_formdata_ID_POST_CATEGORY" value=$formdata.ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new" title="Create a New Post Category">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST_CATEGORY}>
        <{if $alreadyhaslink && isset($smarty.session.acl.postcategory.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/view/<{$row->refuuid_ID_POST_CATEGORY}>"><{$row->reftext_ID_POST_CATEGORY|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST_CATEGORY|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST_CATEGORY}><{$row->ID_POST_CATEGORY|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
                <td class="column column-path text" >
                                            <{if (in_array('PATH', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.PATH) }>
                            <{assign var='tmp_value' value=$formdata.PATH}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-path" type="text" name="<{$prefix}>menuitem_formdata_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->PATH|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('HAS_BREAK_AFTER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['HAS_BREAK_AFTER']) && ((isset($aclviewablecolumns['HAS_BREAK_AFTER']) && $aclviewablecolumns['HAS_BREAK_AFTER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HAS_BREAK_AFTER']) || $aclviewablecolumns['HAS_BREAK_AFTER']))) }>
                <td class="column column-has-break-after yesno" data-value="<{$row->HAS_BREAK_AFTER}>" data-column="HAS_BREAK_AFTER" data-module="menuitem">
                                            <{if (in_array('HAS_BREAK_AFTER', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.HAS_BREAK_AFTER) }>
                            <{assign var='tmp_value' value=$formdata.HAS_BREAK_AFTER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-has-break-after" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" >
                                    <option value="1" <{if $formdata.HAS_BREAK_AFTER}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.HAS_BREAK_AFTER}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-has-break-after" type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="1" <{if $formdata.HAS_BREAK_AFTER}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="0" <{if !$formdata.HAS_BREAK_AFTER}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->HAS_BREAK_AFTER}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ORDERING) }>
                            <{assign var='tmp_value' value=$formdata.ORDERING}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>menuitem_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="number number-format"><{if $row->ORDERING != 0}><{$row->ORDERING}><{/if}></span>
    
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ACL_ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ACL_ID_USER_GROUP']) && ((isset($aclviewablecolumns['ACL_ID_USER_GROUP']) && $aclviewablecolumns['ACL_ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACL_ID_USER_GROUP']) || $aclviewablecolumns['ACL_ID_USER_GROUP']))) }>
                <td class="column column-acl-id-user-group reftext" >
                                            <{if (in_array('ACL_ID_USER_GROUP', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ACL_ID_USER_GROUP) }>
                            <{assign var='tmp_value' value=$formdata.ACL_ID_USER_GROUP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-acl-id-user-group" name="`$prefix`menuitem_formdata_ACL_ID_USER_GROUP" value=$formdata.ACL_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/menuitem/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ACL_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ACL_ID_USER_GROUP}>"><{$row->reftext_ACL_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ACL_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ACL_ID_USER_GROUP}><{$row->ACL_ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.menuitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="menuitem-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.menuitem.0}>
        $('.menuitem-rowedit-message').html('<{$messages.menuitem.0}>').show();
    <{/if}>

    $('#menuitemlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#menuitemlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#menuitemlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#menuitemlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.menuitem-rowedit-save').click();
        }
    });

    bind_hotkey("#menuitemlist > tbody tr.rowedit input[type=text]", 'f2', '.menuitem-rowedit-save');
    bind_hotkey("#menuitemlist > tbody tr.rowedit input[type=text]", 'esc', '.menuitem-rowedit-cancel');
</script>



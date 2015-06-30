<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="post-rowedit <{if $row->UUID}>post-rowedit-existing rowedit-existing<{/if}> <{if $messages.post.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="postlistchk" name="postlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="post_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>post_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="post_formdata_<{$key}>" value="<{$value}>" />
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
                        
                            <input class="input-title" type="text" name="<{$prefix}>post_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_POST_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST_TYPE']) && ((isset($aclviewablecolumns['ID_POST_TYPE']) && $aclviewablecolumns['ID_POST_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_TYPE']) || $aclviewablecolumns['ID_POST_TYPE']))) }>
                <td class="column column-id-post-type reftext" >
                                            <{if (in_array('ID_POST_TYPE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_POST_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post-type" name="`$prefix`post_formdata_ID_POST_TYPE" value=$formdata.ID_POST_TYPE datasource="POST_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/posttype/new" title="Create a New Post Type">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.posttype.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/posttype/view/<{$row->refuuid_ID_POST_TYPE}>"><{$row->reftext_ID_POST_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST_TYPE}><{$row->ID_POST_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post-category" name="`$prefix`post_formdata_ID_POST_CATEGORY" value=$formdata.ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new" title="Create a New Post Category">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST_CATEGORY}>
        <{if $alreadyhaslink && isset($smarty.session.acl.postcategory.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/view/<{$row->refuuid_ID_POST_CATEGORY}>"><{$row->reftext_ID_POST_CATEGORY|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST_CATEGORY|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST_CATEGORY}><{$row->ID_POST_CATEGORY|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image" >
                                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    <{media src=$row->IMAGE thumbnail=1}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('META_KEYWORDS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
                <td class="column column-meta-keywords text" >
                                            <{if (in_array('META_KEYWORDS', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.META_KEYWORDS) }>
                            <{assign var='tmp_value' value=$formdata.META_KEYWORDS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-meta-keywords" type="text" name="<{$prefix}>post_formdata_META_KEYWORDS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->META_KEYWORDS|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('AUTHOR', $filtercolumns)) }>
            <{if !isset($excludedcolumns['AUTHOR']) && ((isset($aclviewablecolumns['AUTHOR']) && $aclviewablecolumns['AUTHOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AUTHOR']) || $aclviewablecolumns['AUTHOR']))) }>
                <td class="column column-author text" >
                                            <{if (in_array('AUTHOR', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.AUTHOR) }>
                            <{assign var='tmp_value' value=$formdata.AUTHOR}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-author" type="text" name="<{$prefix}>post_formdata_AUTHOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->AUTHOR|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_TEMPLATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
                <td class="column column-id-template reftext" >
                                            <{if (in_array('ID_TEMPLATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_TEMPLATE) }>
                            <{assign var='tmp_value' value=$formdata.ID_TEMPLATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-template" name="`$prefix`post_formdata_ID_TEMPLATE" value=$formdata.ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/template/new" title="Create a New Template">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_TEMPLATE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.template.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/template/view/<{$row->refuuid_ID_TEMPLATE}>"><{$row->reftext_ID_TEMPLATE|escape}></a>
        <{else}>
            <{$row->reftext_ID_TEMPLATE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_TEMPLATE}><{$row->ID_TEMPLATE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
                <td class="column column-creation-date datetime" >
                                            <{if (in_array('CREATION_DATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CREATION_DATE) }>
                            <{assign var='tmp_value' value=$formdata.CREATION_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-creation-date field-date" type="text" id="<{$prefix}>post_formdata_CREATION_DATE" name="<{$prefix}>post_formdata_CREATION_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
                <td class="column column-latest-update datetime" >
                                            <{if (in_array('LATEST_UPDATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.LATEST_UPDATE) }>
                            <{assign var='tmp_value' value=$formdata.LATEST_UPDATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-latest-update field-date" type="text" id="<{$prefix}>post_formdata_LATEST_UPDATE" name="<{$prefix}>post_formdata_LATEST_UPDATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_FEATURED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_FEATURED']) && ((isset($aclviewablecolumns['IS_FEATURED']) && $aclviewablecolumns['IS_FEATURED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_FEATURED']) || $aclviewablecolumns['IS_FEATURED']))) }>
                <td class="column column-is-featured yesno" data-value="<{$row->IS_FEATURED}>" data-column="IS_FEATURED" data-module="post">
                                            <{if (in_array('IS_FEATURED', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_FEATURED) }>
                            <{assign var='tmp_value' value=$formdata.IS_FEATURED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-featured" name="<{$prefix}>post_formdata_IS_FEATURED" >
                                    <option value="1" <{if $formdata.IS_FEATURED}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_FEATURED}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-featured" type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="1" <{if $formdata.IS_FEATURED}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="0" <{if !$formdata.IS_FEATURED}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_FEATURED}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('NBR_VIEWS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
                <td class="column column-nbr-views number" >
                                            <{if (in_array('NBR_VIEWS', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.NBR_VIEWS) }>
                            <{assign var='tmp_value' value=$formdata.NBR_VIEWS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-nbr-views number-format" type="text" name="<{$prefix}>post_formdata_NBR_VIEWS" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="post-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.post.0}>
        $('.post-rowedit-message').html('<{$messages.post.0}>').show();
    <{/if}>

    $('#postlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#postlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#postlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#postlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.post-rowedit-save').click();
        }
    });

    bind_hotkey("#postlist > tbody tr.rowedit input[type=text]", 'f2', '.post-rowedit-save');
    bind_hotkey("#postlist > tbody tr.rowedit input[type=text]", 'esc', '.post-rowedit-cancel');
</script>



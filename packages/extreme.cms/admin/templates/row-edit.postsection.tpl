<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="postsection-rowedit <{if $row->UUID}>postsection-rowedit-existing rowedit-existing<{/if}> <{if $messages.postsection.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="postsectionlistchk" name="postsectionlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="postsection_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>postsection_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="postsection_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>postsection_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postsection/view/<{$row->UUID}>"><{/if}>    	    <{$row->TITLE|escape}>
    <{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_POST', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
                <td class="column column-id-post reftext" >
                                            <{if (in_array('ID_POST', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_POST}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-post" name="`$prefix`postsection_formdata_ID_POST" value=$formdata.ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.post.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postsection/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST}>
        <{if $alreadyhaslink && isset($smarty.session.acl.post.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->refuuid_ID_POST}>"><{$row->reftext_ID_POST|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST}><{$row->ID_POST|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image" >
                                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postsection/view/<{$row->UUID}>"><{/if}>    <{media src=$row->IMAGE thumbnail=1}>
<{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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

                        
                            <input class="input-background-color" type="text" name="<{$prefix}>postsection_formdata_BACKGROUND_COLOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
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
	        <{if (in_array('LINK_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LINK_PATH']) && ((isset($aclviewablecolumns['LINK_PATH']) && $aclviewablecolumns['LINK_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_PATH']) || $aclviewablecolumns['LINK_PATH']))) }>
                <td class="column column-link-path text" >
                                            <{if (in_array('LINK_PATH', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataLINK_PATH}>

                        
                            <input class="input-link-path" type="text" name="<{$prefix}>postsection_formdata_LINK_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>    	    <{$row->LINK_PATH|escape}>
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

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>postsection_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="postsection-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.postsection.0}>
        $('.postsection-rowedit-message').html('<{$messages.postsection.0}>').show();
    <{/if}>

    $('#postsectionlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#postsectionlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#postsectionlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#postsectionlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.postsection-rowedit-save').click();
        }
    });

    bind_hotkey("#postsectionlist > tbody tr.rowedit input[type=text]", 'f2', '.postsection-rowedit-save');
    bind_hotkey("#postsectionlist > tbody tr.rowedit input[type=text]", 'esc', '.postsection-rowedit-cancel');
</script>



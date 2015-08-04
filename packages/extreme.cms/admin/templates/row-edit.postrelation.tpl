<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="postrelation-rowedit <{if $row->UUID}>postrelation-rowedit-existing rowedit-existing<{/if}> <{if $messages.postrelation.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="postrelationlistchk" name="postrelationlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="postrelation_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>postrelation_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="postrelation_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_POST', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
                <td class="column column-id-post reftext" >
                                            <{if (in_array('ID_POST', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_POST}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-post" name="`$prefix`postrelation_formdata_ID_POST" value=$formdata.ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.post.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postrelation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST}>
        <{if $alreadyhaslink && isset($smarty.session.acl.post.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->refuuid_ID_POST}>"><{$row->reftext_ID_POST|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST}><{$row->ID_POST|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PEER_ID_POST', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PEER_ID_POST']) && ((isset($aclviewablecolumns['PEER_ID_POST']) && $aclviewablecolumns['PEER_ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PEER_ID_POST']) || $aclviewablecolumns['PEER_ID_POST']))) }>
                <td class="column column-peer-id-post reftext" >
                                            <{if (in_array('PEER_ID_POST', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataPEER_ID_POST}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-peer-id-post" name="`$prefix`postrelation_formdata_PEER_ID_POST" value=$formdata.PEER_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.post.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postrelation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_PEER_ID_POST}>
        <{if $alreadyhaslink && isset($smarty.session.acl.post.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->refuuid_PEER_ID_POST}>"><{$row->reftext_PEER_ID_POST|escape}></a>
        <{else}>
            <{$row->reftext_PEER_ID_POST|escape}>        <{/if}>
    <{else}>
    	<{if $row->PEER_ID_POST}><{$row->PEER_ID_POST|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_POST_RELATION_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST_RELATION_TYPE']) && ((isset($aclviewablecolumns['ID_POST_RELATION_TYPE']) && $aclviewablecolumns['ID_POST_RELATION_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_RELATION_TYPE']) || $aclviewablecolumns['ID_POST_RELATION_TYPE']))) }>
                <td class="column column-id-post-relation-type reftext" >
                                            <{if (in_array('ID_POST_RELATION_TYPE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_POST_RELATION_TYPE}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-post-relation-type" name="`$prefix`postrelation_formdata_ID_POST_RELATION_TYPE" value=$formdata.ID_POST_RELATION_TYPE datasource="POST_RELATION_TYPE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.postrelationtype.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/new" title="Create a New Post Relation Type">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postrelation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST_RELATION_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.postrelationtype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/view/<{$row->refuuid_ID_POST_RELATION_TYPE}>"><{$row->reftext_ID_POST_RELATION_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST_RELATION_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST_RELATION_TYPE}><{$row->ID_POST_RELATION_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="postrelation-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.postrelation.0}>
        $('.postrelation-rowedit-message').html('<{$messages.postrelation.0}>').show();
    <{/if}>

    $('#postrelationlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#postrelationlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#postrelationlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#postrelationlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.postrelation-rowedit-save').click();
        }
    });

    bind_hotkey("#postrelationlist > tbody tr.rowedit input[type=text]", 'f2', '.postrelation-rowedit-save');
    bind_hotkey("#postrelationlist > tbody tr.rowedit input[type=text]", 'esc', '.postrelation-rowedit-cancel');
</script>



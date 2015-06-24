<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->ID}>" class="quadrantitem-rowedit <{if $row->ID}>quadrantitem-rowedit-existing rowedit-existing<{/if}> <{if $messages.quadrantitem.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->ID}>">
	<td class="checkbox">
	    <{if $row->ID}>
    		<input type="checkbox" class="quadrantitemlistchk" name="quadrantitemlist_selection[]" value="<{$row->ID}>" />
	        <input type="hidden" name="quadrantitem_formdata_ID" value="<{$row->ID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>quadrantitem_multiformdata_ID[<{$rowsignature}>]" value="<{$row->ID}>" />
        <{/if}>
        <{if $preset}>
            <input type="hidden" name="quadrantitem_formdata_<{$preset}>" value="<{$presetvalue}>" />
        <{/if}>
	</td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if (isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE'])) }>
                <td class="column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>

                            <input class="input-title" type="text" name="<{$prefix}>quadrantitem_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.quadrantitem.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/quadrantitem/view/<{$row->ID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.quadrantitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
		<td class="actions">
	    <{if $row->ID}>
    	    <div class="quadrantitem-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.quadrantitem.0}>
        $('.quadrantitem-rowedit-message').html('<{$messages.quadrantitem.0}>').show();
    <{/if}>

    $('#quadrantitemlist #item_<{$row->ID}> :input:visible:first').focus();

	$('#quadrantitemlist #item_<{$row->ID}> select.autocomplete').select2();
</script>


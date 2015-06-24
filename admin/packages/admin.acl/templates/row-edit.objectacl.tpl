<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="objectacl-rowedit <{if $row->UUID}>objectacl-rowedit-existing rowedit-existing<{/if}> <{if $messages.objectacl.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="objectacllistchk" name="objectacllist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="objectacl_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>objectacl_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="objectacl_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-module" type="text" name="<{$prefix}>objectacl_formdata_MODULE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/view/<{$row->UUID}>"><{/if}>	<{$row->MODULE|escape}>
<{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('OBJECT_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['OBJECT_ID']) && ((isset($aclviewablecolumns['OBJECT_ID']) && $aclviewablecolumns['OBJECT_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OBJECT_ID']) || $aclviewablecolumns['OBJECT_ID']))) }>
                <td class="column column-object-id key" >
                                            <{if (in_array('OBJECT_ID', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.OBJECT_ID) }>
                            <{assign var='tmp_value' value=$formdata.OBJECT_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-object-id" type="text" name="<{$prefix}>objectacl_formdata_OBJECT_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/view/<{$row->UUID}>"><{/if}>	<{$row->OBJECT_ID|escape}>
<{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
                <td class="column column-id-user-group reftext" >
                                            <{if (in_array('ID_USER_GROUP', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_USER_GROUP) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER_GROUP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`objectacl_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ID_USER_GROUP}>"><{$row->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_GROUP}><{$row->ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_USER) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`objectacl_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ARG_ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ARG_ID_USER_GROUP']) && ((isset($aclviewablecolumns['ARG_ID_USER_GROUP']) && $aclviewablecolumns['ARG_ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ARG_ID_USER_GROUP']) || $aclviewablecolumns['ARG_ID_USER_GROUP']))) }>
                <td class="column column-arg-id-user-group reftext" >
                                            <{if (in_array('ARG_ID_USER_GROUP', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ARG_ID_USER_GROUP) }>
                            <{assign var='tmp_value' value=$formdata.ARG_ID_USER_GROUP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-arg-id-user-group" name="`$prefix`objectacl_formdata_ARG_ID_USER_GROUP" value=$formdata.ARG_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ARG_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ARG_ID_USER_GROUP}>"><{$row->reftext_ARG_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ARG_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ARG_ID_USER_GROUP}><{$row->ARG_ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ARG_ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ARG_ID_USER']) && ((isset($aclviewablecolumns['ARG_ID_USER']) && $aclviewablecolumns['ARG_ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ARG_ID_USER']) || $aclviewablecolumns['ARG_ID_USER']))) }>
                <td class="column column-arg-id-user reftext" >
                                            <{if (in_array('ARG_ID_USER', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ARG_ID_USER) }>
                            <{assign var='tmp_value' value=$formdata.ARG_ID_USER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-arg-id-user" name="`$prefix`objectacl_formdata_ARG_ID_USER" value=$formdata.ARG_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ARG_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ARG_ID_USER}>"><{$row->reftext_ARG_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ARG_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ARG_ID_USER}><{$row->ARG_ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ACL_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ACL_TYPE']) && ((isset($aclviewablecolumns['ID_ACL_TYPE']) && $aclviewablecolumns['ID_ACL_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ACL_TYPE']) || $aclviewablecolumns['ID_ACL_TYPE']))) }>
                <td class="column column-id-acl-type reftext" >
                                            <{if (in_array('ID_ACL_TYPE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_ACL_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_ACL_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-acl-type" name="`$prefix`objectacl_formdata_ID_ACL_TYPE" value=$formdata.ID_ACL_TYPE datasource="ACL_TYPE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/acltype/new" title="Create a New Acl Type">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ACL_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.acltype.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/acltype/view/<{$row->refuuid_ID_ACL_TYPE}>"><{$row->reftext_ID_ACL_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_ACL_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ACL_TYPE}><{$row->ID_ACL_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.objectacl.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="objectacl-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.objectacl.0}>
        $('.objectacl-rowedit-message').html('<{$messages.objectacl.0}>').show();
    <{/if}>

    $('#objectacllist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#objectacllist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#objectacllist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#objectacllist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.objectacl-rowedit-save').click();
        }
    });

    bind_hotkey("#objectacllist > tbody tr.rowedit input[type=text]", 'f2', '.objectacl-rowedit-save');
    bind_hotkey("#objectacllist > tbody tr.rowedit input[type=text]", 'esc', '.objectacl-rowedit-cancel');
</script>



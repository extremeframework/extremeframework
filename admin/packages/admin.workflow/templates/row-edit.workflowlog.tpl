<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="workflowlog-rowedit <{if $row->UUID}>workflowlog-rowedit-existing rowedit-existing<{/if}> <{if $messages.workflowlog.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="workflowloglistchk" name="workflowloglist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="workflowlog_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>workflowlog_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="workflowlog_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_WORKFLOW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
                <td class="column column-id-workflow reftext" >
                                            <{if (in_array('ID_WORKFLOW', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_WORKFLOW}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-workflow" name="`$prefix`workflowlog_formdata_ID_WORKFLOW" value=$formdata.ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.workflow.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WORKFLOW}>
        <{if $alreadyhaslink && isset($smarty.session.acl.workflow.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$row->refuuid_ID_WORKFLOW}>"><{$row->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$row->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WORKFLOW}><{$row->ID_WORKFLOW|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_WORKFLOW_TRANSITION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WORKFLOW_TRANSITION']) && ((isset($aclviewablecolumns['ID_WORKFLOW_TRANSITION']) && $aclviewablecolumns['ID_WORKFLOW_TRANSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW_TRANSITION']) || $aclviewablecolumns['ID_WORKFLOW_TRANSITION']))) }>
                <td class="column column-id-workflow-transition reftext" >
                                            <{if (in_array('ID_WORKFLOW_TRANSITION', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_WORKFLOW_TRANSITION}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-workflow-transition" name="`$prefix`workflowlog_formdata_ID_WORKFLOW_TRANSITION" value=$formdata.ID_WORKFLOW_TRANSITION datasource="WORKFLOW_TRANSITION" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="ID_WORKFLOW" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.workflowtransition.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/new" title="Create a New Workflow Transition">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WORKFLOW_TRANSITION}>
        <{if $alreadyhaslink && isset($smarty.session.acl.workflowtransition.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->refuuid_ID_WORKFLOW_TRANSITION}>"><{$row->reftext_ID_WORKFLOW_TRANSITION|escape}></a>
        <{else}>
            <{$row->reftext_ID_WORKFLOW_TRANSITION|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WORKFLOW_TRANSITION}><{$row->ID_WORKFLOW_TRANSITION|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('MODULE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
                <td class="column column-module text" >
                                            <{if (in_array('MODULE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataMODULE}>

                        
                            <input class="input-module" type="text" name="<{$prefix}>workflowlog_formdata_MODULE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/view/<{$row->UUID}>"><{/if}>    	    <{$row->MODULE|escape}>
    <{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('OBJECT_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['OBJECT_ID']) && ((isset($aclviewablecolumns['OBJECT_ID']) && $aclviewablecolumns['OBJECT_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OBJECT_ID']) || $aclviewablecolumns['OBJECT_ID']))) }>
                <td class="column column-object-id key" >
                                            <{if (in_array('OBJECT_ID', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataOBJECT_ID}>

                        
                            <input class="input-object-id" type="text" name="<{$prefix}>workflowlog_formdata_OBJECT_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/view/<{$row->UUID}>"><{/if}>    	    <{$row->OBJECT_ID|escape}>
    <{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE']) && ((isset($aclviewablecolumns['DATE']) && $aclviewablecolumns['DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE']) || $aclviewablecolumns['DATE']))) }>
                <td class="column column-date date" >
                                            <{if (in_array('DATE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataDATE}>

                                                    <input class="input-date field-date" type="text" id="<{$prefix}>workflowlog_formdata_DATE" name="<{$prefix}>workflowlog_formdata_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
                <td class="column column-id-user reftext" >
                                            <{if (in_array('ID_USER', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER}>

                                                    
                                <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`workflowlog_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.user.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER}>
        <{if $alreadyhaslink && isset($smarty.session.acl.user.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->refuuid_ID_USER}>"><{$row->reftext_ID_USER|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER}><{$row->ID_USER|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowlog.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
    	    <div class="workflowlog-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.workflowlog.0}>
        $('.workflowlog-rowedit-message').html('<{$messages.workflowlog.0}>').show();
    <{/if}>

    $('#workflowloglist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#workflowloglist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#workflowloglist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#workflowloglist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.workflowlog-rowedit-save').click();
        }
    });

    bind_hotkey("#workflowloglist > tbody tr.rowedit input[type=text]", 'f2', '.workflowlog-rowedit-save');
    bind_hotkey("#workflowloglist > tbody tr.rowedit input[type=text]", 'esc', '.workflowlog-rowedit-cancel');
</script>



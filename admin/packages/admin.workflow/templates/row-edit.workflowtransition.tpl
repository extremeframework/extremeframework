<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="workflowtransition-rowedit <{if $row->UUID}>workflowtransition-rowedit-existing rowedit-existing<{/if}> <{if $messages.workflowtransition.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="workflowtransitionlistchk" name="workflowtransitionlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="workflowtransition_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>workflowtransition_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="workflowtransition_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_WORKFLOW', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
                <td class="column column-id-workflow reftext" >
                                            <{if (in_array('ID_WORKFLOW', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_WORKFLOW}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-workflow" name="`$prefix`workflowtransition_formdata_ID_WORKFLOW" value=$formdata.ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.workflow.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WORKFLOW}>
        <{if $alreadyhaslink && isset($smarty.session.acl.workflow.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$row->refuuid_ID_WORKFLOW}>"><{$row->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$row->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WORKFLOW}><{$row->ID_WORKFLOW|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                <td class="column column-name text" >
                                            <{if (in_array('NAME', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataNAME}>

                        
                            <input class="input-name" type="text" name="<{$prefix}>workflowtransition_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>	<{$row->NAME|escape}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text" >
                                            <{if (in_array('CODE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCODE}>

                        
                            <input class="input-code" type="text" name="<{$prefix}>workflowtransition_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('START_ID_WORKFLOW_STAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['START_ID_WORKFLOW_STAGE']) && ((isset($aclviewablecolumns['START_ID_WORKFLOW_STAGE']) && $aclviewablecolumns['START_ID_WORKFLOW_STAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['START_ID_WORKFLOW_STAGE']) || $aclviewablecolumns['START_ID_WORKFLOW_STAGE']))) }>
                <td class="column column-start-id-workflow-stage reftext" >
                                            <{if (in_array('START_ID_WORKFLOW_STAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataSTART_ID_WORKFLOW_STAGE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-start-id-workflow-stage" name="`$prefix`workflowtransition_formdata_START_ID_WORKFLOW_STAGE" value=$formdata.START_ID_WORKFLOW_STAGE datasource="WORKFLOW_STAGE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="ID_WORKFLOW" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.workflowstage.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/new" title="Create a New Workflow Stage">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_START_ID_WORKFLOW_STAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.workflowstage.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$row->refuuid_START_ID_WORKFLOW_STAGE}>"><{$row->reftext_START_ID_WORKFLOW_STAGE|escape}></a>
        <{else}>
            <{$row->reftext_START_ID_WORKFLOW_STAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->START_ID_WORKFLOW_STAGE}><{$row->START_ID_WORKFLOW_STAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('END_ID_WORKFLOW_STAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['END_ID_WORKFLOW_STAGE']) && ((isset($aclviewablecolumns['END_ID_WORKFLOW_STAGE']) && $aclviewablecolumns['END_ID_WORKFLOW_STAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['END_ID_WORKFLOW_STAGE']) || $aclviewablecolumns['END_ID_WORKFLOW_STAGE']))) }>
                <td class="column column-end-id-workflow-stage reftext" >
                                            <{if (in_array('END_ID_WORKFLOW_STAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataEND_ID_WORKFLOW_STAGE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-end-id-workflow-stage" name="`$prefix`workflowtransition_formdata_END_ID_WORKFLOW_STAGE" value=$formdata.END_ID_WORKFLOW_STAGE datasource="WORKFLOW_STAGE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="ID_WORKFLOW" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.workflowstage.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/new" title="Create a New Workflow Stage">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_END_ID_WORKFLOW_STAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.workflowstage.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$row->refuuid_END_ID_WORKFLOW_STAGE}>"><{$row->reftext_END_ID_WORKFLOW_STAGE|escape}></a>
        <{else}>
            <{$row->reftext_END_ID_WORKFLOW_STAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->END_ID_WORKFLOW_STAGE}><{$row->END_ID_WORKFLOW_STAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ACTION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ACTION']) && ((isset($aclviewablecolumns['ACTION']) && $aclviewablecolumns['ACTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTION']) || $aclviewablecolumns['ACTION']))) }>
                <td class="column column-action text" >
                                            <{if (in_array('ACTION', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataACTION}>

                        
                            <input class="input-action" type="text" name="<{$prefix}>workflowtransition_formdata_ACTION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->ACTION|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
                <td class="column column-id-user-group reftext" >
                                            <{if (in_array('ID_USER_GROUP', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER_GROUP}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`workflowtransition_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.usergroup.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_GROUP}>
        <{if $alreadyhaslink && isset($smarty.session.acl.usergroup.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$row->refuuid_ID_USER_GROUP}>"><{$row->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_GROUP}><{$row->ID_USER_GROUP|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_USER_ROLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
                <td class="column column-id-user-role reftext" >
                                            <{if (in_array('ID_USER_ROLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_USER_ROLE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-role" name="`$prefix`workflowtransition_formdata_ID_USER_ROLE" value=$formdata.ID_USER_ROLE datasource="USER_ROLE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.userrole.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new" title="Create a New User Role">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_USER_ROLE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.userrole.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$row->refuuid_ID_USER_ROLE}>"><{$row->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$row->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_USER_ROLE}><{$row->ID_USER_ROLE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TRANSITION_ID_SCREEN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TRANSITION_ID_SCREEN']) && ((isset($aclviewablecolumns['TRANSITION_ID_SCREEN']) && $aclviewablecolumns['TRANSITION_ID_SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TRANSITION_ID_SCREEN']) || $aclviewablecolumns['TRANSITION_ID_SCREEN']))) }>
                <td class="column column-transition-id-screen reftext" >
                                            <{if (in_array('TRANSITION_ID_SCREEN', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTRANSITION_ID_SCREEN}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-transition-id-screen" name="`$prefix`workflowtransition_formdata_TRANSITION_ID_SCREEN" value=$formdata.TRANSITION_ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                    <{if isset($smarty.session.acl.screen.new)}>
                                        <span class="onflycreation">
                                            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/new" title="Create a New Screen">+</a>
                                        </span>
                                    <{/if}>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_TRANSITION_ID_SCREEN}>
        <{if $alreadyhaslink && isset($smarty.session.acl.screen.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$row->refuuid_TRANSITION_ID_SCREEN}>"><{$row->reftext_TRANSITION_ID_SCREEN|escape}></a>
        <{else}>
            <{$row->reftext_TRANSITION_ID_SCREEN|escape}>        <{/if}>
    <{else}>
    	<{if $row->TRANSITION_ID_SCREEN}><{$row->TRANSITION_ID_SCREEN|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.workflowtransition.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number" >
                                            <{if (in_array('ORDERING', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataORDERING}>

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>workflowtransition_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="workflowtransition-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.workflowtransition.0}>
        $('.workflowtransition-rowedit-message').html('<{$messages.workflowtransition.0}>').show();
    <{/if}>

    $('#workflowtransitionlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#workflowtransitionlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#workflowtransitionlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#workflowtransitionlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.workflowtransition-rowedit-save').click();
        }
    });

    bind_hotkey("#workflowtransitionlist > tbody tr.rowedit input[type=text]", 'f2', '.workflowtransition-rowedit-save');
    bind_hotkey("#workflowtransitionlist > tbody tr.rowedit input[type=text]", 'esc', '.workflowtransition-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('workflowtransition_formdata_NAME', 'workflowtransition_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


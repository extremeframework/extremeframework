<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="pagewidget-rowedit <{if $row->UUID}>pagewidget-rowedit-existing rowedit-existing<{/if}> <{if $messages.pagewidget.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="pagewidgetlistchk" name="pagewidgetlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="pagewidget_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>pagewidget_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="pagewidget_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
                <td class="column column-id-page reftext" >
                                            <{if (in_array('ID_PAGE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_PAGE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagewidget_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_ID_PAGE}>"><{$row->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE}><{$row->ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text" >
                                            <{if (in_array('TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataTITLE}>

                        
                            <input class="input-title" type="text" name="<{$prefix}>pagewidget_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text" >
                                            <{if (in_array('CODE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataCODE}>

                        
                            <input class="input-code" type="text" name="<{$prefix}>pagewidget_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
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
	        <{if (in_array('ID_WIDGET_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WIDGET_TYPE']) && ((isset($aclviewablecolumns['ID_WIDGET_TYPE']) && $aclviewablecolumns['ID_WIDGET_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WIDGET_TYPE']) || $aclviewablecolumns['ID_WIDGET_TYPE']))) }>
                <td class="column column-id-widget-type reftext" >
                                            <{if (in_array('ID_WIDGET_TYPE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_WIDGET_TYPE}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-widget-type" name="`$prefix`pagewidget_formdata_ID_WIDGET_TYPE" value=$formdata.ID_WIDGET_TYPE datasource="WIDGET_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgettype/new" title="Create a New Widget Type">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WIDGET_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.widgettype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgettype/view/<{$row->refuuid_ID_WIDGET_TYPE}>"><{$row->reftext_ID_WIDGET_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_WIDGET_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WIDGET_TYPE}><{$row->ID_WIDGET_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_WIDGET_POSITION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WIDGET_POSITION']) && ((isset($aclviewablecolumns['ID_WIDGET_POSITION']) && $aclviewablecolumns['ID_WIDGET_POSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WIDGET_POSITION']) || $aclviewablecolumns['ID_WIDGET_POSITION']))) }>
                <td class="column column-id-widget-position reftext" >
                                            <{if (in_array('ID_WIDGET_POSITION', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataID_WIDGET_POSITION}>

                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-widget-position" name="`$prefix`pagewidget_formdata_ID_WIDGET_POSITION" value=$formdata.ID_WIDGET_POSITION datasource="WIDGET_POSITION" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/new" title="Create a New Widget Position">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WIDGET_POSITION}>
        <{if $alreadyhaslink && isset($smarty.session.acl.widgetposition.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/view/<{$row->refuuid_ID_WIDGET_POSITION}>"><{$row->reftext_ID_WIDGET_POSITION|escape}></a>
        <{else}>
            <{$row->reftext_ID_WIDGET_POSITION|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WIDGET_POSITION}><{$row->ID_WIDGET_POSITION|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('HIDE_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['HIDE_TITLE']) && ((isset($aclviewablecolumns['HIDE_TITLE']) && $aclviewablecolumns['HIDE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HIDE_TITLE']) || $aclviewablecolumns['HIDE_TITLE']))) }>
                <td class="column column-hide-title yesno" data-value="<{$row->HIDE_TITLE}>" data-column="HIDE_TITLE" data-module="pagewidget">
                                            <{if (in_array('HIDE_TITLE', $roweditablecolumns)) }>
                    	                            <{$tmp_value = $formdataHIDE_TITLE}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-hide-title" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" >
                                    <option value="1" <{if $formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" value="1" <{if $formdata.HIDE_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" value="0" <{if !$formdata.HIDE_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->HIDE_TITLE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
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

                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagewidget_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
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
    	    <div class="pagewidget-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.pagewidget.0}>
        $('.pagewidget-rowedit-message').html('<{$messages.pagewidget.0}>').show();
    <{/if}>

    $('#pagewidgetlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#pagewidgetlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#pagewidgetlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#pagewidgetlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.pagewidget-rowedit-save').click();
        }
    });

    bind_hotkey("#pagewidgetlist > tbody tr.rowedit input[type=text]", 'f2', '.pagewidget-rowedit-save');
    bind_hotkey("#pagewidgetlist > tbody tr.rowedit input[type=text]", 'esc', '.pagewidget-rowedit-cancel');
</script>

    <{if $row->UUID == 0}>
        <script type="text/javascript">
                                                alias_hint('pagewidget_formdata_TITLE', 'pagewidget_formdata_CODE', 'tr');
                                    </script>
    <{/if}>


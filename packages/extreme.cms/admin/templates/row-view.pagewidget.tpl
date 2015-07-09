<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> widget-type-<{$row->reftext_ID_WIDGET_TYPE|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-pagewidget-<{$row->UUID}>" class="pagewidgetlistchk" name="pagewidgetlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>pagewidget_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
                <td class="column column-id-page reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_ID_PAGE}>"><{$row->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE}><{$row->ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image " >
                                        	<span>    <{media src=$row->IMAGE thumbnail=1}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_WIDGET_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WIDGET_TYPE']) && ((isset($aclviewablecolumns['ID_WIDGET_TYPE']) && $aclviewablecolumns['ID_WIDGET_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WIDGET_TYPE']) || $aclviewablecolumns['ID_WIDGET_TYPE']))) }>
                <td class="column column-id-widget-type reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WIDGET_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.widgettype.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/widgettype/view/<{$row->refuuid_ID_WIDGET_TYPE}>"><{$row->reftext_ID_WIDGET_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_WIDGET_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WIDGET_TYPE}><{$row->ID_WIDGET_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_WIDGET_POSITION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_WIDGET_POSITION']) && ((isset($aclviewablecolumns['ID_WIDGET_POSITION']) && $aclviewablecolumns['ID_WIDGET_POSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WIDGET_POSITION']) || $aclviewablecolumns['ID_WIDGET_POSITION']))) }>
                <td class="column column-id-widget-position reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_WIDGET_POSITION}>
        <{if $alreadyhaslink && isset($smarty.session.acl.widgetposition.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/view/<{$row->refuuid_ID_WIDGET_POSITION}>"><{$row->reftext_ID_WIDGET_POSITION|escape}></a>
        <{else}>
            <{$row->reftext_ID_WIDGET_POSITION|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_WIDGET_POSITION}><{$row->ID_WIDGET_POSITION|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagewidget.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('HIDE_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['HIDE_TITLE']) && ((isset($aclviewablecolumns['HIDE_TITLE']) && $aclviewablecolumns['HIDE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HIDE_TITLE']) || $aclviewablecolumns['HIDE_TITLE']))) }>
                <td class="column column-hide-title yesno " data-value="<{$row->HIDE_TITLE}>" data-column="HIDE_TITLE" data-module="pagewidget">
                                        	<span>	<{if $row->HIDE_TITLE}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ORDERING', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
                <td class="column column-ordering number " >
                                        	<span>
            <span class="number number-format"><{if $row->ORDERING != 0}><{$row->ORDERING}><{/if}></span>
    
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="pagewidget_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.pagewidget.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('L_EDIT')}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.pagewidget[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/pagewidget/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/booking/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
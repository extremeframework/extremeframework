<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> type-<{$row->reftext_ID_POST_RELATION_TYPE|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-postrelation-<{$row->UUID}>" class="postrelationlistchk" name="postrelationlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>postrelation_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"></td>
            <{if (in_array('ID_POST', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
                <td class="column column-id-post reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST}>
        <{if $alreadyhaslink && isset($smarty.session.acl.post.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->refuuid_ID_POST}>"><{$row->reftext_ID_POST|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST}><{$row->ID_POST|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PEER_ID_POST', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PEER_ID_POST']) && ((isset($aclviewablecolumns['PEER_ID_POST']) && $aclviewablecolumns['PEER_ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PEER_ID_POST']) || $aclviewablecolumns['PEER_ID_POST']))) }>
                <td class="column column-peer-id-post reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_PEER_ID_POST}>
        <{if $alreadyhaslink && isset($smarty.session.acl.post.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->refuuid_PEER_ID_POST}>"><{$row->reftext_PEER_ID_POST|escape}></a>
        <{else}>
            <{$row->reftext_PEER_ID_POST|escape}>        <{/if}>
    <{else}>
    	<{if $row->PEER_ID_POST}><{$row->PEER_ID_POST|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_POST_RELATION_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST_RELATION_TYPE']) && ((isset($aclviewablecolumns['ID_POST_RELATION_TYPE']) && $aclviewablecolumns['ID_POST_RELATION_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_RELATION_TYPE']) || $aclviewablecolumns['ID_POST_RELATION_TYPE']))) }>
                <td class="column column-id-post-relation-type reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelation/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST_RELATION_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.postrelationtype.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/view/<{$row->refuuid_ID_POST_RELATION_TYPE}>"><{$row->reftext_ID_POST_RELATION_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST_RELATION_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST_RELATION_TYPE}><{$row->ID_POST_RELATION_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.postrelation.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="postrelation_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.postrelation.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelation/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('L_EDIT')}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.postrelation[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/postrelation/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
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
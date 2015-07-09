<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-postsection-<{$row->UUID}>" class="postsectionlistchk" name="postsectionlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>postsection_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postsection/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_POST', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
                <td class="column column-id-post reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postsection/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST}>
        <{if $alreadyhaslink && isset($smarty.session.acl.post.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->refuuid_ID_POST}>"><{$row->reftext_ID_POST|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST}><{$row->ID_POST|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postsection/view/<{$row->UUID}>"><{/if}>    <{media src=$row->IMAGE thumbnail=1}>
<{if isset($smarty.session.acl.postsection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('BACKGROUND_IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['BACKGROUND_IMAGE']) && ((isset($aclviewablecolumns['BACKGROUND_IMAGE']) && $aclviewablecolumns['BACKGROUND_IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_IMAGE']) || $aclviewablecolumns['BACKGROUND_IMAGE']))) }>
                <td class="column column-background-image image " >
                                        	<span>    <{media src=$row->BACKGROUND_IMAGE thumbnail=1}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('BACKGROUND_COLOR', $filtercolumns)) }>
            <{if !isset($excludedcolumns['BACKGROUND_COLOR']) && ((isset($aclviewablecolumns['BACKGROUND_COLOR']) && $aclviewablecolumns['BACKGROUND_COLOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_COLOR']) || $aclviewablecolumns['BACKGROUND_COLOR']))) }>
                <td class="column column-background-color color " >
                                        	<span>	<{$row->BACKGROUND_COLOR|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('VIDEO', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VIDEO']) && ((isset($aclviewablecolumns['VIDEO']) && $aclviewablecolumns['VIDEO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIDEO']) || $aclviewablecolumns['VIDEO']))) }>
                <td class="column column-video video " >
                                        	<span>    <{media src=$row->VIDEO thumbnail=1}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LINK_PATH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LINK_PATH']) && ((isset($aclviewablecolumns['LINK_PATH']) && $aclviewablecolumns['LINK_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_PATH']) || $aclviewablecolumns['LINK_PATH']))) }>
                <td class="column column-link-path text " >
                                        	<span>	<{$row->LINK_PATH|escape}>
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
	<{plugin key="postsection_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.postsection.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/postsection/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('L_EDIT')}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.postsection[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/postsection/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
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
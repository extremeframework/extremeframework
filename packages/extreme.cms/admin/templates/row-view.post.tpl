<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> type-<{$row->reftext_ID_POST_TYPE|ascode}> category-<{$row->reftext_ID_POST_CATEGORY|ascode}>" data-id="<{$row->UUID}>"<{if $row->META_DESCRIPTION}> title="<{$row->META_DESCRIPTION|strip_tags}>"<{/if}>>
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-post-<{$row->UUID}>" class="postlistchk" name="postlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>post_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    	    <{$row->TITLE|escape}>
    <{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_POST_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST_TYPE']) && ((isset($aclviewablecolumns['ID_POST_TYPE']) && $aclviewablecolumns['ID_POST_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_TYPE']) || $aclviewablecolumns['ID_POST_TYPE']))) }>
                <td class="column column-id-post-type reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.posttype.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/posttype/view/<{$row->refuuid_ID_POST_TYPE}>"><{$row->reftext_ID_POST_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST_TYPE}><{$row->ID_POST_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_POST_CATEGORY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_POST_CATEGORY']) && ((isset($aclviewablecolumns['ID_POST_CATEGORY']) && $aclviewablecolumns['ID_POST_CATEGORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_CATEGORY']) || $aclviewablecolumns['ID_POST_CATEGORY']))) }>
                <td class="column column-id-post-category reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_POST_CATEGORY}>
        <{if $alreadyhaslink && isset($smarty.session.acl.postcategory.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/view/<{$row->refuuid_ID_POST_CATEGORY}>"><{$row->reftext_ID_POST_CATEGORY|escape}></a>
        <{else}>
            <{$row->reftext_ID_POST_CATEGORY|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_POST_CATEGORY}><{$row->ID_POST_CATEGORY|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IMAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                <td class="column column-image image " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    <{media src=$row->IMAGE thumbnail=1}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('META_KEYWORDS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
                <td class="column column-meta-keywords text " >
                                        	<span>    	    <{$row->META_KEYWORDS|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('AUTHOR', $filtercolumns)) }>
            <{if !isset($excludedcolumns['AUTHOR']) && ((isset($aclviewablecolumns['AUTHOR']) && $aclviewablecolumns['AUTHOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AUTHOR']) || $aclviewablecolumns['AUTHOR']))) }>
                <td class="column column-author text " >
                                        	<span>    	    <{$row->AUTHOR|escape}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_TEMPLATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
                <td class="column column-id-template reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.post.view) && !$alreadyhaslink }><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_TEMPLATE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.template.view)}>
            <a class="refview scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/template/view/<{$row->refuuid_ID_TEMPLATE}>"><{$row->reftext_ID_TEMPLATE|escape}></a>
        <{else}>
            <{$row->reftext_ID_TEMPLATE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_TEMPLATE}><{$row->ID_TEMPLATE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.post.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
                <td class="column column-creation-date date " >
                                        	<span>
            <{$row->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
                <td class="column column-latest-update date " >
                                        	<span>
            <{$row->LATEST_UPDATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_FEATURED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_FEATURED']) && ((isset($aclviewablecolumns['IS_FEATURED']) && $aclviewablecolumns['IS_FEATURED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_FEATURED']) || $aclviewablecolumns['IS_FEATURED']))) }>
                <td class="column column-is-featured yesno " data-value="<{$row->IS_FEATURED}>" data-column="IS_FEATURED" data-module="post">
                                        	<span>	<{if $row->IS_FEATURED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('NBR_VIEWS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
                <td class="column column-nbr-views number " >
                                        	<span>
            <span class="number number-format"><{if $row->NBR_VIEWS != 0}><{$row->NBR_VIEWS}><{/if}></span>
    
            <{$summable.NBR_VIEWS = $summable.NBR_VIEWS + $row->NBR_VIEWS scope=parent}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="post_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.post.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('Edit', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.post[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/post/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
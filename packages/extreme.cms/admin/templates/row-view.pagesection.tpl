<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-pagesection-<{$row->UUID}>" class="pagesectionlistchk" name="pagesectionlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>pagesection_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                <td class="column column-title text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$row->UUID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
                <td class="column column-id-page reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_ID_PAGE}>"><{$row->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAGE}><{$row->ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
                <td class="column column-code text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$row->UUID}>"><{/if}>	<{$row->CODE|escape}>
<{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
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
	        <{if (in_array('FONT_AWESOME_ICON', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
                <td class="column column-font-awesome-icon text " >
                                        	<span>	<{$row->FONT_AWESOME_ICON|escape}>
</span>
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
	        <{if (in_array('VIEW_MORE_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VIEW_MORE_TITLE']) && ((isset($aclviewablecolumns['VIEW_MORE_TITLE']) && $aclviewablecolumns['VIEW_MORE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_TITLE']) || $aclviewablecolumns['VIEW_MORE_TITLE']))) }>
                <td class="column column-view-more-title text " >
                                        	<span>	<{$row->VIEW_MORE_TITLE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('VIEW_MORE_ID_PAGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['VIEW_MORE_ID_PAGE']) && ((isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) && $aclviewablecolumns['VIEW_MORE_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) || $aclviewablecolumns['VIEW_MORE_ID_PAGE']))) }>
                <td class="column column-view-more-id-page reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagesection/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_VIEW_MORE_ID_PAGE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.page.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$row->refuuid_VIEW_MORE_ID_PAGE}>"><{$row->reftext_VIEW_MORE_ID_PAGE|escape}></a>
        <{else}>
            <{$row->reftext_VIEW_MORE_ID_PAGE|escape}>        <{/if}>
    <{else}>
    	<{if $row->VIEW_MORE_ID_PAGE}><{$row->VIEW_MORE_ID_PAGE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.pagesection.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('HIDE_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['HIDE_TITLE']) && ((isset($aclviewablecolumns['HIDE_TITLE']) && $aclviewablecolumns['HIDE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HIDE_TITLE']) || $aclviewablecolumns['HIDE_TITLE']))) }>
                <td class="column column-hide-title yesno " data-value="<{$row->HIDE_TITLE}>" data-column="HIDE_TITLE" data-module="pagesection">
                                        	<span>	<{if $row->HIDE_TITLE}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_TAB_ANCHOR_SECTION', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_TAB_ANCHOR_SECTION']) && ((isset($aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) && $aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_TAB_ANCHOR_SECTION']) || $aclviewablecolumns['IS_TAB_ANCHOR_SECTION']))) }>
                <td class="column column-is-tab-anchor-section yesno " data-value="<{$row->IS_TAB_ANCHOR_SECTION}>" data-column="IS_TAB_ANCHOR_SECTION" data-module="pagesection">
                                        	<span>	<{if $row->IS_TAB_ANCHOR_SECTION}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('TAB_ANCHOR_TITLE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TAB_ANCHOR_TITLE']) && ((isset($aclviewablecolumns['TAB_ANCHOR_TITLE']) && $aclviewablecolumns['TAB_ANCHOR_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAB_ANCHOR_TITLE']) || $aclviewablecolumns['TAB_ANCHOR_TITLE']))) }>
                <td class="column column-tab-anchor-title text " >
                                        	<span>	<{$row->TAB_ANCHOR_TITLE|escape}>
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
	<{plugin key="pagesection_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.pagesection.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagesection/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{$smarty.const.L_EDIT}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.pagesection[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/pagesection/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{label text=$item->TITLE insidequote=true}>"></i><{else}><{label text=$item->TITLE}><{/if}></a>
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
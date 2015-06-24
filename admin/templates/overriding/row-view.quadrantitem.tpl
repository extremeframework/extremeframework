<tr id="item_<{$row->ID}>" class="rowview <{if $counter%2 }>row1<{else}>row0<{/if}> quadrant-type-<{$row->reftext_ID_QUADRANT_TYPE|ascode}>" data-id="<{$row->ID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=1|uniqid}>
	<td class="checkbox">
		<input type="checkbox" class="quadrantitemlistchk" name="quadrantitemlist_selection[]" value="<{$row->ID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>quadrantitem_multiformdata_ID[<{$rowsignature}>]" value="<{$row->ID}>" />
	</td>
            <{if (in_array('TITLE', $filtercolumns)) }>
            <{if (isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE'])) }>
                <td class="column-title text" >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.quadrantitem.view) && !$alreadyhaslink }><a class="scope-main <{if $row->IS_CURRENT}>c<{/if}>" href="<{$smarty.const.APPLICATION_URL}>/quadrantitem/edit/<{$row->ID}>"><{/if}>	<{$row->TITLE|escape}>
<{if isset($smarty.session.acl.quadrantitem.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
</tr>
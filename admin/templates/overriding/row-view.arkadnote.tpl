<tr style="background-color:gray!important;" id="item_<{$row->ID}>" class="rowview <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->ID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=1|uniqid}>
	<td class="checkbox" style="border:none!important;">
		<input type="checkbox" class="arkadnotelistchk" name="arkadnotelist_selection[]" value="<{$row->ID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>arkadnote_multiformdata_ID[<{$rowsignature}>]" value="<{$row->ID}>" />
	</td>
	<td class="indicators" style="border:none!important;"></td>
            <{if (in_array('NOTE', $filtercolumns)) }>
            <{if (isset($aclviewablecolumns['NOTE']) && $aclviewablecolumns['NOTE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NOTE']) || $aclviewablecolumns['NOTE'])) }>
                <td class="column-note textarea"  style="border:none!important;">
                                        	<div style="width: 80%;background-color: white;font-style: italic;white-space: pre-wrap;text-align: justify;padding: 10px;font-size: 15px;font-family:'Times New Roman',sans-serif"><{$row->NOTE|escape}></div>
    				        		</td>
    	    <{/if}>
        <{/if}>
		<{plugin key="arkadnote_list_columns_data" args=$row}>
	<td class="actions" style="border:none!important;">
	    <{if isset($smarty.session.acl.arkadnote.edit) }>
            <a class="edit scope-main" style="color:white" href="<{$smarty.const.APPLICATION_URL}>/arkadnote/edit/<{$row->ID}>"><i class="fa fa-pencil-square-o" title="<{$smarty.const.L_EDIT}>"></i></a>
        <{/if}>


        	</td>
</tr>
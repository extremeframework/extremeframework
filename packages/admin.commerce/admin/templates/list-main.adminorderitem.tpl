<{plugin key="generic_list_before" args=""}>
<{plugin key="adminorderitem_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminorderitemlist" data-module="adminorderitem">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminorderitem-all" onclick="adminorderitem_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_ADMIN_ORDER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_ORDER']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER']) && $aclviewablecolumns['ID_ADMIN_ORDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER']) || $aclviewablecolumns['ID_ADMIN_ORDER']))) }>
    	            <th class="column-id-admin-order">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/sort/id_admin_order"><{label key="L_ADMIN_ORDER"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ADMIN_PRODUCT', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_PRODUCT']) && ((isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) && $aclviewablecolumns['ID_ADMIN_PRODUCT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) || $aclviewablecolumns['ID_ADMIN_PRODUCT']))) }>
    	            <th class="column-id-admin-product">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/sort/id_admin_product"><{label key="L_ADMIN_PRODUCT"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('QUANTITY', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['QUANTITY']) && ((isset($aclviewablecolumns['QUANTITY']) && $aclviewablecolumns['QUANTITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['QUANTITY']) || $aclviewablecolumns['QUANTITY']))) }>
    	            <th class="column-quantity">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/sort/quantity"><{label key="L_QUANTITY"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PRICE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
    	            <th class="column-price">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/sort/price"><{label key="L_PRICE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		        <{foreach from=$customfields item=item}>
            <th class="column-<{$item->COLUMN}>">
	            <{$item->NAME}>
			</th>
			<{assign var='colcount' value=$colcount+1}>
    	<{/foreach}>
		<{plugin key="adminorderitem_list_columns_headers" args=""}>
		<th class="actions"></th>
	</tr>
	</thead>
    <{php}>
    	$template->assign('summable', array());
    <{/php}>
	<tbody>
	<{if $pagination}>
	<tr class="top-holder" style="display:none">
	    <td colspan="<{$colcount+2}>" style="text-align:center;">
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_ADMIN_ORDER_ITEM|strtolower}>s on this page are selected. <a onclick="adminorderitem_selectall()">Select all <{$total}> <{$smarty.const.L_ADMIN_ORDER_ITEM|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_ADMIN_ORDER_ITEM|strtolower}>s in the list are selected. <a onclick="adminorderitem_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminorderitem.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminorderitem-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="adminorderitem-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminorderitem-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel adminorderitem-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="adminorderitem-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
                    <{if $rows}>
            	<tr style="background-color:#F4FAE1;">
            		<th colspan="2"><{label key="L_TOTAL"}></th>
            	                	        <{if (in_array('ID_ADMIN_ORDER', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['ID_ADMIN_ORDER']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER']) && $aclviewablecolumns['ID_ADMIN_ORDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER']) || $aclviewablecolumns['ID_ADMIN_ORDER']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('ID_ADMIN_PRODUCT', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['ID_ADMIN_PRODUCT']) && ((isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) && $aclviewablecolumns['ID_ADMIN_PRODUCT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) || $aclviewablecolumns['ID_ADMIN_PRODUCT']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('QUANTITY', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['QUANTITY']) && ((isset($aclviewablecolumns['QUANTITY']) && $aclviewablecolumns['QUANTITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['QUANTITY']) || $aclviewablecolumns['QUANTITY']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('PRICE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
                    	                                		    <th><{if $summable.PRICE}><span class="currency currency-format"><{$summable.PRICE}></span><{/if}></th>
                                                            <{/if}>
                        <{/if}>
            		            		<{plugin key="adminorderitem_list_columns_footers" args=""}>
                    <th></th>
            	</tr>
        	<{/if}>
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminorderitem_list_after" args=""}>

<script type="text/javascript">
    $(document).ready(function(){
        // s. Synchronize table top scroll and bottom scroll
		var topScroll = $('.table-top-scroll');
		var bottomScroll = $('.table-bottom-scroll');

		$('.table-top-scroll-div').css('width', $('.table-bottom-scroll-div').outerWidth());
		$('.table-bottom-scroll-div').css('width', $('.table-top-scroll-div').outerWidth());

		topScroll.scroll(function(){
			bottomScroll.scrollLeft(topScroll.scrollLeft());
		});

		bottomScroll.scroll(function(){
			topScroll.scrollLeft(bottomScroll.scrollLeft());
		});

        <{if !$readonly}>
            // x. Double-click on a viewing-row to edit it
            $('#adminorderitemlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminorderitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminorderitemlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminorderitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminorderitem-rowedit-save-existing').die('click').live('click', function(event) {
                event.preventDefault();

                tinyMCE.triggerSave();

                var tr = $(this).closest('tr');

                var fd = new FormData();

                if ($('input[type="file"]').length) {
                    var files = $('input[type="file"]')[0].files;
                    for (var i = 0; i < files.length; i++) {
                        fd.append("file_" + i, files[i]);
                    }
                }

                var others = tr.find(':input').serializeArray();
                $.each(others, function(key, input) {
                    fd.append(input.name, input.value);
                });

                <{if $preset}>
                    fd.append('preset', '<{$preset}>');
                    fd.append('presetvalue', '<{$presetvalue}>');
                <{/if}>

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminorderitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminorderitem-rowedit-add').click(function() {
                if ($('#adminorderitemlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminorderitemlist > tbody').append(html);

                    $('.adminorderitem-rowedit-add').hide();
                    $('.adminorderitem-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminorderitem-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminorderitemlist #item_');

                tr.remove();

                $('.adminorderitem-rowedit-message').html('').hide();

                $('.adminorderitem-rowedit-add').show();
                $('.adminorderitem-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminorderitem-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminorderitemlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminorderitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminorderitemlist #item_').length == 0) {
                        $('.adminorderitem-rowedit-add').show();
                        $('.adminorderitem-rowedit-buttons').hide();

                        $('.adminorderitem-list-count, .adminorderitem-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminorderitem-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#adminorderitemlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.adminorderitem-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.adminorderitem-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#adminorderitemlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#adminorderitemlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#adminorderitemform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#adminorderitemlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });
            <{/if}>
            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.adminorderitemlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminorderitemlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminorderitemlistchk').click(function(){
    		$('#adminorderitemlist .top-holder').hide();

    	    document.adminorderitemlist.adminorderitemlist_selection_selectall.value = 0;
        });
    });
</script>
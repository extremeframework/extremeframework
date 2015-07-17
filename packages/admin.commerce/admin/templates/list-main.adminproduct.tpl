<{plugin key="generic_list_before" args=""}>
<{plugin key="adminproduct_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminproductlist" data-module="adminproduct">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminproduct-all" onclick="adminproduct_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
    	            <th class="column-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/sort/title"><{_t('L_TITLE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IMAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
    	            <th class="column-image">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/sort/image"><{_t('L_IMAGE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('LIST_PRICE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['LIST_PRICE']) && ((isset($aclviewablecolumns['LIST_PRICE']) && $aclviewablecolumns['LIST_PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LIST_PRICE']) || $aclviewablecolumns['LIST_PRICE']))) }>
    	            <th class="column-list-price">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/sort/list_price"><{_t('L_LIST_PRICE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PRICE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
    	            <th class="column-price">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/sort/price"><{_t('L_PRICE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PRODUCT_ID_PAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PRODUCT_ID_PAGE']) && ((isset($aclviewablecolumns['PRODUCT_ID_PAGE']) && $aclviewablecolumns['PRODUCT_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRODUCT_ID_PAGE']) || $aclviewablecolumns['PRODUCT_ID_PAGE']))) }>
    	            <th class="column-product-id-page">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/sort/product_id_page"><{_t('L_PRODUCT_PAGE')}></a>
            	        
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
		<{plugin key="adminproduct_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('L_ADMIN_PRODUCT')|strtolower}>s on this page are selected. <a onclick="adminproduct_selectall()">Select all <{$total}> <{_t('L_ADMIN_PRODUCT')|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('L_ADMIN_PRODUCT')|strtolower}>s in the list are selected. <a onclick="adminproduct_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminproduct.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminproduct-rowedit-add"><{_t('Add item')}></span>
                	    <span class="adminproduct-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminproduct-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel adminproduct-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="adminproduct-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
                    <{if $rows}>
            	<tr style="background-color:#F4FAE1;">
            		<th colspan="2"><{_t('Total')}></th>
            	                	        <{if (in_array('TITLE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('IMAGE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('LIST_PRICE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['LIST_PRICE']) && ((isset($aclviewablecolumns['LIST_PRICE']) && $aclviewablecolumns['LIST_PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LIST_PRICE']) || $aclviewablecolumns['LIST_PRICE']))) }>
                    	                                		    <th><{if $summable.LIST_PRICE}><span class="currency currency-format"><{$summable.LIST_PRICE}></span><{/if}></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('PRICE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
                    	                                		    <th><{if $summable.PRICE}><span class="currency currency-format"><{$summable.PRICE}></span><{/if}></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('PRODUCT_ID_PAGE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['PRODUCT_ID_PAGE']) && ((isset($aclviewablecolumns['PRODUCT_ID_PAGE']) && $aclviewablecolumns['PRODUCT_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRODUCT_ID_PAGE']) || $aclviewablecolumns['PRODUCT_ID_PAGE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            		<{plugin key="adminproduct_list_columns_footers" args=""}>
                    <th></th>
            	</tr>
        	<{/if}>
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminproduct_list_after" args=""}>

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
            $('#adminproductlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminproduct-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminproductlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminproduct-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminproduct-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminproduct-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminproduct-rowedit-add').click(function() {
                if ($('#adminproductlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminproductlist > tbody').append(html);

                    $('.adminproduct-rowedit-add').hide();
                    $('.adminproduct-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminproduct-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminproductlist #item_');

                tr.remove();

                $('.adminproduct-rowedit-message').html('').hide();

                $('.adminproduct-rowedit-add').show();
                $('.adminproduct-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminproduct-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminproductlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminproduct-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminproductlist #item_').length == 0) {
                        $('.adminproduct-rowedit-add').show();
                        $('.adminproduct-rowedit-buttons').hide();

                        $('.adminproduct-list-count, .adminproduct-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminproduct-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#adminproductlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.adminproduct-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.adminproduct-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#adminproductlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#adminproductlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#adminproductform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#adminproductlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.adminproductlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminproductlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminproductlistchk').click(function(){
    		$('#adminproductlist .top-holder').hide();

    	    document.adminproductlist.adminproductlist_selection_selectall.value = 0;
        });
    });
</script>
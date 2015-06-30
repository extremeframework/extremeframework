<{plugin key="generic_list_before" args=""}>
<{plugin key="page_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="pagelist" data-module="page">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-page-all" onclick="page_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/name"><{label key="L_PAGE_NAME"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
    	            <th class="column-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/title"><{label key="L_TITLE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('THUMB', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['THUMB']) && ((isset($aclviewablecolumns['THUMB']) && $aclviewablecolumns['THUMB']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['THUMB']) || $aclviewablecolumns['THUMB']))) }>
    	            <th class="column-thumb">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/thumb"><{label key="L_THUMB"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('BACKGROUND_IMAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['BACKGROUND_IMAGE']) && ((isset($aclviewablecolumns['BACKGROUND_IMAGE']) && $aclviewablecolumns['BACKGROUND_IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_IMAGE']) || $aclviewablecolumns['BACKGROUND_IMAGE']))) }>
    	            <th class="column-background-image">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/background_image"><{label key="L_BACKGROUND_IMAGE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IMAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
    	            <th class="column-image">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/image"><{label key="L_IMAGE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VIDEO', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VIDEO']) && ((isset($aclviewablecolumns['VIDEO']) && $aclviewablecolumns['VIDEO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIDEO']) || $aclviewablecolumns['VIDEO']))) }>
    	            <th class="column-video">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/video"><{label key="L_VIDEO"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('META_KEYWORDS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
    	            <th class="column-meta-keywords">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/meta_keywords"><{label key="L_META_KEYWORDS"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_TEMPLATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
    	            <th class="column-id-template">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/id_template"><{label key="L_TEMPLATE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VIEW_MORE_TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VIEW_MORE_TITLE']) && ((isset($aclviewablecolumns['VIEW_MORE_TITLE']) && $aclviewablecolumns['VIEW_MORE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_TITLE']) || $aclviewablecolumns['VIEW_MORE_TITLE']))) }>
    	            <th class="column-view-more-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/view_more_title"><{label key="L_VIEW_MORE_TITLE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VIEW_MORE_ID_PAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VIEW_MORE_ID_PAGE']) && ((isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) && $aclviewablecolumns['VIEW_MORE_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) || $aclviewablecolumns['VIEW_MORE_ID_PAGE']))) }>
    	            <th class="column-view-more-id-page">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/view_more_id_page"><{label key="L_VIEW_MORE_PAGE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
    	            <th class="column-latest-update">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/latest_update"><{label key="L_LATEST_UPDATE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('NBR_VIEWS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
    	            <th class="column-nbr-views">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/sort/nbr_views"><{label key="L_NBR_VIEWS"}></a>
            	        
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
		<{plugin key="page_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_PAGE|strtolower}>s on this page are selected. <a onclick="page_selectall()">Select all <{$total}> <{$smarty.const.L_PAGE|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_PAGE|strtolower}>s in the list are selected. <a onclick="page_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.page.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="page-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="page-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save page-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel page-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="page-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
                    <{if $rows}>
            	<tr style="background-color:#F4FAE1;">
            		<th colspan="2"><{label key="L_TOTAL"}></th>
            	                	        <{if (in_array('NAME', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('TITLE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('THUMB', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['THUMB']) && ((isset($aclviewablecolumns['THUMB']) && $aclviewablecolumns['THUMB']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['THUMB']) || $aclviewablecolumns['THUMB']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('BACKGROUND_IMAGE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['BACKGROUND_IMAGE']) && ((isset($aclviewablecolumns['BACKGROUND_IMAGE']) && $aclviewablecolumns['BACKGROUND_IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_IMAGE']) || $aclviewablecolumns['BACKGROUND_IMAGE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('IMAGE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('VIDEO', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['VIDEO']) && ((isset($aclviewablecolumns['VIDEO']) && $aclviewablecolumns['VIDEO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIDEO']) || $aclviewablecolumns['VIDEO']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('META_KEYWORDS', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('ID_TEMPLATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('VIEW_MORE_TITLE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['VIEW_MORE_TITLE']) && ((isset($aclviewablecolumns['VIEW_MORE_TITLE']) && $aclviewablecolumns['VIEW_MORE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_TITLE']) || $aclviewablecolumns['VIEW_MORE_TITLE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('VIEW_MORE_ID_PAGE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['VIEW_MORE_ID_PAGE']) && ((isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) && $aclviewablecolumns['VIEW_MORE_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIEW_MORE_ID_PAGE']) || $aclviewablecolumns['VIEW_MORE_ID_PAGE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('NBR_VIEWS', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
                    	                                		    <th><{if $summable.NBR_VIEWS}><span class="number number-format"><{$summable.NBR_VIEWS}></span><{/if}></th>
                                                            <{/if}>
                        <{/if}>
            		            		<{plugin key="page_list_columns_footers" args=""}>
                    <th></th>
            	</tr>
        	<{/if}>
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="page_list_after" args=""}>

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
            $('#pagelist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/page/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.page-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#pagelist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/page/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.page-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.page-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/page/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.page-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.page-rowedit-add').click(function() {
                if ($('#pagelist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/page/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#pagelist > tbody').append(html);

                    $('.page-rowedit-add').hide();
                    $('.page-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.page-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#pagelist #item_');

                tr.remove();

                $('.page-rowedit-message').html('').hide();

                $('.page-rowedit-add').show();
                $('.page-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.page-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#pagelist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/page/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.page-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#pagelist #item_').length == 0) {
                        $('.page-rowedit-add').show();
                        $('.page-rowedit-buttons').hide();

                        $('.page-list-count, .page-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.page-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#pagelist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.page-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.page-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/page/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#pagelist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/page/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#pagelist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/page/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#pageform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#pagelist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/page/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.pagelistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.pagelistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.pagelistchk').click(function(){
    		$('#pagelist .top-holder').hide();

    	    document.pagelist.pagelist_selection_selectall.value = 0;
        });
    });
</script>
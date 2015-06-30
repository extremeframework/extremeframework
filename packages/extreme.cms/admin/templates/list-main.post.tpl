<{plugin key="generic_list_before" args=""}>
<{plugin key="post_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="postlist" data-module="post">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-post-all" onclick="post_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
    	            <th class="column-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/title"><{label key="L_TITLE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_POST_TYPE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_POST_TYPE']) && ((isset($aclviewablecolumns['ID_POST_TYPE']) && $aclviewablecolumns['ID_POST_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_TYPE']) || $aclviewablecolumns['ID_POST_TYPE']))) }>
    	            <th class="column-id-post-type">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/id_post_type"><{label key="L_POST_TYPE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_POST_CATEGORY', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_POST_CATEGORY']) && ((isset($aclviewablecolumns['ID_POST_CATEGORY']) && $aclviewablecolumns['ID_POST_CATEGORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_CATEGORY']) || $aclviewablecolumns['ID_POST_CATEGORY']))) }>
    	            <th class="column-id-post-category">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/id_post_category"><{label key="L_POST_CATEGORY"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IMAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
    	            <th class="column-image">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/image"><{label key="L_IMAGE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('META_KEYWORDS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
    	            <th class="column-meta-keywords">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/meta_keywords"><{label key="L_META_KEYWORDS"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('AUTHOR', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['AUTHOR']) && ((isset($aclviewablecolumns['AUTHOR']) && $aclviewablecolumns['AUTHOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AUTHOR']) || $aclviewablecolumns['AUTHOR']))) }>
    	            <th class="column-author">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/author"><{label key="L_AUTHOR"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_TEMPLATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
    	            <th class="column-id-template">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/id_template"><{label key="L_TEMPLATE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
    	            <th class="column-creation-date">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/creation_date"><{label key="L_CREATION_DATE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
    	            <th class="column-latest-update">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/latest_update"><{label key="L_LATEST_UPDATE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_FEATURED', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_FEATURED']) && ((isset($aclviewablecolumns['IS_FEATURED']) && $aclviewablecolumns['IS_FEATURED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_FEATURED']) || $aclviewablecolumns['IS_FEATURED']))) }>
    	            <th class="column-is-featured">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/is_featured"><{label key="L_IS_FEATURED"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('NBR_VIEWS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
    	            <th class="column-nbr-views">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/sort/nbr_views"><{label key="L_NBR_VIEWS"}></a>
            	        
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
		<{plugin key="post_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_POST|strtolower}>s on this page are selected. <a onclick="post_selectall()">Select all <{$total}> <{$smarty.const.L_POST|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_POST|strtolower}>s in the list are selected. <a onclick="post_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.post.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="post-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="post-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save post-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel post-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="post-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
                    <{if $rows}>
            	<tr style="background-color:#F4FAE1;">
            		<th colspan="2"><{label key="L_TOTAL"}></th>
            	                	        <{if (in_array('TITLE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('ID_POST_TYPE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['ID_POST_TYPE']) && ((isset($aclviewablecolumns['ID_POST_TYPE']) && $aclviewablecolumns['ID_POST_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_TYPE']) || $aclviewablecolumns['ID_POST_TYPE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('ID_POST_CATEGORY', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['ID_POST_CATEGORY']) && ((isset($aclviewablecolumns['ID_POST_CATEGORY']) && $aclviewablecolumns['ID_POST_CATEGORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_CATEGORY']) || $aclviewablecolumns['ID_POST_CATEGORY']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('IMAGE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('META_KEYWORDS', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['META_KEYWORDS']) && ((isset($aclviewablecolumns['META_KEYWORDS']) && $aclviewablecolumns['META_KEYWORDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['META_KEYWORDS']) || $aclviewablecolumns['META_KEYWORDS']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('AUTHOR', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['AUTHOR']) && ((isset($aclviewablecolumns['AUTHOR']) && $aclviewablecolumns['AUTHOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AUTHOR']) || $aclviewablecolumns['AUTHOR']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('ID_TEMPLATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['ID_TEMPLATE']) && ((isset($aclviewablecolumns['ID_TEMPLATE']) && $aclviewablecolumns['ID_TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TEMPLATE']) || $aclviewablecolumns['ID_TEMPLATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('LATEST_UPDATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['LATEST_UPDATE']) && ((isset($aclviewablecolumns['LATEST_UPDATE']) && $aclviewablecolumns['LATEST_UPDATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_UPDATE']) || $aclviewablecolumns['LATEST_UPDATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('IS_FEATURED', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['IS_FEATURED']) && ((isset($aclviewablecolumns['IS_FEATURED']) && $aclviewablecolumns['IS_FEATURED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_FEATURED']) || $aclviewablecolumns['IS_FEATURED']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('NBR_VIEWS', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['NBR_VIEWS']) && ((isset($aclviewablecolumns['NBR_VIEWS']) && $aclviewablecolumns['NBR_VIEWS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NBR_VIEWS']) || $aclviewablecolumns['NBR_VIEWS']))) }>
                    	                                		    <th><{if $summable.NBR_VIEWS}><span class="number number-format"><{$summable.NBR_VIEWS}></span><{/if}></th>
                                                            <{/if}>
                        <{/if}>
            		            		<{plugin key="post_list_columns_footers" args=""}>
                    <th></th>
            	</tr>
        	<{/if}>
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="post_list_after" args=""}>

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
            $('#postlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/post/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.post-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#postlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/post/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.post-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.post-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/post/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.post-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.post-rowedit-add').click(function() {
                if ($('#postlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/post/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#postlist > tbody').append(html);

                    $('.post-rowedit-add').hide();
                    $('.post-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.post-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#postlist #item_');

                tr.remove();

                $('.post-rowedit-message').html('').hide();

                $('.post-rowedit-add').show();
                $('.post-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.post-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#postlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/post/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.post-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#postlist #item_').length == 0) {
                        $('.post-rowedit-add').show();
                        $('.post-rowedit-buttons').hide();

                        $('.post-list-count, .post-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.post-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#postlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.post-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.post-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/post/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#postlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/post/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#postlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/post/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#postform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#postlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/post/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.postlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.postlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.postlistchk').click(function(){
    		$('#postlist .top-holder').hide();

    	    document.postlist.postlist_selection_selectall.value = 0;
        });
    });
</script>
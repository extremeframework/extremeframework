<{plugin key="generic_list_before" args=""}>
<{plugin key="adminview_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminviewlist" data-module="adminview">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminview-all" onclick="adminview_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
    	            <th class="column-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/title"><{label key="L_TITLE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CODE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
    	            <th class="column-code">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/code"><{label key="L_CODE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('MODULE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
    	            <th class="column-module">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/module"><{label key="L_MODULE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('SCREEN', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['SCREEN']) && ((isset($aclviewablecolumns['SCREEN']) && $aclviewablecolumns['SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SCREEN']) || $aclviewablecolumns['SCREEN']))) }>
    	            <th class="column-screen">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/screen"><{label key="L_SCREEN"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CONDITION_FIELD', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CONDITION_FIELD']) && ((isset($aclviewablecolumns['CONDITION_FIELD']) && $aclviewablecolumns['CONDITION_FIELD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION_FIELD']) || $aclviewablecolumns['CONDITION_FIELD']))) }>
    	            <th class="column-condition-field">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/condition_field"><{label key="L_CONDITION_FIELD"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CONDITION_VALUE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CONDITION_VALUE']) && ((isset($aclviewablecolumns['CONDITION_VALUE']) && $aclviewablecolumns['CONDITION_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION_VALUE']) || $aclviewablecolumns['CONDITION_VALUE']))) }>
    	            <th class="column-condition-value">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/condition_value"><{label key="L_CONDITION_VALUE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('TEMPLATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TEMPLATE']) && ((isset($aclviewablecolumns['TEMPLATE']) && $aclviewablecolumns['TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TEMPLATE']) || $aclviewablecolumns['TEMPLATE']))) }>
    	            <th class="column-template">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/template"><{label key="L_TEMPLATE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_PRINT_VIEW', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_PRINT_VIEW']) && ((isset($aclviewablecolumns['IS_PRINT_VIEW']) && $aclviewablecolumns['IS_PRINT_VIEW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_PRINT_VIEW']) || $aclviewablecolumns['IS_PRINT_VIEW']))) }>
    	            <th class="column-is-print-view">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/is_print_view"><{label key="L_IS_PRINT_VIEW"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/sort/ordering"><{label key="L_ORDERING"}></a>
            	        
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
		<{plugin key="adminview_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_ADMIN_VIEW|strtolower}>s on this page are selected. <a onclick="adminview_selectall()">Select all <{$total}> <{$smarty.const.L_ADMIN_VIEW|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_ADMIN_VIEW|strtolower}>s in the list are selected. <a onclick="adminview_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminview.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminview-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="adminview-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminview-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel adminview-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="adminview-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminview_list_after" args=""}>

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
            $('#adminviewlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminview-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminviewlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminview-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminview-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminview-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminview-rowedit-add').click(function() {
                if ($('#adminviewlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminviewlist > tbody').append(html);

                    $('.adminview-rowedit-add').hide();
                    $('.adminview-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminview-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminviewlist #item_');

                tr.remove();

                $('.adminview-rowedit-message').html('').hide();

                $('.adminview-rowedit-add').show();
                $('.adminview-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminview-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminviewlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminview-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminviewlist #item_').length == 0) {
                        $('.adminview-rowedit-add').show();
                        $('.adminview-rowedit-buttons').hide();

                        $('.adminview-list-count, .adminview-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminview-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#adminviewlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.adminview-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.adminview-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#adminviewlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#adminviewlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#adminviewform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#adminviewlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminview/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });
            <{/if}>
            });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        var fixHelper = function(e, ui) {
            ui.children().each(function() {
                $(this).width($(this).width());
            });
            return ui;
        };

        <{if !$readonly}>
            $("#adminviewlist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#adminviewlist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#adminviewlist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminview/updateorder",
                        data: order,
                        success: function(msg){
                            if (msg) {
                                alert(msg);
                            }
                        }
                    });
                }
            });
        <{/if}>
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.adminviewlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminviewlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminviewlistchk').click(function(){
    		$('#adminviewlist .top-holder').hide();

    	    document.adminviewlist.adminviewlist_selection_selectall.value = 0;
        });
    });
</script>
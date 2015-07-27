<{plugin key="generic_list_before" args=""}>
<{plugin key="adminlayoutsection_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminlayoutsectionlist" data-module="adminlayoutsection">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminlayoutsection-all" onclick="adminlayoutsection_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/sort/name"><{_t('Admin layout section name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('MODULE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
    	            <th class="column-module">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/sort/module"><{_t('Module')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('SHOW_TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['SHOW_TITLE']) && ((isset($aclviewablecolumns['SHOW_TITLE']) && $aclviewablecolumns['SHOW_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SHOW_TITLE']) || $aclviewablecolumns['SHOW_TITLE']))) }>
    	            <th class="column-show-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/sort/show_title"><{_t('Show title')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/sort/ordering"><{_t('Ordering')}></a>
            	        
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
		<{plugin key="adminlayoutsection_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('Admin Layout Sections')|strtolower}> on this page are selected. <a onclick="adminlayoutsection_selectall()">Select all <{$total}> <{_t('Admin Layout Sections')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Admin Layout Sections')|strtolower}> in the list are selected. <a onclick="adminlayoutsection_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminlayoutsection.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminlayoutsection-rowedit-add"><{_t('Add item')}></span>
                	    <span class="adminlayoutsection-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminlayoutsection-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel adminlayoutsection-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="adminlayoutsection-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminlayoutsection_list_after" args=""}>

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
            $('#adminlayoutsectionlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlayoutsection-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminlayoutsectionlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlayoutsection-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminlayoutsection-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminlayoutsection-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminlayoutsection-rowedit-add').click(function() {
                if ($('#adminlayoutsectionlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminlayoutsectionlist > tbody').append(html);

                    $('.adminlayoutsection-rowedit-add').hide();
                    $('.adminlayoutsection-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminlayoutsection-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminlayoutsectionlist #item_');

                tr.remove();

                $('.adminlayoutsection-rowedit-message').html('').hide();

                $('.adminlayoutsection-rowedit-add').show();
                $('.adminlayoutsection-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminlayoutsection-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminlayoutsectionlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlayoutsection-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminlayoutsectionlist #item_').length == 0) {
                        $('.adminlayoutsection-rowedit-add').show();
                        $('.adminlayoutsection-rowedit-buttons').hide();

                        $('.adminlayoutsection-list-count, .adminlayoutsection-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminlayoutsection-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#adminlayoutsectionlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.adminlayoutsection-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.adminlayoutsection-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#adminlayoutsectionlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#adminlayoutsectionlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#adminlayoutsectionform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#adminlayoutsectionlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
            $("#adminlayoutsectionlist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#adminlayoutsectionlist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#adminlayoutsectionlist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/updateorder",
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
        $('.adminlayoutsectionlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminlayoutsectionlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminlayoutsectionlistchk').click(function(){
    		$('#adminlayoutsectionlist .top-holder').hide();

    	    document.adminlayoutsectionlist.adminlayoutsectionlist_selection_selectall.value = 0;
        });
    });
</script>
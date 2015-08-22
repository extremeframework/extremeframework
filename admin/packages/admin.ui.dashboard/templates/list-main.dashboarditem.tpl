<{plugin key="generic_list_before" args=""}>
<{plugin key="dashboarditem_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="dashboarditemlist" data-module="dashboarditem">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-dashboarditem-all" onclick="dashboarditem_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
    	            <th class="column-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/sort/title"><{_t('Dashboard item title')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_DASHBOARD', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_DASHBOARD']) && ((isset($aclviewablecolumns['ID_DASHBOARD']) && $aclviewablecolumns['ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD']) || $aclviewablecolumns['ID_DASHBOARD']))) }>
    	            <th class="column-id-dashboard">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/sort/id_dashboard"><{_t('Dashboard')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IMAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
    	            <th class="column-image">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/sort/image"><{_t('Image')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PATH', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
    	            <th class="column-path">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/sort/path"><{_t('Path')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_DASHBOARD_ITEM_TYPE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_DASHBOARD_ITEM_TYPE']) && ((isset($aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) && $aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) || $aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']))) }>
    	            <th class="column-id-dashboard-item-type">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/sort/id_dashboard_item_type"><{_t('Dashboard item type')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/sort/ordering"><{_t('Ordering')}></a>
            	        
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
		<{plugin key="dashboarditem_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('Dashboard Items')|strtolower}> on this page are selected. <a onclick="dashboarditem_selectall()">Select all <{$total}> <{_t('Dashboard Items')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Dashboard Items')|strtolower}> in the list are selected. <a onclick="dashboarditem_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.dashboarditem.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="dashboarditem-rowedit-add"><{_t('Add item')}></span>
                	    <span class="dashboarditem-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save dashboarditem-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel dashboarditem-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="dashboarditem-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="dashboarditem_list_after" args=""}>

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
            $('#dashboarditemlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.dashboarditem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#dashboarditemlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.dashboarditem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.dashboarditem-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.dashboarditem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.dashboarditem-rowedit-add').click(function() {
                if ($('#dashboarditemlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#dashboarditemlist > tbody').append(html);

                    $('.dashboarditem-rowedit-add').hide();
                    $('.dashboarditem-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.dashboarditem-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#dashboarditemlist #item_');

                tr.remove();

                $('.dashboarditem-rowedit-message').html('').hide();

                $('.dashboarditem-rowedit-add').show();
                $('.dashboarditem-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.dashboarditem-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#dashboarditemlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.dashboarditem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#dashboarditemlist #item_').length == 0) {
                        $('.dashboarditem-rowedit-add').show();
                        $('.dashboarditem-rowedit-buttons').hide();

                        $('.dashboarditem-list-count, .dashboarditem-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.dashboarditem-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#dashboarditemlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.dashboarditem-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.dashboarditem-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#dashboarditemlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#dashboarditemlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#dashboarditemform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#dashboarditemlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
            $("#dashboarditemlist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#dashboarditemlist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#dashboarditemlist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/updateorder",
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
        $('.dashboarditemlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.dashboarditemlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.dashboarditemlistchk').click(function(){
    		$('#dashboarditemlist .top-holder').hide();

    	    document.dashboarditemlist.dashboarditemlist_selection_selectall.value = 0;
        });
    });
</script>
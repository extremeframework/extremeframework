<{plugin key="generic_list_before" args=""}>
<{plugin key="adminlayoutfield_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminlayoutfieldlist" data-module="adminlayoutfield">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminlayoutfield-all" onclick="adminlayoutfield_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('MODULE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
    	            <th class="column-module">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/sort/module"><{label key="L_MODULE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ADMIN_LAYOUT_SECTION', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_LAYOUT_SECTION']) && ((isset($aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) && $aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) || $aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']))) }>
    	            <th class="column-id-admin-layout-section">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/sort/id_admin_layout_section"><{label key="L_ADMIN_LAYOUT_SECTION"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('COLUMN', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['COLUMN']) && ((isset($aclviewablecolumns['COLUMN']) && $aclviewablecolumns['COLUMN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COLUMN']) || $aclviewablecolumns['COLUMN']))) }>
    	            <th class="column-column">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/sort/column"><{label key="L_COLUMN"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('POSITION', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['POSITION']) && ((isset($aclviewablecolumns['POSITION']) && $aclviewablecolumns['POSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['POSITION']) || $aclviewablecolumns['POSITION']))) }>
    	            <th class="column-position">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/sort/position"><{label key="L_POSITION"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/sort/ordering"><{label key="L_ORDERING"}></a>
            	        
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
		<{plugin key="adminlayoutfield_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_ADMIN_LAYOUT_FIELD|strtolower}>s on this page are selected. <a onclick="adminlayoutfield_selectall()">Select all <{$total}> <{$smarty.const.L_ADMIN_LAYOUT_FIELD|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_ADMIN_LAYOUT_FIELD|strtolower}>s in the list are selected. <a onclick="adminlayoutfield_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminlayoutfield.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminlayoutfield-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="adminlayoutfield-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminlayoutfield-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel adminlayoutfield-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="adminlayoutfield-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminlayoutfield_list_after" args=""}>

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
            $('#adminlayoutfieldlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlayoutfield-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminlayoutfieldlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlayoutfield-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminlayoutfield-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminlayoutfield-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminlayoutfield-rowedit-add').click(function() {
                if ($('#adminlayoutfieldlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminlayoutfieldlist > tbody').append(html);

                    $('.adminlayoutfield-rowedit-add').hide();
                    $('.adminlayoutfield-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminlayoutfield-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminlayoutfieldlist #item_');

                tr.remove();

                $('.adminlayoutfield-rowedit-message').html('').hide();

                $('.adminlayoutfield-rowedit-add').show();
                $('.adminlayoutfield-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminlayoutfield-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminlayoutfieldlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlayoutfield-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminlayoutfieldlist #item_').length == 0) {
                        $('.adminlayoutfield-rowedit-add').show();
                        $('.adminlayoutfield-rowedit-buttons').hide();

                        $('.adminlayoutfield-list-count, .adminlayoutfield-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminlayoutfield-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#adminlayoutfieldlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.adminlayoutfield-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.adminlayoutfield-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#adminlayoutfieldlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#adminlayoutfieldlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#adminlayoutfieldform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#adminlayoutfieldlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
            $("#adminlayoutfieldlist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#adminlayoutfieldlist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#adminlayoutfieldlist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/updateorder",
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
        $('.adminlayoutfieldlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminlayoutfieldlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminlayoutfieldlistchk').click(function(){
    		$('#adminlayoutfieldlist .top-holder').hide();

    	    document.adminlayoutfieldlist.adminlayoutfieldlist_selection_selectall.value = 0;
        });
    });
</script>
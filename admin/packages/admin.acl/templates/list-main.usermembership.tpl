<{plugin key="generic_list_before" args=""}>
<{plugin key="usermembership_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="usermembershiplist" data-module="usermembership">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-usermembership-all" onclick="usermembership_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_USER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
    	            <th class="column-id-user">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usermembership/sort/id_user"><{label key="L_USER"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
    	            <th class="column-id-user-group">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usermembership/sort/id_user_group"><{label key="L_USER_GROUP"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER_ROLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
    	            <th class="column-id-user-role">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usermembership/sort/id_user_role"><{label key="L_USER_ROLE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VALID_FROM', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
    	            <th class="column-valid-from">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usermembership/sort/valid_from"><{label key="L_VALID_FROM"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VALID_UNTIL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VALID_UNTIL']) && ((isset($aclviewablecolumns['VALID_UNTIL']) && $aclviewablecolumns['VALID_UNTIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_UNTIL']) || $aclviewablecolumns['VALID_UNTIL']))) }>
    	            <th class="column-valid-until">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usermembership/sort/valid_until"><{label key="L_VALID_UNTIL"}></a>
            	        
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
		<{plugin key="usermembership_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_USER_MEMBERSHIP|strtolower}>s on this page are selected. <a onclick="usermembership_selectall()">Select all <{$total}> <{$smarty.const.L_USER_MEMBERSHIP|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_USER_MEMBERSHIP|strtolower}>s in the list are selected. <a onclick="usermembership_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.usermembership.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="usermembership-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="usermembership-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save usermembership-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel usermembership-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="usermembership-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="usermembership_list_after" args=""}>

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
            $('#usermembershiplist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.usermembership-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#usermembershiplist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.usermembership-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.usermembership-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.usermembership-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.usermembership-rowedit-add').click(function() {
                if ($('#usermembershiplist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#usermembershiplist > tbody').append(html);

                    $('.usermembership-rowedit-add').hide();
                    $('.usermembership-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.usermembership-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#usermembershiplist #item_');

                tr.remove();

                $('.usermembership-rowedit-message').html('').hide();

                $('.usermembership-rowedit-add').show();
                $('.usermembership-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.usermembership-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#usermembershiplist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.usermembership-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#usermembershiplist #item_').length == 0) {
                        $('.usermembership-rowedit-add').show();
                        $('.usermembership-rowedit-buttons').hide();

                        $('.usermembership-list-count, .usermembership-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.usermembership-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#usermembershiplist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.usermembership-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.usermembership-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#usermembershiplist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#usermembershiplist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#usermembershipform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#usermembershiplist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/usermembership/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.usermembershiplistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.usermembershiplistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.usermembershiplistchk').click(function(){
    		$('#usermembershiplist .top-holder').hide();

    	    document.usermembershiplist.usermembershiplist_selection_selectall.value = 0;
        });
    });
</script>
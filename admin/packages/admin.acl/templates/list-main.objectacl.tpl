<{plugin key="generic_list_before" args=""}>
<{plugin key="objectacl_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="objectacllist" data-module="objectacl">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-objectacl-all" onclick="objectacl_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('MODULE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
    	            <th class="column-module">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/sort/module"><{label key="L_MODULE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('OBJECT_ID', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['OBJECT_ID']) && ((isset($aclviewablecolumns['OBJECT_ID']) && $aclviewablecolumns['OBJECT_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OBJECT_ID']) || $aclviewablecolumns['OBJECT_ID']))) }>
    	            <th class="column-object-id">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/sort/object_id"><{label key="L_OBJECT"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
    	            <th class="column-id-user-group">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/sort/id_user_group"><{label key="L_USER_GROUP"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
    	            <th class="column-id-user">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/sort/id_user"><{label key="L_USER"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ARG_ID_USER_GROUP', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ARG_ID_USER_GROUP']) && ((isset($aclviewablecolumns['ARG_ID_USER_GROUP']) && $aclviewablecolumns['ARG_ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ARG_ID_USER_GROUP']) || $aclviewablecolumns['ARG_ID_USER_GROUP']))) }>
    	            <th class="column-arg-id-user-group">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/sort/arg_id_user_group"><{label key="L_ARG_USER_GROUP"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ARG_ID_USER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ARG_ID_USER']) && ((isset($aclviewablecolumns['ARG_ID_USER']) && $aclviewablecolumns['ARG_ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ARG_ID_USER']) || $aclviewablecolumns['ARG_ID_USER']))) }>
    	            <th class="column-arg-id-user">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/sort/arg_id_user"><{label key="L_ARG_USER"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ACL_TYPE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ACL_TYPE']) && ((isset($aclviewablecolumns['ID_ACL_TYPE']) && $aclviewablecolumns['ID_ACL_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ACL_TYPE']) || $aclviewablecolumns['ID_ACL_TYPE']))) }>
    	            <th class="column-id-acl-type">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/sort/id_acl_type"><{label key="L_ACL_TYPE"}></a>
            	        
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
		<{plugin key="objectacl_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_OBJECT_ACL|strtolower}>s on this page are selected. <a onclick="objectacl_selectall()">Select all <{$total}> <{$smarty.const.L_OBJECT_ACL|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_OBJECT_ACL|strtolower}>s in the list are selected. <a onclick="objectacl_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.objectacl.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="objectacl-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="objectacl-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save objectacl-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel objectacl-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="objectacl-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="objectacl_list_after" args=""}>

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
            $('#objectacllist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.objectacl-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#objectacllist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.objectacl-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.objectacl-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.objectacl-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.objectacl-rowedit-add').click(function() {
                if ($('#objectacllist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#objectacllist > tbody').append(html);

                    $('.objectacl-rowedit-add').hide();
                    $('.objectacl-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.objectacl-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#objectacllist #item_');

                tr.remove();

                $('.objectacl-rowedit-message').html('').hide();

                $('.objectacl-rowedit-add').show();
                $('.objectacl-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.objectacl-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#objectacllist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.objectacl-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#objectacllist #item_').length == 0) {
                        $('.objectacl-rowedit-add').show();
                        $('.objectacl-rowedit-buttons').hide();

                        $('.objectacl-list-count, .objectacl-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.objectacl-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#objectacllist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.objectacl-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.objectacl-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#objectacllist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#objectacllist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#objectaclform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#objectacllist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/objectacl/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.objectacllistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.objectacllistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.objectacllistchk').click(function(){
    		$('#objectacllist .top-holder').hide();

    	    document.objectacllist.objectacllist_selection_selectall.value = 0;
        });
    });
</script>
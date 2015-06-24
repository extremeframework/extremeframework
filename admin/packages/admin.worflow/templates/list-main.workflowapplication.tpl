<{plugin key="generic_list_before" args=""}>
<{plugin key="workflowapplication_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="workflowapplicationlist" data-module="workflowapplication">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-workflowapplication-all" onclick="workflowapplication_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('MODULE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
    	            <th class="column-module">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowapplication/sort/module"><{label key="L_MODULE"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_WORKFLOW', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
    	            <th class="column-id-workflow">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowapplication/sort/id_workflow"><{label key="L_WORKFLOW"}></a>
            	        
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
		<{plugin key="workflowapplication_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_WORKFLOW_APPLICATION|strtolower}>s on this page are selected. <a onclick="workflowapplication_selectall()">Select all <{$total}> <{$smarty.const.L_WORKFLOW_APPLICATION|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_WORKFLOW_APPLICATION|strtolower}>s in the list are selected. <a onclick="workflowapplication_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.workflowapplication.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="workflowapplication-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="workflowapplication-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save workflowapplication-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel workflowapplication-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="workflowapplication-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="workflowapplication_list_after" args=""}>

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
            $('#workflowapplicationlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowapplication/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowapplication-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#workflowapplicationlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowapplication/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowapplication-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.workflowapplication-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowapplication/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.workflowapplication-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.workflowapplication-rowedit-add').click(function() {
                if ($('#workflowapplicationlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowapplication/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#workflowapplicationlist > tbody').append(html);

                    $('.workflowapplication-rowedit-add').hide();
                    $('.workflowapplication-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.workflowapplication-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#workflowapplicationlist #item_');

                tr.remove();

                $('.workflowapplication-rowedit-message').html('').hide();

                $('.workflowapplication-rowedit-add').show();
                $('.workflowapplication-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.workflowapplication-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#workflowapplicationlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowapplication/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowapplication-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#workflowapplicationlist #item_').length == 0) {
                        $('.workflowapplication-rowedit-add').show();
                        $('.workflowapplication-rowedit-buttons').hide();

                        $('.workflowapplication-list-count, .workflowapplication-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.workflowapplication-rowedit-add').click();
                    }
                });
            });
        <{/if}>

            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.workflowapplicationlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.workflowapplicationlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.workflowapplicationlistchk').click(function(){
    		$('#workflowapplicationlist .top-holder').hide();

    	    document.workflowapplicationlist.workflowapplicationlist_selection_selectall.value = 0;
        });
    });
</script>
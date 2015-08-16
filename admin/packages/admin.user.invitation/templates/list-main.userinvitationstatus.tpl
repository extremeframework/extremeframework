<{plugin key="generic_list_before" args=""}>
<{plugin key="userinvitationstatus_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="userinvitationstatuslist" data-module="userinvitationstatus">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-userinvitationstatus-all" onclick="userinvitationstatus_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/sort/name"><{_t('User invitation status name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/sort/ordering"><{_t('Ordering')}></a>
            	        
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
		<{plugin key="userinvitationstatus_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('User Invitation Statuses')|strtolower}> on this page are selected. <a onclick="userinvitationstatus_selectall()">Select all <{$total}> <{_t('User Invitation Statuses')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('User Invitation Statuses')|strtolower}> in the list are selected. <a onclick="userinvitationstatus_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.userinvitationstatus.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="userinvitationstatus-rowedit-add"><{_t('Add item')}></span>
                	    <span class="userinvitationstatus-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save userinvitationstatus-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel userinvitationstatus-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="userinvitationstatus-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="userinvitationstatus_list_after" args=""}>

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
            $('#userinvitationstatuslist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userinvitationstatus-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#userinvitationstatuslist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userinvitationstatus-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.userinvitationstatus-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.userinvitationstatus-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.userinvitationstatus-rowedit-add').click(function() {
                if ($('#userinvitationstatuslist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#userinvitationstatuslist > tbody').append(html);

                    $('.userinvitationstatus-rowedit-add').hide();
                    $('.userinvitationstatus-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.userinvitationstatus-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#userinvitationstatuslist #item_');

                tr.remove();

                $('.userinvitationstatus-rowedit-message').html('').hide();

                $('.userinvitationstatus-rowedit-add').show();
                $('.userinvitationstatus-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.userinvitationstatus-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#userinvitationstatuslist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userinvitationstatus-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#userinvitationstatuslist #item_').length == 0) {
                        $('.userinvitationstatus-rowedit-add').show();
                        $('.userinvitationstatus-rowedit-buttons').hide();

                        $('.userinvitationstatus-list-count, .userinvitationstatus-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.userinvitationstatus-rowedit-add').click();
                    }
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
            $("#userinvitationstatuslist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#userinvitationstatuslist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#userinvitationstatuslist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/updateorder",
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
        $('.userinvitationstatuslistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.userinvitationstatuslistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.userinvitationstatuslistchk').click(function(){
    		$('#userinvitationstatuslist .top-holder').hide();

    	    document.userinvitationstatuslist.userinvitationstatuslist_selection_selectall.value = 0;
        });
    });
</script>
<{plugin key="generic_list_before" args=""}>
<{plugin key="userinvitation_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="userinvitationlist" data-module="userinvitation">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-userinvitation-all" onclick="userinvitation_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('INVITEE_NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['INVITEE_NAME']) && ((isset($aclviewablecolumns['INVITEE_NAME']) && $aclviewablecolumns['INVITEE_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INVITEE_NAME']) || $aclviewablecolumns['INVITEE_NAME']))) }>
    	            <th class="column-invitee-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/invitee_name"><{_t('Invitee name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('INVITEE_EMAIL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['INVITEE_EMAIL']) && ((isset($aclviewablecolumns['INVITEE_EMAIL']) && $aclviewablecolumns['INVITEE_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INVITEE_EMAIL']) || $aclviewablecolumns['INVITEE_EMAIL']))) }>
    	            <th class="column-invitee-email">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/invitee_email"><{_t('Invitee email')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
    	            <th class="column-id-user-group">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/id_user_group"><{_t('User group')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER_ROLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
    	            <th class="column-id-user-role">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/id_user_role"><{_t('User role')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VALID_FROM', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
    	            <th class="column-valid-from">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/valid_from"><{_t('Valid from')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VALID_UNTIL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VALID_UNTIL']) && ((isset($aclviewablecolumns['VALID_UNTIL']) && $aclviewablecolumns['VALID_UNTIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_UNTIL']) || $aclviewablecolumns['VALID_UNTIL']))) }>
    	            <th class="column-valid-until">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/valid_until"><{_t('Valid until')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER_INVITATION_STATUS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER_INVITATION_STATUS']) && ((isset($aclviewablecolumns['ID_USER_INVITATION_STATUS']) && $aclviewablecolumns['ID_USER_INVITATION_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_INVITATION_STATUS']) || $aclviewablecolumns['ID_USER_INVITATION_STATUS']))) }>
    	            <th class="column-id-user-invitation-status">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/id_user_invitation_status"><{_t('User invitation status')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('DATE_SENT', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['DATE_SENT']) && ((isset($aclviewablecolumns['DATE_SENT']) && $aclviewablecolumns['DATE_SENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_SENT']) || $aclviewablecolumns['DATE_SENT']))) }>
    	            <th class="column-date-sent">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/date_sent"><{_t('Date sent')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('DATE_ACCEPTED', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['DATE_ACCEPTED']) && ((isset($aclviewablecolumns['DATE_ACCEPTED']) && $aclviewablecolumns['DATE_ACCEPTED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_ACCEPTED']) || $aclviewablecolumns['DATE_ACCEPTED']))) }>
    	            <th class="column-date-accepted">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/sort/date_accepted"><{_t('Date accepted')}></a>
            	        
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
		<{plugin key="userinvitation_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('User Invitations')|strtolower}> on this page are selected. <a onclick="userinvitation_selectall()">Select all <{$total}> <{_t('User Invitations')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('User Invitations')|strtolower}> in the list are selected. <a onclick="userinvitation_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.userinvitation.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="userinvitation-rowedit-add"><{_t('Add item')}></span>
                	    <span class="userinvitation-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save userinvitation-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel userinvitation-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="userinvitation-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="userinvitation_list_after" args=""}>

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
            $('#userinvitationlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userinvitation-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#userinvitationlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userinvitation-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.userinvitation-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.userinvitation-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.userinvitation-rowedit-add').click(function() {
                if ($('#userinvitationlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#userinvitationlist > tbody').append(html);

                    $('.userinvitation-rowedit-add').hide();
                    $('.userinvitation-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.userinvitation-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#userinvitationlist #item_');

                tr.remove();

                $('.userinvitation-rowedit-message').html('').hide();

                $('.userinvitation-rowedit-add').show();
                $('.userinvitation-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.userinvitation-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#userinvitationlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userinvitation-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#userinvitationlist #item_').length == 0) {
                        $('.userinvitation-rowedit-add').show();
                        $('.userinvitation-rowedit-buttons').hide();

                        $('.userinvitation-list-count, .userinvitation-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.userinvitation-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#userinvitationlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.userinvitation-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.userinvitation-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#userinvitationlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#userinvitationlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#userinvitationform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#userinvitationlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.userinvitationlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.userinvitationlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.userinvitationlistchk').click(function(){
    		$('#userinvitationlist .top-holder').hide();

    	    document.userinvitationlist.userinvitationlist_selection_selectall.value = 0;
        });
    });
</script>
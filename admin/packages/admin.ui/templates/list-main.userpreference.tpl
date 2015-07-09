<{plugin key="generic_list_before" args=""}>
<{plugin key="userpreference_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="userpreferencelist" data-module="userpreference">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-userpreference-all" onclick="userpreference_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_USER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
    	            <th class="column-id-user">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpreference/sort/id_user"><{_t('L_USER')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_DASHBOARD', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_DASHBOARD']) && ((isset($aclviewablecolumns['ID_DASHBOARD']) && $aclviewablecolumns['ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD']) || $aclviewablecolumns['ID_DASHBOARD']))) }>
    	            <th class="column-id-dashboard">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpreference/sort/id_dashboard"><{_t('L_DASHBOARD')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_WALLPAPER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_WALLPAPER']) && ((isset($aclviewablecolumns['ID_WALLPAPER']) && $aclviewablecolumns['ID_WALLPAPER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WALLPAPER']) || $aclviewablecolumns['ID_WALLPAPER']))) }>
    	            <th class="column-id-wallpaper">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpreference/sort/id_wallpaper"><{_t('L_WALLPAPER')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ADMIN_STYLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_STYLE']) && ((isset($aclviewablecolumns['ID_ADMIN_STYLE']) && $aclviewablecolumns['ID_ADMIN_STYLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_STYLE']) || $aclviewablecolumns['ID_ADMIN_STYLE']))) }>
    	            <th class="column-id-admin-style">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpreference/sort/id_admin_style"><{_t('L_ADMIN_STYLE')}></a>
            	        
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
		<{plugin key="userpreference_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('L_USER_PREFERENCE')|strtolower}>s on this page are selected. <a onclick="userpreference_selectall()">Select all <{$total}> <{_t('L_USER_PREFERENCE')|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('L_USER_PREFERENCE')|strtolower}>s in the list are selected. <a onclick="userpreference_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.userpreference.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="userpreference-rowedit-add"><{_t('L_ADD_ITEM')}></span>
                	    <span class="userpreference-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save userpreference-rowedit-save btn btn-success"><{_t('L_SAVE')}></div>
                    	    <a class="rowedit-cancel userpreference-rowedit-cancel button-cancel"><{_t('L_CANCEL')}></a>
                        </span>
                        <span class="userpreference-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="userpreference_list_after" args=""}>

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
            $('#userpreferencelist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userpreference-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#userpreferencelist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userpreference-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.userpreference-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.userpreference-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.userpreference-rowedit-add').click(function() {
                if ($('#userpreferencelist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#userpreferencelist > tbody').append(html);

                    $('.userpreference-rowedit-add').hide();
                    $('.userpreference-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.userpreference-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#userpreferencelist #item_');

                tr.remove();

                $('.userpreference-rowedit-message').html('').hide();

                $('.userpreference-rowedit-add').show();
                $('.userpreference-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.userpreference-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#userpreferencelist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userpreference-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#userpreferencelist #item_').length == 0) {
                        $('.userpreference-rowedit-add').show();
                        $('.userpreference-rowedit-buttons').hide();

                        $('.userpreference-list-count, .userpreference-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.userpreference-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#userpreferencelist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.userpreference-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.userpreference-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#userpreferencelist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#userpreferencelist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#userpreferenceform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#userpreferencelist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/userpreference/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.userpreferencelistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.userpreferencelistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.userpreferencelistchk').click(function(){
    		$('#userpreferencelist .top-holder').hide();

    	    document.userpreferencelist.userpreferencelist_selection_selectall.value = 0;
        });
    });
</script>
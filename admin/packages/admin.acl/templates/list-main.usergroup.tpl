<{plugin key="generic_list_before" args=""}>
<{plugin key="usergroup_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="usergrouplist" data-module="usergroup">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-usergroup-all" onclick="usergroup_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usergroup/sort/name"><{label key="L_USER_GROUP_NAME"}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('DEFAULT_ID_DASHBOARD', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['DEFAULT_ID_DASHBOARD']) && ((isset($aclviewablecolumns['DEFAULT_ID_DASHBOARD']) && $aclviewablecolumns['DEFAULT_ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DEFAULT_ID_DASHBOARD']) || $aclviewablecolumns['DEFAULT_ID_DASHBOARD']))) }>
    	            <th class="column-default-id-dashboard">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usergroup/sort/default_id_dashboard"><{label key="L_DEFAULT_DASHBOARD"}></a>
            	        
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
		<{plugin key="usergroup_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{$smarty.const.L_USER_GROUP|strtolower}>s on this page are selected. <a onclick="usergroup_selectall()">Select all <{$total}> <{$smarty.const.L_USER_GROUP|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{$smarty.const.L_USER_GROUP|strtolower}>s in the list are selected. <a onclick="usergroup_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.usergroup.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="usergroup-rowedit-add"><{label key="L_ADD_ITEM"}></span>
                	    <span class="usergroup-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save usergroup-rowedit-save btn btn-success"><{label key="L_SAVE"}></div>
                    	    <a class="rowedit-cancel usergroup-rowedit-cancel button-cancel"><{label key="L_CANCEL"}></a>
                        </span>
                        <span class="usergroup-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="usergroup_list_after" args=""}>

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
            $('#usergrouplist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/usergroup/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.usergroup-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#usergrouplist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/usergroup/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.usergroup-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.usergroup-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/usergroup/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.usergroup-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.usergroup-rowedit-add').click(function() {
                if ($('#usergrouplist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/usergroup/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#usergrouplist > tbody').append(html);

                    $('.usergroup-rowedit-add').hide();
                    $('.usergroup-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.usergroup-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#usergrouplist #item_');

                tr.remove();

                $('.usergroup-rowedit-message').html('').hide();

                $('.usergroup-rowedit-add').show();
                $('.usergroup-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.usergroup-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#usergrouplist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/usergroup/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.usergroup-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#usergrouplist #item_').length == 0) {
                        $('.usergroup-rowedit-add').show();
                        $('.usergroup-rowedit-buttons').hide();

                        $('.usergroup-list-count, .usergroup-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.usergroup-rowedit-add').click();
                    }
                });
            });
        <{/if}>

            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.usergrouplistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.usergrouplistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.usergrouplistchk').click(function(){
    		$('#usergrouplist .top-holder').hide();

    	    document.usergrouplist.usergrouplist_selection_selectall.value = 0;
        });
    });
</script>
<{plugin key="generic_list_before" args=""}>
<{plugin key="userlog_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="userloglist" data-module="userlog">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-userlog-all" onclick="userlog_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_USER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
    	            <th class="column-id-user">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userlog/sort/id_user"><{_t('L_USER')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('DATE_TIME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['DATE_TIME']) && ((isset($aclviewablecolumns['DATE_TIME']) && $aclviewablecolumns['DATE_TIME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_TIME']) || $aclviewablecolumns['DATE_TIME']))) }>
    	            <th class="column-date-time">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userlog/sort/date_time"><{_t('L_DATE_TIME')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IP', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IP']) && ((isset($aclviewablecolumns['IP']) && $aclviewablecolumns['IP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IP']) || $aclviewablecolumns['IP']))) }>
    	            <th class="column-ip">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userlog/sort/ip"><{_t('L_IP')}></a>
            	        
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
		<{plugin key="userlog_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('L_USER_LOG')|strtolower}>s on this page are selected. <a onclick="userlog_selectall()">Select all <{$total}> <{_t('L_USER_LOG')|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('L_USER_LOG')|strtolower}>s in the list are selected. <a onclick="userlog_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.userlog.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="userlog-rowedit-add"><{_t('L_ADD_ITEM')}></span>
                	    <span class="userlog-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save userlog-rowedit-save btn btn-success"><{_t('L_SAVE')}></div>
                    	    <a class="rowedit-cancel userlog-rowedit-cancel button-cancel"><{_t('L_CANCEL')}></a>
                        </span>
                        <span class="userlog-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="userlog_list_after" args=""}>

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
            $('#userloglist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userlog/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userlog-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#userloglist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userlog/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userlog-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.userlog-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/userlog/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.userlog-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.userlog-rowedit-add').click(function() {
                if ($('#userloglist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userlog/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#userloglist > tbody').append(html);

                    $('.userlog-rowedit-add').hide();
                    $('.userlog-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.userlog-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#userloglist #item_');

                tr.remove();

                $('.userlog-rowedit-message').html('').hide();

                $('.userlog-rowedit-add').show();
                $('.userlog-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.userlog-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#userloglist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userlog/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userlog-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#userloglist #item_').length == 0) {
                        $('.userlog-rowedit-add').show();
                        $('.userlog-rowedit-buttons').hide();

                        $('.userlog-list-count, .userlog-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.userlog-rowedit-add').click();
                    }
                });
            });
        <{/if}>

            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.userloglistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.userloglistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.userloglistchk').click(function(){
    		$('#userloglist .top-holder').hide();

    	    document.userloglist.userloglist_selection_selectall.value = 0;
        });
    });
</script>
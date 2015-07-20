<{plugin key="generic_list_before" args=""}>
<{plugin key="adminlanguageitem_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminlanguageitemlist" data-module="adminlanguageitem">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminlanguageitem-all" onclick="adminlanguageitem_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_ADMIN_LANGUAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_LANGUAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_LANGUAGE']) && $aclviewablecolumns['ID_ADMIN_LANGUAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LANGUAGE']) || $aclviewablecolumns['ID_ADMIN_LANGUAGE']))) }>
    	            <th class="column-id-admin-language">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/sort/id_admin_language"><{_t('Admin language')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ADMIN_LABEL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_LABEL']) && ((isset($aclviewablecolumns['ID_ADMIN_LABEL']) && $aclviewablecolumns['ID_ADMIN_LABEL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LABEL']) || $aclviewablecolumns['ID_ADMIN_LABEL']))) }>
    	            <th class="column-id-admin-label">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/sort/id_admin_label"><{_t('Admin label')}></a>
            	        
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
		<{plugin key="adminlanguageitem_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('Admin Language Items')|strtolower}> on this page are selected. <a onclick="adminlanguageitem_selectall()">Select all <{$total}> <{_t('Admin Language Items')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Admin Language Items')|strtolower}> in the list are selected. <a onclick="adminlanguageitem_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminlanguageitem.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminlanguageitem-rowedit-add"><{_t('Add item')}></span>
                	    <span class="adminlanguageitem-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminlanguageitem-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel adminlanguageitem-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="adminlanguageitem-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminlanguageitem_list_after" args=""}>

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
            $('#adminlanguageitemlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlanguageitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminlanguageitemlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlanguageitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminlanguageitem-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminlanguageitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminlanguageitem-rowedit-add').click(function() {
                if ($('#adminlanguageitemlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminlanguageitemlist > tbody').append(html);

                    $('.adminlanguageitem-rowedit-add').hide();
                    $('.adminlanguageitem-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminlanguageitem-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminlanguageitemlist #item_');

                tr.remove();

                $('.adminlanguageitem-rowedit-message').html('').hide();

                $('.adminlanguageitem-rowedit-add').show();
                $('.adminlanguageitem-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminlanguageitem-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminlanguageitemlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminlanguageitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminlanguageitemlist #item_').length == 0) {
                        $('.adminlanguageitem-rowedit-add').show();
                        $('.adminlanguageitem-rowedit-buttons').hide();

                        $('.adminlanguageitem-list-count, .adminlanguageitem-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminlanguageitem-rowedit-add').click();
                    }
                });
            });
        <{/if}>

            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.adminlanguageitemlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminlanguageitemlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminlanguageitemlistchk').click(function(){
    		$('#adminlanguageitemlist .top-holder').hide();

    	    document.adminlanguageitemlist.adminlanguageitemlist_selection_selectall.value = 0;
        });
    });
</script>
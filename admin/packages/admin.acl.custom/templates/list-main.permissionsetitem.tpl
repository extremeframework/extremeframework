<{plugin key="generic_list_before" args=""}>
<{plugin key="permissionsetitem_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="permissionsetitemlist" data-module="permissionsetitem">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-permissionsetitem-all" onclick="permissionsetitem_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_PERMISSION_SET', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_PERMISSION_SET']) && ((isset($aclviewablecolumns['ID_PERMISSION_SET']) && $aclviewablecolumns['ID_PERMISSION_SET']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PERMISSION_SET']) || $aclviewablecolumns['ID_PERMISSION_SET']))) }>
    	            <th class="column-id-permission-set">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/sort/id_permission_set"><{_t('Permission set')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('MODULE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
    	            <th class="column-module">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/sort/module"><{_t('Module')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ACTIONS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ACTIONS']) && ((isset($aclviewablecolumns['ACTIONS']) && $aclviewablecolumns['ACTIONS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTIONS']) || $aclviewablecolumns['ACTIONS']))) }>
    	            <th class="column-actions">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/sort/actions"><{_t('Actions')}></a>
            	        
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
		<{plugin key="permissionsetitem_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('Permission Set Items')|strtolower}> on this page are selected. <a onclick="permissionsetitem_selectall()">Select all <{$total}> <{_t('Permission Set Items')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Permission Set Items')|strtolower}> in the list are selected. <a onclick="permissionsetitem_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.permissionsetitem.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="permissionsetitem-rowedit-add"><{_t('Add item')}></span>
                	    <span class="permissionsetitem-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save permissionsetitem-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel permissionsetitem-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="permissionsetitem-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="permissionsetitem_list_after" args=""}>

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
            $('#permissionsetitemlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/permissionsetitem/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.permissionsetitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#permissionsetitemlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/permissionsetitem/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.permissionsetitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.permissionsetitem-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/permissionsetitem/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.permissionsetitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.permissionsetitem-rowedit-add').click(function() {
                if ($('#permissionsetitemlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/permissionsetitem/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#permissionsetitemlist > tbody').append(html);

                    $('.permissionsetitem-rowedit-add').hide();
                    $('.permissionsetitem-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.permissionsetitem-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#permissionsetitemlist #item_');

                tr.remove();

                $('.permissionsetitem-rowedit-message').html('').hide();

                $('.permissionsetitem-rowedit-add').show();
                $('.permissionsetitem-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.permissionsetitem-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#permissionsetitemlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/permissionsetitem/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.permissionsetitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#permissionsetitemlist #item_').length == 0) {
                        $('.permissionsetitem-rowedit-add').show();
                        $('.permissionsetitem-rowedit-buttons').hide();

                        $('.permissionsetitem-list-count, .permissionsetitem-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.permissionsetitem-rowedit-add').click();
                    }
                });
            });
        <{/if}>

            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.permissionsetitemlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.permissionsetitemlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.permissionsetitemlistchk').click(function(){
    		$('#permissionsetitemlist .top-holder').hide();

    	    document.permissionsetitemlist.permissionsetitemlist_selection_selectall.value = 0;
        });
    });
</script>
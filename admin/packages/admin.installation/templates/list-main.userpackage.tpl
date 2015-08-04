<{plugin key="generic_list_before" args=""}>
<{plugin key="userpackage_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="userpackagelist" data-module="userpackage">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-userpackage-all" onclick="userpackage_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_USER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
    	            <th class="column-id-user">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpackage/sort/id_user"><{_t('User')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ADMIN_PACKAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) && $aclviewablecolumns['ID_ADMIN_PACKAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) || $aclviewablecolumns['ID_ADMIN_PACKAGE']))) }>
    	            <th class="column-id-admin-package">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpackage/sort/id_admin_package"><{_t('Admin package')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('INSTALLATION_DATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['INSTALLATION_DATE']) && ((isset($aclviewablecolumns['INSTALLATION_DATE']) && $aclviewablecolumns['INSTALLATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INSTALLATION_DATE']) || $aclviewablecolumns['INSTALLATION_DATE']))) }>
    	            <th class="column-installation-date">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpackage/sort/installation_date"><{_t('Installation date')}></a>
            	        
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
		<{plugin key="userpackage_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('User Packages')|strtolower}> on this page are selected. <a onclick="userpackage_selectall()">Select all <{$total}> <{_t('User Packages')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('User Packages')|strtolower}> in the list are selected. <a onclick="userpackage_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.userpackage.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="userpackage-rowedit-add"><{_t('Add item')}></span>
                	    <span class="userpackage-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save userpackage-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel userpackage-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="userpackage-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="userpackage_list_after" args=""}>

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
            $('#userpackagelist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpackage/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userpackage-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#userpackagelist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpackage/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userpackage-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.userpackage-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/userpackage/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.userpackage-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.userpackage-rowedit-add').click(function() {
                if ($('#userpackagelist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpackage/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#userpackagelist > tbody').append(html);

                    $('.userpackage-rowedit-add').hide();
                    $('.userpackage-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.userpackage-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#userpackagelist #item_');

                tr.remove();

                $('.userpackage-rowedit-message').html('').hide();

                $('.userpackage-rowedit-add').show();
                $('.userpackage-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.userpackage-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#userpackagelist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpackage/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.userpackage-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#userpackagelist #item_').length == 0) {
                        $('.userpackage-rowedit-add').show();
                        $('.userpackage-rowedit-buttons').hide();

                        $('.userpackage-list-count, .userpackage-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.userpackage-rowedit-add').click();
                    }
                });
            });
        <{/if}>

            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.userpackagelistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.userpackagelistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.userpackagelistchk').click(function(){
    		$('#userpackagelist .top-holder').hide();

    	    document.userpackagelist.userpackagelist_selection_selectall.value = 0;
        });
    });
</script>
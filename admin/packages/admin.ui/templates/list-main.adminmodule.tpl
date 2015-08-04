<{plugin key="generic_list_before" args=""}>
<{plugin key="adminmodule_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminmodulelist" data-module="adminmodule">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminmodule-all" onclick="adminmodule_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/sort/name"><{_t('Admin module name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('MODULE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
    	            <th class="column-module">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/sort/module"><{_t('Module')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ADMIN_PACKAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) && $aclviewablecolumns['ID_ADMIN_PACKAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) || $aclviewablecolumns['ID_ADMIN_PACKAGE']))) }>
    	            <th class="column-id-admin-package">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/sort/id_admin_package"><{_t('Admin package')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PREFIX', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PREFIX']) && ((isset($aclviewablecolumns['PREFIX']) && $aclviewablecolumns['PREFIX']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PREFIX']) || $aclviewablecolumns['PREFIX']))) }>
    	            <th class="column-prefix">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/sort/prefix"><{_t('Prefix')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('AVAILABLE_ACTIONS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['AVAILABLE_ACTIONS']) && ((isset($aclviewablecolumns['AVAILABLE_ACTIONS']) && $aclviewablecolumns['AVAILABLE_ACTIONS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['AVAILABLE_ACTIONS']) || $aclviewablecolumns['AVAILABLE_ACTIONS']))) }>
    	            <th class="column-available-actions">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/sort/available_actions"><{_t('Available actions')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_COMMENT_ENABLED', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_COMMENT_ENABLED']) && ((isset($aclviewablecolumns['IS_COMMENT_ENABLED']) && $aclviewablecolumns['IS_COMMENT_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_COMMENT_ENABLED']) || $aclviewablecolumns['IS_COMMENT_ENABLED']))) }>
    	            <th class="column-is-comment-enabled">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/sort/is_comment_enabled"><{_t('Comment enabled?')}></a>
            	        
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
		<{plugin key="adminmodule_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('Admin Modules')|strtolower}> on this page are selected. <a onclick="adminmodule_selectall()">Select all <{$total}> <{_t('Admin Modules')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Admin Modules')|strtolower}> in the list are selected. <a onclick="adminmodule_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminmodule.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminmodule-rowedit-add"><{_t('Add item')}></span>
                	    <span class="adminmodule-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminmodule-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel adminmodule-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="adminmodule-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminmodule_list_after" args=""}>

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
            $('#adminmodulelist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminmodule-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminmodulelist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminmodule-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminmodule-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminmodule-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminmodule-rowedit-add').click(function() {
                if ($('#adminmodulelist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminmodulelist > tbody').append(html);

                    $('.adminmodule-rowedit-add').hide();
                    $('.adminmodule-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminmodule-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminmodulelist #item_');

                tr.remove();

                $('.adminmodule-rowedit-message').html('').hide();

                $('.adminmodule-rowedit-add').show();
                $('.adminmodule-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminmodule-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminmodulelist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminmodule-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminmodulelist #item_').length == 0) {
                        $('.adminmodule-rowedit-add').show();
                        $('.adminmodule-rowedit-buttons').hide();

                        $('.adminmodule-list-count, .adminmodule-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminmodule-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#adminmodulelist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.adminmodule-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.adminmodule-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#adminmodulelist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#adminmodulelist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#adminmoduleform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#adminmodulelist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.adminmodulelistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminmodulelistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminmodulelistchk').click(function(){
    		$('#adminmodulelist .top-holder').hide();

    	    document.adminmodulelist.adminmodulelist_selection_selectall.value = 0;
        });
    });
</script>
<{plugin key="generic_list_before" args=""}>
<{plugin key="adminmenuitem_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminmenuitemlist" data-module="adminmenuitem">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminmenuitem-all" onclick="adminmenuitem_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/name"><{_t('Name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ADMIN_MENU', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_MENU']) && ((isset($aclviewablecolumns['ID_ADMIN_MENU']) && $aclviewablecolumns['ID_ADMIN_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_MENU']) || $aclviewablecolumns['ID_ADMIN_MENU']))) }>
    	            <th class="column-id-admin-menu">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/id_admin_menu"><{_t('Admin menu')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('MODULE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
    	            <th class="column-module">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/module"><{_t('Module')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PATH', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
    	            <th class="column-path">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/path"><{_t('Path')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('FONT_AWESOME_ICON', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
    	            <th class="column-font-awesome-icon">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/font_awesome_icon"><{_t('Font awesome icon')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ENABLE_LEFT', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ENABLE_LEFT']) && ((isset($aclviewablecolumns['ENABLE_LEFT']) && $aclviewablecolumns['ENABLE_LEFT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_LEFT']) || $aclviewablecolumns['ENABLE_LEFT']))) }>
    	            <th class="column-enable-left">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/enable_left"><{_t('Enable left?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ENABLE_TOP', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ENABLE_TOP']) && ((isset($aclviewablecolumns['ENABLE_TOP']) && $aclviewablecolumns['ENABLE_TOP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_TOP']) || $aclviewablecolumns['ENABLE_TOP']))) }>
    	            <th class="column-enable-top">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/enable_top"><{_t('Enable top?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ENABLE_QUICK', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ENABLE_QUICK']) && ((isset($aclviewablecolumns['ENABLE_QUICK']) && $aclviewablecolumns['ENABLE_QUICK']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_QUICK']) || $aclviewablecolumns['ENABLE_QUICK']))) }>
    	            <th class="column-enable-quick">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/enable_quick"><{_t('Enable quick?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ENABLE_ALL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ENABLE_ALL']) && ((isset($aclviewablecolumns['ENABLE_ALL']) && $aclviewablecolumns['ENABLE_ALL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_ALL']) || $aclviewablecolumns['ENABLE_ALL']))) }>
    	            <th class="column-enable-all">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/enable_all"><{_t('Enable all?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ENABLE_SETTINGS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ENABLE_SETTINGS']) && ((isset($aclviewablecolumns['ENABLE_SETTINGS']) && $aclviewablecolumns['ENABLE_SETTINGS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ENABLE_SETTINGS']) || $aclviewablecolumns['ENABLE_SETTINGS']))) }>
    	            <th class="column-enable-settings">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/enable_settings"><{_t('Enable settings?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('OPEN_IN_NEW_WINDOW', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['OPEN_IN_NEW_WINDOW']) && ((isset($aclviewablecolumns['OPEN_IN_NEW_WINDOW']) && $aclviewablecolumns['OPEN_IN_NEW_WINDOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OPEN_IN_NEW_WINDOW']) || $aclviewablecolumns['OPEN_IN_NEW_WINDOW']))) }>
    	            <th class="column-open-in-new-window">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/open_in_new_window"><{_t('Open in new window')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_STARRED', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_STARRED']) && ((isset($aclviewablecolumns['IS_STARRED']) && $aclviewablecolumns['IS_STARRED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_STARRED']) || $aclviewablecolumns['IS_STARRED']))) }>
    	            <th class="column-is-starred">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/is_starred"><{_t('Starred?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/sort/ordering"><{_t('Ordering')}></a>
            	        
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
		<{plugin key="adminmenuitem_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('Admin Menu Items')|strtolower}> on this page are selected. <a onclick="adminmenuitem_selectall()">Select all <{$total}> <{_t('Admin Menu Items')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Admin Menu Items')|strtolower}> in the list are selected. <a onclick="adminmenuitem_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminmenuitem.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminmenuitem-rowedit-add"><{_t('Add item')}></span>
                	    <span class="adminmenuitem-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminmenuitem-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel adminmenuitem-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="adminmenuitem-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminmenuitem_list_after" args=""}>

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
            $('#adminmenuitemlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminmenuitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminmenuitemlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminmenuitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminmenuitem-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminmenuitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminmenuitem-rowedit-add').click(function() {
                if ($('#adminmenuitemlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminmenuitemlist > tbody').append(html);

                    $('.adminmenuitem-rowedit-add').hide();
                    $('.adminmenuitem-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminmenuitem-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminmenuitemlist #item_');

                tr.remove();

                $('.adminmenuitem-rowedit-message').html('').hide();

                $('.adminmenuitem-rowedit-add').show();
                $('.adminmenuitem-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminmenuitem-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminmenuitemlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminmenuitem-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminmenuitemlist #item_').length == 0) {
                        $('.adminmenuitem-rowedit-add').show();
                        $('.adminmenuitem-rowedit-buttons').hide();

                        $('.adminmenuitem-list-count, .adminmenuitem-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminmenuitem-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#adminmenuitemlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.adminmenuitem-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.adminmenuitem-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#adminmenuitemlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#adminmenuitemlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#adminmenuitemform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#adminmenuitemlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
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
            $("#adminmenuitemlist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#adminmenuitemlist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#adminmenuitemlist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/updateorder",
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
        $('.adminmenuitemlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminmenuitemlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminmenuitemlistchk').click(function(){
    		$('#adminmenuitemlist .top-holder').hide();

    	    document.adminmenuitemlist.adminmenuitemlist_selection_selectall.value = 0;
        });
    });
</script>
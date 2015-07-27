<{plugin key="generic_list_before" args=""}>
<{plugin key="postsection_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="postsectionlist" data-module="postsection">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-postsection-all" onclick="postsection_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
    	            <th class="column-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/sort/title"><{_t('Post section title')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_POST', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
    	            <th class="column-id-post">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/sort/id_post"><{_t('Post')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IMAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
    	            <th class="column-image">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/sort/image"><{_t('Image')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('BACKGROUND_IMAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['BACKGROUND_IMAGE']) && ((isset($aclviewablecolumns['BACKGROUND_IMAGE']) && $aclviewablecolumns['BACKGROUND_IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_IMAGE']) || $aclviewablecolumns['BACKGROUND_IMAGE']))) }>
    	            <th class="column-background-image">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/sort/background_image"><{_t('Background image')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('BACKGROUND_COLOR', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['BACKGROUND_COLOR']) && ((isset($aclviewablecolumns['BACKGROUND_COLOR']) && $aclviewablecolumns['BACKGROUND_COLOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_COLOR']) || $aclviewablecolumns['BACKGROUND_COLOR']))) }>
    	            <th class="column-background-color">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/sort/background_color"><{_t('Background color')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VIDEO', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VIDEO']) && ((isset($aclviewablecolumns['VIDEO']) && $aclviewablecolumns['VIDEO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIDEO']) || $aclviewablecolumns['VIDEO']))) }>
    	            <th class="column-video">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/sort/video"><{_t('Video')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('LINK_PATH', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['LINK_PATH']) && ((isset($aclviewablecolumns['LINK_PATH']) && $aclviewablecolumns['LINK_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_PATH']) || $aclviewablecolumns['LINK_PATH']))) }>
    	            <th class="column-link-path">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/sort/link_path"><{_t('Link path')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/sort/ordering"><{_t('Ordering')}></a>
            	        
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
		<{plugin key="postsection_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('Post Sections')|strtolower}> on this page are selected. <a onclick="postsection_selectall()">Select all <{$total}> <{_t('Post Sections')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Post Sections')|strtolower}> in the list are selected. <a onclick="postsection_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.postsection.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="postsection-rowedit-add"><{_t('Add item')}></span>
                	    <span class="postsection-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save postsection-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel postsection-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="postsection-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="postsection_list_after" args=""}>

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
            $('#postsectionlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.postsection-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#postsectionlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.postsection-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.postsection-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.postsection-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.postsection-rowedit-add').click(function() {
                if ($('#postsectionlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#postsectionlist > tbody').append(html);

                    $('.postsection-rowedit-add').hide();
                    $('.postsection-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.postsection-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#postsectionlist #item_');

                tr.remove();

                $('.postsection-rowedit-message').html('').hide();

                $('.postsection-rowedit-add').show();
                $('.postsection-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.postsection-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#postsectionlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.postsection-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#postsectionlist #item_').length == 0) {
                        $('.postsection-rowedit-add').show();
                        $('.postsection-rowedit-buttons').hide();

                        $('.postsection-list-count, .postsection-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.postsection-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#postsectionlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.postsection-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.postsection-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#postsectionlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#postsectionlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#postsectionform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#postsectionlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/postsection/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
            $("#postsectionlist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#postsectionlist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#postsectionlist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/postsection/updateorder",
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
        $('.postsectionlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.postsectionlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.postsectionlistchk').click(function(){
    		$('#postsectionlist .top-holder').hide();

    	    document.postsectionlist.postsectionlist_selection_selectall.value = 0;
        });
    });
</script>
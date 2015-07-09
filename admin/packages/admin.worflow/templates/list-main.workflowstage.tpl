<{plugin key="generic_list_before" args=""}>
<{plugin key="workflowstage_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="workflowstagelist" data-module="workflowstage">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-workflowstage-all" onclick="workflowstage_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_WORKFLOW', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
    	            <th class="column-id-workflow">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/sort/id_workflow"><{_t('L_WORKFLOW')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/sort/name"><{_t('L_WORKFLOW_STAGE_NAME')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CODE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
    	            <th class="column-code">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/sort/code"><{_t('L_CODE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_DEFAULT', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_DEFAULT']) && ((isset($aclviewablecolumns['IS_DEFAULT']) && $aclviewablecolumns['IS_DEFAULT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_DEFAULT']) || $aclviewablecolumns['IS_DEFAULT']))) }>
    	            <th class="column-is-default">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/sort/is_default"><{_t('L_IS_DEFAULT')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_BINDING_OBJECT_EDITABLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_BINDING_OBJECT_EDITABLE']) && ((isset($aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) && $aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']) || $aclviewablecolumns['IS_BINDING_OBJECT_EDITABLE']))) }>
    	            <th class="column-is-binding-object-editable">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/sort/is_binding_object_editable"><{_t('L_IS_BINDING_OBJECT_EDITABLE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_BINDING_OBJECT_DELETABLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_BINDING_OBJECT_DELETABLE']) && ((isset($aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) && $aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']) || $aclviewablecolumns['IS_BINDING_OBJECT_DELETABLE']))) }>
    	            <th class="column-is-binding-object-deletable">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/sort/is_binding_object_deletable"><{_t('L_IS_BINDING_OBJECT_DELETABLE')}></a>
            	        
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
		<{plugin key="workflowstage_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('L_WORKFLOW_STAGE')|strtolower}>s on this page are selected. <a onclick="workflowstage_selectall()">Select all <{$total}> <{_t('L_WORKFLOW_STAGE')|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('L_WORKFLOW_STAGE')|strtolower}>s in the list are selected. <a onclick="workflowstage_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.workflowstage.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="workflowstage-rowedit-add"><{_t('L_ADD_ITEM')}></span>
                	    <span class="workflowstage-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save workflowstage-rowedit-save btn btn-success"><{_t('L_SAVE')}></div>
                    	    <a class="rowedit-cancel workflowstage-rowedit-cancel button-cancel"><{_t('L_CANCEL')}></a>
                        </span>
                        <span class="workflowstage-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="workflowstage_list_after" args=""}>

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
            $('#workflowstagelist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowstage-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#workflowstagelist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowstage-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.workflowstage-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.workflowstage-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.workflowstage-rowedit-add').click(function() {
                if ($('#workflowstagelist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#workflowstagelist > tbody').append(html);

                    $('.workflowstage-rowedit-add').hide();
                    $('.workflowstage-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.workflowstage-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#workflowstagelist #item_');

                tr.remove();

                $('.workflowstage-rowedit-message').html('').hide();

                $('.workflowstage-rowedit-add').show();
                $('.workflowstage-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.workflowstage-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#workflowstagelist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowstage-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#workflowstagelist #item_').length == 0) {
                        $('.workflowstage-rowedit-add').show();
                        $('.workflowstage-rowedit-buttons').hide();

                        $('.workflowstage-list-count, .workflowstage-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.workflowstage-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#workflowstagelist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.workflowstage-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.workflowstage-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#workflowstagelist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#workflowstagelist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#workflowstageform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#workflowstagelist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.workflowstagelistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.workflowstagelistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.workflowstagelistchk').click(function(){
    		$('#workflowstagelist .top-holder').hide();

    	    document.workflowstagelist.workflowstagelist_selection_selectall.value = 0;
        });
    });
</script>
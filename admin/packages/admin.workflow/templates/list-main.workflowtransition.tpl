<{plugin key="generic_list_before" args=""}>
<{plugin key="workflowtransition_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="workflowtransitionlist" data-module="workflowtransition">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-workflowtransition-all" onclick="workflowtransition_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_WORKFLOW', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
    	            <th class="column-id-workflow">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/id_workflow"><{_t('L_WORKFLOW')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/name"><{_t('L_WORKFLOW_TRANSITION_NAME')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CODE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
    	            <th class="column-code">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/code"><{_t('L_CODE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('START_ID_WORKFLOW_STAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['START_ID_WORKFLOW_STAGE']) && ((isset($aclviewablecolumns['START_ID_WORKFLOW_STAGE']) && $aclviewablecolumns['START_ID_WORKFLOW_STAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['START_ID_WORKFLOW_STAGE']) || $aclviewablecolumns['START_ID_WORKFLOW_STAGE']))) }>
    	            <th class="column-start-id-workflow-stage">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/start_id_workflow_stage"><{_t('L_START_WORKFLOW_STAGE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('END_ID_WORKFLOW_STAGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['END_ID_WORKFLOW_STAGE']) && ((isset($aclviewablecolumns['END_ID_WORKFLOW_STAGE']) && $aclviewablecolumns['END_ID_WORKFLOW_STAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['END_ID_WORKFLOW_STAGE']) || $aclviewablecolumns['END_ID_WORKFLOW_STAGE']))) }>
    	            <th class="column-end-id-workflow-stage">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/end_id_workflow_stage"><{_t('L_END_WORKFLOW_STAGE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ACTION', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ACTION']) && ((isset($aclviewablecolumns['ACTION']) && $aclviewablecolumns['ACTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTION']) || $aclviewablecolumns['ACTION']))) }>
    	            <th class="column-action">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/action"><{_t('L_ACTION')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER_GROUP', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
    	            <th class="column-id-user-group">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/id_user_group"><{_t('L_USER_GROUP')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_USER_ROLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
    	            <th class="column-id-user-role">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/id_user_role"><{_t('L_USER_ROLE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('TRANSITION_ID_SCREEN', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TRANSITION_ID_SCREEN']) && ((isset($aclviewablecolumns['TRANSITION_ID_SCREEN']) && $aclviewablecolumns['TRANSITION_ID_SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TRANSITION_ID_SCREEN']) || $aclviewablecolumns['TRANSITION_ID_SCREEN']))) }>
    	            <th class="column-transition-id-screen">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/sort/transition_id_screen"><{_t('L_TRANSITION_SCREEN')}></a>
            	        
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
		<{plugin key="workflowtransition_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('L_WORKFLOW_TRANSITION')|strtolower}>s on this page are selected. <a onclick="workflowtransition_selectall()">Select all <{$total}> <{_t('L_WORKFLOW_TRANSITION')|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('L_WORKFLOW_TRANSITION')|strtolower}>s in the list are selected. <a onclick="workflowtransition_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.workflowtransition.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="workflowtransition-rowedit-add"><{_t('L_ADD_ITEM')}></span>
                	    <span class="workflowtransition-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save workflowtransition-rowedit-save btn btn-success"><{_t('L_SAVE')}></div>
                    	    <a class="rowedit-cancel workflowtransition-rowedit-cancel button-cancel"><{_t('L_CANCEL')}></a>
                        </span>
                        <span class="workflowtransition-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="workflowtransition_list_after" args=""}>

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
            $('#workflowtransitionlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowtransition-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#workflowtransitionlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowtransition-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.workflowtransition-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.workflowtransition-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.workflowtransition-rowedit-add').click(function() {
                if ($('#workflowtransitionlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#workflowtransitionlist > tbody').append(html);

                    $('.workflowtransition-rowedit-add').hide();
                    $('.workflowtransition-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.workflowtransition-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#workflowtransitionlist #item_');

                tr.remove();

                $('.workflowtransition-rowedit-message').html('').hide();

                $('.workflowtransition-rowedit-add').show();
                $('.workflowtransition-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.workflowtransition-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#workflowtransitionlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.workflowtransition-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#workflowtransitionlist #item_').length == 0) {
                        $('.workflowtransition-rowedit-add').show();
                        $('.workflowtransition-rowedit-buttons').hide();

                        $('.workflowtransition-list-count, .workflowtransition-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.workflowtransition-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#workflowtransitionlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.workflowtransition-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.workflowtransition-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#workflowtransitionlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#workflowtransitionlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#workflowtransitionform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#workflowtransitionlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
        $('.workflowtransitionlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.workflowtransitionlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.workflowtransitionlistchk').click(function(){
    		$('#workflowtransitionlist .top-holder').hide();

    	    document.workflowtransitionlist.workflowtransitionlist_selection_selectall.value = 0;
        });
    });
</script>
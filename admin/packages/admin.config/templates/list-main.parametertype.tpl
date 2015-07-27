<{plugin key="generic_list_before" args=""}>
<{plugin key="parametertype_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="parametertypelist" data-module="parametertype">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-parametertype-all" onclick="parametertype_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
    	            <th class="column-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametertype/sort/name"><{_t('Parameter type name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('BASE_TYPE_CODE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['BASE_TYPE_CODE']) && ((isset($aclviewablecolumns['BASE_TYPE_CODE']) && $aclviewablecolumns['BASE_TYPE_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BASE_TYPE_CODE']) || $aclviewablecolumns['BASE_TYPE_CODE']))) }>
    	            <th class="column-base-type-code">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametertype/sort/base_type_code"><{_t('Base type code')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('EXTRA', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['EXTRA']) && ((isset($aclviewablecolumns['EXTRA']) && $aclviewablecolumns['EXTRA']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EXTRA']) || $aclviewablecolumns['EXTRA']))) }>
    	            <th class="column-extra">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametertype/sort/extra"><{_t('Extra')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametertype/sort/ordering"><{_t('Ordering')}></a>
            	        
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
		<{plugin key="parametertype_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('Parameter Types')|strtolower}> on this page are selected. <a onclick="parametertype_selectall()">Select all <{$total}> <{_t('Parameter Types')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Parameter Types')|strtolower}> in the list are selected. <a onclick="parametertype_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.parametertype.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="parametertype-rowedit-add"><{_t('Add item')}></span>
                	    <span class="parametertype-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save parametertype-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel parametertype-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="parametertype-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="parametertype_list_after" args=""}>

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
            $('#parametertypelist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.parametertype-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#parametertypelist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.parametertype-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.parametertype-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.parametertype-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.parametertype-rowedit-add').click(function() {
                if ($('#parametertypelist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#parametertypelist > tbody').append(html);

                    $('.parametertype-rowedit-add').hide();
                    $('.parametertype-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.parametertype-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#parametertypelist #item_');

                tr.remove();

                $('.parametertype-rowedit-message').html('').hide();

                $('.parametertype-rowedit-add').show();
                $('.parametertype-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.parametertype-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#parametertypelist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.parametertype-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#parametertypelist #item_').length == 0) {
                        $('.parametertype-rowedit-add').show();
                        $('.parametertype-rowedit-buttons').hide();

                        $('.parametertype-list-count, .parametertype-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.parametertype-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#parametertypelist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.parametertype-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.parametertype-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#parametertypelist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#parametertypelist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#parametertypeform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#parametertypelist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/parametertype/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
            $("#parametertypelist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#parametertypelist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#parametertypelist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/parametertype/updateorder",
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
        $('.parametertypelistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.parametertypelistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.parametertypelistchk').click(function(){
    		$('#parametertypelist .top-holder').hide();

    	    document.parametertypelist.parametertypelist_selection_selectall.value = 0;
        });
    });
</script>
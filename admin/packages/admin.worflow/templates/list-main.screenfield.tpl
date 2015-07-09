<{plugin key="generic_list_before" args=""}>
<{plugin key="screenfield_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="screenfieldlist" data-module="screenfield">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-screenfield-all" onclick="screenfield_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_SCREEN', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_SCREEN']) && ((isset($aclviewablecolumns['ID_SCREEN']) && $aclviewablecolumns['ID_SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_SCREEN']) || $aclviewablecolumns['ID_SCREEN']))) }>
    	            <th class="column-id-screen">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/id_screen"><{_t('L_SCREEN')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('TITLE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
    	            <th class="column-title">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/title"><{_t('L_TITLE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CODE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
    	            <th class="column-code">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/code"><{_t('L_CODE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_VALUE_TYPE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_VALUE_TYPE']) && ((isset($aclviewablecolumns['ID_VALUE_TYPE']) && $aclviewablecolumns['ID_VALUE_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_VALUE_TYPE']) || $aclviewablecolumns['ID_VALUE_TYPE']))) }>
    	            <th class="column-id-value-type">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/id_value_type"><{_t('L_VALUE_TYPE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('DATASOURCE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['DATASOURCE']) && ((isset($aclviewablecolumns['DATASOURCE']) && $aclviewablecolumns['DATASOURCE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATASOURCE']) || $aclviewablecolumns['DATASOURCE']))) }>
    	            <th class="column-datasource">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/datasource"><{_t('L_DATASOURCE')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CONDITION', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CONDITION']) && ((isset($aclviewablecolumns['CONDITION']) && $aclviewablecolumns['CONDITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION']) || $aclviewablecolumns['CONDITION']))) }>
    	            <th class="column-condition">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/condition"><{_t('L_CONDITION')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('VALUECOL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['VALUECOL']) && ((isset($aclviewablecolumns['VALUECOL']) && $aclviewablecolumns['VALUECOL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALUECOL']) || $aclviewablecolumns['VALUECOL']))) }>
    	            <th class="column-valuecol">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/valuecol"><{_t('L_VALUECOL')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('TEXTCOL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TEXTCOL']) && ((isset($aclviewablecolumns['TEXTCOL']) && $aclviewablecolumns['TEXTCOL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TEXTCOL']) || $aclviewablecolumns['TEXTCOL']))) }>
    	            <th class="column-textcol">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/textcol"><{_t('L_TEXTCOL')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_MANDATORY', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_MANDATORY']) && ((isset($aclviewablecolumns['IS_MANDATORY']) && $aclviewablecolumns['IS_MANDATORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_MANDATORY']) || $aclviewablecolumns['IS_MANDATORY']))) }>
    	            <th class="column-is-mandatory">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/is_mandatory"><{_t('L_IS_MANDATORY')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ORDERING', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ORDERING']) && ((isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING']))) }>
    	            <th class="column-ordering">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screenfield/sort/ordering"><{_t('L_ORDERING')}></a>
            	        
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
		<{plugin key="screenfield_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('L_SCREEN_FIELD')|strtolower}>s on this page are selected. <a onclick="screenfield_selectall()">Select all <{$total}> <{_t('L_SCREEN_FIELD')|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('L_SCREEN_FIELD')|strtolower}>s in the list are selected. <a onclick="screenfield_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.screenfield.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="screenfield-rowedit-add"><{_t('L_ADD_ITEM')}></span>
                	    <span class="screenfield-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save screenfield-rowedit-save btn btn-success"><{_t('L_SAVE')}></div>
                    	    <a class="rowedit-cancel screenfield-rowedit-cancel button-cancel"><{_t('L_CANCEL')}></a>
                        </span>
                        <span class="screenfield-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="screenfield_list_after" args=""}>

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
            $('#screenfieldlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.screenfield-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#screenfieldlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.screenfield-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.screenfield-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.screenfield-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.screenfield-rowedit-add').click(function() {
                if ($('#screenfieldlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#screenfieldlist > tbody').append(html);

                    $('.screenfield-rowedit-add').hide();
                    $('.screenfield-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.screenfield-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#screenfieldlist #item_');

                tr.remove();

                $('.screenfield-rowedit-message').html('').hide();

                $('.screenfield-rowedit-add').show();
                $('.screenfield-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.screenfield-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#screenfieldlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.screenfield-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#screenfieldlist #item_').length == 0) {
                        $('.screenfield-rowedit-add').show();
                        $('.screenfield-rowedit-buttons').hide();

                        $('.screenfield-list-count, .screenfield-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.screenfield-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#screenfieldlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.screenfield-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.screenfield-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#screenfieldlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#screenfieldlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#screenfieldform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#screenfieldlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/screenfield/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
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
            $("#screenfieldlist > tbody").sortable({
                helper: fixHelper
            }).enableSelection();

            $("#screenfieldlist > tbody").sortable({
                update: function(event, ui) {
                    var order = $('#screenfieldlist > tbody').sortable('serialize', { expression: /(item)_(.+)/ });

                    $.ajax({
                        type: "post",
                        url: "<{$smarty.const.APPLICATION_URL}>/screenfield/updateorder",
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
        $('.screenfieldlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.screenfieldlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.screenfieldlistchk').click(function(){
    		$('#screenfieldlist .top-holder').hide();

    	    document.screenfieldlist.screenfieldlist_selection_selectall.value = 0;
        });
    });
</script>
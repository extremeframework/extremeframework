<{plugin key="generic_list_before" args=""}>
<{plugin key="postrelation_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="postrelationlist" data-module="postrelation">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-postrelation-all" onclick="postrelation_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('ID_POST', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
    	            <th class="column-id-post">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postrelation/sort/id_post"><{_t('L_POST')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PEER_ID_POST', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PEER_ID_POST']) && ((isset($aclviewablecolumns['PEER_ID_POST']) && $aclviewablecolumns['PEER_ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PEER_ID_POST']) || $aclviewablecolumns['PEER_ID_POST']))) }>
    	            <th class="column-peer-id-post">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postrelation/sort/peer_id_post"><{_t('L_PEER_POST')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_POST_RELATION_TYPE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_POST_RELATION_TYPE']) && ((isset($aclviewablecolumns['ID_POST_RELATION_TYPE']) && $aclviewablecolumns['ID_POST_RELATION_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_RELATION_TYPE']) || $aclviewablecolumns['ID_POST_RELATION_TYPE']))) }>
    	            <th class="column-id-post-relation-type">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postrelation/sort/id_post_relation_type"><{_t('L_POST_RELATION_TYPE')}></a>
            	        
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
		<{plugin key="postrelation_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{_t('L_POST_RELATION')|strtolower}>s on this page are selected. <a onclick="postrelation_selectall()">Select all <{$total}> <{_t('L_POST_RELATION')|strtolower}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('L_POST_RELATION')|strtolower}>s in the list are selected. <a onclick="postrelation_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.postrelation.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="postrelation-rowedit-add"><{_t('Add item')}></span>
                	    <span class="postrelation-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save postrelation-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel postrelation-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="postrelation-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="postrelation_list_after" args=""}>

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
            $('#postrelationlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/postrelation/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.postrelation-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#postrelationlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/postrelation/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.postrelation-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.postrelation-rowedit-save-existing').die('click').live('click', function(event) {
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
                    url: "<{$smarty.const.APPLICATION_URL}>/postrelation/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.postrelation-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.postrelation-rowedit-add').click(function() {
                if ($('#postrelationlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/postrelation/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#postrelationlist > tbody').append(html);

                    $('.postrelation-rowedit-add').hide();
                    $('.postrelation-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.postrelation-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#postrelationlist #item_');

                tr.remove();

                $('.postrelation-rowedit-message').html('').hide();

                $('.postrelation-rowedit-add').show();
                $('.postrelation-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.postrelation-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#postrelationlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/postrelation/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.postrelation-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#postrelationlist #item_').length == 0) {
                        $('.postrelation-rowedit-add').show();
                        $('.postrelation-rowedit-buttons').hide();

                        $('.postrelation-list-count, .postrelation-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.postrelation-rowedit-add').click();
                    }
                });
            });
        <{/if}>

            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.postrelationlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.postrelationlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.postrelationlistchk').click(function(){
    		$('#postrelationlist .top-holder').hide();

    	    document.postrelationlist.postrelationlist_selection_selectall.value = 0;
        });
    });
</script>
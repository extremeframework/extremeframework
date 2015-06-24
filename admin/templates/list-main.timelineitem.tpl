<div id="timeline-bar" style="background-color:white"></div>

<style>
.column-id-timeline-item-status span a {
    border-radius: 14px;
    display: inline-block;
    padding: 0px 11px;
    border: 1px solid #465a86;
}

tr.status-planned .column-id-timeline-item-status span a {
    background-color: green;
    color: #FFF !important;
}
</style>

<link rel="stylesheet" type="text/css" href="<{$smarty.const.APPLICATION_URL}>/lib/jqtimeline/css/jquery.jqtimeline.css" />
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/jqtimeline/js/jquery.jqtimeline.js"></script>

<script type="text/javascript">
	var ev =
	[
    	<{$xx = 0}>
    	<{foreach from=$rows key=key item=row}>
    	    <{if $row->ID_TIMELINE_ITEM_STATUS == 3}>
                <{if $xx > 0}>,<{/if}>
                <{$xx = $xx + 1}>

                <{$yy = date('Y', strtotime($row->DATE))}>
                <{$mm = date('m', strtotime($row->DATE)) - 1}>
                <{$dd = date('d', strtotime($row->DATE))}>

			    {id : <{$row->ID}>,name : "<{$row->NAME}>",on : new Date(<{$yy}>, <{$mm}>, <{$dd}>)}
            <{/if}>
		<{/foreach}>
	]

	var tl = $('#timeline-bar').jqtimeline({
		events : ev,
		numYears:1,
		startYear:<{$yy}>,
		gap:50,
		click:function(e,event){
            // TODO
		}
	});
</script>

<{plugin key="timelineitem_list_before" args=""}>

<table class="item_list" id="timelineitemlist">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" onclick="timelineitem_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                	        <{if (isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME'])) }>
	            <th class="column-name">
        	                	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/timelineitem/sort/name"><{label key="L_TIMELINE_ITEM_NAME"}></a>

            						</th>
        		<{assign var='colcount' value=$colcount+1}>
            <{/if}>
		            	        <{if (isset($aclviewablecolumns['ID_TIMELINE_ITEM_STATUS']) && $aclviewablecolumns['ID_TIMELINE_ITEM_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TIMELINE_ITEM_STATUS']) || $aclviewablecolumns['ID_TIMELINE_ITEM_STATUS'])) }>
	            <th class="column-id-timeline-item-status">
        	                	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/timelineitem/sort/id_timeline_item_status"><{label key="L_TIMELINE_ITEM_STATUS"}></a>

            						</th>
        		<{assign var='colcount' value=$colcount+1}>
            <{/if}>
		            	        <{if (isset($aclviewablecolumns['ORDERING']) && $aclviewablecolumns['ORDERING']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ORDERING']) || $aclviewablecolumns['ORDERING'])) }>
	            <th class="column-ordering">
        	                	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/timelineitem/sort/ordering"><{label key="L_ORDERING"}></a>

            						</th>
        		<{assign var='colcount' value=$colcount+1}>
            <{/if}>
		            	        <{if (isset($aclviewablecolumns['ID_TIMELINE']) && $aclviewablecolumns['ID_TIMELINE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_TIMELINE']) || $aclviewablecolumns['ID_TIMELINE'])) }>
	            <th class="column-id-timeline">
        	                	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/timelineitem/sort/id_timeline"><{label key="L_TIMELINE"}></a>

            						</th>
        		<{assign var='colcount' value=$colcount+1}>
            <{/if}>
		            	        <{if (isset($aclviewablecolumns['DATE']) && $aclviewablecolumns['DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE']) || $aclviewablecolumns['DATE'])) }>
	            <th class="column-date">
        	                	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/timelineitem/sort/date"><{label key="L_DATE"}></a>

            						</th>
        		<{assign var='colcount' value=$colcount+1}>
            <{/if}>
				<{plugin key="timelineitem_list_columns_headers" args=""}>
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
	    	<div class="selectall">All <{$rows|@count}> <{label key="L_TIMELINE_ITEM" format="lower"}>s on this page are selected. <a onclick="timelineitem_selectall()">Select all <{$total}> <{label key="L_TIMELINE_ITEM" format="lower"}>s in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{label key="L_TIMELINE_ITEM" format="lower"}>s in the list are selected. <a onclick="timelineitem_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.timelineitem.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	            	<tr>
        	    <td colspan="2"></td>
        		<td colspan="<{$colcount}>">
                    <span style="cursor:pointer;text-decoration:underline;color:blue" class="timelineitem-rowedit-add">Add item</span>
            	    <span class="timelineitem-rowedit-buttons" style="display:none">
                	    <button class="timelineitem-rowedit-save">Save</button>
                	    <button class="timelineitem-rowedit-cancel">Cancel</button>
                    </span>
                    <span class="timelineitem-rowedit-message rowedit-message" style="display:none"></span>
                </td>
        	</tr>


	</tfoot>
</table>

<{plugin key="timelineitem_list_after" args=""}>

<script type="text/javascript">
    $(document).ready(function(){
        // x. Double-click on a viewing-row to edit it
        $('#timelineitemlist tbody tr.rowview').die('dblclick').live('dblclick', function(){
            var tr = $(this);

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/timelineitem/rowEdit/" + tr.data('id'),
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                tr.after(html);
                tr.remove();
            });
        });

        // x. Double-click on a editing-row to cancel editing
        $('#timelineitemlist tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
            var tr = $(this);

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/timelineitem/rowView/" + tr.data('id'),
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                tr.after(html);
                tr.remove();
            });
        });

        // x. Button Save in an editing-row to save the editing item
        $('.timelineitem-rowedit-save-existing').die('click').live('click', function(event) {
            event.preventDefault();

            var tr = $(this).closest('tr');

            $.ajax({
                type: "post",
                url: "<{$smarty.const.APPLICATION_URL}>/timelineitem/rowSave",
                data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.timelineitem-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();
            });
        });

        // x. 'Add item' link to quick-add a new item
        $('.timelineitem-rowedit-add').click(function() {
            if ($('#timelineitemlist #item_').length > 0) {
                return;
            }

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/timelineitem/rowNew",
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('tbody').append(html);

                $('.timelineitem-rowedit-add').hide();
                $('.timelineitem-rowedit-buttons').show();
            });
        });

        // x. Button Cancel to cancel the quick-add item
        $('.timelineitem-rowedit-cancel').click(function(event) {
            event.preventDefault();

            var tr = $('#timelineitemlist #item_');

            tr.remove();

            $('.timelineitem-rowedit-message').html('').hide();

            $('.timelineitem-rowedit-add').show();
            $('.timelineitem-rowedit-buttons').hide();
        });

        // x. Button Save to save the quick-add item
        $('.timelineitem-rowedit-save').click(function(event) {
            event.preventDefault();

            var tr = $('#timelineitemlist #item_');

            $.ajax({
                type: "post",
                url: "<{$smarty.const.APPLICATION_URL}>/timelineitem/rowSave",
                data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.timelineitem-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();

                if ($('#timelineitemlist #item_').length == 0) {
                    $('.timelineitem-rowedit-add').show();
                    $('.timelineitem-rowedit-buttons').hide();

                    $('.timelineitem-list-count, .timelineitem-pagination-to').each(function(){
                        var counter = $(this);

                        counter.text(parseInt(counter.text()) + 1);
                    });
                }
            });
        });
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

        $("#timelineitemlist tbody").sortable({
            helper: fixHelper
        }).enableSelection();

        $("#timelineitemlist tbody").sortable({
            update: function(event, ui) {
                var order = $('#timelineitemlist tbody').sortable('serialize');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/timelineitem/updateorder",
                    data: order,
                    success: function(msg){
                        if (msg) {
                            alert(msg);
                        }
                    }
                });
            }
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.timelineitemlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.timelineitemlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.timelineitemlistchk').click(function(){
    		$('#timelineitemlist .top-holder').hide();

    	    document.timelineitemlist.timelineitemlist_selection_selectall.value = 0;
        });
    });
</script>
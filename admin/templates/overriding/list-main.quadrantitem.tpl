<{plugin key="quadrantitem_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<style>
.x {
    -webkit-transform: rotate(-90deg);
    -moz-transform: rotate(-90deg);
    -ms-transform: rotate(-90deg);
    -o-transform: rotate(-90deg);
    transform: rotate(-90deg);

    /* also accepts left, right, top, bottom coordinates; not required, but a good idea for styling */
    -webkit-transform-origin: 50% 50%;
    -moz-transform-origin: 50% 50%;
    -ms-transform-origin: 50% 50%;
    -o-transform-origin: 50% 50%;
    transform-origin: 80% 100%;
    width: 30px;

    font-weight: bold;
}
.y {
    vertical-align: top!important;
    border-left: 1px solid #DCDCDC;
    width: 49%;
}

tr, tr.rowedit, tr.rowedit:hover {
    background-color: #fff!important;
}
.y td {
    border-bottom: none!important;
    font-size: 13px!important;
}
.z {
    padding-left: 9px;
}
.c {
    background-color: rgb(0, 112, 255);
    padding: 5px;
    color: white!important;
}
</style>
<table class="item_list" id="quadrantitemlist">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" onclick="quadrantitem_checkall(this.checked)" /></th>
		<th>Urgent</th>
		<th>Not Urgent</th>
    </tr>
    </thead>
	<tbody>
	<tr>
		<td><div class="x">Important</div></td>
		<td class="y">
            <div class="z">You need to MANAGE these</div>
            <table>
                <tbody>
                    <{foreach from=$rows key=counter item=row}>
                        <{if $row->ID_QUADRANT_TYPE == 1}>
                            <{include file="row-view.quadrantitem.tpl"}>
                        <{/if}>
                    <{/foreach}>
                </tbody>
                <!--
	            <tfoot>
	            	<tr class="rowedit">
                	    <td></td>
                		<td colspan="2">
                            <span style="cursor:pointer;text-decoration:underline;color:blue" class="quadrantitem-rowedit-add">Add item</span>
                    	    <span class="quadrantitem-rowedit-buttons" style="display:none">
                        	    <div class="rowedit-save quadrantitem-rowedit-save btn btn-success">Save</div>
                        	    <a class="rowedit-cancel quadrantitem-rowedit-cancel button-cancel">Cancel</a>
                            </span>
                            <span class="quadrantitem-rowedit-message rowedit-message" style="display:none"></span>
                        </td>
                	</tr>
            	</tfoot>
            	-->
            </table>
		</td>
		<td class="y">
            <div class="z">You need to FOCUS on these</div>
            <table>
                <tbody>
                    <{foreach from=$rows key=counter item=row}>
                        <{if $row->ID_QUADRANT_TYPE == 2}>
                            <{include file="row-view.quadrantitem.tpl"}>
                        <{/if}>
                    <{/foreach}>
                </tbody>
            </table>
		</td>
    </tr>
	<tr>
		<td><div class="x">Not Important</div></td>
		<td class="y">
		    <div class="z">You need to AVOID these</div>
            <table>
                <tbody>
                    <{foreach from=$rows key=counter item=row}>
                        <{if $row->ID_QUADRANT_TYPE == 3}>
                            <{include file="row-view.quadrantitem.tpl"}>
                        <{/if}>
                    <{/foreach}>
                </tbody>
            </table>
		</td>
		<td class="y">
		    <div class="z">You need to AVOID these too</div>
            <table>
                <tbody>
                    <{foreach from=$rows key=counter item=row}>
                        <{if empty($row->ID_QUADRANT_TYPE) || $row->ID_QUADRANT_TYPE == 4}>
                            <{include file="row-view.quadrantitem.tpl"}>
                        <{/if}>
                    <{/foreach}>
                </tbody>
            </table>
		</td>
    </tr>
    </tbody>
</table>
</div>
</div>

<{plugin key="quadrantitem_list_after" args=""}>

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

        // x. Double-click on a viewing-row to edit it
        $('#quadrantitemlist tbody tr.rowview').die('dblclick').live('dblclick', function(){
            var tr = $(this);

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/quadrantitem/rowEdit/" + tr.data('id'),
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.quadrantitem-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();
            });
        });

        // x. Double-click on a editing-row to cancel editing
        $('#quadrantitemlist tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
            var tr = $(this);

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/quadrantitem/rowView/" + tr.data('id'),
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.quadrantitem-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();
            });
        });

        // x. Button Save in an editing-row to save the editing item
        $('.quadrantitem-rowedit-save-existing').die('click').live('click', function(event) {
            event.preventDefault();

            var tr = $(this).closest('tr');

            $.ajax({
                type: "post",
                url: "<{$smarty.const.APPLICATION_URL}>/quadrantitem/rowSave",
                data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.quadrantitem-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();
            });
        });

        // x. 'Add item' link to quick-add a new item
        $('.quadrantitem-rowedit-add').click(function() {
            if ($('#quadrantitemlist #item_').length > 0) {
                return;
            }

            var table = $(this).closest('table');
            var tbody = table.find('tbody');
            var tfoot = table.find('tfoot');

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/quadrantitem/rowNew",
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                tbody.append(html);

                tfoot.find('.quadrantitem-rowedit-add').hide();
                tfoot.find('.quadrantitem-rowedit-buttons').show();
            });
        });

        // x. Button Cancel to cancel the quick-add item
        $('.quadrantitem-rowedit-cancel').click(function(event) {
            event.preventDefault();

            var table = $(this).closest('table');
            var tbody = table.find('tbody');
            var tfoot = table.find('tfoot');

            var tr = $('#quadrantitemlist #item_');

            tr.remove();

            tfoot.find('.quadrantitem-rowedit-message').html('').hide();

            tfoot.find('.quadrantitem-rowedit-add').show();
            tfoot.find('.quadrantitem-rowedit-buttons').hide();
        });

        // x. Button Save to save the quick-add item
        $('.quadrantitem-rowedit-save').click(function(event) {
            event.preventDefault();

            var table = $(this).closest('table');
            var tbody = table.find('tbody');
            var tfoot = table.find('tfoot');

            var tr = $('#quadrantitemlist #item_');

            $.ajax({
                type: "post",
                url: "<{$smarty.const.APPLICATION_URL}>/quadrantitem/rowSave",
                data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                tfoot.find('.quadrantitem-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();

                if ($('#quadrantitemlist #item_').length == 0) {
                    tfoot.find('.quadrantitem-rowedit-add').show();
                    tfoot.find('.quadrantitem-rowedit-buttons').hide();

                    $('.quadrantitem-list-count, .quadrantitem-pagination-to').each(function(){
                        var counter = $(this);

                        counter.text(parseInt(counter.text()) + 1);
                    });

                    tfoot.find('.quadrantitem-rowedit-add').trigger('click');
                }
            });
        });
    });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.quadrantitemlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.quadrantitemlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.quadrantitemlistchk').click(function(){
    		$('#quadrantitemlist .top-holder').hide();

    	    document.quadrantitemlist.quadrantitemlist_selection_selectall.value = 0;
        });
    });
</script>
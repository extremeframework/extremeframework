<{plugin key="milestone_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<style>
tr.x, tr.x.rowedit, tr.x.rowedit:hover,
tr.z, tr.z.rowedit, tr.z.rowedit:hover {
    background-color: #fff!important;
}

.x {
    height: 210px;
}

.x td {
    -webkit-transform: rotate(-30deg);
    -moz-transform: rotate(-30deg);
    -ms-transform: rotate(-30deg);
    -o-transform: rotate(-30deg);
    transform: rotate(-30deg);

    /* also accepts left, right, top, bottom coordinates; not required, but a good idea for styling */
    -webkit-transform-origin: 50% 50%;
    -moz-transform-origin: 50% 50%;
    -ms-transform-origin: 50% 50%;
    -o-transform-origin: 50% 50%;
    transform-origin: 50% 50%;
    padding: 0px!important;
    margin: 0px!important;
    height: 30px;
    text-align: center;
    border: 1px solid #ddd;
}

.y td {
    text-align: center;
    line-height: 5px!important;
}

.y input[type='checkbox'] {
    float: none;
}

.z td {
    text-align: center;
    border: 1px solid #ddd;
}

.status-1 span,
.status-2 span,
.status-3 span {
    border-radius: 14px;
    display: inline-block;
    padding: 0px 11px;
    border: 1px solid #465a86;
}

.status-1 span {
    background-color: #f5f5f5;
}

.status-2 span {
    background-color: green;
    color: white;
}

.status-3 span {
    background-color: orange;
    color: white;
    border: 1px solid rgb(198, 198, 198);
}

</style>

<table class="item_list" id="milestonelist" style="height: 250px;">
	<tbody>
	    <tr class="x">
        	<{foreach from=$rows key=counter item=row}>
                <td><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/milestone/edit/<{$row->ID}>"><{$row->TITLE}></a></td>
        	<{/foreach}>
	    </tr>
	    <tr class="y" style="background-color:gray;height:5px">
        	<{foreach from=$rows key=counter item=row}>
                <td>
            		<input type="checkbox" class="milestonelistchk" name="milestonelist_selection[]" value="<{$row->ID}>" />
            		<input type="hidden" class="column-id" name="<{$prefix}>milestone_multiformdata_ID[<{$rowsignature}>]" value="<{$row->ID}>" />
                </td>
        	<{/foreach}>
	    </tr>
	    <tr class="z">
        	<{foreach from=$rows key=counter item=row}>
                <td><{$row->DATE|date_format:'%b %d'}></td>
        	<{/foreach}>
	    </tr>
	    <tr class="z">
        	<{foreach from=$rows key=counter item=row}>
                <td class="s status-<{$row->ID_MILESTONE_STATUS}>"><span><{$row->reftext_ID_MILESTONE_STATUS|escape}></span></td>
        	<{/foreach}>
	    </tr>
	</tbody>
</table>
</div>
</div>

<{plugin key="milestone_list_after" args=""}>

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
        $('#milestonelist tbody tr.rowview').die('dblclick').live('dblclick', function(){
            var tr = $(this);

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/milestone/rowEdit/" + tr.data('id'),
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.milestone-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();
            });
        });

        // x. Double-click on a editing-row to cancel editing
        $('#milestonelist tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
            var tr = $(this);

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/milestone/rowView/" + tr.data('id'),
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.milestone-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();
            });
        });

        // x. Button Save in an editing-row to save the editing item
        $('.milestone-rowedit-save-existing').die('click').live('click', function(event) {
            event.preventDefault();

            var tr = $(this).closest('tr');

            $.ajax({
                type: "post",
                url: "<{$smarty.const.APPLICATION_URL}>/milestone/rowSave",
                data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.milestone-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();
            });
        });

        // x. 'Add item' link to quick-add a new item
        $('.milestone-rowedit-add').click(function() {
            if ($('#milestonelist #item_').length > 0) {
                return;
            }

            $.ajax({
                type: "get",
                url: "<{$smarty.const.APPLICATION_URL}>/milestone/rowNew",
                data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('#milestonelist tbody').append(html);

                $('.milestone-rowedit-add').hide();
                $('.milestone-rowedit-buttons').show();
            });
        });

        // x. Button Cancel to cancel the quick-add item
        $('.milestone-rowedit-cancel').click(function(event) {
            event.preventDefault();

            var tr = $('#milestonelist #item_');

            tr.remove();

            $('.milestone-rowedit-message').html('').hide();

            $('.milestone-rowedit-add').show();
            $('.milestone-rowedit-buttons').hide();
        });

        // x. Button Save to save the quick-add item
        $('.milestone-rowedit-save').click(function(event) {
            event.preventDefault();

            var tr = $('#milestonelist #item_');

            $.ajax({
                type: "post",
                url: "<{$smarty.const.APPLICATION_URL}>/milestone/rowSave",
                data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
            }).done(function(html) {
                $('.milestone-rowedit-message').html('').hide();

                tr.after(html);
                tr.remove();

                if ($('#milestonelist #item_').length == 0) {
                    $('.milestone-rowedit-add').show();
                    $('.milestone-rowedit-buttons').hide();

                    $('.milestone-list-count, .milestone-pagination-to').each(function(){
                        var counter = $(this);

                        counter.text(parseInt(counter.text()) + 1);
                    });

                    $('.milestone-rowedit-add').trigger('click');
                }
            });
        });
    });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.milestonelistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.milestonelistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.milestonelistchk').click(function(){
    		$('#milestonelist .top-holder').hide();

    	    document.milestonelist.milestonelist_selection_selectall.value = 0;
        });
    });
</script>
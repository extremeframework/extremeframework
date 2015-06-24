<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list live-report">
	<thead>
	<tr>
        <{foreach from=$columns item=column}>
            <{if (in_array($column, $filtercolumns)) }>
	            <th class="column-name">
    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminreport/liveSort/<{$model->ID}>/<{$column}>"><{label key="L_`$column`"}></a>
				</th>
            <{/if}>
        <{/foreach}>
        <{if $reportactions}>
            <th class="actions"></th>
        <{/if}>
	</tr>
	</thead>
    <{php}>
    	$template->assign('summable', array());
    <{/php}>
	<tbody>
	<{foreach from=$rows key=counter item=row}>
        <tr id="item_<{$row->ID}>" class="rowview <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->ID}>"<{if $row->NOTE}> title="<{$row->NOTE|strip_tags}>"<{/if}>>
            <{foreach from=$columns item=column}>
                <{if (in_array($column, $filtercolumns)) }>
                    <td class="column column-name text" >
                        <{$has_link = isset($columnlinks.$column) }>

                        <{if $has_link }>
                            <a class="scope-main" href="<{framework_report_link format=$columnlinks.$column data=$row}>">
                        <{/if}>
                        	<span>
                        	    <{if is_numeric($row.$column) }>
                        	        <{$row.$column|escape}>
                        	    <{else}>
                        	        <{$row.$column|escape}>
                                <{/if}>
                        	</span>
                        <{if $has_link }>
                            </a>
                        <{/if}>
	        		</td>
                <{/if}>
            <{/foreach}>
            <{if $reportactions}>
                <td class="actions">
                    <{foreach from=$reportactions item=item}>
                        <a class="scope-main" href="<{framework_report_link format=$item->LINK_FORMAT data=$row}>"><{label text=$item->NAME}></a>
                    <{/foreach}>
                </td>
            <{/if}>
        </tr>
	<{/foreach}>
	</tbody>
</table>
</div>
</div>

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
    });
</script>
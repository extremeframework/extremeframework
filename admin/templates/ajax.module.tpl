<div class="<{$class}> <{$signature}>"><{if $showindicator}><span style="padding-top:20px;text-align:center"><img src="<{$smarty.const.APPLICATION_URL}>/images/ajax-indicator.gif" alt="Loading..."/></span><{/if}></div>

<script type="text/javascript">
$('.<{$signature}>').load('<{$smarty.const.APPLICATION_URL}>/ajax/widget/&<{$querystring}>', function () {
	$('.field-date').datepicker({dateFormat: '<{$smarty.const.DATE_FORMAT}>', appendText: '(<{$smarty.const.DATE_FORMAT}>)'});
});
</script>
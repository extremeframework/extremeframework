<script type="text/javascript">
function <{$module}>_fullexport() {
	document.<{$module}>list.action = "<{$smarty.const.APPLICATION_URL}>/<{$module}>/export/";
	document.<{$module}>list.submit();

	$('#<{$module}>widgetexport').hide();
}

function <{$module}>_splittedexport() {
	document.<{$module}>list.action = "<{$smarty.const.APPLICATION_URL}>/<{$module}>/export/?splitsize=" + $('[name="splitsize"]').val();
	document.<{$module}>list.submit();

	$('#<{$module}>widgetexport').hide();
}

function <{$module}>_xlsexport() {
	document.<{$module}>list.action = "<{$smarty.const.APPLICATION_URL}>/<{$module}>/exportxls/";
	document.<{$module}>list.submit();

	$('#<{$module}>widgetexport').hide();
}
</script>
<div id="<{$module}>widgetexport" style="border:1px solid #DFD9C3;position:absolute;background:#F5F3E5 50% top repeat-x;top:154px;left:390px">
	<li style="padding:5px;list-style:none"><a onclick="<{$module}>_fullexport()">Full export</a></li>
	<li style="padding:5px;list-style:none"><a onclick="<{$module}>_splittedexport()">Splitted export</a> of <input type="text" name="splitsize" value="500" size="3" style="text-align:center"/> rows per file</li>
	<li style="padding:5px;list-style:none"><a onclick="<{$module}>_xlsexport()">Export as an Excel file (.xls)</a></li>
</div>
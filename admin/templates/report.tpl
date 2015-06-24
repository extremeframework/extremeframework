<{include file="header.tpl"}>

<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/amcharts/flash/swfobject.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/amcharts/javascript/amcharts.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/amcharts/javascript/amfallback.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/amcharts/javascript/raphael.js"></script>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$label}>
<{include file="top.tpl"}>

<h1 class="heading"><span class="h"><{$title}></span></h1>

<div id="chartdiv" style="width:600px; height:400px; background-color:#000000"></div>

<script type="text/javascript">
	var params = {
	     bgcolor: "#000000"
    };

    var flashVars = {
        path: "",
        chart_settings: "<{$chartsettings}>",
        chart_data: "<{$chartdata}>"
	};

	// change 8 to 80 to test javascript version
    if (swfobject.hasFlashPlayerVersion("8")){
		swfobject.embedSWF("<{$smarty.const.APPLICATION_URL}>/js/amcharts/flash/am<{$charttype}>.swf", "chartdiv", "600", "400", "8.0.0", "<{$smarty.const.APPLICATION_URL}>/js/amcharts/flash/expressInstall.swf", flashVars, params);
	} else{
	    // Note, as this example loads external data, JavaScript version might only work on server
		var amFallback = new AmCharts.AmFallback();
		amFallback.path = "<{$smarty.const.APPLICATION_URL}>/js/amcharts/flash/";
		amFallback.chartSettings = flashVars.chart_settings;
		amFallback.chartData = flashVars.chart_data;
		amFallback.type = "<{$charttype}>";
		amFallback.write("chartdiv");
	}
</script>

<{include file="footer.tpl"}>
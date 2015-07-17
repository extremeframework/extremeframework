<{include file="header.tpl"}>

<style type="text/css">
.widget-header {
    background-color: #019CDC;
    border-bottom: 1px solid #CCC;
    padding: 5px;
}
.widget-header .ui-icon { float: right; }
.widget-title {
    color: #FFFFFF;
}
.widget-content {
    border: 1px solid #D9D9D9;
    padding: 5px;
}
.ui-sortable-placeholder { border: 1px dotted black; visibility: visible !important; height: 50px !important; }
.ui-sortable-placeholder * { visibility: hidden; }
</style>

</head>
<body class="module" id="dashboard">
<{assign var='title' value=_t('Dashboard')}>
<{include file="top.tpl"}>

<style type="text/css">
#dashboard .top {
    padding: 5px;
    width: 99%;
}
#dashboard .left {
    padding: 5px;
    float:left;
    width: 48%;
    min-height: 200px;
}
#dashboard .right {
    float: right;
    padding: 5px;
    width: 48%;
    min-height: 200px;
}
#dashboard .bottom {
    clear: both;
    padding: 5px;
    width: 99%;
}
.dashboard-options {
    float:right;
}
.dashboard-content {
    clear: both;
}
.widget {
    margin-bottom: 20px;
    overflow: hidden;
}
</style>

<div id="dashboard" class="dashboard">
    <div class="dashboard-content">
        <{foreach from=$positions item=position}>
            <div class="column <{$position}>" position="<{$position}>">
                <{foreach from=$widgets.$position item=widget}>
                    <div class="widget" widget-id="<{$widget->ID}>">
                    	<div class="widget-header">
                    		<h3 class="widget-title"><{$widget->TITLE}></h3>
                    		<div class="widget-menu"></div>
                    		<div style="clear:both"></div>
                    	</div>

                        <div class="widget-content">
                            <{ajaxmodule class=$widget->CLASS}>
                        </div>
                    </div>
                <{/foreach}>
            </div>
        <{/foreach}>
    </div>
</div>

<script type="text/javascript">
$(function() {
	$(".column").sortable({
	    handle: ".widget-title",
		connectWith: ".column",
		update: function () {
        	var place = '';

        	$(".widget").each(function() {
        		place += ("widgets[" + $(this).parent().attr("position") + "][]" + "=" + $(this).attr("widget-id") + "&");
        	});

        	$.ajax({
        		type: "post",
        		url: "<{$smarty.const.APPLICATION_URL}>/dashboard/updateconfig",
        		data: place
        	});
		}
	});

    $(".widget-title").css('cursor', 'move');

	$( ".widget" ).addClass( "ui-widget" )
		.find( ".widget-header" )
			.addClass( "ui-widget-header" )
			.prepend( "<span class='ui-icon ui-icon-minusthick'></span>")
			.end()
		.find( ".widget-content" );

	$( ".widget-header .ui-icon" ).click(function() {
		$( this ).toggleClass( "ui-icon-minusthick" ).toggleClass( "ui-icon-plusthick" );
		$( this ).parents( ".widget:first" ).find( ".widget-content" ).toggle();
	});
});
</script>

<{include file="footer.tpl"}>
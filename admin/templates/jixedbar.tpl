<style>
#demo-bar
{
	z-index:1000;
}
.jx-bar {
	height:30px;
	padding:0px;
	width:90%;
	background-color:#e5e5e5;
	border:#b5b5b5 solid 1px;
}

	/* rounded top-left corner */
	.jx-bar-rounded-tl {
		-webkit-border-top-left-radius:5px;
		-khtml-border-radius-topleft:5px;
		-moz-border-radius-topleft:5px;
		border-top-left-radius:5px;
	}

	/* rounded bottom-left corner */
	.jx-bar-rounded-bl {
		-webkit-border-bottom-left-radius:5px;
		-khtml-border-radius-bottomleft:5px;
		-moz-border-radius-bottomleft:5px;
		border-bottom-left-radius:5px;
	}

	/* rounded top-right corner */
	.jx-bar-rounded-tr {
		-webkit-border-top-right-radius:5px;
		-khtml-border-radius-topright:5px;
		-moz-border-radius-topright:5px;
		border-top-right-radius:5x;
	}

	/* rounded bottom-right corner */
	.jx-bar-rounded-br {
		-webkit-border-bottom-right-radius:5px;
		-khtml-border-radius-bottomright:5px;
		-moz-border-radius-bottomright:5px;
		border-bottom-right-radius:5x;
	}

/*----- bar separator -----*/
.jx-bar span {
	width:1px;
	height:100%;
	background-color:#ccc;
}

	.jx-separator-left {
		float:left;
	}

	.jx-separator-right {
		float:right;
	}

/*----- bar button -----*/
.jx-bar-button ul {
	margin:0px;
	padding:0px;
}

.jx-bar-button li {
	float:left;
	list-style:none;
}

.jx-bar-button-right li {
	float:right;
	list-style:none;
}

.jx-bar-button li {
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:11px;
	cursor:pointer;
	padding:4px 8px 4px 8px;
	border:#e5e5e5 solid 1px;
	margin:2px;
}

	/*	button hover effect	*/
	.jx-bar-button li:hover {
		background-color:#eee;
		border:#ccc solid 1px;
		padding:4px 8px 4px 8px;
		margin:2px;
	}

	/* rounded button corners */
	.jx-bar-button-rounded li:hover {
		-webkit-border-radius:3px;
		-khtml-border-radius:3px;
		-moz-border-radius:3px;
		border-radius:3px;
	}

	/* default button's anchor text style */
	.jx-bar-button li a:link, .jx-bar-button li a:visited {
		font-family:Verdana, Arial, Helvetica, sans-serif;
		font-size:11px;
		color:#666;
		text-decoration:none;
		padding:1px;
	}

	.jx-bar-button li a:hover {
		font-family:Verdana, Arial, Helvetica, sans-serif;
		font-size:11px;
		color:#333;
		text-decoration:none;
	}

/*----- bar text container and button arrow indicator -----*/
.jx-bar div, .jx-bar iframe {
	float:left;
}

.jx-bar div {
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:11px;
	color:#666;
	padding:4px 8px 4px 8px;
	margin:4px 0px 4px 0px;
}

.jx-bar iframe {
	margin:4px 0px 4px 10px;
}

	.jx-bar div a:link, .jx-bar div a:visited {
		color:#666;
		text-decoration:none;
	}

	.jx-bar div a:hover {
		color:#0099FF;
		text-decoration:none;
	}

/*----- button tooltip -----*/
.jx-bar-button-tooltip {
	height:auto;
	padding:5px 10px 5px 10px;
	color:#fff;
	background-color:#36393D;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:11px;
}

	/* rounded tooltip */
	.jx-bar-button-tooltip {
		-moz-border-radius:3px;
		-webkit-border-radius:3px;
	}

/*----- nav menu -----*/
.jx-nav-menu {
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:11px;
	padding:2px;
	background-color:#eee;
	border:#ccc solid 1px;
}

	.jx-nav-menu-rounded {
		-webkit-border-radius:3px;
		-khtml-border-radius:3px;
		-moz-border-radius:3px;
		border-radius:3px;
		z-index:1000;
	}

.jx-nav-menu ul {
	margin:0;
	padding:0;
	list-style:none;
}

.jx-nav-menu a:hover {
	background-color:#4096EE;
	color:#fff;
}

/* styles for menu items */
.jx-nav-menu ul li a {
	display:block;
	text-decoration:none;
	color:#777;
	background:#fff; /* IE6 Bug */
	padding:8px;
	border:1px solid #eee; /* IE6 Bug */
	border-bottom:0px;
}

/* active menu button */
.jx-nav-menu-active {
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:11px;
	cursor:pointer;
	background-color:#ccc;
	padding:4px 8px 4px 8px;
	margin:2px;
}

/* active menu button (rounded) */
.jx-nav-menu-active-rounded {
	-webkit-border-radius:3px;
	-khtml-border-radius:3px;
	-moz-border-radius:3px;
	border-radius:3px;
}

/* menu indicator UP state */
.jx-arrow-up {
	background-image:url('up.gif');
	background-repeat:no-repeat;
	background-position: center;
}

/* menu indicator DOWN state */
.jx-arrow-down {
	background-image:url('dn.gif');
	background-repeat:no-repeat;
	background-position: center;
}

/* tooltip point direction */
.jx-tool-point-dir-down {
	background-image:url('ttd.gif');
	background-repeat:no-repeat;
	background-position:center bottom;
	height:5px;
	width:auto;
}

.jx-tool-point-dir-up {
	background-image:url('ttu.gif');
	background-repeat:no-repeat;
	background-position:center bottom;
	height:5px;
	width:auto;
}

/* hide and show/unhide item */
.jx-hide {
	float:right;
	background-image:url('hide.gif');
	background-repeat:no-repeat;
	height:16px;
	width:16px;
}

	/* if showOnTop is TRUE, use "show.gif" instead of "hide.gif" */
	.jx-hide-top {
		float:right;
		background-image:url('show.gif');
		background-repeat:no-repeat;
		height:16px;
		width:16px;
	}

.jx-show {
	height:30px;
	padding:0px;
	width:38px;
	background-color:#e5e5e5;
	border:#b5b5b5 solid 1px;
}

.jx-show-button {
	float:right;
	background-image:url('show.gif');
	background-repeat:no-repeat;
	height:16px;
	width:16px;
}

	/* if showOnTop is TRUE, use "hide.gif" instead of "show.gif" */
	.jx-show-button-top {
		float:right;
		background-image:url('hide.gif');
		background-repeat:no-repeat;
		height:16px;
		width:16px;
	}

.jx-hide-separator {
	width:1px;
	height:100%;
	background-color:#ccc;
	float:right;
}


</style>

<div id="demo-bar" style="z-index:2000;">
    <ul>
        <li title="Truy cập nhanh"><a href="#">
            <img src="http://static.bizwebmedia.net/images/icons/link1.png" alt="Truy cập nhanh" /></a>
            <ul>
                <li><a href="/admin.aspx?module=sitesetting">
                    <img src="http://static.bizwebmedia.net/images/icons/config.png" alt="" />&nbsp;&nbsp;Cấu hình hệ thống</a></li>
                <li><a href="/admin.aspx?module=skins">
                    <img src="http://static.bizwebmedia.net/images/icons/banner.png" alt="" />&nbsp;&nbsp;Thiết lập giao diện</a></li>
            </ul>
        </li>
    </ul>
    <span class="jx-separator-left"></span>
    <div class="text-container">
        <span>Esc - Trở về</span>
        <span>F2 - Tạo mới</span>
        <span>F3 - Save</span>
    </div>
</div>

<script type="text/javascript" src="http://static.bizwebmedia.net/Extensions/Js/AdminMenu/jquery.jixedbar.js"></script>

<script type="text/javascript">
    $(function () {
        $("#demo-bar").jixedbar();
    });
</script>
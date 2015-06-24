<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_BOOK_NOTE}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch">
        <form id="booknotequicksearch" action="<{$smarty.const.APPLICATION_URL}>/booknote/search" method="post" enctype="multipart/form-data">
            <input type="text" name="booknote_searchdata___QUICKSEARCH__" value="<{$searchdata.__QUICKSEARCH__}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>">
	        <a class="button-quick-search scope-list" onclick="$('#booknotequicksearch').submit();return false;">
	            <span><{label key="L_SEARCH"}></span>
            </a>
        </form>
    </div>

<h1 class="heading"><span class="h"><{$title}></span></h1>

<{foreach from=$messages.booknote key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>

<form name="booknotelist" action="" method="post">

<input type="hidden" name="booknotelist_selection_selectall" value="0">

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.booknote.new) }>
<div id="sub-controls">
<ul class="subtabs">
    <li class="">
    <div class="buttons">
        	        		        <{if isset($smarty.session.acl.booknote.new) }>
		        <div class="button-general">
		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/booknote/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" /><{label key="L_NEW"}> <{label key="L_BOOK_NOTE" format="lower"}></span></a>
		        </div>
		        <{/if}>
			                                            <{if isset($smarty.session.acl.booknote.delete) }>
                            <div class="button-general">
                    <a onclick="booknote_delete()"><span class="button-face"><{label key="L_DELETE"}></span></a>
                </div>
                            <{/if}>
                                </div>
    </li>
</ul>
</div>
<div class="clearer"></div>
<{/if}>

<!-- Relations -->

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function booknote_reset() {
	$(':text, select', '#booknote-search').val('');
}

function booknote_search() {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/search/";
	document.booknotelist.submit();
}

function booknote_save() {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/save/?back=0";
	document.booknotelist.submit();
}

function booknote_delete() {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/delete/";
	document.booknotelist.submit();
}

function booknote_copy() {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/copy/";
	document.booknotelist.submit();
}

function booknote_approve() {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/approve/";
	document.booknotelist.submit();
}

function booknote_batchedit() {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/batchedit/";
	document.booknotelist.submit();
}

function booknote_update(col, val) {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/bulkupdate/"+col+"/"+val;
	document.booknotelist.submit();
}

function booknote_dupdate(col, val) {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/bulkdupdate/"+col+"/"+val;
	document.booknotelist.submit();
}

function booknote_customaction(controller, action) {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/"+controller+"/"+action+"/";
	document.booknotelist.submit();
}

function booknote_filter(col, val) {
	document.booknotelist.action = "<{$smarty.const.APPLICATION_URL}>/booknote/filter/"+col+"/"+val;
	document.booknotelist.submit();
}


function booknote_checkall(checked) {
	$('#booknotelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('booknotelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#booknotelist .top-holder').show();

		$('#booknotelist .top-holder .selectall').show();
		$('#booknotelist .top-holder .clearselection').hide();
	} else {
		$('#booknotelist .top-holder').hide();

	    document.booknotelist.booknotelist_selection_selectall.value = 0;
	}
}

function booknote_selectall() {
	booknote_checkall(true);

    document.booknotelist.booknotelist_selection_selectall.value = 1;

	$('#booknotelist .top-holder .selectall').hide();
	$('#booknotelist .top-holder .clearselection').show();
}

function booknote_clearselection() {
	booknote_checkall(false);

    document.booknotelist.booknotelist_selection_selectall.value = 0;
}
</script>

<style type="text/css">
body {
    background: #e7ebf2;
}
li {
    list-style: none;
}
.timelineLayout {
    color: #333;
    line-height: 1.28;
    text-align: left;
    direction: ltr;
    font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
    font-size: 11px;
}
.timelineLayout a {
    color: #3b5998;
    cursor: pointer;
    text-decoration: none;
    font-weight:bold;
    font-size: 13px;
    line-height: 1.38;
}
.timelineUnit {
    color: #37404e;
    margin-bottom: 17px;
    display: block;
    position: relative;
}
.timelineUnitContainer {
    width: 486px;
    border-top: 1px solid #EEEEE9;
    padding: 12px;
    background: #fff;
    position: relative;
}
.articleHeader {
    border: 0;
    margin: 0 0 15px;
    padding: 0;
}
.posterThumb {
    position: relative;
    margin-right: 8px;
    float: left;
}
.posterThumb img {
    height: 40px;
    margin-right: 1px;
    width: 40px;
}
.topBorder {
    background-image: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yg/r/xOAcFHrvIVL.png);
    background-repeat: no-repeat;
    background-size: auto;
    background-position: 0 -10px;
    height: 3px;
    top: -1px;
    width: 512px;
}
.bottomBorder {
    background-image: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yg/r/xOAcFHrvIVL.png);
    background-repeat: no-repeat;
    background-size: auto;
    background-position: 0 -10px;
    bottom: -1px;
    height: 2px;
    width: 512px;
}
.userContent {
    font-size: 13px;
    line-height: 18px;
    color: #37404e;
    font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
}
.posterInfo {
    display: table-cell;
    vertical-align: top;
}
.posterName {
    margin-right: 51px;
    font-size: 12px;
    line-height: 16px;
    margin: 4px 15px 1px 0;
}
.posterDate {
    line-height: 15px;
    color: #89919c;
    font-weight: normal;
    font-size: 11px;
}
._5ce {
    position: absolute;
    right: 8px;
    top: 0;
}
</style>

<div class="timelineLayout">
<ul>
<{foreach from=$rows key=counter item=row}>
    <li class="timelineUnit">
        <div class="timelineUnitContainer">
            <div>
                <div class="article">
                    <div class="articleHeader">
                        <div class="posterThumb">
                            <img src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/1076889_1382395182_2028759593_q.jpg"/>
                        </div>
                        <div class="posterInfo">
                            <h5 class="posterName">
                                <a>Tran Quoc Viet</a>
                            </h5>
                            <div class="posterDate">
                                <abbr title="Friday, 23 August 2013 at 13:34">about an hour ago</abbr>
                            </div>
                        </div>
                    </div>
                    <div class="articleBody">
                        <div class="userContentWrapper">
                            <span class="userContent"><{$row->NOTE|nl2br}></span>
                        </div>
                    </div>
                </div>
                <div class="_5ce">
                    <span><a style="font-size:11px;font-weight:normal;color:#89919c;position:relative;top:5px;" href="<{$smarty.const.APPLICATION_URL}>/booknote/edit/<{$row->ID}>">Edit</a></span>
                </div>
            </div>
        </div>
    </li>
<{/foreach}>
</ul>
</div>

<{if $pagination || $total > 10}>
	<br>
	<div style="float:right">
	<{php}>
	    $template->assign('pagesizes', array(10, 20, 30, 50, '*'));
	<{/php}>
	<{foreach from=$pagesizes key=key item=item}>
	    <{if $key > 0}> | <{/if}>
	    <{if $item == $limit}>
	        <{$item}>
	    <{else}>
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/booknote/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div style="float:left">
		Showing <{$limit_from}>-<{$limit_to}> of <{$total}>
	</div>

	<div style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager scope-list" href="<{$smarty.const.APPLICATION_URL}>/booknote/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>
<{else}>
	<br>
	<div style="float:left">
		<{$total}> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>


<script type="text/javascript">
$(document).ready(function(){
    // x. Shift-checkbox
    $('.booknotelistchk').shiftcheckbox();

    // x. CSS for selected rows
    $('.booknotelistchk').change(function(){
    	if ($(this).is(':checked')) {
			$(this).closest('tr').addClass('row-selected');
		} else {
			$(this).closest('tr').removeClass('row-selected');
		}
    });

    $('.booknotelistchk').click(function(){
		$('#booknotelist .top-holder').hide();

	    document.booknotelist.booknotelist_selection_selectall.value = 0;
    });
});
</script>

<!--:listbodyend:-->
</div>

</form>

<{include file="footer.tpl"}>

<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">

<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminreportquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminreport/liveSearch/<{$model->ID}>" method="post" enctype="multipart/form-data">
            <input type="text" name="adminreport_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#adminreportquicksearch').submit(); return false;">
	            <span><{label key="L_SEARCH"}></span>
            </a>
        </form>
    </div>

    <script type="text/javascript">
        $(function() {
            var delay = (function(){
              var timer = 0;
              return function(callback, ms){
                  clearTimeout (timer);
                  timer = setTimeout(callback, ms);
              };
            })();

            var latest = '';
            $('#adminreportquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminreportquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminreport/live/<{$model->ID}>"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminreport) }>
<{foreach from=$messages.adminreport key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminreportlist" id="adminreportlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminreport/" method="post">

<input type="hidden" name="adminreportlist_selection_selectall" value="0" />

<!-- Search form -->
<{if $searchfields}>
    <div id="adminreport-search" class="searchform">
        <{foreach from=$searchfields item=item}>
        	<div class="blocker">
            	<div class="form-row">
            	    <label><{label text="<{$item->NAME}>"}></label>
            	    <div class="form-field">
                        <{if isset($searchdata[$item->CODE])}>
                            <{assign var='tmp_value' value=$searchdata[$item->CODE]}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>

                        <{if $item->VALUE_TYPE_CODE == 'refselect'}>
                            <{html_ref_select autocomplete="1" ajax="0" name="adminreport_searchdata_<{$item->CODE}>" value="$tmp_value" method="" datasource="<{$item->DATASOURCE}>" valuecol="<{$item->VALUECOL}>" textcol="<{$item->TEXTCOL}>" groupcol="" blankitem="&lt;All&gt;" noneitem="&lt;None&gt;"}>
                        <{else}>
                            <input type="text" <{if $item->VALUE_TYPE_CODE == 'date'}>class="field-date"<{/if}> name="adminreport_searchdata_<{$item->CODE}>" value="<{$tmp_value}>"/>
                        <{/if}>
        		    </div>
        		</div>
        	</div>
        <{/foreach}>

        <div class="blocker">
            <div class="form-row">
                <label style="height:18px">&nbsp;</label>
                <div class="form-field">
                    <span class="buttons">
                        <a href="javascript:adminreport_search()"><span><{label key="L_SEARCH"}></span></a>
                        <a href="javascript:adminreport_reset()"><span><{label key="L_RESET"}></span></a>
                    </span>
                </div>
            </div>
        </div>

        <div class="clearer"></div>
    </div>
<{/if}>

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminreport_reset() {
	$(':text, select', '#adminreport-search').val('');
}

function adminreport_search() {
	$('#adminreportlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminreport/liveSearch/<{$model->ID}>');
	$('#adminreportlistform').submit();
}

function adminreport_checkall(checked) {
	$('#adminreportlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminreportlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminreportlist .top-holder').show();

		$('#adminreportlist .top-holder .selectall').show();
		$('#adminreportlist .top-holder .clearselection').hide();
	} else {
		$('#adminreportlist .top-holder').hide();

	    document.adminreportlist.adminreportlist_selection_selectall.value = 0;
	}
}

function adminreport_selectall() {
	adminreport_checkall(true);

    document.adminreportlist.adminreportlist_selection_selectall.value = 1;

	$('#adminreportlist .top-holder .selectall').hide();
	$('#adminreportlist .top-holder .clearselection').show();
}

function adminreport_clearselection() {
	adminreport_checkall(false);

    document.adminreportlist.adminreportlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="live-main.adminreport.tpl"}>
<{/if}>

<{if $pagination || $total > 10}>
	<br>
	<div class="pagination-sizes hidden-print" style="float:right">
	<{php}>
	    $template->assign('pagesizes', array(10, 20, 30, 50, '*'));
	<{/php}>
	<{foreach from=$pagesizes key=key item=item}>
	    <{if $key > 0}> | <{/if}>
	    <{if $item == $limit}>
	        <{$item}>
	    <{else}>
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminreport/liveLimit/<{$model->ID}>/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminreport-pagination-from"><{$limit_from}>-<span class="adminreport-pagination-to"><{$limit_to}></span> of <span class="adminreport-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminreport/livePage/<{$model->ID}>/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

    <script type="text/javascript">
        $(function() {
        	bind_hotkey('#adminreportlistform', 'left', '.pagination-prev');
        	bind_hotkey('#adminreportlistform', 'right', '.pagination-next');
        });
    </script>
<{else}>
	<br>
	<div style="float:left">
		<span class="adminreport-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminreport-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminreport-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminreportlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminreportlistform :focusable:first').focus();
        }

    	$('#adminreportlistform').click(function(){
    	    var focused = $('#adminreportlistform :focus');

    	    if (focused.length == 0) {
                $('#adminreportlistform :focusable:first').focus();
    	    }
    	});
    });
</script>

<script type="text/javascript">
    $(function() {
        LicenseHelper.init();
    });
</script>

<!--:listbodyend:-->
</div>

</form>

<{include file="footer.tpl"}>

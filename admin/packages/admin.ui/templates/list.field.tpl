<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_FIELD}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="fieldquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/field/search" method="post" enctype="multipart/form-data">
            <input type="text" name="field_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#fieldquicksearch').submit(); return false;">
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
            $('#fieldquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#fieldquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/field"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.field) }>
<{foreach from=$messages.field key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="fieldlist" id="fieldlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/field/" method="post">

<input type="hidden" name="fieldlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.field.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.field.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/field/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_FIELD|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_FIELD|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.field.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="field_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.field[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="field_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                                <{/if}>
                            <{/foreach}>
                        </ul>
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
function field_reset() {
	$('input, select', '#field-search').val('');
}

function field_search() {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/search/');
	$('#fieldlistform').submit();
}

function field_save() {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/save/?back=0');
	$('#fieldlistform').submit();
}

function field_delete() {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/delete/');
	$('#fieldlistform').submit();
}

function field_copy() {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/copy/');
	$('#fieldlistform').submit();
}

function field_approve() {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/approve/');
	$('#fieldlistform').submit();
}

function field_batchedit() {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/batchedit/');
	$('#fieldlistform').submit();
}

function field_update(col, val) {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/bulkupdate/' + col + '/' + val);
	$('#fieldlistform').submit();
}

function field_dupdate(col, val) {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/bulkdupdate/' + col + '/' + val);
	$('#fieldlistform').submit();
}

function field_customaction(controller, action) {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#fieldlistform').submit();
}

function field_filter(col, val) {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/filter/' + col + '/' + val);
	$('#fieldlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function field_<{$item->ACTION}>() {
        	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/<{$item->ACTION}>/');
        	$('#fieldlistform').submit();
		}
	<{/if}>
<{/foreach}>

function field_checkall(checked) {
	$('#fieldlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('fieldlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#fieldlist .top-holder').show();

		$('#fieldlist .top-holder .selectall').show();
		$('#fieldlist .top-holder .clearselection').hide();
	} else {
		$('#fieldlist .top-holder').hide();

	    document.fieldlist.fieldlist_selection_selectall.value = 0;
	}
}

function field_selectall() {
	field_checkall(true);

    document.fieldlist.fieldlist_selection_selectall.value = 1;

	$('#fieldlist .top-holder .selectall').hide();
	$('#fieldlist .top-holder .clearselection').show();
}

function field_clearselection() {
	field_checkall(false);

    document.fieldlist.fieldlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.field.tpl"}>
<{/if}>

<{if $pagination || $total > 10}>
	<br>
	<div class="pagination-sizes hidden-print" style="float:right">
	<{php}>
	    $template->assign('pagesizes', array(10, 20, 30, 50, 100, 200, 500, '*'));
	<{/php}>
	<{foreach from=$pagesizes key=key item=item}>
	    <{if $key > 0}> | <{/if}>
	    <{if $item == $limit}>
	        <{$item}>
	    <{else}>
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/field/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="field-pagination-from"><{$limit_from}>-<span class="field-pagination-to"><{$limit_to}></span> of <span class="field-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/field/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="field-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.field-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.field-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#fieldlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#fieldlistform :focusable:first').focus();
        }

    	$('#fieldlistform').click(function(){
    	    var focused = $('#fieldlistform :focus');

    	    if (focused.length == 0) {
                $('#fieldlistform :focusable:first').focus();
    	    }
    	});
    });
</script>

<script type="text/javascript">
    $(function() {
        LicenseHelper.init();
    });
</script>

<{time_elapsed}>

<!--:listbodyend:-->
</div>

</form>

<{include file="footer.tpl"}>

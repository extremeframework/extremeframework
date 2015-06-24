

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="screenquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/screen/search" method="post" enctype="multipart/form-data">
            <input type="text" name="screen_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#screenquicksearch').submit(); return false;">
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
            $('#screenquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#screenquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.screen) }>
<{foreach from=$messages.screen key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="screenlist" id="screenlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/screen/" method="post">

<input type="hidden" name="screenlist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.screen.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.screen.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_SCREEN|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_SCREEN|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.screen.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="screen_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.screen[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="screen_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
function screen_reset() {
	$('input, select', '#screen-search').val('');
}

function screen_search() {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/search/');
	$('#screenlistform').submit();
}

function screen_save() {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/save/?back=0');
	$('#screenlistform').submit();
}

function screen_delete() {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/delete/');
	$('#screenlistform').submit();
}

function screen_copy() {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/copy/');
	$('#screenlistform').submit();
}

function screen_approve() {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/approve/');
	$('#screenlistform').submit();
}

function screen_batchedit() {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/batchedit/');
	$('#screenlistform').submit();
}

function screen_update(col, val) {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/bulkupdate/' + col + '/' + val);
	$('#screenlistform').submit();
}

function screen_dupdate(col, val) {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/bulkdupdate/' + col + '/' + val);
	$('#screenlistform').submit();
}

function screen_customaction(controller, action) {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#screenlistform').submit();
}

function screen_filter(col, val) {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/filter/' + col + '/' + val);
	$('#screenlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function screen_<{$item->ACTION}>() {
        	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/<{$item->ACTION}>/');
        	$('#screenlistform').submit();
		}
	<{/if}>
<{/foreach}>

function screen_checkall(checked) {
	$('#screenlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('screenlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#screenlist .top-holder').show();

		$('#screenlist .top-holder .selectall').show();
		$('#screenlist .top-holder .clearselection').hide();
	} else {
		$('#screenlist .top-holder').hide();

	    document.screenlist.screenlist_selection_selectall.value = 0;
	}
}

function screen_selectall() {
	screen_checkall(true);

    document.screenlist.screenlist_selection_selectall.value = 1;

	$('#screenlist .top-holder .selectall').hide();
	$('#screenlist .top-holder .clearselection').show();
}

function screen_clearselection() {
	screen_checkall(false);

    document.screenlist.screenlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.screen.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screen/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="screen-pagination-from"><{$limit_from}>-<span class="screen-pagination-to"><{$limit_to}></span> of <span class="screen-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/screen/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#screenlistform', 'left', '.pagination-prev');
            	bind_hotkey('#screenlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="screen-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.screen-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.screen-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#screenlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#screenlistform :focusable:first').focus();
        }

    	$('#screenlistform').click(function(){
    	    var focused = $('#screenlistform :focus');

    	    if (focused.length == 0) {
                $('#screenlistform :focusable:first').focus();
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


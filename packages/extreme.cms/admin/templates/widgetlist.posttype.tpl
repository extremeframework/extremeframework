

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="posttypequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/posttype/search" method="get">
            <input type="text" name="posttype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#posttypequicksearch').submit(); return false;">
	            <span><{_t('Search')}></span>
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
            $('#posttypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#posttypequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.posttype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.posttype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/posttype/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Post Type', true)|strtolower}>"/><{_t('New')}> <{_t('Post Type')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.posttype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="posttype_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.posttype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="posttype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="posttypelist" id="posttypelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/posttype/" method="post">
<input type="hidden" name="posttypelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function posttype_reset() {
	$('input, select', '#posttype-search').val('');
}

function posttype_search() {
	$('#posttype-search').submit();
}

function posttype_save() {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/save/?back=0');
	$('#posttypelistform').submit();
}

function posttype_delete() {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/delete/');
	$('#posttypelistform').submit();
}

function posttype_copy() {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/copy/');
	$('#posttypelistform').submit();
}

function posttype_approve() {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/approve/');
	$('#posttypelistform').submit();
}

function posttype_batchedit() {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/batchedit/');
	$('#posttypelistform').submit();
}

function posttype_update(col, val) {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/bulkupdate/' + col + '/' + val);
	$('#posttypelistform').submit();
}

function posttype_dupdate(col, val) {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/bulkdupdate/' + col + '/' + val);
	$('#posttypelistform').submit();
}

function posttype_customaction(controller, action) {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#posttypelistform').submit();
}

function posttype_filter(col, val) {
	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/filter/' + col + '/' + val);
	$('#posttypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function posttype_<{$item->ACTION}>() {
        	$('#posttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/posttype/<{$item->ACTION}>/');
        	$('#posttypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function posttype_checkall(checked) {
	$('#posttypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('posttypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#posttypelist .top-holder').show();

		$('#posttypelist .top-holder .selectall').show();
		$('#posttypelist .top-holder .clearselection').hide();
	} else {
		$('#posttypelist .top-holder').hide();

	    document.posttypelist.posttypelist_selection_selectall.value = 0;
	}
}

function posttype_selectall() {
	posttype_checkall(true);

    document.posttypelist.posttypelist_selection_selectall.value = 1;

	$('#posttypelist .top-holder .selectall').hide();
	$('#posttypelist .top-holder .clearselection').show();
}

function posttype_clearselection() {
	posttype_checkall(false);

    document.posttypelist.posttypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.posttype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/posttype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="posttype-pagination-from"><{$limit_from}>-<span class="posttype-pagination-to"><{$limit_to}></span> of <span class="posttype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/posttype/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#posttypelistform', 'left', '.pagination-prev');
            	bind_hotkey('#posttypelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="posttype-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.posttype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.posttype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#posttypelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#posttypelistform :focusable:first').focus();
        }

    	$('#posttypelistform').click(function(){
    	    var focused = $('#posttypelistform :focus');

    	    if (focused.length == 0) {
                $('#posttypelistform :focusable:first').focus();
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


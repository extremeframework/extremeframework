

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="objectaclquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/objectacl/search" method="post" enctype="multipart/form-data">
            <input type="text" name="objectacl_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#objectaclquicksearch').submit(); return false;">
	            <span><{_t('L_SEARCH')}></span>
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
            $('#objectaclquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#objectaclquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.objectacl) }>
<{foreach from=$messages.objectacl key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="objectacllist" id="objectacllistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/objectacl/" method="post">

<input type="hidden" name="objectacllist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.objectacl.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.objectacl.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_OBJECT_ACL')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_OBJECT_ACL')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.objectacl.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="objectacl_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.objectacl[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="objectacl_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
function objectacl_reset() {
	$('input, select', '#objectacl-search').val('');
}

function objectacl_search() {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/search/');
	$('#objectacllistform').submit();
}

function objectacl_save() {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/save/?back=0');
	$('#objectacllistform').submit();
}

function objectacl_delete() {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/delete/');
	$('#objectacllistform').submit();
}

function objectacl_copy() {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/copy/');
	$('#objectacllistform').submit();
}

function objectacl_approve() {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/approve/');
	$('#objectacllistform').submit();
}

function objectacl_batchedit() {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/batchedit/');
	$('#objectacllistform').submit();
}

function objectacl_update(col, val) {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/bulkupdate/' + col + '/' + val);
	$('#objectacllistform').submit();
}

function objectacl_dupdate(col, val) {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/bulkdupdate/' + col + '/' + val);
	$('#objectacllistform').submit();
}

function objectacl_customaction(controller, action) {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#objectacllistform').submit();
}

function objectacl_filter(col, val) {
	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/filter/' + col + '/' + val);
	$('#objectacllistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function objectacl_<{$item->ACTION}>() {
        	$('#objectacllistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/<{$item->ACTION}>/');
        	$('#objectacllistform').submit();
		}
	<{/if}>
<{/foreach}>

function objectacl_checkall(checked) {
	$('#objectacllist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('objectacllist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#objectacllist .top-holder').show();

		$('#objectacllist .top-holder .selectall').show();
		$('#objectacllist .top-holder .clearselection').hide();
	} else {
		$('#objectacllist .top-holder').hide();

	    document.objectacllist.objectacllist_selection_selectall.value = 0;
	}
}

function objectacl_selectall() {
	objectacl_checkall(true);

    document.objectacllist.objectacllist_selection_selectall.value = 1;

	$('#objectacllist .top-holder .selectall').hide();
	$('#objectacllist .top-holder .clearselection').show();
}

function objectacl_clearselection() {
	objectacl_checkall(false);

    document.objectacllist.objectacllist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.objectacl.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="objectacl-pagination-from"><{$limit_from}>-<span class="objectacl-pagination-to"><{$limit_to}></span> of <span class="objectacl-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/objectacl/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#objectacllistform', 'left', '.pagination-prev');
            	bind_hotkey('#objectacllistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="objectacl-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.objectacl-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.objectacl-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#objectacllistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#objectacllistform :focusable:first').focus();
        }

    	$('#objectacllistform').click(function(){
    	    var focused = $('#objectacllistform :focus');

    	    if (focused.length == 0) {
                $('#objectacllistform :focusable:first').focus();
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


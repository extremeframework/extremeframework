

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="parametergroupquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/parametergroup/search" method="post" enctype="multipart/form-data">
            <input type="text" name="parametergroup_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#parametergroupquicksearch').submit(); return false;">
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
            $('#parametergroupquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#parametergroupquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/parametergroup"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.parametergroup) }>
<{foreach from=$messages.parametergroup key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="parametergrouplist" id="parametergrouplistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/parametergroup/" method="post">

<input type="hidden" name="parametergrouplist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.parametergroup.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.parametergroup.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_PARAMETER_GROUP|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_PARAMETER_GROUP|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.parametergroup.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="parametergroup_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.parametergroup[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="parametergroup_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
function parametergroup_reset() {
	$('input, select', '#parametergroup-search').val('');
}

function parametergroup_search() {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/search/');
	$('#parametergrouplistform').submit();
}

function parametergroup_save() {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/save/?back=0');
	$('#parametergrouplistform').submit();
}

function parametergroup_delete() {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/delete/');
	$('#parametergrouplistform').submit();
}

function parametergroup_copy() {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/copy/');
	$('#parametergrouplistform').submit();
}

function parametergroup_approve() {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/approve/');
	$('#parametergrouplistform').submit();
}

function parametergroup_batchedit() {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/batchedit/');
	$('#parametergrouplistform').submit();
}

function parametergroup_update(col, val) {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/bulkupdate/' + col + '/' + val);
	$('#parametergrouplistform').submit();
}

function parametergroup_dupdate(col, val) {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/bulkdupdate/' + col + '/' + val);
	$('#parametergrouplistform').submit();
}

function parametergroup_customaction(controller, action) {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#parametergrouplistform').submit();
}

function parametergroup_filter(col, val) {
	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/filter/' + col + '/' + val);
	$('#parametergrouplistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function parametergroup_<{$item->ACTION}>() {
        	$('#parametergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametergroup/<{$item->ACTION}>/');
        	$('#parametergrouplistform').submit();
		}
	<{/if}>
<{/foreach}>

function parametergroup_checkall(checked) {
	$('#parametergrouplist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('parametergrouplist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#parametergrouplist .top-holder').show();

		$('#parametergrouplist .top-holder .selectall').show();
		$('#parametergrouplist .top-holder .clearselection').hide();
	} else {
		$('#parametergrouplist .top-holder').hide();

	    document.parametergrouplist.parametergrouplist_selection_selectall.value = 0;
	}
}

function parametergroup_selectall() {
	parametergroup_checkall(true);

    document.parametergrouplist.parametergrouplist_selection_selectall.value = 1;

	$('#parametergrouplist .top-holder .selectall').hide();
	$('#parametergrouplist .top-holder .clearselection').show();
}

function parametergroup_clearselection() {
	parametergroup_checkall(false);

    document.parametergrouplist.parametergrouplist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.parametergroup.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="parametergroup-pagination-from"><{$limit_from}>-<span class="parametergroup-pagination-to"><{$limit_to}></span> of <span class="parametergroup-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#parametergrouplistform', 'left', '.pagination-prev');
            	bind_hotkey('#parametergrouplistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="parametergroup-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.parametergroup-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.parametergroup-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#parametergrouplistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#parametergrouplistform :focusable:first').focus();
        }

    	$('#parametergrouplistform').click(function(){
    	    var focused = $('#parametergrouplistform :focus');

    	    if (focused.length == 0) {
                $('#parametergrouplistform :focusable:first').focus();
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


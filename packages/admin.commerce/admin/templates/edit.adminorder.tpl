<{assign var='meta_description' value=$details->CUSTOMER_FIRST_NAME}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{if $details->UUID > 0}>
        <{$tmp = strtolower($smarty.const.L_ADMIN_ORDER)}>
        <{$title = "`$smarty.const.L_EDIT` $tmp"}>
    <{else}>
        <{$tmp = strtolower($smarty.const.L_ADMIN_ORDER)}>
        <{$title = "`$smarty.const.L_NEW` $tmp"}>
    <{/if}>
<{include file="top.tpl"}>

<script type="text/javascript">
function remove_attachment(element, attachment, spanid)
{
    element.value = element.value.replace(attachment, '');
    document.getElementById(spanid).style.visibility = 'hidden';
    document.getElementById(spanid).style.display = 'none';
}

function saveaddnew()
{
    $('#adminorderform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/saveaddnew/');
	$('#adminorderform').submit();
}

function saveclone()
{
    $('#adminorderform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/saveclone/');
	$('#adminorderform').submit();
}
</script>

<h1 class="heading">
    <span class="h"><{$title}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/<{if $details->UUID}>edit/<{$details->UUID}><{else}>new<{/if}>"><i class="fa fa-refresh"></i></a>

        <{if $details->UUID}>
            <!-- Live search -->
            <span id="adminorder-live-search" class="live-search edit-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#adminorder-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/adminorder/liveSearch?mode=edit&term='});

            	    $('#jquery-live-search').hide();
            	    $('#adminorderform:not(.filter) :input:visible:first').focus();
                });
            </script>
        <{/if}>
    </span>
</h1>


<div id="adminorder-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-top hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#adminorderform').submit();return false;"><span class="button-face"><{label key="L_SAVE"}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{label text="Add More"}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/cancel/"><{label key="L_CANCEL"}></a>
            <div class="clearer"></div>
        </div>
    
    <!-- Details -->
    <div class="section">
        <div>
                            <{include file="edit-main.adminorder.tpl"}>
                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminorderitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="adminordertabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.adminorderitem) }>
                    <li><a href="#tab-adminorderitems"><{label key="L_ADMIN_ORDER_ITEM"}> <span class="badge adminorderitem-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.adminorderitem) }>
                    <div id="tab-adminorderitems">
                    	<{if true || $tab == 'adminorderitems'}>
                        	<h2 class="print"><{label key="L_ADMIN_ORDER_ITEM"}></h2>
                                                            <{ajaxmodule class="WidgetListAdminOrderItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_ORDER="`$details->ID`" where=""  template='widgetlist.adminorderitem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#adminordertabs" ).tabs({
        		cookie: {
        			// store cookie for a day, without, it would be a session cookie
        			expires: 1
        		}
        	});
        });
        </script>
    <{/if}>

            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-bottom hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#adminorderform').submit();return false;"><span class="button-face"><{label key="L_SAVE"}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{label text="Add More"}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/cancel/"><{label key="L_CANCEL"}></a>
            <div class="clearer"></div>
        </div>
    
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminorderform', 'f2', 'a.button-save');
    	bind_hotkey('#adminorderform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminorderform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminorderform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminorderform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>
<script type="text/javascript">
    $(function() {
        LicenseHelper.init();
    });
</script>

<{include file="footer.tpl"}>
<{assign var='meta_description' value=$details->NAME}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{if $details->UUID > 0}>
        <{$tmp = strtolower($smarty.const.L_ADMIN_MENU)}>
        <{$title = "`$smarty.const.L_EDIT` $tmp"}>
    <{else}>
        <{$tmp = strtolower($smarty.const.L_ADMIN_MENU)}>
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
    $('#adminmenuform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/saveaddnew/');
	$('#adminmenuform').submit();
}

function saveclone()
{
    $('#adminmenuform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/saveclone/');
	$('#adminmenuform').submit();
}
</script>

<h1 class="heading">
    <span class="h"><{$title}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/<{if $details->UUID}>edit/<{$details->UUID}><{else}>new<{/if}>"><i class="fa fa-refresh"></i></a>

        <{if $details->UUID}>
            <!-- Live search -->
            <span id="adminmenu-live-search" class="live-search edit-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#adminmenu-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/adminmenu/liveSearch?mode=edit&term='});

            	    $('#jquery-live-search').hide();
            	    $('#adminmenuform:not(.filter) :input:visible:first').focus();
                });
            </script>
        <{/if}>
    </span>
</h1>


<div id="adminmenu-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-top hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#adminmenuform').submit();return false;"><span class="button-face"><{label key="L_SAVE"}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{label text="Add More"}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/cancel/"><{label key="L_CANCEL"}></a>
            <div class="clearer"></div>
        </div>
    
    <!-- Details -->
    <div class="section">
        <div>
                            <{include file="edit-main.adminmenu.tpl"}>
                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminmenuitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.dashboard) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="adminmenutabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.adminmenuitem) }>
                    <li><a href="#tab-adminmenuitems"><{label key="L_ADMIN_MENU_ITEM"}> <span class="badge adminmenuitem-badge-count"></span></a></li>
                <{/if}>
                                <{if isset($smarty.session.acl.dashboard) }>
                    <li><a href="#tab-dashboards"><{label key="L_DASHBOARD"}> <span class="badge dashboard-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.adminmenuitem) }>
                    <div id="tab-adminmenuitems">
                    	<{if true || $tab == 'adminmenuitems'}>
                        	<h2 class="print"><{label key="L_ADMIN_MENU_ITEM"}></h2>
                                                            <{ajaxmodule class="WidgetListAdminMenuItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_MENU="`$details->ID`" where=""  template='widgetlist.adminmenuitem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                            <{if isset($smarty.session.acl.dashboard) }>
                    <div id="tab-dashboards">
                    	<{if true || $tab == 'dashboards'}>
                        	<h2 class="print"><{label key="L_DASHBOARD"}></h2>
                                                            <{ajaxmodule class="WidgetListDashboard" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_MENU="`$details->ID`" where=""  template='widgetlist.dashboard.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#adminmenutabs" ).tabs({
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
                <a class="button-save" onclick="$('#adminmenuform').submit();return false;"><span class="button-face"><{label key="L_SAVE"}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{label text="Add More"}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/cancel/"><{label key="L_CANCEL"}></a>
            <div class="clearer"></div>
        </div>
    
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmenuform', 'f2', 'a.button-save');
    	bind_hotkey('#adminmenuform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminmenuform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminmenuform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminmenuform', 'esc', 'a.button-cancel');
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
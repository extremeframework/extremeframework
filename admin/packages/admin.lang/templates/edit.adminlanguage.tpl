<{assign var='meta_description' value=$details->NAME}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{if $details->UUID > 0}>
        <{$tmp1 = _t('Edit')}>
        <{$tmp2 = strtolower(_t('Admin Language'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    <{else}>
        <{$tmp1 = _t('New')}>
        <{$tmp2 = strtolower(_t('Admin Language'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
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
    $('#adminlanguageform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/saveaddnew/');
	$('#adminlanguageform').submit();
}

function saveclone()
{
    $('#adminlanguageform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/saveclone/');
	$('#adminlanguageform').submit();
}
</script>

<h1 class="heading">
    <span class="h"><{$title}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/<{if $details->UUID}>edit/<{$details->UUID}><{else}>new<{/if}>"><i class="fa fa-refresh"></i></a>

        <{if $details->UUID}>
            <!-- Live search -->
            <span id="adminlanguage-live-search" class="live-search edit-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#adminlanguage-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/adminlanguage/liveSearch?mode=edit&term='});

            	    $('#jquery-live-search').hide();
            	    $('#adminlanguageform:not(.filter) :input:visible:first').focus();
                });
            </script>
        <{/if}>
    </span>
</h1>


<div id="adminlanguage-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-top hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#adminlanguageform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/cancel/"><{_t('Cancel')}></a>
            <div class="clearer"></div>
        </div>
    
    <!-- Details -->
    <div class="section">
        <div>
                            <{include file="edit-main.adminlanguage.tpl"}>
                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminlanguageitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="adminlanguagetabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.adminlanguageitem) }>
                    <li><a href="#tab-adminlanguageitems"><{_t('Admin language item')}> <span class="badge adminlanguageitem-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.adminlanguageitem) }>
                    <div id="tab-adminlanguageitems">
                    	<{if true || $tab == 'adminlanguageitems'}>
                        	<h2 class="print"><{_t('Admin language item')}></h2>
                                                            <{ajaxmodule class="WidgetListAdminLanguageItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_LANGUAGE="`$details->ID`" where=""  template='widgetlist.adminlanguageitem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#adminlanguagetabs" ).tabs({
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
                <a class="button-save" onclick="$('#adminlanguageform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/cancel/"><{_t('Cancel')}></a>
            <div class="clearer"></div>
        </div>
    
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminlanguageform', 'f2', 'a.button-save');
    	bind_hotkey('#adminlanguageform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminlanguageform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminlanguageform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminlanguageform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>
<script type="text/javascript">
    $(function() {
        LicenseHelper.init();
    });
</script>

<{include file="footer.tpl"}>
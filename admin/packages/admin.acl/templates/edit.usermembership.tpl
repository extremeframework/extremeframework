<{assign var='meta_description' value=$details->VALID_FROM}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{if $details->UUID > 0}>
        <{$tmp1 = _t('L_EDIT')}>
        <{$tmp2 = strtolower(_t('L_USER_MEMBERSHIP'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    <{else}>
        <{$tmp1 = _t('L_NEW')}>
        <{$tmp2 = strtolower(_t('L_USER_MEMBERSHIP'))}>
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
    $('#usermembershipform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/saveaddnew/');
	$('#usermembershipform').submit();
}

function saveclone()
{
    $('#usermembershipform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/saveclone/');
	$('#usermembershipform').submit();
}
</script>

<h1 class="heading">
    <span class="h"><{$title}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/<{if $details->UUID}>edit/<{$details->UUID}><{else}>new<{/if}>"><i class="fa fa-refresh"></i></a>

        <{if $details->UUID}>
            <!-- Live search -->
            <span id="usermembership-live-search" class="live-search edit-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#usermembership-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/usermembership/liveSearch?mode=edit&term='});

            	    $('#jquery-live-search').hide();
            	    $('#usermembershipform:not(.filter) :input:visible:first').focus();
                });
            </script>
        <{/if}>
    </span>
</h1>


<div id="usermembership-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-top hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#usermembershipform').submit();return false;"><span class="button-face"><{_t('L_SAVE')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/cancel/?return=<{ContextStack::getRecentContext()}>"><{_t('L_CANCEL')}></a>
            <div class="clearer"></div>
        </div>
    
    <!-- Details -->
    <div class="section">
        <div>
                            <{include file="edit-main.usermembership.tpl"}>
                    </div>
    </div>

    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-bottom hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#usermembershipform').submit();return false;"><span class="button-face"><{_t('L_SAVE')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/cancel/?return=<{ContextStack::getRecentContext()}>"><{_t('L_CANCEL')}></a>
            <div class="clearer"></div>
        </div>
    
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#usermembershipform', 'f2', 'a.button-save');
    	bind_hotkey('#usermembershipform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#usermembershipform', 'f3', 'a.button-save-more');
    	bind_hotkey('#usermembershipform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#usermembershipform', 'esc', 'a.button-cancel');
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
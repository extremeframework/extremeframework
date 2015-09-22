<{assign var='meta_description' value=$details->ITEM}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{if $details->UUID}>
        <{$tmp1 = _t('Edit')}>
        <{$tmp2 = strtolower(_t('Recycle Bin'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    <{else}>
        <{$tmp1 = _t('New')}>
        <{$tmp2 = strtolower(_t('Recycle Bin'))}>
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
    $('#recyclebinform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/saveaddnew/');
	$('#recyclebinform').submit();
}

function saveclone()
{
    $('#recyclebinform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/saveclone/');
	$('#recyclebinform').submit();
}
</script>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{$title}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>

        <{if $details->UUID}>
            <!-- Live search -->
            <span id="recyclebin-live-search" class="live-search edit-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#recyclebin-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/recyclebin/liveSearch?mode=edit&term='});

            	    $('#jquery-live-search').hide();
            	    $('#recyclebinform:not(.filter) :input:visible:first').focus();
                });
            </script>
        <{/if}>
    </span>
</h1>


<div id="recyclebin-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-top hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#recyclebinform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/recyclebin/cancel/"><{_t('Cancel')}></a>
            <div class="clearer"></div>
        </div>
    
    <!-- Details -->
    <div class="section">
        <div>
                            <{include file="edit-main.recyclebin.tpl"}>
                    </div>
    </div>

    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-bottom hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#recyclebinform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/recyclebin/cancel/"><{_t('Cancel')}></a>
        </div>
        <div class="clearer"></div>
    
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#recyclebinform', 'f2', 'a.button-save');
    	bind_hotkey('#recyclebinform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#recyclebinform', 'f3', 'a.button-save-more');
    	bind_hotkey('#recyclebinform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#recyclebinform', 'esc', 'a.button-cancel');
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
<{assign var='meta_description' value=$details->MODULE}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{if $details->UUID > 0}>
        <{$tmp = strtolower($smarty.const.L_OBJECT_ACL)}>
        <{$title = "`$smarty.const.L_EDIT` $tmp"}>
    <{else}>
        <{$tmp = strtolower($smarty.const.L_OBJECT_ACL)}>
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
    $('#objectaclform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/saveaddnew/');
	$('#objectaclform').submit();
}

function saveclone()
{
    $('#objectaclform').attr('action', '<{$smarty.const.APPLICATION_URL}>/objectacl/saveclone/');
	$('#objectaclform').submit();
}
</script>

<h1 class="heading">
    <span class="h"><{$title}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/<{if $details->UUID}>edit/<{$details->UUID}><{else}>new<{/if}>"><i class="fa fa-refresh"></i></a>

        <{if $details->UUID}>
            <!-- Live search -->
            <span id="objectacl-live-search" class="live-search edit-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#objectacl-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/objectacl/liveSearch?mode=edit&term='});

            	    $('#jquery-live-search').hide();
            	    $('#objectaclform:not(.filter) :input:visible:first').focus();
                });
            </script>
        <{/if}>
    </span>
</h1>


<div id="objectacl-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-top hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#objectaclform').submit();return false;"><span class="button-face"><{label key="L_SAVE"}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{label text="Add More"}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/cancel/"><{label key="L_CANCEL"}></a>
            <div class="clearer"></div>
        </div>
    
    <!-- Details -->
    <div class="section">
        <div>
                            <{include file="edit-main.objectacl.tpl"}>
                    </div>
    </div>

    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-bottom hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#objectaclform').submit();return false;"><span class="button-face"><{label key="L_SAVE"}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{label text="Add More"}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/objectacl/cancel/"><{label key="L_CANCEL"}></a>
            <div class="clearer"></div>
        </div>
    
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#objectaclform', 'f2', 'a.button-save');
    	bind_hotkey('#objectaclform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#objectaclform', 'f3', 'a.button-save-more');
    	bind_hotkey('#objectaclform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#objectaclform', 'esc', 'a.button-cancel');
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
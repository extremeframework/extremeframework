    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp = strtolower($smarty.const.L_OPTION)}>
        <{$title = "`$smarty.const.L_VIEW` $tmp"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/option/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/option/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/option/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="option-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#option-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/option/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#optionview .button-edit').focus();
                });
            </script>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.option.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/option/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{$smarty.const.L_EDIT}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.option.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/option/delete/<{$details->UUID}>" title="<{$smarty.const.L_DELETE}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.option[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/option/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/option/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="optionview" class="option-view view_details mainview">

<{if isset($messages.option) }>
<{foreach from=$messages.option key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.option.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="option_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
    
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="option-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/option/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#optionview .form-field-value .column-name');
    	var mirror = $('#optionview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#optionview', 'f2', '.button-edit');
    	bind_hotkey('#optionview', 'esc', '.button-close');
    	bind_hotkey('#optionview', 'left', '.button-view-prev');
    	bind_hotkey('#optionview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#optionview :focusable:first').focus();
        }

    	$('#optionview').click(function(){
    	    var focused = $('#optionview :focus');

    	    if (focused.length == 0) {
                $('#optionview :focusable:first').focus();
    	    }
    	});
    });

            $(function() {
        	//$('.view-buttons').scrollToFixed();
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
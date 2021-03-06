<div class="loading-overlay"></div>

<div id="top-nav" class="hidden-print">
    <div class="inner">
        <{if isset($smarty.session.user) }>
            <{if Framework::hasModule('AdminMenu')}>
                <div class="navigation-toggler"><i class="fa fa-bars"></i></div>
            <{/if}>
        <{else}>
            <span style="float: left;width: 20px;">&nbsp;</span>
        <{/if}>
        <div id="application-name">
            <a href="<{$smarty.const.APPLICATION_URL}>"><{$smarty.const.CONFIG_APPLICATION_NAME}></a>
            <{if isset($smarty.session.user_message) }><span style="font-family: Arial;font-size: 13px;background-color: rgb(27, 252, 216);color:black;padding:3px 5px 3px 5px"><{$smarty.session.user_message}></span><{/if}>
        </div>
        <ul id="user-controls">
            <{if isset($smarty.session.user) }>
                <li class="status"><{_t('Hello')}> <a href="/account"><{$smarty.session.user->FIRST_NAME}> <{$smarty.session.user->LAST_NAME}></a></li>
                <li class="res-text"><a href="<{$smarty.const.APPLICATION_URL}>/authentication/logout/"><{_t('Sign out')}></a></li>
            <{else}>
                <li class="status"><{_t('You are not currenly signed in')}></li>
                <li class="res-text"><a href="<{$smarty.const.APPLICATION_URL}>/authentication/login/"><{_t('Sign in')}></a></li>
            <{/if}>
            <{if isset($smarty.session.user) }>
                <{if Framework::hasModule('Wallpaper')}>
                    <li><a href="#" id="wallpaper-selector" title="<{_t('Change background wallpaper', true)}>"><i class="fa fa-desktop"></i></a></li>
                <{/if}>
                <{if Framework::hasModule('AdminStyle')}>
                    <li><a href="#" id="style-selector" title="<{_t('Change style', true)}>"><i class="fa fa-adjust"></i></a></li>
                <{/if}>
                <li>
                    <span class="dropdown" style="margin-left:15px">
                        <i class="fa fa-gear dropdown-toggle" data-toggle="dropdown"></i>
                        <ul class="dropdown-menu pull-right">
                            <{if AclController::hasPermission('user', 'edit')}>
                                <li><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/edit-account"><{_t('Edit account information')}></a></li>
                            <{/if}>
                            <{if Framework::hasModule('AdminMenu')}>
                                <li><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/?context=settings"><{_t('Settings')}></a></li>
                            <{/if}>
                            <{if Framework::hasModule('AdminLanguage')}>
                                <li><a class="show-modal" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/quickSelect"><{_t('Change display language')}></a></li>
                            <{/if}>
                            <li><a href="<{$smarty.const.APPLICATION_URL}>/authentication/refresh"><{_t('Refresh')}></a></li>
                        </ul>
                    </span>
                </li>
                <script>
                    $(function() {
                        <{if Framework::hasModule('Wallpaper')}>
                            $('#wallpaper-selector').click(function() {
                                $('.loading').show();

                                $.ajax({
                            		url: '<{$smarty.const.APPLICATION_URL}>/wallpaper/change',
                            		success: function(data){
                        		        if ($('#admin-wallpaper').length > 0) {
                        		            $('#admin-wallpaper').remove();
                        		        }

                    		            var ele = $('<style id="admin-wallpaper"></style>').appendTo('body');

                    			        ele.html(data);

                            			$('.loading').hide();
                            		}
                            	});
                            });
                        <{/if}>

                        <{if Framework::hasModule('AdminStyle')}>
                            $('#style-selector').click(function() {
                                $('.loading').show();

                                $.ajax({
                            		url: '<{$smarty.const.APPLICATION_URL}>/adminstyle/change',
                            		success: function(data){
                        		        if ($('#admin-style').length > 0) {
                        		            $('#admin-style').remove();
                        		        }

                    		            var ele = $('<style id="admin-style"></style>').appendTo('body');

                    			        ele.html(data);

                            			$('.loading').hide();
                            		}
                            	});
                            });
                        <{/if}>
                    });
                </script>
            <{/if}>
        </ul>

        <{$has_all = false}>
        <{$has_quick = false}>

        <{foreach from=$smarty.session.flatmenu item=menuitem}>
            <{if $menuitem->ENABLE_ALL}>
                <{$has_all = true}>
            <{/if}>

            <{if $menuitem->ENABLE_QUICK}>
                <{$has_quick = true}>
            <{/if}>
        <{/foreach}>

        <{if isset($smarty.session.user) }>
            <{if $has_quick}>
                <ul id="quick-create-menu">
                    <li class="btn-group" style="margin: 0 15px 0 15px">
                        <i class="fa fa-plus" title="<{_t('Quick create', true)}>" data-toggle="dropdown" style="cursor:pointer;padding: 3px;border-radius: 10px;width: 19px;height: 18px;text-align: center;"></i>
                        <ul class="dropdown-menu quick-create-menu" style="margin:0px">
                            <li style="width:100%">
                                <span class="title"><{_t('Quick create')}></span>
                                <hr/>
                                <ul style="width:100%;margin: 0px;padding: 0px;">
                                    <{foreach from=$smarty.session.flatmenu item=menuitem}>
                                        <{if $menuitem->ENABLE_QUICK}>
                                            <li>
                                                <a class="show-modal" href="<{$menuitem->LINK}>/quickCreate"><{_t($menuitem->NAME)}></a>
                                            </li>
                                        <{/if}>
                                    <{/foreach}>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            <{/if}>
        <{/if}>

        <{if isset($smarty.session.user) }>
            <div class="top-all-menu">
                <{if $has_all}>
                    <ul id="all-menu">
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" style="cursor:pointer"><b class="caret"></b></a>
                            <ul class="dropdown-menu quick-create-menu" style="margin:0px">
                                <li style="width:100%">
                                    <span class="title"><{_t('All')}></span>
                                    <hr/>
                                    <ul style="width:100%;margin: 0px;padding: 0px;">
                                        <{foreach from=$smarty.session.flatmenu item=menuitem}>
                                            <{if $menuitem->ENABLE_ALL}>
                                                <li>
                                                    <a class="scope-page cachable" href="<{$menuitem->LINK}>"><{_t($menuitem->NAME)}></a>
                                                </li>
                                            <{/if}>
                                        <{/foreach}>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                <{/if}>
            </div>
        <{/if}>
    </div>
    <div style="clear:both"></div>
</div>
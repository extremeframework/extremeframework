<{assign var='parentmenu' value=0}>
<{assign var='currentmenu' value=0}>
<{if isset($smarty.session.flatmenu) }>
    <{foreach from=$smarty.session.flatmenu item=menuitem}>
        <{if isset($module) && $menuitem->MODULE == $module}>
            <{assign var='currentmenu' value=$menuitem->ID}>
            <{if $menuitem->PARENT}>
                <{assign var='parentmenu' value=$menuitem->PARENT}>
            <{/if}>
        <{/if}>
    <{/foreach}>
<{/if}>
<{if !$parentmenu}>
    <{assign var='parentmenu' value=$currentmenu}>
<{/if}>

<{if isset($smarty.session.user) }>
    <div class="left-side sticky-left-side" tabindex="5000" style="overflow: hidden; outline: none;">
        <div class="left-side-inner">
            <input class="navigation-quick-search" placeholder="<{$smarty.const.L_MENU_QUICK_SEARCH}>..."/>
            <{include file="menu.adminex.items.tpl" menus=$smarty.session.menu parent=0 depth=0}>
        </div>
    </div>

	<script type="text/javascript">
    	$(function(){
            $(".left-side").niceScroll({styler:"fb",cursorcolor:"#65cea7", cursorwidth: '3', cursorborderradius: '0px', background: '#424f63', spacebarenabled:false, cursorborder: '0'});

            // Active menu
            $('.sub-menu-list li').each(function(){
                var li = $(this);

                if (li.hasClass('active')) {
                    li.closest('li.menu-list').addClass('nav-active');
                }
            });

            // Toggle left menu
            $('.menu-list > a').click(function() {
                var parent = $(this).parent();
                var sub = parent.find('> ul');

                if(!$('body').hasClass('left-side-collapsed')) {
                    if(sub.is(':visible')) {
                        sub.slideUp(200, function(){
                            parent.removeClass('nav-active');

                            $('#main-body').css({height: ''});

                            mainContentHeightAdjust();
                        });
                    } else {
                        visibleSubMenuClose();

                        parent.addClass('nav-active');

                        sub.slideDown(200, function(){
                            mainContentHeightAdjust();
                        });
                    }
                }

                return false;
            });

            function visibleSubMenuClose() {
                $('.menu-list').each(function() {
                    var t = $(this);

                    if(t.hasClass('nav-active')) {
                        t.find('> ul').slideUp(200, function(){
                            t.removeClass('nav-active');
                        });
                    }
                });
            }

            function mainContentHeightAdjust() {
                // Adjust main content height
                var docHeight = $(document).height();

                if(docHeight > $('#main-body').height()) {
                    $('#main-body').height(docHeight);
                }
            }

            //  class add mouse hover
            $('.adminex-nav > li').hover(function(){
                $(this).addClass('nav-hover');
            }, function(){
                $(this).removeClass('nav-hover');
            });

            // x. Menu toggle
            var direction = $.cookie('left-side-direction');

            $('body').addClass($.cookie('left-side-state'));

            $('.navigation-toggler').off('click').on('click', function(){
                var body = $('body');

                if (body.hasClass('left-side-collapsed')) {
                    if (direction) {
                        body.removeClass('left-side-collapsed').addClass('left-side-hide');
                        $('.adminex-nav li.active ul').css({display: 'block'});
                        $(this).removeClass('menu-collapsed');

                        $.cookie('left-side-state', 'left-side-hide', { expires: 365 });
                    } else {
                        body.removeClass('left-side-collapsed').addClass('left-side-full');
                        $('.adminex-nav ul').attr('style','');
                        $(this).addClass('menu-collapsed');

                        $.cookie('left-side-state', 'left-side-full', { expires: 365 });
                    }

                    direction = !direction;
                } else {
                    direction = body.hasClass('left-side-full');

                    $(".left-side").getNiceScroll().hide();

                    body.removeClass('left-side-hide left-side-full').addClass('left-side-collapsed');
                    $('.adminex-nav ul').attr('style','');
                    $(this).addClass('menu-collapsed');

                    $.cookie('left-side-state', 'left-side-collapsed', { expires: 365 });
                }

                $.cookie('left-side-direction', direction, { expires: 365 });
            });
        });

        $(function(){
            $('.navigation-quick-search').keyup(function(){
                var input = $(this);
                var search = input.val().trim();

                $('ul.nav li').each(function(){
                    var li = $(this);
                    var text = li.text().trim();

                    var match = search.length == 0 || text.toLowerCase().indexOf(search.toLowerCase()) !== -1;

                    if (match) {
                        li.show();
                    } else {
                        li.hide();
                    }
                });
            });



        });
    </script>
<{/if}>
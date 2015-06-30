<nav id="navbar" class="site-navbar slideable no-sticky clearfix" role="navigation">
    <div id="touch-scroll" class="container">
        <div class="nav sizer">
            <div class="main">
                <ul id="main-menu" class="menu">
                    <{$menus = MenuHelper::getMenuItems(get_theme_option('main-menu'), 2)}>

                    <{foreach from=$menus.0.0 item=menuitem}>
                        <{$parent2 = $menuitem->ID}>
                        <{$depth2 = 1}>

                        <li class="menu-item <{$menuitem->CLASS}> <{if $menus.$depth2.$parent2}>has-children<{/if}>">
                            <a href="<{$menuitem->SLUG}>"><span><{$menuitem->TITLE}></span></a>

                            <{if $menus.$depth2.$parent2}>
                                <div class="sub">
                                    <div class="sub-menu">
                                        <h3><{$menuitem->TITLE}></h3>
                                        <ul class="submenu-list clearfix">
                                            <{foreach from=$menus.$depth2.$parent2 item=menuitem}>
                                                <li class="menu-item <{$menuitem->CLASS}>">
                                                    <a href="<{$menuitem->SLUG}>"><{$menuitem->TITLE}></a>
                                                </li>
                                            <{/foreach}>
                                        </ul>
                                    </div>
                                    <div class="menu-posts menu-highlights" data-category="<{$menuitem->ID_POST_CATEGORY}>"></div>
                                </div>
                            <{/if}>
                        </li>
                    <{/foreach}>
                </ul>
            </div>
            <aside class="secondary">
                <div class="search right">
                    <form class="searchform" method="get" action="<{$smarty.const.APPLICATION_URL}>/search">
                        <input name="q" type="search" class="field" value="<{label text="Search"}>..." onfocus="if(this.value=='<{label text="Search"}>...')this.value='';" onblur="if(this.value=='')this.value='<{label text="Search"}>...';"/>
                    </form>
                </div>
            </aside>
        </div>
    </div>
    <div class="nav-scroll">
        <div class="container">
            <div class="share visible-desktop left">
                <span class="heading connect-with-us"><{label text="Follow us"}></span>
                <div class="social-buttons">
                    <ul class="post-social-buttons">
                        <li class="fb">
                            <a href="<{get_theme_option('facebook-url')}>" data-href="<{get_theme_option('facebook-url')}>" class="socialite facebook-like"  title="Like <{get_theme_option('site-name')}> on Facebook" data-send="false" data-layout="button_count" data-width="70" data-show-faces="false" rel="nofollow" target="_blank"><span>&#59392;</span></a>
                        </li>
                        <li class="tw">
                            <a href="<{get_theme_option('twitter-url')}>" class="socialite twitter-follow" title="Follow <{get_theme_option('site-name')}>" data-text="<{get_theme_option('site-name')}>" data-count="horizontal" data-url="http" rel="nofollow" target="_blank"><span>&#59405;</span></a>
                        </li>
                        <li class="gp">
                            <a href="<{get_theme_option('google-plus-url')}>" class="socialite googleplus-one" data-size="medium" data-href="<{$smarty.const.APPLICATION_URL}>" rel="nofollow" target="_blank"><span>&#59404;</span></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="access right">
                <div class="right">
                    <div class="nav-toggle-link right">
                        <a id="close-nav" href="#">&#59403;</a>
                        <a id="open-nav" href="#">&#59410;</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>

<script type="text/javascript">
    $(function () {
        $('.menu-highlights').each(function () {
            var container = $(this);
            var id = container.data('category');

            if (id != '') {
                container.load("<{$smarty.const.APPLICATION_URL}>/ajax/getMenuHighlights/" + id);
            }
        });
    });
</script>
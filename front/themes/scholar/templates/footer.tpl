        <footer>
            <div class="row" id="top">
                <div class="small-12 medium-4 large-4 four columns" id="breakthroughs">
                    <p>
                        <img alt="<{get_theme_option('site-tag-line')}>" src="<{$smarty.const.THEME_URL}>/images/bg_tagline.png"/>
                        <br/>
                        <{get_theme_option('organization-name')}>
                        <br/>
                        <{get_theme_option('organization-address')}>
                        <br/>
                        <{get_theme_option('organization-phone')}>
                        <span class="divider">|</span>
                        <a class="footer-link" href="<{get_theme_option('organization-contact-url')}>" target="">Contact Us</a>
                    </p>
                </div>

                <{$menus = MenuHelper::getMenuItems(get_theme_option('footer-menu'), 2)}>
                <{foreach from=$menus.0.0 key=key item=menuitem}>
                    <{$parent2 = $menuitem->ID}>
                    <{$depth2 = 1}>

                    <div class="medium-3 large-3 three columns links <{if $key == 0}>small-7 first-links<{else}>small-5<{/if}>">
                        <span class="header"><{$menuitem->TITLE}></span>

                        <{if $menus.$depth2.$parent2}>
                            <ul>
                                <{foreach from=$menus.$depth2.$parent2 item=menuitem}>
                                    <li><a class="footer-link" href="<{$menuitem->SLUG}>"><{$menuitem->TITLE}></a></li>
                                <{/foreach}>
                            </ul>
                        <{/if}>
                    </div>
                <{/foreach}>

                <div class="small-12 medium-2 large-2 two columns social">
                    <span class="header">Follow Us</span>
                    <ul>
                        <li>
                            <a class="footer-link" href="<{get_theme_option('facebook-url')}>" target="_blank" title="Facebook">
                                <i class="fa fa-facebook">
                                    &#160;
                                </i>
                            </a>
                        </li>
                        <li>
                            <a class="footer-link" href="<{get_theme_option('twitter-url')}>" target="_blank" title="Twitter">
                                <i class="fa fa-twitter">
                                    &#160;
                                </i>
                            </a>
                        </li>
                        <li>
                            <a class="footer-link" href="<{get_theme_option('youtube-url')}>" target="_blank" title="YouTube">
                                <i class="fa fa-youtube-play">
                                    &#160;
                                </i>
                            </a>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <a class="footer-link" href="<{get_theme_option('flickr-url')}>" target="_blank" title="Flickr">
                                <i class="fa fa-flickr">
                                    &#160;
                                </i>
                            </a>
                        </li>
                        <li>
                            <a class="footer-link" href="<{get_theme_option('pinterest-url')}>" target="_blank" title="Pinterest">
                                <i class="fa fa-pinterest">
                                    &#160;
                                </i>
                            </a>
                        </li>
                        <li>
                            <a class="footer-link" href="<{get_theme_option('linkedin-url')}>" target="_blank" title="Linkedin">
                                <i class="fa fa-linkedin">
                                    &#160;
                                </i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="bottom">
                <div class="row">
                    <div class="small-12 medium-2 large-2 two columns" id="footer-img">
                        <a href="<{$smarty.const.APPLICATION_URL}>" target=""><img alt="<{get_theme_option('site-name')}>" src="<{$smarty.const.UPLOAD_URL}>/<{get_theme_option('site-logo-footer')}>"/></a>
                    </div>
                    <div class="small-12 medium-10 large-10 ten columns">
                        <p><{get_theme_option('copyright-notice')}></p>
                    </div>
                    <div class="small-12 medium-10 large-10 ten columns remove-right" id="right">
                        <p>
                            <{$menus = MenuHelper::getMenuItems(get_theme_option('footer-links'), 1)}>
                            <{foreach from=$menus.0.0 key=key item=menuitem}>
                                <{if $key}><span class="divider">|</span><{/if}>
                                <a class="footer-link" href="<{$menuitem->SLUG}>"><{$menuitem->TITLE}></a>
                            <{/foreach}>
                            <span class="divider">|</span>
                            <a class="footer-link" id="view-full-site">View Full Site</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <script src="<{$smarty.const.THEME_URL}>/js/require.js" type="text/javascript"></script>
        <script type="text/javascript">
            require(['<{$smarty.const.THEME_URL}>/js/common.js'], function (common) {
                <{if $context == "main-site"}>
                    require(['homepage']);
                <{elseif $context == "site-section"}>
                    require(['primary']);
                <{elseif $context == "news-single" || $context == "news-home" || $context == "news-category"}>
                    require(['newsfeed']);
                <{else}>
                    require(['content']);
                <{/if}>
            });
        </script>
    </body>
</html>
        </div>
    </main>
    <footer id="footer" class="site-footer slidable clearfix" role="contentinfo">
        <div class="container top">
            <div class="site-links clearfix">
                <ul>
                    <{$menus = MenuHelper::getMenuItems(get_theme_option('footer-menu'), 1)}>

                    <{foreach from=$menus.0.0 item=menuitem}>
                        <li>
                            <a href="<{$menuitem->SLUG}>"><{$menuitem->TITLE}></a>
                        </li>
                    <{/foreach}>
                </ul>
            </div>
        </div>
    </footer>

    <script type="text/javascript" src="<{$smarty.const.THEME_URL}>/js/scripts.min.js"></script>
</body>
</html>
</div>

<{if Framework::hasModule('AdminWizard')}>
    <{AdminWizardController::getCurrentWizardHtml()}>
<{/if}>

<{time_elapsed}>

<!--:mainbodyend:-->
</div>

<div class="clearer"></div>

<div id="fb-root"></div>

<script type="text/javascript">
    window.fbAsyncInit = function () {
        FB.init({
            appId: "<{get_option('facebook-oauth2-app-id')}>",
            status: true,
            cookie: true,
            xfbml: true,
            oauth: true
        });
    };

    (function () {
        var e = document.createElement('script');
        e.type = 'text/javascript';
        e.src = 'http://connect.facebook.net/en_US/all.js';
        e.async = true;
        document.getElementById('fb-root').appendChild(e);
    }());
</script>

<div id="footer">
<div class="content">
	<{$smarty.const.COPYRIGHT_NOTICE}>
</div>
</div>
<div class="clearer"></div>

<{time_elapsed}>

<!--:pagebodyend:-->
</div>

<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/apps4clouds.footer.js"></script>

<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/tiny_mce/tiny_mce_my.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/jquery-ace/ace/ace.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/jquery-ace/ace/theme-textmate.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/jquery-ace/ace/mode-css.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/jquery-ace/ace/mode-php.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/jquery-ace/jquery-ace.min.js"></script>

<style id="admin-style">
    <{if Framework::hasModule('AdminStyle')}>
        <{$key = 'user.preferences.style'}>
        <{AdminStyleController::loadStyle($smarty.session.$key)}>
    <{/if}>
</style>

<style id="admin-wallpaper">
    <{if Framework::hasModule('Wallpaper')}>
        <{$key = 'user.preferences.wallpaper'}>
        <{WallpaperController::loadStyle($smarty.session.$key)}>
    <{/if}>
</style>

<{time_elapsed}>

</body>
</html>
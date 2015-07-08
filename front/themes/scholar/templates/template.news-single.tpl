<{include file="header.tpl" context="news-single"}>

<div class="row">
    <div class="small-12 medium-12 large-12 twelve columns" id="heading">
        <{$single->TITLE}>
    </div>
    <div class="small-12 medium-12 large-12 twelve columns byline">
        <p><{if $single->AUTHOR}>by <{$single->AUTHOR}> | <{/if}><{$single->CREATION_DATE|date_format}></p>
    </div>
</div>
<div class="row" id="content">
    <div class="small-12 medium-9 large-9 nine columns" id="body-area">
        <div class="small-12 medium-12 large-11 large-offset-1 eleven columns" id="copy-area">
            <{if $single->IMAGE}>
                <p>
                    <img alt="<{$single->TITLE}>" src="<{$smarty.const.UPLOAD_URL}>/<{$single->IMAGE}>" id="mainImage">
                </p>
            <{/if}>

            <{$single->CONTENT|shortcodes}>

            <{get_theme_option('global-news-footer')}>

            <div class="share">
                <div id="facebook">
                    <div id="fb-root"></div>
                    <script src="http://connect.facebook.net/en_US/all.js#appId=194089653977418&amp;xfbml=1"></script>
                    <fb:like href="" send="false" layout="button" width="90" show_faces="false" action="recommend" font="arial"></fb:like>
                </div>
                <div id="twitter">
                    <a href="https://twitter.com/share" class="twitter-share-button" data-dnt="true" data-count="none" data-via="twitterapi">Tweet</a>
                    <script>
                        ! function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (!d.getElementById(id)) {
                                js = d.createElement(s);
                                js.id = id;
                                js.src = "https://platform.twitter.com/widgets.js";
                                fjs.parentNode.insertBefore(js, fjs);
                            }
                        }(document, "script", "twitter-wjs");
                    </script>
                </div>
                <div id="google">
                    <div class="g-plus" data-action="share" data-annotation="none"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="small-12 medium-3 large-3 three columns" id="right-column">
        <{$right_widgets = PostHelper::getPostWidgets($single, 'side-bar-right')}>

        <{if $right_widgets}>
            <{include file="widgets.tpl" widgets=$right_widgets}>
        <{/if}>

        <{include file="widget.news_feeds.tpl"}>
    </div>
</div>

<{include file="footer.tpl" context="news-single"}>
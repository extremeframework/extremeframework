<{if $share_style == "sharre"}>
    <div id="sharethispage" data-url="<{$share_url}>" data-text="<{$share_text}>" data-title="<{$share_title}>"></div>

    <script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/jquery.sharrre-1.3.4.min.js"></script>

    <script type="text/javascript">
    $('#sharethispage').sharrre({
      share: {
        twitter: true,
        facebook: true,
        googlePlus: true,
        linkedin: true,
        pinterest: true,
        digg: true,
        stumbleupon: true,
        delicious: true
      },
      buttons: {
        googlePlus: {size: 'tall'},
        facebook: {layout: 'box_count'},
        twitter: {count: 'vertical', via: '_JulienH'},
        digg: {type: 'DiggMedium'},
        delicious: {size: 'tall'},
        stumbleupon: {layout: '5'},
        linkedin: {counter: 'top'},
        pinterest: {media: 'http://sharrre.com/img/example1.png', description: $('#sharethispage').data('text'), layout: 'vertical'}
      },
      hover: function(api, options){
        $(api.element).find('.buttons').show();
      },
      hide: function(api, options){
        $(api.element).find('.buttons').hide();
      },
      enableTracking: true
    });
    </script>

    <style type="text/css">
      #sharethispage .box{
        float: left;
        margin:5px;
        padding-bottom: 10px;
      }
      #sharethispage .box a{
        color:#404040;
        text-shadow: 0 1px 1px rgba(167,167,167,.4);
        text-decoration: none;
      }
      #sharethispage .box a:hover{
        text-decoration:none;
      }
      #sharethispage .count {
        font-weight:bold;
        font-size:50px;
        float:left;
        border-right:2px solid #57b8d1;
        line-height:40px;
        padding-right:10px
      }
      #sharethispage .share {
        float:left;
        position: relative;
        top: -6px;
        margin-left:10px;
        font-size:20px;
        width:90px;
      }
      #sharethispage .buttons {
        position:absolute;
        margin: 55px 0 0 0px;
        background-color:#fff;
        border: 1px solid rgba(0,0,0,.2);
        padding:10px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.1);
        -moz-box-shadow: 0 1px 2px rgba(0,0,0,.1);
        box-shadow: 0 1px 2px rgba(0,0,0,.1);
      }
      #sharethispage .button {
        float:left;
        margin:0 15px 0 0;
      }
      #sharethispage .facebook {
      }
      #sharethispage .linkedin {
      }
      #sharethispage .pinterest {
        margin: 20px 0 0 0;
        padding-right: 10px;
      }
    </style>
    </div>
<{elseif $share_style == "simple"}>
    <div class="share-button share-button-twitter">
        <a href="https://twitter.com/share" class="twitter-share-button" data-url="<{$share_url}>" data-size="normal">Tweet</a>
        <script type="text/javascript">!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
    </div>

    <div class="share-button share-button-facebook">
        <div id="fb-root"></div>
        <script type="text/javascript">(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>

        <div class="fb-like" data-href="<{$share_url}>" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true" data-font="segoe ui"></div>
    </div>

    <div class="share-button share-button-googleplus">
        <div class="g-plusone" data-href="<{$share_url}>"></div>
        <script type="text/javascript">
          (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/plusone.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
          })();
        </script>
    </div>

    <div class="share-button share-button-linkedin">
        <script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
        <script type="IN/Share" data-url="<{$share_url}>" data-counter="right"></script>
    </div>

    <div class="share-button share-button-stumbleupon">
        <su:badge layout="1" location="<{$share_url}>"></su:badge>
        <script type="text/javascript">
          (function() {
            var li = document.createElement('script'); li.type = 'text/javascript'; li.async = true;
            li.src = ('https:' == document.location.protocol ? 'https:' : 'http:') + '//platform.stumbleupon.com/1/widgets.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(li, s);
          })();
        </script>
    </div>

    <div class="share-button share-button-pinterest">
        <a data-pin-config="beside" href="//pinterest.com/pin/create/button/?url=<{$share_url|urlencode}>&media=http%3A%2F%2Fwww.sharrre.com%2Fimg%2Fexample1.png&description=Pinterest" data-pin-do="buttonPin" ><img src="//assets.pinterest.com/images/pidgets/pin_it_button.png" /></a>
        <script type="text/javascript" src="//assets.pinterest.com/js/pinit.js"></script>
    </div>

    <style type="text/css">
        .share-button {
            float: left;
        }
        .share-button-twitter {
            margin-top:5px;
            padding-right:20px;
        }
        .share-button-facebook {
            padding-right:20px;
            margin-top:5px;
        }
        .share-button-linkedin {
            padding: 5px 20px 0 0;
        }
        .share-button-googleplus {
            margin-top:2px;
        }
        .share-button-pinterest {
            padding: 5px 20px 0 0;
        }
        .share-button-stumbleupon {
            padding: 5px 20px 0 0;
        }
    </style>
<{/if}>
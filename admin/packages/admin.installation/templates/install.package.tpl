<{include file="header.tpl"}>

<style>
.btn-heading {
    margin-left: 4px;
    padding: 4px 8px;
    position: relative;
    top: -3px;
    text-decoration: none;
    border: none;
    background: #e0e0e0;
    text-shadow: none;
    font-size: 13px;
}

.use-browse, .install-upload {
    display: none;
}

.package {
    float: left;
    width: 47%;
    border: 1px solid #E2E2E2;
    padding: 10px;
    margin: 10px 20px 10px 0;
    min-height: 200px;
}

.package .image {
    float: left;
    width: 30%;
    margin-right: 10px;
}

.package .image img {
    width: 100%;
}

.package .info {
    float: left;
    width: 65%;
}

.package .name {
    font-size: 18px;
    color: #048497;
    font-family: Helvetica;
}

.package .actions li {
    float: left;
    padding: 5px 10px;
    margin: 5px 10px 5px 0;
    border: 1px solid #E2E2E2;
}

.package .author {
    font-style: italic;
}

.package .version {
    float: right;
    font-style: italic;
}
</style>

</head>
<body>

<{include file="top.tpl"}>

<{if $type == 'package'}>
    <{$title = 'package'}>
<{elseif $type == 'plugin'}>
    <{$title = 'plugin'}>
<{elseif $type == 'theme'}>
    <{$title = 'theme'}>
<{/if}>

<h1 class="heading">
    <span class="h">Install a <{ucfirst(_t($title))}></span>
    <a href="#" class="use-upload btn-heading">Upload</a>
    <a href="#" class="use-browse btn-heading">Browse</a>
    <a class="scope-main btn-heading" style="background:none;" href="<{$smarty.const.APPLICATION_URL}>/installation/">Back</a>
</h1>

<{if $messages.installation}>
    <ul class="message" style="margin:0 0 10px 0;padding:0">
        <{foreach from=$messages.installation key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<div class="install-upload">
    <p>If you have a <{$title}> in a .zip format, you may install it by uploading it here.</p>

    <form id="installationform" class="scope-main" action="<{$smarty.const.APPLICATION_URL}>/installation/install" method="post" enctype="multipart/form-data">
        <input type="hidden" name="type" value="<{$type}>"/>

        <div class="form-row">
            <div class="form-field">
                <input type="file" name="installation_file">
            </div>
        </div>

        <div class="button-general button-save btn btn-success" style="margin: 3px;">
            <a class="button-install" onclick="$('#installationform').submit();return false;"><span class="button-face">Install</span></a>
        </div>
    </form>

    <div style="clear:both"></div>
</div>

<div class="install-browse">
    <ul>
        <li class="package">
            <div class="image"><img src="http://ps.w.org/jetpack/assets/icon.svg?rev=1173629"/></div>
            <div class="info">
                <div class="name">Extreme CMS</div>
                <ul class="actions" style="padding:0px">
                    <li><a href="#">Install</a></li>
                    <li><a href="#">Details</a></li>
                </ul>
                <div style="clear:both"></div>
                <p class="description">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat</p>
                <div>
                    <span class="author">By <a href=#" target="_blank">Viet Tran</a></span>
                    <span class="version">Version 1.2.3</span>
                </div>
            </div>
        </li>
        <li class="package">
            <div class="image"><img src="http://ps.w.org/bbpress/assets/icon.svg?rev=978290"/></div>
            <div class="info">
                <div class="name">Extreme CMS</div>
                <ul class="actions" style="padding:0px">
                    <li><a href="#">Install</a></li>
                    <li><a href="#">Details</a></li>
                </ul>
                <div style="clear:both"></div>
                <p class="description">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat</p>
                <div>
                    <span class="author">By <a href=#" target="_blank">Viet Tran</a></span>
                    <span class="version">Version 1.2.3</span>
                </div>
            </div>
        </li>
        <li class="package">
            <div class="image"><img src="http://ps.w.org/theme-check/assets/icon-128x128.png?rev=972579"/></div>
            <div class="info">
                <div class="name">Extreme CMS</div>
                <ul class="actions" style="padding:0px">
                    <li><a href="#">Install</a></li>
                    <li><a href="#">Details</a></li>
                </ul>
                <div style="clear:both"></div>
                <p class="description">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat</p>
                <div>
                    <span class="author">By <a href=#" target="_blank">Viet Tran</a></span>
                    <span class="version">Version 1.2.3</span>
                </div>
            </div>
        </li>
        <li class="package">
            <div class="image"><img src="http://ps.w.org/akismet/assets/icon-256x256.png?rev=969272"/></div>
            <div class="info">
                <div class="name">Extreme CMS</div>
                <ul class="actions" style="padding:0px">
                    <li><a href="#">Install</a></li>
                    <li><a href="#">Details</a></li>
                </ul>
                <div style="clear:both"></div>
                <p class="description">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat</p>
                <div>
                    <span class="author">By <a href=#" target="_blank">Viet Tran</a></span>
                    <span class="version">Version 1.2.3</span>
                </div>
            </div>
        </li>
    </ul>
</div>

<script type="text/javascript">
    $('.use-upload').click(function(){
        $('.use-upload').hide();
        $('.use-browse').show();

        $('.install-upload').show();
        $('.install-browse').hide();
    });

    $('.use-browse').click(function(){
        $('.use-upload').show();
        $('.use-browse').hide();

        $('.install-upload').hide();
        $('.install-browse').show();
    });
</script>

<{include file="footer.tpl"}>
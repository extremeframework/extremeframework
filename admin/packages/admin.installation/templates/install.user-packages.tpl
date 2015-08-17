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
    border: 1px solid #E2E2E2;
    padding: 10px;
    margin: 10px 20px 10px 0;
    min-height: 200px;
}

.package .image {
    float: left;
    margin-right: 10px;
}

.package .image img {
    width: 100%;
}

.package .info {
    float: left;
}

.package .name {
    font-size: 18px;
    color: #048497;
    font-family: Helvetica;
    padding-top: 5px;
}

.package .description {
    min-height: 110px;
}

.package .actions a {
    cursor: pointer;
}

.package .actions li {
    float: left;
    padding: 5px 10px;
    margin: 5px 10px 5px 0;
    border: 1px solid #E2E2E2;
}

.package .actions li.install {
    background-color: #9DC21B;
}

.package.installed .actions li.install {
    background-color: gray;
    color: white;
}

.package .actions li.install a {
    color: white;
}

.package .author {
    font-style: italic;
}

.package .version {
    float: right;
    font-style: italic;
}

@media only screen and (min-width : 768px) {
    .package {
        width: 47%;
    }

    .package .image {
        width: 30%;
    }

    .package .info {
        width: 65%;
    }
}
</style>

</head>
<body>

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><{_t('Install a package')}></span>
</h1>

<{if $messages}>
    <ul class="message" style="margin:0 0 10px 0;padding:0">
        <{foreach from=$messages key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<div class="install-browse">
    <ul>
        <{foreach from=$packages item=item}>
            <{$installed = isset($user_installed_package_ids[$item->id()])}>

            <li class="package <{if $installed}>installed<{/if}>">
                <div class="image"><img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"/></div>
                <div class="info">
                    <div class="name">
                        <{if $installed}>
                            <a class="scope-main" style="text-decoration:underline;" href="<{$smarty.const.APPLICATION_URL}>/desktop/package/<{$item->UUID}>"><{$item->NAME}></a>
                        <{else}>
                            <{$item->NAME}>
                        <{/if}>
                    </div>
                    <ul class="actions" style="padding:0px">
                        <li class="install">
                            <{if $installed}>
                                <span><{_t('Installed')}> <i class="fa fa-check"></i></span>
                            <{else}>
                                <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/installation/userpackages/<{$item->UUID}>"><i class="fa fa-cloud-download"></i> <{_t('Install')}></a>
                            <{/if}>
                        </li>
                        <li><a href="#"><{_t('Details')}></a></li>
                    </ul>
                    <div style="clear:both"></div>
                    <p class="description"><{$item->DESCRIPTION}></p>
                    <div>
                        <span class="author">By <a href=#" target="_blank"><{$item->AUTHOR}></a></span>
                        <span class="version"><{_t('Version')}> <{$item->VERSION}></span>
                    </div>
                </div>
            </li>
        <{/foreach}>
    </ul>
</div>

<{include file="footer.tpl"}>
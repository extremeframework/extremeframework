<{include file="header.tpl"}>

<div class="row">
    <div class="small-12 medium-12 large-12 twelve columns" id="breadcrumb">
        <{include file="page.breadcrumbs.tpl"}>
    </div>
</div>

<div class="row">
    <div class="small-12 medium-12 large-12 twelve columns" id="heading">
        <{$single->TITLE}>
    </div>
</div>

<div class="row" id="content">
    <div class="columns" id="body-area">
        <{if $single->IMAGE}>
            <h2>
                <img alt="<{$single->TITLE}>" src="<{$smarty.const.UPLOAD_URL}>/<{$single->IMAGE}>" width="720" height="315" >
            </h2>
        <{/if}>
        <{$single->CONTENT|shortcodes}>
    </div>
</div>

<{include file="footer.tpl"}>
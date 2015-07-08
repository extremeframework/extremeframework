<{include file="header.tpl" context="site-section"}>

<div id="fancy-header">
    <img alt="<{$single->TITLE}>" src="<{$smarty.const.UPLOAD_URL}>/<{$single->IMAGE}>"/>
    <div class="row">
        <div class="small-12 medium-12 large-3 three columns" id="heading">
            <div id="text">
                <{$single->TITLE}>
            </div>
        </div>
    </div>
</div>

<{include file="page.left-main-right.tpl" context="site-section"}>

<{include file="footer.tpl" context="site-section"}>
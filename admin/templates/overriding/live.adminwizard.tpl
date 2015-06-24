<style>
.wizard {
    position: fixed;
    bottom: 0;
    right: 0;
    xwidth: 100%;
    background-color: pink;
    z-index: 1;
    padding: 10px;
}
.wizard ul {
    float: left;
}
.wizard ul li {
    float: left;
    margin-right: 20px;
    font-weight: bold;
}
.wizard ul li p {
    margin-top: 10px;
    padding-bottom: 0;
}
.wizard .close {
    position: absolute;
    bottom: 1px;
    right: 2px;
    margin: 1px;
}
</style>

<div class="wizard">
    <ul>
        <{foreach from=$steps key=key item=item}>
            <{if $key == $current}>
                <li><i class="fa fa-hand-o-right"></i> &nbsp;(<{$current + 1}>/<{count($steps)}>) <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminwizard/restartStep"><{label text=$item->NAME}></a><p><{$item->INSTRUCTION}></p></li>
            <{/if}>
        <{/foreach}>
    </ul>
    <div class="button-general button-save btn btn-success">
        <a class="button-save scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminwizard/next"><span class="button-face"><{if !$is_last_step}><{label text="Mark as Completed"}><{else}><{label text="Finish"}><{/if}></span></a>
    </div>
    <a class="close scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminwizard/end"><i class="fa fa-times"></i></a>
</div>
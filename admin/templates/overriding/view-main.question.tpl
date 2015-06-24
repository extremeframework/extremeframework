<{plugin key="question_view_top" args="<{$details->ID}>"}>

<div id="item_<{$details->ID}>" class="std-block">
    <div class="std-block-head">
        <span class="std-block-right"></span>
        <span class="std-block-left">
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/test/view/<{$details->ID_TEST}>"><{$details->reftext_ID_TEST|escape}></a>
            <span style="margin: 0 10px">/</span>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/section/view/<{$details->ID_SECTION}>"><{$details->reftext_ID_SECTION|escape}></a>
        </span>
    </div>
    <div class="std-block-body">
        <div style="padding-bottom: 10px;">
            <{$details->QUESTION|escape|nl2br}>
        </div>
        <div>
            <{$details->OPTIONS|escape|nl2br}>
        </div>
        <div style="padding-top: 10px;">
            <strong>Score:</strong> <{$details->SCORE|escape}>
        </div>
    </div>
</div>

<{plugin key="question_view_bottom" args="<{$details->ID}>"}>
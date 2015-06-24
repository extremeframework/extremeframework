<{plugin key="question_list_before" args=""}>

<{foreach from=$rows key=counter item=row}>
    <div id="item_<{$row->ID}>" class="std-block">
        <div class="std-block-head">
            <span class="std-block-right">
                <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/question/edit/<{$row->ID}>">Edit</a>
            </span>
            <span class="std-block-left">
    			<input type="checkbox" class="questionlistchk" name="questionlist_selection[]" value="<{$row->ID}>" />
                <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/test/view/<{$row->ID_TEST}>"><{$row->reftext_ID_TEST|escape}></a>
                <span style="margin: 0 10px">/</span>
                <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/section/view/<{$row->ID_SECTION}>"><{$row->reftext_ID_SECTION|escape}></a>
            </span>
        </div>
        <div class="std-block-body">
            <div style="padding-bottom: 10px;">
                <{$row->QUESTION|escape|nl2br}>
            </div>
            <div>
                <{$row->OPTIONS|escape|nl2br}>
            </div>
            <div style="padding-top: 10px;">
                <strong>Score:</strong> <{$row->SCORE|escape}>
            </div>
        </div>
    </div>
<{/foreach}>

<{plugin key="question_list_after" args=""}>
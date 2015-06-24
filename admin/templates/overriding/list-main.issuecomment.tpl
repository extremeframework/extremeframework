<{plugin key="issuecomment_list_before" args=""}>

<{foreach from=$rows key=counter item=row}>
    <div id="item_<{$row->ID}>" class="std-block">
        <div class="std-block-head">
            <span class="std-block-right">
                <{$row->DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
            </span>
            <span class="std-block-left">
    			<input type="checkbox" class="issuecommentlistchk" name="issuecommentlist_selection[]" value="<{$row->ID}>" />
                <{$row->reftext_ID_USER|escape}>
            </span>
        </div>
        <div class="std-block-body">
            <{$row->COMMENT|escape|nl2br}>
        </div>
    </div>
<{/foreach}>

<{plugin key="issuecomment_list_after" args=""}>
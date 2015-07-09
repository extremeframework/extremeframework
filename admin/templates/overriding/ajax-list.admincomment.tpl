<style>
.comments {
    background: white;
    margin-top: 20px;
    padding: 10px;
}

.comment {
    margin: 20px 0;
    border-bottom: 1px solid rgb(232, 232, 232);
}

.comment:last-child {
    border-bottom: none;
}

.comment .comment-avatar {
    float: left;
    display: inline;
    width: 46px;
    margin: 0 16px 0 0;
}

.comment .comment-text {
    float: left;
    display: inline;
    width: 558px;
    margin: 0;
}

.comment h3 {
    margin-bottom: 2px;
    font-size: 14px;
    font-weight: bold;
    color: #287999;
}

.title-bar {
    margin: 10px 0 20px 10px;
    padding: 0 0 10px;
    font-size: 18px;
    line-height: 24px;
    font-weight: bold;
    border-bottom: 1px solid rgb(225, 233, 241);
}

.title-bar span {
    font-weight: normal;
    font-size: 16px;
}

.btn-info {
    outline: none;
    background-color: #2f96b4!important;
    padding: 4px 12px;
    box-shadow: 0px 1px 3px rgba(0,0,0,.1);
    border-radius: 4px;
    border: 1px solid #bbb;
}

.comment h3 span {
    display: inline-block;
    margin-left: 5px;
    font: 500 12px/20px "",sans-serif;
    color: #9cacb4;
    margin-bottom: 2px;
}

.comment textarea {
    width: 97%;
    height: 100px;
}

</style>

<div class="comments">
    <div class="title-bar">Discussion <{if $items}><span>(<{count($items)}>)</span><{/if}></div>

    <{foreach from=$items item=item}>
        <div class="comment" style="background-color: rgba(255, 255, 255, 0);">
    		<div class="comment-avatar">
    			<{media class="img-rounded" src=$item->PHOTO default="default-user.jpg" width="46" height="46"}>
    		</div>
    		<div class="comment-text">
    			<h3><{$item->FIRST_NAME}> <{$item->LAST_NAME}> <span><{$item->CREATION_DATE|friendly_date}></span></h3>
        		<p><{$item->COMMENT}></p>
    		</div>
    		<div style="clear:both"></div>
    	</div>
    <{/foreach}>

    <div class="comment comment-template" style="background-color: rgba(255, 255, 255, 0); display:none">
		<div class="comment-avatar">
			<{media class="img-rounded" src=$smarty.session.user->PHOTO default="default-user.jpg" width="46" height="46"}>
		</div>
		<div class="comment-text">
			<h3><{$smarty.session.user->FIRST_NAME}> <{$smarty.session.user->LAST_NAME}> <span>just now</span></h3>
    		<p>{COMMENT}</p>
		</div>
		<div style="clear:both"></div>
	</div>

    <div class="comment">
    	<div class="comment-avatar">
    	    <{media class="img-rounded" src=$smarty.session.user->PHOTO default="default-user.jpg" width="46" height="46"}>
    	</div>
    	<div class="comment-text">
    		<form id="comment-form" action="<{$smarty.const.APPLICATION_URL}>/api/admincomment/save" method="post" data-type="ajax" data-success="onCommentSuccess" data-error="onCommentError">
    		    <input type="hidden" name="admincomment_formdata_ID_USER" value="<{$smarty.session.user->ID}>" />
    		    <input type="hidden" name="admincomment_formdata_MODULE" value="<{$module}>" />
    		    <input type="hidden" name="admincomment_formdata_OBJECT_ID" value="<{$object_id}>" />
    			<textarea name="admincomment_formdata_COMMENT" placeholder="<{_t('Contribute to discussion', true)}>"></textarea>
    			<button class="btn btn-info">Submit</button>
    		</form>
    	</div>
    	<div style="clear:both"></div>
    </div>
</div>

<script type="text/javascript">
function onCommentSuccess(json) {
    if (json.success) {
        var form = $('#comment-form');
        form[0].reset();
        form.find('textarea').focus();

        var template = form.closest('.comment').siblings('.comment-template').first();

        var clone = template.clone().removeClass('comment-template');

        var html = clone.html().replace('{COMMENT}', json.data.COMMENT);

        clone.html(html).insertBefore(template).show();
    } else {
        alert(json.message);
    }
}

function onCommentError() {
    alert('Error');
}

</script>
<{plugin key="generic_list_before" args=""}>
<{plugin key="user_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="userlist" data-module="user">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-user-all" onclick="user_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('FIRST_NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['FIRST_NAME']) && ((isset($aclviewablecolumns['FIRST_NAME']) && $aclviewablecolumns['FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FIRST_NAME']) || $aclviewablecolumns['FIRST_NAME']))) }>
    	            <th class="column-first-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/first_name"><{_t('First name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('LAST_NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['LAST_NAME']) && ((isset($aclviewablecolumns['LAST_NAME']) && $aclviewablecolumns['LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LAST_NAME']) || $aclviewablecolumns['LAST_NAME']))) }>
    	            <th class="column-last-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/last_name"><{_t('Last name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PHOTO', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PHOTO']) && ((isset($aclviewablecolumns['PHOTO']) && $aclviewablecolumns['PHOTO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PHOTO']) || $aclviewablecolumns['PHOTO']))) }>
    	            <th class="column-photo">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/photo"><{_t('Photo')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('EMAIL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['EMAIL']) && ((isset($aclviewablecolumns['EMAIL']) && $aclviewablecolumns['EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EMAIL']) || $aclviewablecolumns['EMAIL']))) }>
    	            <th class="column-email">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/email"><{_t('Email')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('LOGIN', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['LOGIN']) && ((isset($aclviewablecolumns['LOGIN']) && $aclviewablecolumns['LOGIN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LOGIN']) || $aclviewablecolumns['LOGIN']))) }>
    	            <th class="column-login">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/login"><{_t('Login')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PHONE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PHONE']) && ((isset($aclviewablecolumns['PHONE']) && $aclviewablecolumns['PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PHONE']) || $aclviewablecolumns['PHONE']))) }>
    	            <th class="column-phone">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/phone"><{_t('Phone')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('GENDER', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['GENDER']) && ((isset($aclviewablecolumns['GENDER']) && $aclviewablecolumns['GENDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GENDER']) || $aclviewablecolumns['GENDER']))) }>
    	            <th class="column-gender">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/gender"><{_t('Gender')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('DATE_OF_BIRTH', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['DATE_OF_BIRTH']) && ((isset($aclviewablecolumns['DATE_OF_BIRTH']) && $aclviewablecolumns['DATE_OF_BIRTH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_OF_BIRTH']) || $aclviewablecolumns['DATE_OF_BIRTH']))) }>
    	            <th class="column-date-of-birth">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/date_of_birth"><{_t('Date of birth')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('FORCE_PASSWORD_CHANGE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['FORCE_PASSWORD_CHANGE']) && ((isset($aclviewablecolumns['FORCE_PASSWORD_CHANGE']) && $aclviewablecolumns['FORCE_PASSWORD_CHANGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FORCE_PASSWORD_CHANGE']) || $aclviewablecolumns['FORCE_PASSWORD_CHANGE']))) }>
    	            <th class="column-force-password-change">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/force_password_change"><{_t('Force password change?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_EMAIL_VERIFIED', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_EMAIL_VERIFIED']) && ((isset($aclviewablecolumns['IS_EMAIL_VERIFIED']) && $aclviewablecolumns['IS_EMAIL_VERIFIED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_EMAIL_VERIFIED']) || $aclviewablecolumns['IS_EMAIL_VERIFIED']))) }>
    	            <th class="column-is-email-verified">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/is_email_verified"><{_t('Email verified?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('LOCALE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['LOCALE']) && ((isset($aclviewablecolumns['LOCALE']) && $aclviewablecolumns['LOCALE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LOCALE']) || $aclviewablecolumns['LOCALE']))) }>
    	            <th class="column-locale">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/locale"><{_t('Locale')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CURRENCY', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CURRENCY']) && ((isset($aclviewablecolumns['CURRENCY']) && $aclviewablecolumns['CURRENCY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CURRENCY']) || $aclviewablecolumns['CURRENCY']))) }>
    	            <th class="column-currency">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/currency"><{_t('Currency')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('FACEBOOK_ID', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['FACEBOOK_ID']) && ((isset($aclviewablecolumns['FACEBOOK_ID']) && $aclviewablecolumns['FACEBOOK_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FACEBOOK_ID']) || $aclviewablecolumns['FACEBOOK_ID']))) }>
    	            <th class="column-facebook-id">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/facebook_id"><{_t('Facebook')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('FACEBOOK_OAUTH_ID', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['FACEBOOK_OAUTH_ID']) && ((isset($aclviewablecolumns['FACEBOOK_OAUTH_ID']) && $aclviewablecolumns['FACEBOOK_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FACEBOOK_OAUTH_ID']) || $aclviewablecolumns['FACEBOOK_OAUTH_ID']))) }>
    	            <th class="column-facebook-oauth-id">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/facebook_oauth_id"><{_t('Facebook oauth')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('GOOGLE_ID', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['GOOGLE_ID']) && ((isset($aclviewablecolumns['GOOGLE_ID']) && $aclviewablecolumns['GOOGLE_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GOOGLE_ID']) || $aclviewablecolumns['GOOGLE_ID']))) }>
    	            <th class="column-google-id">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/google_id"><{_t('Google')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('GOOGLE_OAUTH_ID', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['GOOGLE_OAUTH_ID']) && ((isset($aclviewablecolumns['GOOGLE_OAUTH_ID']) && $aclviewablecolumns['GOOGLE_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GOOGLE_OAUTH_ID']) || $aclviewablecolumns['GOOGLE_OAUTH_ID']))) }>
    	            <th class="column-google-oauth-id">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/google_oauth_id"><{_t('Google oauth')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('YAHOO_ID', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['YAHOO_ID']) && ((isset($aclviewablecolumns['YAHOO_ID']) && $aclviewablecolumns['YAHOO_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['YAHOO_ID']) || $aclviewablecolumns['YAHOO_ID']))) }>
    	            <th class="column-yahoo-id">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/yahoo_id"><{_t('Yahoo')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('YAHOO_OAUTH_ID', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['YAHOO_OAUTH_ID']) && ((isset($aclviewablecolumns['YAHOO_OAUTH_ID']) && $aclviewablecolumns['YAHOO_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['YAHOO_OAUTH_ID']) || $aclviewablecolumns['YAHOO_OAUTH_ID']))) }>
    	            <th class="column-yahoo-oauth-id">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/yahoo_oauth_id"><{_t('Yahoo oauth')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('IS_ENABLED', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['IS_ENABLED']) && ((isset($aclviewablecolumns['IS_ENABLED']) && $aclviewablecolumns['IS_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_ENABLED']) || $aclviewablecolumns['IS_ENABLED']))) }>
    	            <th class="column-is-enabled">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/is_enabled"><{_t('Enabled?')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
    	            <th class="column-creation-date">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/creation_date"><{_t('Creation date')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('LATEST_LOGIN', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['LATEST_LOGIN']) && ((isset($aclviewablecolumns['LATEST_LOGIN']) && $aclviewablecolumns['LATEST_LOGIN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_LOGIN']) || $aclviewablecolumns['LATEST_LOGIN']))) }>
    	            <th class="column-latest-login">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/sort/latest_login"><{_t('Latest login')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		        <{foreach from=$customfields item=item}>
            <th class="column-<{$item->COLUMN}>">
	            <{$item->NAME}>
			</th>
			<{assign var='colcount' value=$colcount+1}>
    	<{/foreach}>
		<{plugin key="user_list_columns_headers" args=""}>
		<th class="actions"></th>
	</tr>
	</thead>
    <{php}>
    	$template->assign('summable', array());
    <{/php}>
	<tbody>
	<{if $pagination}>
	<tr class="top-holder" style="display:none">
	    <td colspan="<{$colcount+2}>" style="text-align:center;">
	    	<div class="selectall">All <{$rows|@count}> <{_t('Users')|strtolower}> on this page are selected. <a onclick="user_selectall()">Select all <{$total}> <{_t('Users')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Users')|strtolower}> in the list are selected. <a onclick="user_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.user.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="user-rowedit-add"><{_t('Add item')}></span>
                	    <span class="user-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save user-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel user-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="user-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="user_list_after" args=""}>

<script type="text/javascript">
    $(document).ready(function(){
        // s. Synchronize table top scroll and bottom scroll
		var topScroll = $('.table-top-scroll');
		var bottomScroll = $('.table-bottom-scroll');

		$('.table-top-scroll-div').css('width', $('.table-bottom-scroll-div').outerWidth());
		$('.table-bottom-scroll-div').css('width', $('.table-top-scroll-div').outerWidth());

		topScroll.scroll(function(){
			bottomScroll.scrollLeft(topScroll.scrollLeft());
		});

		bottomScroll.scroll(function(){
			topScroll.scrollLeft(bottomScroll.scrollLeft());
		});

        <{if !$readonly}>
            // x. Double-click on a viewing-row to edit it
            $('#userlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/user/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.user-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#userlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/user/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.user-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.user-rowedit-save-existing').die('click').live('click', function(event) {
                event.preventDefault();

                tinyMCE.triggerSave();

                var tr = $(this).closest('tr');

                var fd = new FormData();

                if ($('input[type="file"]').length) {
                    var files = $('input[type="file"]')[0].files;
                    for (var i = 0; i < files.length; i++) {
                        fd.append("file_" + i, files[i]);
                    }
                }

                var others = tr.find(':input').serializeArray();
                $.each(others, function(key, input) {
                    fd.append(input.name, input.value);
                });

                <{if $preset}>
                    fd.append('preset', '<{$preset}>');
                    fd.append('presetvalue', '<{$presetvalue}>');
                <{/if}>

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/user/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.user-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.user-rowedit-add').click(function() {
                if ($('#userlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/user/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#userlist > tbody').append(html);

                    $('.user-rowedit-add').hide();
                    $('.user-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.user-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#userlist #item_');

                tr.remove();

                $('.user-rowedit-message').html('').hide();

                $('.user-rowedit-add').show();
                $('.user-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.user-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#userlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/user/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.user-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#userlist #item_').length == 0) {
                        $('.user-rowedit-add').show();
                        $('.user-rowedit-buttons').hide();

                        $('.user-list-count, .user-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.user-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#userlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.user-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.user-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/user/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#userlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/user/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#userlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/user/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#userform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#userlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/user/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });
            <{/if}>
            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.userlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.userlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.userlistchk').click(function(){
    		$('#userlist .top-holder').hide();

    	    document.userlist.userlist_selection_selectall.value = 0;
        });
    });
</script>
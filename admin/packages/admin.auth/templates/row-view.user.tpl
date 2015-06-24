<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> -<{$row->reftext_|ascode}>" data-id="<{$row->UUID}>">
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-user-<{$row->UUID}>" class="userlistchk" name="userlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>user_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('FIRST_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FIRST_NAME']) && ((isset($aclviewablecolumns['FIRST_NAME']) && $aclviewablecolumns['FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FIRST_NAME']) || $aclviewablecolumns['FIRST_NAME']))) }>
                <td class="column column-first-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.user.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->UUID}>"><{/if}>	<{$row->FIRST_NAME|escape}>
<{if isset($smarty.session.acl.user.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LAST_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LAST_NAME']) && ((isset($aclviewablecolumns['LAST_NAME']) && $aclviewablecolumns['LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LAST_NAME']) || $aclviewablecolumns['LAST_NAME']))) }>
                <td class="column column-last-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.user.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->UUID}>"><{/if}>	<{$row->LAST_NAME|escape}>
<{if isset($smarty.session.acl.user.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PHOTO', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PHOTO']) && ((isset($aclviewablecolumns['PHOTO']) && $aclviewablecolumns['PHOTO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PHOTO']) || $aclviewablecolumns['PHOTO']))) }>
                <td class="column column-photo image " >
                                        	<span>    <{media src=$row->PHOTO thumbnail=1}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('EMAIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['EMAIL']) && ((isset($aclviewablecolumns['EMAIL']) && $aclviewablecolumns['EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EMAIL']) || $aclviewablecolumns['EMAIL']))) }>
                <td class="column column-email email " >
                                        	<span>	<{$row->EMAIL|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LOGIN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LOGIN']) && ((isset($aclviewablecolumns['LOGIN']) && $aclviewablecolumns['LOGIN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LOGIN']) || $aclviewablecolumns['LOGIN']))) }>
                <td class="column column-login code " >
                                        	<span>	<{$row->LOGIN|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PHONE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PHONE']) && ((isset($aclviewablecolumns['PHONE']) && $aclviewablecolumns['PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PHONE']) || $aclviewablecolumns['PHONE']))) }>
                <td class="column column-phone phone " >
                                        	<span>	<{$row->PHONE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('GENDER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['GENDER']) && ((isset($aclviewablecolumns['GENDER']) && $aclviewablecolumns['GENDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GENDER']) || $aclviewablecolumns['GENDER']))) }>
                <td class="column column-gender gender " >
                                        	<span>	<{if $row->GENDER}><{label key="L_MALE"}><{else}><{label key="L_FEMALE"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('DATE_OF_BIRTH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE_OF_BIRTH']) && ((isset($aclviewablecolumns['DATE_OF_BIRTH']) && $aclviewablecolumns['DATE_OF_BIRTH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_OF_BIRTH']) || $aclviewablecolumns['DATE_OF_BIRTH']))) }>
                <td class="column column-date-of-birth date " >
                                        	<span>
            <{$row->DATE_OF_BIRTH|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('FORCE_PASSWORD_CHANGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FORCE_PASSWORD_CHANGE']) && ((isset($aclviewablecolumns['FORCE_PASSWORD_CHANGE']) && $aclviewablecolumns['FORCE_PASSWORD_CHANGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FORCE_PASSWORD_CHANGE']) || $aclviewablecolumns['FORCE_PASSWORD_CHANGE']))) }>
                <td class="column column-force-password-change yesno " data-value="<{$row->FORCE_PASSWORD_CHANGE}>" data-column="FORCE_PASSWORD_CHANGE" data-module="user">
                                        	<span>	<{if $row->FORCE_PASSWORD_CHANGE}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_EMAIL_VERIFIED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_EMAIL_VERIFIED']) && ((isset($aclviewablecolumns['IS_EMAIL_VERIFIED']) && $aclviewablecolumns['IS_EMAIL_VERIFIED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_EMAIL_VERIFIED']) || $aclviewablecolumns['IS_EMAIL_VERIFIED']))) }>
                <td class="column column-is-email-verified yesno " data-value="<{$row->IS_EMAIL_VERIFIED}>" data-column="IS_EMAIL_VERIFIED" data-module="user">
                                        	<span>	<{if $row->IS_EMAIL_VERIFIED}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('FACEBOOK_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FACEBOOK_ID']) && ((isset($aclviewablecolumns['FACEBOOK_ID']) && $aclviewablecolumns['FACEBOOK_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FACEBOOK_ID']) || $aclviewablecolumns['FACEBOOK_ID']))) }>
                <td class="column column-facebook-id key " >
                                        	<span>	<{$row->FACEBOOK_ID|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('FACEBOOK_OAUTH_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FACEBOOK_OAUTH_ID']) && ((isset($aclviewablecolumns['FACEBOOK_OAUTH_ID']) && $aclviewablecolumns['FACEBOOK_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FACEBOOK_OAUTH_ID']) || $aclviewablecolumns['FACEBOOK_OAUTH_ID']))) }>
                <td class="column column-facebook-oauth-id key " >
                                        	<span>	<{$row->FACEBOOK_OAUTH_ID|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('GOOGLE_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['GOOGLE_ID']) && ((isset($aclviewablecolumns['GOOGLE_ID']) && $aclviewablecolumns['GOOGLE_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GOOGLE_ID']) || $aclviewablecolumns['GOOGLE_ID']))) }>
                <td class="column column-google-id key " >
                                        	<span>	<{$row->GOOGLE_ID|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('GOOGLE_OAUTH_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['GOOGLE_OAUTH_ID']) && ((isset($aclviewablecolumns['GOOGLE_OAUTH_ID']) && $aclviewablecolumns['GOOGLE_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GOOGLE_OAUTH_ID']) || $aclviewablecolumns['GOOGLE_OAUTH_ID']))) }>
                <td class="column column-google-oauth-id key " >
                                        	<span>	<{$row->GOOGLE_OAUTH_ID|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('YAHOO_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['YAHOO_ID']) && ((isset($aclviewablecolumns['YAHOO_ID']) && $aclviewablecolumns['YAHOO_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['YAHOO_ID']) || $aclviewablecolumns['YAHOO_ID']))) }>
                <td class="column column-yahoo-id key " >
                                        	<span>	<{$row->YAHOO_ID|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('YAHOO_OAUTH_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['YAHOO_OAUTH_ID']) && ((isset($aclviewablecolumns['YAHOO_OAUTH_ID']) && $aclviewablecolumns['YAHOO_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['YAHOO_OAUTH_ID']) || $aclviewablecolumns['YAHOO_OAUTH_ID']))) }>
                <td class="column column-yahoo-oauth-id key " >
                                        	<span>	<{$row->YAHOO_OAUTH_ID|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('IS_ENABLED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_ENABLED']) && ((isset($aclviewablecolumns['IS_ENABLED']) && $aclviewablecolumns['IS_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_ENABLED']) || $aclviewablecolumns['IS_ENABLED']))) }>
                <td class="column column-is-enabled yesno " data-value="<{$row->IS_ENABLED}>" data-column="IS_ENABLED" data-module="user">
                                        	<span>	<{if $row->IS_ENABLED}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
                <td class="column column-creation-date datetime " >
                                        	<span>
            <{$row->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('LATEST_LOGIN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LATEST_LOGIN']) && ((isset($aclviewablecolumns['LATEST_LOGIN']) && $aclviewablecolumns['LATEST_LOGIN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_LOGIN']) || $aclviewablecolumns['LATEST_LOGIN']))) }>
                <td class="column column-latest-login datetime " >
                                        	<span>
            <{$row->LATEST_LOGIN|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="user_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.user.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{$smarty.const.L_EDIT}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.user[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/user/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{label text=$item->TITLE insidequote=true}>"></i><{else}><{label text=$item->TITLE}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/booking/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>
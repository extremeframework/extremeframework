<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="user-rowedit <{if $row->UUID}>user-rowedit-existing rowedit-existing<{/if}> <{if $messages.user.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="userlistchk" name="userlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="user_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>user_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="user_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('FIRST_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FIRST_NAME']) && ((isset($aclviewablecolumns['FIRST_NAME']) && $aclviewablecolumns['FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FIRST_NAME']) || $aclviewablecolumns['FIRST_NAME']))) }>
                <td class="column column-first-name text" >
                                            <{if (in_array('FIRST_NAME', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.FIRST_NAME) }>
                            <{assign var='tmp_value' value=$formdata.FIRST_NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-first-name" type="text" name="<{$prefix}>user_formdata_FIRST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.user.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->UUID}>"><{/if}>	<{$row->FIRST_NAME|escape}>
<{if isset($smarty.session.acl.user.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LAST_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LAST_NAME']) && ((isset($aclviewablecolumns['LAST_NAME']) && $aclviewablecolumns['LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LAST_NAME']) || $aclviewablecolumns['LAST_NAME']))) }>
                <td class="column column-last-name text" >
                                            <{if (in_array('LAST_NAME', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.LAST_NAME) }>
                            <{assign var='tmp_value' value=$formdata.LAST_NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-last-name" type="text" name="<{$prefix}>user_formdata_LAST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.user.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$row->UUID}>"><{/if}>	<{$row->LAST_NAME|escape}>
<{if isset($smarty.session.acl.user.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PHOTO', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PHOTO']) && ((isset($aclviewablecolumns['PHOTO']) && $aclviewablecolumns['PHOTO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PHOTO']) || $aclviewablecolumns['PHOTO']))) }>
                <td class="column column-photo image" >
                                            <span>    <{media src=$row->PHOTO thumbnail=1}>
</span>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('EMAIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['EMAIL']) && ((isset($aclviewablecolumns['EMAIL']) && $aclviewablecolumns['EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EMAIL']) || $aclviewablecolumns['EMAIL']))) }>
                <td class="column column-email email" >
                                            <{if (in_array('EMAIL', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.EMAIL) }>
                            <{assign var='tmp_value' value=$formdata.EMAIL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-email" type="text" name="<{$prefix}>user_formdata_EMAIL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="150"<{/if}> />
                                                <{else}>
                            <span>	<{$row->EMAIL|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LOGIN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LOGIN']) && ((isset($aclviewablecolumns['LOGIN']) && $aclviewablecolumns['LOGIN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LOGIN']) || $aclviewablecolumns['LOGIN']))) }>
                <td class="column column-login code" >
                                            <{if (in_array('LOGIN', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.LOGIN) }>
                            <{assign var='tmp_value' value=$formdata.LOGIN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-login" type="text" name="<{$prefix}>user_formdata_LOGIN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->LOGIN|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PHONE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PHONE']) && ((isset($aclviewablecolumns['PHONE']) && $aclviewablecolumns['PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PHONE']) || $aclviewablecolumns['PHONE']))) }>
                <td class="column column-phone phone" >
                                            <{if (in_array('PHONE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.PHONE) }>
                            <{assign var='tmp_value' value=$formdata.PHONE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-phone" type="text" name="<{$prefix}>user_formdata_PHONE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->PHONE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('GENDER', $filtercolumns)) }>
            <{if !isset($excludedcolumns['GENDER']) && ((isset($aclviewablecolumns['GENDER']) && $aclviewablecolumns['GENDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GENDER']) || $aclviewablecolumns['GENDER']))) }>
                <td class="column column-gender gender" >
                                            <{if (in_array('GENDER', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.GENDER) }>
                            <{assign var='tmp_value' value=$formdata.GENDER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <span class="input-type-radio"><input class="input-gender" type="radio" name="<{$prefix}>user_formdata_GENDER" value="1" <{if $formdata.GENDER}>checked="checked"<{/if}>><{_t('L_MALE')}> <input type="radio" name="<{$prefix}>user_formdata_GENDER" value="0" <{if !$formdata.GENDER}>checked="checked"<{/if}> /><{_t('L_FEMALE')}></span>
                                                <{else}>
                            <span>	<{if $row->GENDER}><{_t('L_MALE')}><{else}><{_t('L_FEMALE')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('DATE_OF_BIRTH', $filtercolumns)) }>
            <{if !isset($excludedcolumns['DATE_OF_BIRTH']) && ((isset($aclviewablecolumns['DATE_OF_BIRTH']) && $aclviewablecolumns['DATE_OF_BIRTH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_OF_BIRTH']) || $aclviewablecolumns['DATE_OF_BIRTH']))) }>
                <td class="column column-date-of-birth date" >
                                            <{if (in_array('DATE_OF_BIRTH', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.DATE_OF_BIRTH) }>
                            <{assign var='tmp_value' value=$formdata.DATE_OF_BIRTH}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-date-of-birth field-date" type="text" id="<{$prefix}>user_formdata_DATE_OF_BIRTH" name="<{$prefix}>user_formdata_DATE_OF_BIRTH" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->DATE_OF_BIRTH|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('FORCE_PASSWORD_CHANGE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FORCE_PASSWORD_CHANGE']) && ((isset($aclviewablecolumns['FORCE_PASSWORD_CHANGE']) && $aclviewablecolumns['FORCE_PASSWORD_CHANGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FORCE_PASSWORD_CHANGE']) || $aclviewablecolumns['FORCE_PASSWORD_CHANGE']))) }>
                <td class="column column-force-password-change yesno" data-value="<{$row->FORCE_PASSWORD_CHANGE}>" data-column="FORCE_PASSWORD_CHANGE" data-module="user">
                                            <{if (in_array('FORCE_PASSWORD_CHANGE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.FORCE_PASSWORD_CHANGE) }>
                            <{assign var='tmp_value' value=$formdata.FORCE_PASSWORD_CHANGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-force-password-change" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" >
                                    <option value="1" <{if $formdata.FORCE_PASSWORD_CHANGE}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.FORCE_PASSWORD_CHANGE}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-force-password-change" type="radio" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" value="1" <{if $formdata.FORCE_PASSWORD_CHANGE}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" value="0" <{if !$formdata.FORCE_PASSWORD_CHANGE}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->FORCE_PASSWORD_CHANGE}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_EMAIL_VERIFIED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_EMAIL_VERIFIED']) && ((isset($aclviewablecolumns['IS_EMAIL_VERIFIED']) && $aclviewablecolumns['IS_EMAIL_VERIFIED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_EMAIL_VERIFIED']) || $aclviewablecolumns['IS_EMAIL_VERIFIED']))) }>
                <td class="column column-is-email-verified yesno" data-value="<{$row->IS_EMAIL_VERIFIED}>" data-column="IS_EMAIL_VERIFIED" data-module="user">
                                            <{if (in_array('IS_EMAIL_VERIFIED', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_EMAIL_VERIFIED) }>
                            <{assign var='tmp_value' value=$formdata.IS_EMAIL_VERIFIED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-email-verified" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" >
                                    <option value="1" <{if $formdata.IS_EMAIL_VERIFIED}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_EMAIL_VERIFIED}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-email-verified" type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="1" <{if $formdata.IS_EMAIL_VERIFIED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="0" <{if !$formdata.IS_EMAIL_VERIFIED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_EMAIL_VERIFIED}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('FACEBOOK_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FACEBOOK_ID']) && ((isset($aclviewablecolumns['FACEBOOK_ID']) && $aclviewablecolumns['FACEBOOK_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FACEBOOK_ID']) || $aclviewablecolumns['FACEBOOK_ID']))) }>
                <td class="column column-facebook-id key" >
                                            <{if (in_array('FACEBOOK_ID', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.FACEBOOK_ID) }>
                            <{assign var='tmp_value' value=$formdata.FACEBOOK_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-facebook-id" type="text" name="<{$prefix}>user_formdata_FACEBOOK_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->FACEBOOK_ID|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('FACEBOOK_OAUTH_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['FACEBOOK_OAUTH_ID']) && ((isset($aclviewablecolumns['FACEBOOK_OAUTH_ID']) && $aclviewablecolumns['FACEBOOK_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FACEBOOK_OAUTH_ID']) || $aclviewablecolumns['FACEBOOK_OAUTH_ID']))) }>
                <td class="column column-facebook-oauth-id key" >
                                            <{if (in_array('FACEBOOK_OAUTH_ID', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.FACEBOOK_OAUTH_ID) }>
                            <{assign var='tmp_value' value=$formdata.FACEBOOK_OAUTH_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-facebook-oauth-id" type="text" name="<{$prefix}>user_formdata_FACEBOOK_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->FACEBOOK_OAUTH_ID|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('GOOGLE_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['GOOGLE_ID']) && ((isset($aclviewablecolumns['GOOGLE_ID']) && $aclviewablecolumns['GOOGLE_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GOOGLE_ID']) || $aclviewablecolumns['GOOGLE_ID']))) }>
                <td class="column column-google-id key" >
                                            <{if (in_array('GOOGLE_ID', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.GOOGLE_ID) }>
                            <{assign var='tmp_value' value=$formdata.GOOGLE_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-google-id" type="text" name="<{$prefix}>user_formdata_GOOGLE_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->GOOGLE_ID|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('GOOGLE_OAUTH_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['GOOGLE_OAUTH_ID']) && ((isset($aclviewablecolumns['GOOGLE_OAUTH_ID']) && $aclviewablecolumns['GOOGLE_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GOOGLE_OAUTH_ID']) || $aclviewablecolumns['GOOGLE_OAUTH_ID']))) }>
                <td class="column column-google-oauth-id key" >
                                            <{if (in_array('GOOGLE_OAUTH_ID', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.GOOGLE_OAUTH_ID) }>
                            <{assign var='tmp_value' value=$formdata.GOOGLE_OAUTH_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-google-oauth-id" type="text" name="<{$prefix}>user_formdata_GOOGLE_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->GOOGLE_OAUTH_ID|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('YAHOO_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['YAHOO_ID']) && ((isset($aclviewablecolumns['YAHOO_ID']) && $aclviewablecolumns['YAHOO_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['YAHOO_ID']) || $aclviewablecolumns['YAHOO_ID']))) }>
                <td class="column column-yahoo-id key" >
                                            <{if (in_array('YAHOO_ID', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.YAHOO_ID) }>
                            <{assign var='tmp_value' value=$formdata.YAHOO_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-yahoo-id" type="text" name="<{$prefix}>user_formdata_YAHOO_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->YAHOO_ID|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('YAHOO_OAUTH_ID', $filtercolumns)) }>
            <{if !isset($excludedcolumns['YAHOO_OAUTH_ID']) && ((isset($aclviewablecolumns['YAHOO_OAUTH_ID']) && $aclviewablecolumns['YAHOO_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['YAHOO_OAUTH_ID']) || $aclviewablecolumns['YAHOO_OAUTH_ID']))) }>
                <td class="column column-yahoo-oauth-id key" >
                                            <{if (in_array('YAHOO_OAUTH_ID', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.YAHOO_OAUTH_ID) }>
                            <{assign var='tmp_value' value=$formdata.YAHOO_OAUTH_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-yahoo-oauth-id" type="text" name="<{$prefix}>user_formdata_YAHOO_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->YAHOO_OAUTH_ID|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('IS_ENABLED', $filtercolumns)) }>
            <{if !isset($excludedcolumns['IS_ENABLED']) && ((isset($aclviewablecolumns['IS_ENABLED']) && $aclviewablecolumns['IS_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_ENABLED']) || $aclviewablecolumns['IS_ENABLED']))) }>
                <td class="column column-is-enabled yesno" data-value="<{$row->IS_ENABLED}>" data-column="IS_ENABLED" data-module="user">
                                            <{if (in_array('IS_ENABLED', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.IS_ENABLED) }>
                            <{assign var='tmp_value' value=$formdata.IS_ENABLED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-enabled" name="<{$prefix}>user_formdata_IS_ENABLED" >
                                    <option value="1" <{if $formdata.IS_ENABLED}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_ENABLED}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="1" <{if $formdata.IS_ENABLED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="0" <{if !$formdata.IS_ENABLED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                                                <{else}>
                            <span>	<{if $row->IS_ENABLED}><{_t('L_YES')}><{else}><{_t('L_NO')}><{/if}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
                <td class="column column-creation-date datetime" >
                                            <{if (in_array('CREATION_DATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CREATION_DATE) }>
                            <{assign var='tmp_value' value=$formdata.CREATION_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-creation-date field-date" type="text" id="<{$prefix}>user_formdata_CREATION_DATE" name="<{$prefix}>user_formdata_CREATION_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('LATEST_LOGIN', $filtercolumns)) }>
            <{if !isset($excludedcolumns['LATEST_LOGIN']) && ((isset($aclviewablecolumns['LATEST_LOGIN']) && $aclviewablecolumns['LATEST_LOGIN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_LOGIN']) || $aclviewablecolumns['LATEST_LOGIN']))) }>
                <td class="column column-latest-login datetime" >
                                            <{if (in_array('LATEST_LOGIN', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.LATEST_LOGIN) }>
                            <{assign var='tmp_value' value=$formdata.LATEST_LOGIN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-latest-login field-date" type="text" id="<{$prefix}>user_formdata_LATEST_LOGIN" name="<{$prefix}>user_formdata_LATEST_LOGIN" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->LATEST_LOGIN|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{include file="item.edit.tpl" customfield=$item id=$row->UUID value=CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<td class="actions">
	    <{if $row->UUID}>
    	    <div class="user-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.user.0}>
        $('.user-rowedit-message').html('<{$messages.user.0}>').show();
    <{/if}>

    $('#userlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#userlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#userlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#userlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.user-rowedit-save').click();
        }
    });

    bind_hotkey("#userlist > tbody tr.rowedit input[type=text]", 'f2', '.user-rowedit-save');
    bind_hotkey("#userlist > tbody tr.rowedit input[type=text]", 'esc', '.user-rowedit-cancel');
</script>



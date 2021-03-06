<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="userform" id="userform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/user/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="user_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="user_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="user_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-first-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['FIRST_NAME'])}>
    
        <{if $preset == 'FIRST_NAME'}>
            <input type="hidden" class="input-first-name" name="user_formdata_FIRST_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FIRST_NAME']) && !$acleditablecolumns['FIRST_NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FIRST_NAME'])}>
            <input type="hidden" class="input-first-name" name="user_formdata_FIRST_NAME" value="<{$details->FIRST_NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('First name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-first-name" colspan="3">
                                    

    <input class="input-first-name input-type-text" type="text" name="<{$prefix}>user_formdata_FIRST_NAME" value="<{$details->FIRST_NAME|escape}>"  />
                    <{if $columntooltips.FIRST_NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.FIRST_NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-last-name">
            
        
        
        
        <{if !isset($excludedcolumns['LAST_NAME'])}>
    
        <{if $preset == 'LAST_NAME'}>
            <input type="hidden" class="input-last-name" name="user_formdata_LAST_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LAST_NAME']) && !$acleditablecolumns['LAST_NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LAST_NAME'])}>
            <input type="hidden" class="input-last-name" name="user_formdata_LAST_NAME" value="<{$details->LAST_NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Last name')}></label>
            </td>
            <td class="form-field form-field-value column-last-name" colspan="3">
                                    

    <input class="input-last-name input-type-text" type="text" name="<{$prefix}>user_formdata_LAST_NAME" value="<{$details->LAST_NAME|escape}>"  />
                    <{if $columntooltips.LAST_NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.LAST_NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-photo">
            
        
        
        
        <{if !isset($excludedcolumns['PHOTO'])}>
    
        <{if $preset == 'PHOTO'}>
            <input type="hidden" class="input-photo" name="user_formdata_PHOTO" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PHOTO']) && !$acleditablecolumns['PHOTO'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PHOTO'])}>
            <input type="hidden" class="input-photo" name="user_formdata_PHOTO" value="<{$details->PHOTO}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Photo')}></label>
            </td>
            <td class="form-field form-field-value column-photo" colspan="3">
                                    

	<input class="input-photo input-type-file" type="file" name="<{$prefix}>user_formdata_PHOTO" />
    <span class="input-sizes-width-height"><input type="text" name="PHOTO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="PHOTO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->PHOTO}><div style="clear:both"></div><span id="<{$prefix}>user_PHOTO"><{media src=$details->PHOTO}> <a onclick="remove_attachment(document.userform.<{$prefix}>user_formdata_PHOTO, '<{$details->PHOTO}>', '<{$prefix}>user_PHOTO')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>user_formdata_PHOTO" value="<{$details->PHOTO}>" />
                    <{if $columntooltips.PHOTO}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PHOTO}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-email form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['EMAIL'])}>
    
        <{if $preset == 'EMAIL'}>
            <input type="hidden" class="input-email" name="user_formdata_EMAIL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['EMAIL']) && !$acleditablecolumns['EMAIL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['EMAIL'])}>
            <input type="hidden" class="input-email" name="user_formdata_EMAIL" value="<{$details->EMAIL}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Email')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-email" colspan="3">
                                    

    <input class="input-email input-type-text" type="text" name="<{$prefix}>user_formdata_EMAIL" value="<{$details->EMAIL|escape}>"  />
                    <{if $columntooltips.EMAIL}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.EMAIL}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-login form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['LOGIN'])}>
    
        <{if $preset == 'LOGIN'}>
            <input type="hidden" class="input-login" name="user_formdata_LOGIN" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LOGIN']) && !$acleditablecolumns['LOGIN'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LOGIN'])}>
            <input type="hidden" class="input-login" name="user_formdata_LOGIN" value="<{$details->LOGIN}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Login')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-login" colspan="3">
                                    

    <input class="input-login input-type-text" type="text" name="<{$prefix}>user_formdata_LOGIN" value="<{$details->LOGIN|escape}>"  />
                    <{if $columntooltips.LOGIN}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.LOGIN}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-password form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['PASSWORD'])}>
    
        <{if $preset == 'PASSWORD'}>
            <input type="hidden" class="input-password" name="user_formdata_PASSWORD" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PASSWORD']) && !$acleditablecolumns['PASSWORD'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PASSWORD'])}>
            <input type="hidden" class="input-password" name="user_formdata_PASSWORD" value="<{$details->PASSWORD}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Password')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-password" colspan="3">
                                    

    <input class="input-password input-type-password" type="password" name="<{$prefix}>user_formdata_PASSWORD" value="<{if $details->PASSWORD}>*****<{/if}>" />
                    <{if $columntooltips.PASSWORD}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PASSWORD}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-phone">
            
        
        
        
        <{if !isset($excludedcolumns['PHONE'])}>
    
        <{if $preset == 'PHONE'}>
            <input type="hidden" class="input-phone" name="user_formdata_PHONE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PHONE']) && !$acleditablecolumns['PHONE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PHONE'])}>
            <input type="hidden" class="input-phone" name="user_formdata_PHONE" value="<{$details->PHONE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Phone')}></label>
            </td>
            <td class="form-field form-field-value column-phone" colspan="3">
                                    

    <input class="input-phone input-type-text" type="text" name="<{$prefix}>user_formdata_PHONE" value="<{$details->PHONE|escape}>"  />
                    <{if $columntooltips.PHONE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PHONE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-gender">
            
        
        
        
        <{if !isset($excludedcolumns['GENDER'])}>
    
        <{if $preset == 'GENDER'}>
            <input type="hidden" class="input-gender" name="user_formdata_GENDER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['GENDER']) && !$acleditablecolumns['GENDER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['GENDER'])}>
            <input type="hidden" class="input-gender" name="user_formdata_GENDER" value="<{$details->GENDER}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Gender')}></label>
            </td>
            <td class="form-field form-field-value column-gender" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-gender" type="radio" name="<{$prefix}>user_formdata_GENDER" value="1" <{if $details->GENDER}>checked="checked"<{/if}>><{_t('Male')}> <input type="radio" name="<{$prefix}>user_formdata_GENDER" value="0" <{if !$details->GENDER}>checked="checked"<{/if}> /><{_t('Female')}></span>
                    <{if $columntooltips.GENDER}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.GENDER}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-date-of-birth">
            
        
        
        
        <{if !isset($excludedcolumns['DATE_OF_BIRTH'])}>
    
        <{if $preset == 'DATE_OF_BIRTH'}>
            <input type="hidden" class="input-date-of-birth" name="user_formdata_DATE_OF_BIRTH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DATE_OF_BIRTH']) && !$acleditablecolumns['DATE_OF_BIRTH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DATE_OF_BIRTH'])}>
            <input type="hidden" class="input-date-of-birth" name="user_formdata_DATE_OF_BIRTH" value="<{$details->DATE_OF_BIRTH}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Date of birth')}></label>
            </td>
            <td class="form-field form-field-value column-date-of-birth" colspan="3">
                                    
    <input class="input-date-of-birth input-type-date field-date" type="text" id="<{$prefix}>user_formdata_DATE_OF_BIRTH" name="<{$prefix}>user_formdata_DATE_OF_BIRTH" value="<{$details->DATE_OF_BIRTH|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.DATE_OF_BIRTH}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.DATE_OF_BIRTH}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-force-password-change">
            
        
        
        
        <{if !isset($excludedcolumns['FORCE_PASSWORD_CHANGE'])}>
    
        <{if $preset == 'FORCE_PASSWORD_CHANGE'}>
            <input type="hidden" class="input-force-password-change" name="user_formdata_FORCE_PASSWORD_CHANGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FORCE_PASSWORD_CHANGE']) && !$acleditablecolumns['FORCE_PASSWORD_CHANGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FORCE_PASSWORD_CHANGE'])}>
            <input type="hidden" class="input-force-password-change" name="user_formdata_FORCE_PASSWORD_CHANGE" value="<{$details->FORCE_PASSWORD_CHANGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Force password change?')}></label>
            </td>
            <td class="form-field form-field-value column-force-password-change" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-force-password-change" type="radio" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" value="1" <{if $details->FORCE_PASSWORD_CHANGE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" value="0" <{if !$details->FORCE_PASSWORD_CHANGE}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.FORCE_PASSWORD_CHANGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.FORCE_PASSWORD_CHANGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-is-email-verified">
            
        
        
        
        <{if !isset($excludedcolumns['IS_EMAIL_VERIFIED'])}>
    
        <{if $preset == 'IS_EMAIL_VERIFIED'}>
            <input type="hidden" class="input-is-email-verified" name="user_formdata_IS_EMAIL_VERIFIED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_EMAIL_VERIFIED']) && !$acleditablecolumns['IS_EMAIL_VERIFIED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_EMAIL_VERIFIED'])}>
            <input type="hidden" class="input-is-email-verified" name="user_formdata_IS_EMAIL_VERIFIED" value="<{$details->IS_EMAIL_VERIFIED}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Email verified?')}></label>
            </td>
            <td class="form-field form-field-value column-is-email-verified" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-is-email-verified" type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="1" <{if $details->IS_EMAIL_VERIFIED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="0" <{if !$details->IS_EMAIL_VERIFIED}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.IS_EMAIL_VERIFIED}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IS_EMAIL_VERIFIED}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-locale">
            
        
        
        
        <{if !isset($excludedcolumns['LOCALE'])}>
    
        <{if $preset == 'LOCALE'}>
            <input type="hidden" class="input-locale" name="user_formdata_LOCALE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LOCALE']) && !$acleditablecolumns['LOCALE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LOCALE'])}>
            <input type="hidden" class="input-locale" name="user_formdata_LOCALE" value="<{$details->LOCALE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Locale')}></label>
            </td>
            <td class="form-field form-field-value column-locale" colspan="3">
                                    

    <input class="input-locale input-type-text" type="text" name="<{$prefix}>user_formdata_LOCALE" value="<{$details->LOCALE|escape}>"  />
                    <{if $columntooltips.LOCALE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.LOCALE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-currency">
            
        
        
        
        <{if !isset($excludedcolumns['CURRENCY'])}>
    
        <{if $preset == 'CURRENCY'}>
            <input type="hidden" class="input-currency" name="user_formdata_CURRENCY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CURRENCY']) && !$acleditablecolumns['CURRENCY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CURRENCY'])}>
            <input type="hidden" class="input-currency" name="user_formdata_CURRENCY" value="<{$details->CURRENCY}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Currency')}></label>
            </td>
            <td class="form-field form-field-value column-currency" colspan="3">
                                    

    <input class="input-currency input-type-text" type="text" name="<{$prefix}>user_formdata_CURRENCY" value="<{$details->CURRENCY|escape}>"  />
                    <{if $columntooltips.CURRENCY}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CURRENCY}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-facebook-id">
            
        
        
        
        <{if !isset($excludedcolumns['FACEBOOK_ID'])}>
    
        <{if $preset == 'FACEBOOK_ID'}>
            <input type="hidden" class="input-facebook-id" name="user_formdata_FACEBOOK_ID" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FACEBOOK_ID']) && !$acleditablecolumns['FACEBOOK_ID'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FACEBOOK_ID'])}>
            <input type="hidden" class="input-facebook-id" name="user_formdata_FACEBOOK_ID" value="<{$details->FACEBOOK_ID}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Facebook')}></label>
            </td>
            <td class="form-field form-field-value column-facebook-id" colspan="3">
                                    

    <input class="input-facebook-id input-type-text" type="text" name="<{$prefix}>user_formdata_FACEBOOK_ID" value="<{$details->FACEBOOK_ID|escape}>"  />
                    <{if $columntooltips.FACEBOOK_ID}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.FACEBOOK_ID}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-facebook-oauth-id">
            
        
        
        
        <{if !isset($excludedcolumns['FACEBOOK_OAUTH_ID'])}>
    
        <{if $preset == 'FACEBOOK_OAUTH_ID'}>
            <input type="hidden" class="input-facebook-oauth-id" name="user_formdata_FACEBOOK_OAUTH_ID" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FACEBOOK_OAUTH_ID']) && !$acleditablecolumns['FACEBOOK_OAUTH_ID'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FACEBOOK_OAUTH_ID'])}>
            <input type="hidden" class="input-facebook-oauth-id" name="user_formdata_FACEBOOK_OAUTH_ID" value="<{$details->FACEBOOK_OAUTH_ID}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Facebook oauth')}></label>
            </td>
            <td class="form-field form-field-value column-facebook-oauth-id" colspan="3">
                                    

    <input class="input-facebook-oauth-id input-type-text" type="text" name="<{$prefix}>user_formdata_FACEBOOK_OAUTH_ID" value="<{$details->FACEBOOK_OAUTH_ID|escape}>"  />
                    <{if $columntooltips.FACEBOOK_OAUTH_ID}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.FACEBOOK_OAUTH_ID}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-google-id">
            
        
        
        
        <{if !isset($excludedcolumns['GOOGLE_ID'])}>
    
        <{if $preset == 'GOOGLE_ID'}>
            <input type="hidden" class="input-google-id" name="user_formdata_GOOGLE_ID" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['GOOGLE_ID']) && !$acleditablecolumns['GOOGLE_ID'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['GOOGLE_ID'])}>
            <input type="hidden" class="input-google-id" name="user_formdata_GOOGLE_ID" value="<{$details->GOOGLE_ID}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Google')}></label>
            </td>
            <td class="form-field form-field-value column-google-id" colspan="3">
                                    

    <input class="input-google-id input-type-text" type="text" name="<{$prefix}>user_formdata_GOOGLE_ID" value="<{$details->GOOGLE_ID|escape}>"  />
                    <{if $columntooltips.GOOGLE_ID}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.GOOGLE_ID}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-google-oauth-id">
            
        
        
        
        <{if !isset($excludedcolumns['GOOGLE_OAUTH_ID'])}>
    
        <{if $preset == 'GOOGLE_OAUTH_ID'}>
            <input type="hidden" class="input-google-oauth-id" name="user_formdata_GOOGLE_OAUTH_ID" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['GOOGLE_OAUTH_ID']) && !$acleditablecolumns['GOOGLE_OAUTH_ID'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['GOOGLE_OAUTH_ID'])}>
            <input type="hidden" class="input-google-oauth-id" name="user_formdata_GOOGLE_OAUTH_ID" value="<{$details->GOOGLE_OAUTH_ID}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Google oauth')}></label>
            </td>
            <td class="form-field form-field-value column-google-oauth-id" colspan="3">
                                    

    <input class="input-google-oauth-id input-type-text" type="text" name="<{$prefix}>user_formdata_GOOGLE_OAUTH_ID" value="<{$details->GOOGLE_OAUTH_ID|escape}>"  />
                    <{if $columntooltips.GOOGLE_OAUTH_ID}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.GOOGLE_OAUTH_ID}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-yahoo-id">
            
        
        
        
        <{if !isset($excludedcolumns['YAHOO_ID'])}>
    
        <{if $preset == 'YAHOO_ID'}>
            <input type="hidden" class="input-yahoo-id" name="user_formdata_YAHOO_ID" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['YAHOO_ID']) && !$acleditablecolumns['YAHOO_ID'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['YAHOO_ID'])}>
            <input type="hidden" class="input-yahoo-id" name="user_formdata_YAHOO_ID" value="<{$details->YAHOO_ID}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Yahoo')}></label>
            </td>
            <td class="form-field form-field-value column-yahoo-id" colspan="3">
                                    

    <input class="input-yahoo-id input-type-text" type="text" name="<{$prefix}>user_formdata_YAHOO_ID" value="<{$details->YAHOO_ID|escape}>"  />
                    <{if $columntooltips.YAHOO_ID}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.YAHOO_ID}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-yahoo-oauth-id">
            
        
        
        
        <{if !isset($excludedcolumns['YAHOO_OAUTH_ID'])}>
    
        <{if $preset == 'YAHOO_OAUTH_ID'}>
            <input type="hidden" class="input-yahoo-oauth-id" name="user_formdata_YAHOO_OAUTH_ID" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['YAHOO_OAUTH_ID']) && !$acleditablecolumns['YAHOO_OAUTH_ID'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['YAHOO_OAUTH_ID'])}>
            <input type="hidden" class="input-yahoo-oauth-id" name="user_formdata_YAHOO_OAUTH_ID" value="<{$details->YAHOO_OAUTH_ID}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Yahoo oauth')}></label>
            </td>
            <td class="form-field form-field-value column-yahoo-oauth-id" colspan="3">
                                    

    <input class="input-yahoo-oauth-id input-type-text" type="text" name="<{$prefix}>user_formdata_YAHOO_OAUTH_ID" value="<{$details->YAHOO_OAUTH_ID|escape}>"  />
                    <{if $columntooltips.YAHOO_OAUTH_ID}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.YAHOO_OAUTH_ID}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-is-enabled">
            
        
        
        
        <{if !isset($excludedcolumns['IS_ENABLED'])}>
    
        <{if $preset == 'IS_ENABLED'}>
            <input type="hidden" class="input-is-enabled" name="user_formdata_IS_ENABLED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_ENABLED']) && !$acleditablecolumns['IS_ENABLED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_ENABLED'])}>
            <input type="hidden" class="input-is-enabled" name="user_formdata_IS_ENABLED" value="<{$details->IS_ENABLED}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Enabled?')}></label>
            </td>
            <td class="form-field form-field-value column-is-enabled" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="1" <{if $details->IS_ENABLED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="0" <{if !$details->IS_ENABLED}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.IS_ENABLED}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IS_ENABLED}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-creation-date">
            
        
        
                    </tr>                                                                                            
<tr class="form-row form-row-latest-login">
            
        
        
        
        <{if !isset($excludedcolumns['LATEST_LOGIN'])}>
    
        <{if $preset == 'LATEST_LOGIN'}>
            <input type="hidden" class="input-latest-login" name="user_formdata_LATEST_LOGIN" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LATEST_LOGIN']) && !$acleditablecolumns['LATEST_LOGIN'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LATEST_LOGIN'])}>
            <input type="hidden" class="input-latest-login" name="user_formdata_LATEST_LOGIN" value="<{$details->LATEST_LOGIN}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Latest login')}></label>
            </td>
            <td class="form-field form-field-value column-latest-login" colspan="3">
                                    
    <input class="input-latest-login input-type-date field-date" type="text" id="<{$prefix}>user_formdata_LATEST_LOGIN" name="<{$prefix}>user_formdata_LATEST_LOGIN" value="<{$details->LATEST_LOGIN|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.LATEST_LOGIN}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.LATEST_LOGIN}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                    
                    <!-- Custom fields -->
                    <{if $customfields}>
    <{foreach from=$customfields item=item}>
        <tr class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
    		<td>
                <div class="form-field form-field-label">
        		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                </div>
            </td>
            <td colspan="3">
                <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                    <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                    <{if $item->TOOLTIP}>
                        <i class="fa fa-info-circle" title="<{$item->TOOLTIP}>"></i>
                    <{/if}>
                </div>
            </td>
		</tr>
	<{/foreach}>
<{/if}>                </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{plugin key="user_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#userform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#userform :input').change(function() {
        $('#userform').data('changed', true);
    });

        function saveDraft() {
        if ($('#userform').length) {
            if ($('#userform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/user/savedraft/",
                    data: $('#userform').serialize()
                });

                $('#userform').data('changed', false);
            }
        }
    }

    $(function() {
        if (window.saveDraftTimer !== 'undefined' && window.saveDraftTimer != null) {
            window.clearInterval(window.saveDraftTimer);
        }

        window.saveDraftTimer = window.setInterval(saveDraft, <{$smarty.const.SAVE_DRAFT_INTERVAL}> * 1000);
    });
    </script>

<script type="text/javascript">
    $(function() {
        $('.message li').each(function(){
            var li = $(this);
            var field = li.data('error-field');
            var target = $('.input-' + field);

            target.closest('tr').addClass('form-row-with-error');

            li.css('cursor', 'pointer').click(function(){
                target.focus();
            });
        });
    });
</script>

<script type="text/javascript">
    ///////////////////////////////////////////////////////////////////////////////
    // VISIBILITY REFLECTION
    user_get_editing_model = function () {
        var model = {};

        var formdata = $('#userform').find('[name*=user_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('user_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    user_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    user_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            user_apply_block_visibility(key, value);
        });
    }

    user_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    user_update_visibility_settings = function () {
        var model = user_get_editing_model();

        var settings = user_get_visibility_settings(model);

        user_apply_visibility_settings(settings);
    }

    $(function() {
        $('#userform :input').change(function() {
            user_update_visibility_settings();
        });

        user_update_visibility_settings();
    });
</script>
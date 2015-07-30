<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-user">

<{include file="top.tpl"}>

<script type="text/javascript">
function remove_attachment(element, attachment, spanid)
{
    element.value = element.value.replace(attachment, '');
    document.getElementById(spanid).style.visibility = 'hidden';
    document.getElementById(spanid).style.display = 'none';
}
</script>

<h1 class="heading">
    <span class="h"><{$formtitle}></span>
</h1>

<div class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-top hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#userform').attr('action', '<{$actionurl}>');$('#userform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>

    <!-- Details -->
    <div class="section" style="padding: 10px 0;">
        <div>
            <div class="edit-main edit_details">
                <{if $messages}>
                    <ul class="message">
                        <{foreach from=$messages key=field item=message}>
                            <li data-error-field="<{$field}>"><{$message}></li>
                        <{/foreach}>
                    </ul>
                <{/if}>

                <form name="userform" id="userform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$columns item=column }>
                                <{if $columnsettings.$column }>
                                    <tr class="form-row form-row-<{$columnsettings.$column->code}> <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t($columnsettings.$column->text)}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-<{$columnsettings.$column->code}>">
                                                <{include file="input-item.tpl"}>
                                            </div>
                                        </td>
                                    </tr>

                            
                                <{elseif $column == 'FIRST_NAME' }>
                                    <tr class="form-row form-row-first-name <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('First name')}><{if in_array('FIRST_NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-first-name">
                                                                        <{$tmp_value = $formdataFIRST_NAME}>

                        
                            <input class="input-first-name" type="text" name="<{$prefix}>user_formdata_FIRST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'LAST_NAME' }>
                                    <tr class="form-row form-row-last-name <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Last name')}><{if in_array('LAST_NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-last-name">
                                                                        <{$tmp_value = $formdataLAST_NAME}>

                        
                            <input class="input-last-name" type="text" name="<{$prefix}>user_formdata_LAST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PHOTO' }>
                                    <tr class="form-row form-row-photo <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Photo')}><{if in_array('PHOTO', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-photo">
                                                                        <{$tmp_value = $formdataPHOTO}>

                                                    <{if $force_image_input}>
                                <input class="input-photo" type="text" name="<{$prefix}>user_formdata_PHOTO" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-photo" type="file" name="<{$prefix}>user_formdata_PHOTO" />
                                <span class="input-sizes-width-height"><input type="text" name="PHOTO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="PHOTO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.PHOTO}><div style="clear:both"></div><span id="<{$prefix}>user_PHOTO"><{media src=$formdata.PHOTO}> <a onclick="remove_attachment(document.userform.<{$prefix}>user_formdata_PHOTO, '<{$tmp_value}>', '<{$prefix}>user_PHOTO')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>user_formdata_PHOTO" value="<{$tmp_value}>" />
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'EMAIL' }>
                                    <tr class="form-row form-row-email <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Email')}><{if in_array('EMAIL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-email">
                                                                        <{$tmp_value = $formdataEMAIL}>

                        
                            <input class="input-email" type="text" name="<{$prefix}>user_formdata_EMAIL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="32"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'LOGIN' }>
                                    <tr class="form-row form-row-login <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Login')}><{if in_array('LOGIN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-login">
                                                                        <{$tmp_value = $formdataLOGIN}>

                        
                            <input class="input-login" type="text" name="<{$prefix}>user_formdata_LOGIN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PASSWORD' }>
                                    <tr class="form-row form-row-password <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Password')}><{if in_array('PASSWORD', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-password">
                                                                        <{$tmp_value = $formdataPASSWORD}>

                        
                            <input class="input-password" type="password" name="<{$prefix}>user_formdata_PASSWORD" value="<{if $tmp_value}>*****<{/if}>" />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PHONE' }>
                                    <tr class="form-row form-row-phone <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Phone')}><{if in_array('PHONE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-phone">
                                                                        <{$tmp_value = $formdataPHONE}>

                        
                            <input class="input-phone" type="text" name="<{$prefix}>user_formdata_PHONE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'GENDER' }>
                                    <tr class="form-row form-row-gender <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Gender')}><{if in_array('GENDER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-gender">
                                                                        <{$tmp_value = $formdataGENDER}>

                        
                            <span class="input-type-radio"><input class="input-gender" type="radio" name="<{$prefix}>user_formdata_GENDER" value="1" <{if $formdata.GENDER}>checked="checked"<{/if}>><{_t('Male')}> <input type="radio" name="<{$prefix}>user_formdata_GENDER" value="0" <{if !$formdata.GENDER}>checked="checked"<{/if}> /><{_t('Female')}></span>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'DATE_OF_BIRTH' }>
                                    <tr class="form-row form-row-date-of-birth <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Date of birth')}><{if in_array('DATE_OF_BIRTH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-date-of-birth">
                                                                        <{$tmp_value = $formdataDATE_OF_BIRTH}>

                                                    <input class="input-date-of-birth field-date" type="text" id="<{$prefix}>user_formdata_DATE_OF_BIRTH" name="<{$prefix}>user_formdata_DATE_OF_BIRTH" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'FORCE_PASSWORD_CHANGE' }>
                                    <tr class="form-row form-row-force-password-change <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Force password change?')}><{if in_array('FORCE_PASSWORD_CHANGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-force-password-change">
                                                                        <{$tmp_value = $formdataFORCE_PASSWORD_CHANGE}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-force-password-change" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" >
                                    <option value="1" <{if $formdata.FORCE_PASSWORD_CHANGE}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.FORCE_PASSWORD_CHANGE}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-force-password-change" type="radio" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" value="1" <{if $formdata.FORCE_PASSWORD_CHANGE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" value="0" <{if !$formdata.FORCE_PASSWORD_CHANGE}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'IS_EMAIL_VERIFIED' }>
                                    <tr class="form-row form-row-is-email-verified <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Email verified?')}><{if in_array('IS_EMAIL_VERIFIED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-is-email-verified">
                                                                        <{$tmp_value = $formdataIS_EMAIL_VERIFIED}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-email-verified" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" >
                                    <option value="1" <{if $formdata.IS_EMAIL_VERIFIED}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_EMAIL_VERIFIED}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-email-verified" type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="1" <{if $formdata.IS_EMAIL_VERIFIED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="0" <{if !$formdata.IS_EMAIL_VERIFIED}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'LOCALE' }>
                                    <tr class="form-row form-row-locale <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Locale')}><{if in_array('LOCALE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-locale">
                                                                        <{$tmp_value = $formdataLOCALE}>

                        
                            <input class="input-locale" type="text" name="<{$prefix}>user_formdata_LOCALE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CURRENCY' }>
                                    <tr class="form-row form-row-currency <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Currency')}><{if in_array('CURRENCY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-currency">
                                                                        <{$tmp_value = $formdataCURRENCY}>

                        
                            <input class="input-currency" type="text" name="<{$prefix}>user_formdata_CURRENCY" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'FACEBOOK_ID' }>
                                    <tr class="form-row form-row-facebook-id <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Facebook')}><{if in_array('FACEBOOK_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-facebook-id">
                                                                        <{$tmp_value = $formdataFACEBOOK_ID}>

                        
                            <input class="input-facebook-id" type="text" name="<{$prefix}>user_formdata_FACEBOOK_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'FACEBOOK_OAUTH_ID' }>
                                    <tr class="form-row form-row-facebook-oauth-id <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Facebook oauth')}><{if in_array('FACEBOOK_OAUTH_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-facebook-oauth-id">
                                                                        <{$tmp_value = $formdataFACEBOOK_OAUTH_ID}>

                        
                            <input class="input-facebook-oauth-id" type="text" name="<{$prefix}>user_formdata_FACEBOOK_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'GOOGLE_ID' }>
                                    <tr class="form-row form-row-google-id <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Google')}><{if in_array('GOOGLE_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-google-id">
                                                                        <{$tmp_value = $formdataGOOGLE_ID}>

                        
                            <input class="input-google-id" type="text" name="<{$prefix}>user_formdata_GOOGLE_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'GOOGLE_OAUTH_ID' }>
                                    <tr class="form-row form-row-google-oauth-id <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Google oauth')}><{if in_array('GOOGLE_OAUTH_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-google-oauth-id">
                                                                        <{$tmp_value = $formdataGOOGLE_OAUTH_ID}>

                        
                            <input class="input-google-oauth-id" type="text" name="<{$prefix}>user_formdata_GOOGLE_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'YAHOO_ID' }>
                                    <tr class="form-row form-row-yahoo-id <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Yahoo')}><{if in_array('YAHOO_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-yahoo-id">
                                                                        <{$tmp_value = $formdataYAHOO_ID}>

                        
                            <input class="input-yahoo-id" type="text" name="<{$prefix}>user_formdata_YAHOO_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'YAHOO_OAUTH_ID' }>
                                    <tr class="form-row form-row-yahoo-oauth-id <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Yahoo oauth')}><{if in_array('YAHOO_OAUTH_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-yahoo-oauth-id">
                                                                        <{$tmp_value = $formdataYAHOO_OAUTH_ID}>

                        
                            <input class="input-yahoo-oauth-id" type="text" name="<{$prefix}>user_formdata_YAHOO_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'IS_ENABLED' }>
                                    <tr class="form-row form-row-is-enabled <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Enabled?')}><{if in_array('IS_ENABLED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-is-enabled">
                                                                        <{$tmp_value = $formdataIS_ENABLED}>

                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-enabled" name="<{$prefix}>user_formdata_IS_ENABLED" >
                                    <option value="1" <{if $formdata.IS_ENABLED}>selected="selected"<{/if}>><{_t('Yes')}></option>
                                    <option value="0" <{if !$formdata.IS_ENABLED}>selected="selected"<{/if}>><{_t('No')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="1" <{if $formdata.IS_ENABLED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="0" <{if !$formdata.IS_ENABLED}>checked="checked"<{/if}> /><{_t('No')}></span>
                            <{/if}>
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CREATION_DATE' }>
                                    <tr class="form-row form-row-creation-date <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Creation date')}><{if in_array('CREATION_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-creation-date">
                                                                        <{$tmp_value = $formdataCREATION_DATE}>

                        
                            <input class="input-creation-date" type="text" name="<{$prefix}>user_formdata_CREATION_DATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'LATEST_LOGIN' }>
                                    <tr class="form-row form-row-latest-login <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Latest login')}><{if in_array('LATEST_LOGIN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-latest-login">
                                                                        <{$tmp_value = $formdataLATEST_LOGIN}>

                                                    <input class="input-latest-login field-date" type="text" id="<{$prefix}>user_formdata_LATEST_LOGIN" name="<{$prefix}>user_formdata_LATEST_LOGIN" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{/if}>
                            <{/foreach}>
                        </tbody>
                    </table>
                </form>
            </div>
    	</div>
        <div class="clearer"></div>
    </div>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-bottom hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#userform').attr('action', '<{$actionurl}>');$('#userform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#userform', 'f2', '.button-save');
    	bind_hotkey('#userform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#userform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>
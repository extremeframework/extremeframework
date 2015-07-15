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

<h2 class="heading"><{$formtitle}></h2>

<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=field item=message}>
            <li data-error-field="<{$field}>"><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="userform" id="userform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

<!-- Details -->
<div class="section" style="padding: 10px 0;">
    <div>
        <{foreach from=$columns item=column }>
                <{if $columnsettings.$column }>
                	<div class="form-row <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{$columnsettings.$column->text}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-<{$columnsettings.$column->code}>">
                		    <{include file="input-item.tpl"}>
                		</div>
                	</div>
            
                <{elseif $column == 'FIRST_NAME' }>
                	<div class="form-row <{if in_array('FIRST_NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_FIRST_NAME')}><{if in_array('FIRST_NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-first-name">

                                                    <{if isset($formdata.FIRST_NAME) }>
                            <{assign var='tmp_value' value=$formdata.FIRST_NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-first-name" type="text" name="<{$prefix}>user_formdata_FIRST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'LAST_NAME' }>
                	<div class="form-row <{if in_array('LAST_NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_LAST_NAME')}><{if in_array('LAST_NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-last-name">

                                                    <{if isset($formdata.LAST_NAME) }>
                            <{assign var='tmp_value' value=$formdata.LAST_NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-last-name" type="text" name="<{$prefix}>user_formdata_LAST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PHOTO' }>
                	<div class="form-row <{if in_array('PHOTO', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PHOTO')}><{if in_array('PHOTO', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-photo">

                                                    <{if isset($formdata.PHOTO) }>
                            <{assign var='tmp_value' value=$formdata.PHOTO}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_image_input}>
                                <input class="input-photo" type="text" name="<{$prefix}>user_formdata_PHOTO" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-photo" type="file" name="<{$prefix}>user_formdata_PHOTO" />
                                <span class="input-sizes-width-height"><input type="text" name="PHOTO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="PHOTO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.PHOTO}><div style="clear:both"></div><span id="<{$prefix}>user_PHOTO"><{media src=$formdata.PHOTO}> <a onclick="remove_attachment(document.userform.<{$prefix}>user_formdata_PHOTO, '<{$tmp_value}>', '<{$prefix}>user_PHOTO')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>user_formdata_PHOTO" value="<{$tmp_value}>" />
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'EMAIL' }>
                	<div class="form-row <{if in_array('EMAIL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_EMAIL')}><{if in_array('EMAIL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-email">

                                                    <{if isset($formdata.EMAIL) }>
                            <{assign var='tmp_value' value=$formdata.EMAIL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-email" type="text" name="<{$prefix}>user_formdata_EMAIL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="32"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'LOGIN' }>
                	<div class="form-row <{if in_array('LOGIN', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_LOGIN')}><{if in_array('LOGIN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-login">

                                                    <{if isset($formdata.LOGIN) }>
                            <{assign var='tmp_value' value=$formdata.LOGIN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-login" type="text" name="<{$prefix}>user_formdata_LOGIN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PASSWORD' }>
                	<div class="form-row <{if in_array('PASSWORD', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PASSWORD')}><{if in_array('PASSWORD', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-password">

                                                    <{if isset($formdata.PASSWORD) }>
                            <{assign var='tmp_value' value=$formdata.PASSWORD}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-password" type="password" name="<{$prefix}>user_formdata_PASSWORD" value="<{if $tmp_value}>*****<{/if}>" />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PHONE' }>
                	<div class="form-row <{if in_array('PHONE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PHONE')}><{if in_array('PHONE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-phone">

                                                    <{if isset($formdata.PHONE) }>
                            <{assign var='tmp_value' value=$formdata.PHONE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-phone" type="text" name="<{$prefix}>user_formdata_PHONE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'GENDER' }>
                	<div class="form-row <{if in_array('GENDER', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_GENDER')}><{if in_array('GENDER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-gender">

                                                    <{if isset($formdata.GENDER) }>
                            <{assign var='tmp_value' value=$formdata.GENDER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <span class="input-type-radio"><input class="input-gender" type="radio" name="<{$prefix}>user_formdata_GENDER" value="1" <{if $formdata.GENDER}>checked="checked"<{/if}>><{_t('L_MALE')}> <input type="radio" name="<{$prefix}>user_formdata_GENDER" value="0" <{if !$formdata.GENDER}>checked="checked"<{/if}> /><{_t('L_FEMALE')}></span>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'DATE_OF_BIRTH' }>
                	<div class="form-row <{if in_array('DATE_OF_BIRTH', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_DATE_OF_BIRTH')}><{if in_array('DATE_OF_BIRTH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-date-of-birth">

                                                    <{if isset($formdata.DATE_OF_BIRTH) }>
                            <{assign var='tmp_value' value=$formdata.DATE_OF_BIRTH}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-date-of-birth field-date" type="text" id="<{$prefix}>user_formdata_DATE_OF_BIRTH" name="<{$prefix}>user_formdata_DATE_OF_BIRTH" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'FORCE_PASSWORD_CHANGE' }>
                	<div class="form-row <{if in_array('FORCE_PASSWORD_CHANGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_FORCE_PASSWORD_CHANGE')}><{if in_array('FORCE_PASSWORD_CHANGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-force-password-change">

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
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_EMAIL_VERIFIED' }>
                	<div class="form-row <{if in_array('IS_EMAIL_VERIFIED', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_EMAIL_VERIFIED')}><{if in_array('IS_EMAIL_VERIFIED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-email-verified">

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
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'FACEBOOK_ID' }>
                	<div class="form-row <{if in_array('FACEBOOK_ID', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_FACEBOOK')}><{if in_array('FACEBOOK_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-facebook-id">

                                                    <{if isset($formdata.FACEBOOK_ID) }>
                            <{assign var='tmp_value' value=$formdata.FACEBOOK_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-facebook-id" type="text" name="<{$prefix}>user_formdata_FACEBOOK_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'FACEBOOK_OAUTH_ID' }>
                	<div class="form-row <{if in_array('FACEBOOK_OAUTH_ID', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_FACEBOOK_OAUTH')}><{if in_array('FACEBOOK_OAUTH_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-facebook-oauth-id">

                                                    <{if isset($formdata.FACEBOOK_OAUTH_ID) }>
                            <{assign var='tmp_value' value=$formdata.FACEBOOK_OAUTH_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-facebook-oauth-id" type="text" name="<{$prefix}>user_formdata_FACEBOOK_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'GOOGLE_ID' }>
                	<div class="form-row <{if in_array('GOOGLE_ID', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_GOOGLE')}><{if in_array('GOOGLE_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-google-id">

                                                    <{if isset($formdata.GOOGLE_ID) }>
                            <{assign var='tmp_value' value=$formdata.GOOGLE_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-google-id" type="text" name="<{$prefix}>user_formdata_GOOGLE_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'GOOGLE_OAUTH_ID' }>
                	<div class="form-row <{if in_array('GOOGLE_OAUTH_ID', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_GOOGLE_OAUTH')}><{if in_array('GOOGLE_OAUTH_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-google-oauth-id">

                                                    <{if isset($formdata.GOOGLE_OAUTH_ID) }>
                            <{assign var='tmp_value' value=$formdata.GOOGLE_OAUTH_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-google-oauth-id" type="text" name="<{$prefix}>user_formdata_GOOGLE_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'YAHOO_ID' }>
                	<div class="form-row <{if in_array('YAHOO_ID', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_YAHOO')}><{if in_array('YAHOO_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-yahoo-id">

                                                    <{if isset($formdata.YAHOO_ID) }>
                            <{assign var='tmp_value' value=$formdata.YAHOO_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-yahoo-id" type="text" name="<{$prefix}>user_formdata_YAHOO_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'YAHOO_OAUTH_ID' }>
                	<div class="form-row <{if in_array('YAHOO_OAUTH_ID', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_YAHOO_OAUTH')}><{if in_array('YAHOO_OAUTH_ID', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-yahoo-oauth-id">

                                                    <{if isset($formdata.YAHOO_OAUTH_ID) }>
                            <{assign var='tmp_value' value=$formdata.YAHOO_OAUTH_ID}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-yahoo-oauth-id" type="text" name="<{$prefix}>user_formdata_YAHOO_OAUTH_ID" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_ENABLED' }>
                	<div class="form-row <{if in_array('IS_ENABLED', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_ENABLED')}><{if in_array('IS_ENABLED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-enabled">

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
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CREATION_DATE' }>
                	<div class="form-row <{if in_array('CREATION_DATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CREATION_DATE')}><{if in_array('CREATION_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-creation-date">

                                                    <{if isset($formdata.CREATION_DATE) }>
                            <{assign var='tmp_value' value=$formdata.CREATION_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-creation-date" type="text" name="<{$prefix}>user_formdata_CREATION_DATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'LATEST_LOGIN' }>
                	<div class="form-row <{if in_array('LATEST_LOGIN', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_LATEST_LOGIN')}><{if in_array('LATEST_LOGIN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-latest-login">

                                                    <{if isset($formdata.LATEST_LOGIN) }>
                            <{assign var='tmp_value' value=$formdata.LATEST_LOGIN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-latest-login field-date" type="text" id="<{$prefix}>user_formdata_LATEST_LOGIN" name="<{$prefix}>user_formdata_LATEST_LOGIN" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#userform').attr('action', '<{$actionurl}>');$('#userform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


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
</script>

<{include file="footer.tpl"}>
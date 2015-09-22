<{include file="header.tpl"}>
<script type="text/javascript">
    var RecaptchaOptions = {
        theme : 'clean',
        lang : '<{$smarty.session.lang}>'
    };
</script>

<style>
.user-register .content-inner {
    margin: auto;
    padding: 0 20px;
    max-width: 620px;
}

.user-register .edit_details .equal-split>tbody>tr>td:nth-child(odd) {
    border-bottom: none!important;
}

a.button-register {
    font-weight: bold;
    padding: 5px 10px;
}
</style>
</head>
<body class="module user-register">

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{_t('Create an Account')}></span>
</h1>

<div class="edit_details">
    <!-- Details -->
    <div class="section">
        <div>
            <div class="edit-main edit_details">
                <{if $message}>
                    <ul class="message">
                        <li><{$message}></li>
                    </ul>
                <{/if}>

                <form name="userform" id="userform" action="<{$smarty.const.APPLICATION_URL}>/user/register" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-custom-layout equal-split" style="margin-top:10px;">
                        <tbody>
                            <tr class="form-row form-row-first-name">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('First name')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-first-name">
                                        <input class="input-first-name input-type-text" type="text" name="user_formdata_FIRST_NAME" value="<{$details->FIRST_NAME|escape}>"/>
                                    </div>
                                </td>
                            </tr>
                            <tr class="form-row form-row-last-name">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Last name')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-last-name">
                                        <input class="input-last-name input-type-text" type="text" name="user_formdata_LAST_NAME" value="<{$details->LAST_NAME|escape}>"/>
                                    </div>
                                </td>
                            </tr>
                            <tr class="form-row form-row-email">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Email address')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-email">
                                        <input class="input-email input-type-text" type="text" name="user_formdata_EMAIL" value="<{$details->EMAIL|escape}>"/>
                                        <div style="padding:5px 0 5px 0">(<{_t('account activation information will be sent to this address')}>)</div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="form-row form-row-password">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Create an account password')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-password">
                                        <input class="input-password input-type-text" type="password" name="user_formdata_PASSWORD" value="<{$details->PASSWORD}>"/>
                                    </div>
                                </td>
                            </tr>
                            <tr class="form-row form-row-password">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Retype the password')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-password2">
                                        <input class="input-password input-type-text" type="password" name="PASSWORD2" value="<{$details->PASSWORD2}>"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                	<div class="form-row form-row-mandatory">
                		<label><{_t('Please type the number (as shown in the image) to the box below it')}></label>
                		<div class="form-field column-captcha">
                            <{$captcha}>
                		</div>
                    </div>
                	<div class="form-row form-row-mandatory">
                		<div class="form-field column-tos">
                		    <input type="checkbox" name="ACCEPT_TOS" value="1"/>&nbsp;
                		    <span><{_t('I accept the')}> <a href="<{$smarty.const.APPLICATION_URL}>/terms" style="text-decoration:none" target="_blank"><{_t('Terms of service')}></a> <{_t('of')}> <{$smarty.const.ORGANIZATION_NAME_SHORT}></span>
                		</div>
                    </div>
                	<div class="form-row form-row-mandatory">
                		<div class="form-field column-newsletter">
                		    <input type="checkbox" name="ACCEPT_NEWSLETTER" value="1"/>&nbsp;
                		    <span><{_t('I would like to receive information updates from')}> <{$smarty.const.ORGANIZATION_NAME_SHORT}></span>
                		</div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Control buttons -->
    <div style="margin-top: 10px;">
        <div class="button-general button-save btn btn-success">
            <a class="button-register" onclick="$('#userform').submit();return false;"><span class="button-face"><{_t('Register')}></span></a>
        </div>
        <div class="clearer"></div>
    </div>
</div>

<{include file="footer.tpl"}>
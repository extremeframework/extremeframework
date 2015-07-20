<{include file="header.tpl"}>
<script type="text/javascript">
    var RecaptchaOptions = {
        theme : 'clean',
        lang : '<{$smarty.session.lang}>'
    };
</script>
</head>
<body>

<{include file="headerbar.tpl"}>

<div id="container">
<div id="main-body" class="main-content">

<div id="heading">
    <div class="inner">
        <h1>Create an Account</h1>
    </div>
</div>

<div class="content-inner">

<form name="userform" id="userform" action="<{$smarty.const.APPLICATION_URL}>/user/register" method="post" enctype="multipart/form-data">
    <div class="section">
        <div>
            <{if $message}>
                <p style="color:red;"><{$message}></p>
            <{/if}>
        	<div class="form-row form-row-mandatory">
        		<label>Your first name</label>
        		<div class="form-field column-first-name">
                    <input class="input-first-name" type="text" name="<{$prefix}>user_formdata_FIRST_NAME" value="<{$details->FIRST_NAME|escape}>" size="40">
        		</div>
        	</div>
        	<div class="form-row form-row-mandatory">
        		<label>Your last name</label>
        		<div class="form-field column-last-name">
                    <input class="input-last-name" type="text" name="<{$prefix}>user_formdata_LAST_NAME" value="<{$details->LAST_NAME|escape}>" size="40">
        		</div>
        	</div>
        	<div class="form-row form-row-mandatory">
        		<label>Email address</label>
        		<div class="form-field column-email">
                    <input class="input-email" type="text" name="<{$prefix}>user_formdata_EMAIL" value="<{$details->EMAIL|escape}>" size="40">
                    <div style="padding:5px 0 5px 0">(account activation information will be sent to this address)</div>
        		</div>
        	</div>
        	<div class="form-row form-row-mandatory">
        		<label>Create an account password</label>
        		<div class="form-field column-password">
                    <input class="input-password" type="password" name="<{$prefix}>user_formdata_PASSWORD" value="<{$details->PASSWORD}>">
        		</div>
        	</div>
        	<div class="form-row form-row-mandatory">
        		<label>Retype the password</label>
        		<div class="form-field column-password2">
                    <input class="input-password2" type="password" name="PASSWORD2" value="<{$details->PASSWORD2}>">
        		</div>
        	</div>
        	<div class="form-row form-row-mandatory">
        		<label>Please type the number (as shown in the image) to the box below it</label>
        		<div class="form-field column-captcha">
                    <{$captcha}>
        		</div>
            </div>
        	<div class="form-row form-row-mandatory">
        		<div class="form-field column-tos">
        		    <input type="checkbox" name="ACCEPT_TOS" value="1"/>&nbsp;
        		    <span>I accept the <a href="<{$smarty.const.APPLICATION_URL}>/scopes/cms/terms-of-service" style="text-decoration:none" target="_blank">Terms of service</a> of <{$smarty.const.ORGANIZATION_NAME_SHORT}></span>
        		</div>
            </div>
        	<div class="form-row form-row-mandatory">
        		<div class="form-field column-newsletter">
        		    <input type="checkbox" name="ACCEPT_NEWSLETTER" value="1"/>&nbsp;
        		    <span>I would like to receive new updates, promotions or special offers from <{$smarty.const.ORGANIZATION_NAME_SHORT}></span>
        		</div>
            </div>
        </div>
    </div>
    <div class="clearer"></div>
    <div class="button-bar buttons">
        <div class="button-general button-save">
            <a class="button-save" onclick="$('#userform').submit();return false;"><span class="button-face">Register</span></a>
        </div>
        <div class="clearer"></div>
    </div>
</form>

<{include file="footer.tpl"}>
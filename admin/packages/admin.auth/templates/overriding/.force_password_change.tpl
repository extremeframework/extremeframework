<{include file="header.tpl"}>
<title>Change password</title>

</head>
<body class="force-password-change" id="signin">
<{assign var='title' value=_t('Force password change')}>
<{include file="top.tpl"}>

<h1 class="heading"><span class="h"><{$title}></span></h1>

<{if ($errors) }>
<span style="color:red"><{$errors[0]}></span>
<{/if}>

<div id="signin-form">
<form action="<{$smarty.const.APPLICATION_URL}>/authentication/changepassword/" method="post">
    <div class="form-row">
        <label style="width:130px"><{_t('New password')}></label>
        <div class="form-field">
            <input name="password" type="password" autocorrect="off" autocapitalize="off" id="signin_username" style="width:200px"/>
        </div>
    </div>

	<div class="clearer"></div>

    <div class="form-row">
		<label style="width:130px"><{_t('Confirm new password')}></label>
		<div class="form-field">
		    <input name="confirmpassword" type="password" autocorrect="off" autocapitalize="off" id="signin_password" style="width:200px"/>
		</div>
	</div>

    <div class="clearer"></div>

    <div class="buttons" style="margin:0 0 0 245px">
        <span class="button-general ">
            <button value="1" class="button large" type="submit"><span class="button-face"><{_t('Change')}></span></button>
        </span>
    </div>
</form>
</div>

<{include file="footer.tpl"}>
<{include file="header.tpl"}>
</head>
<body>

<{include file="headerbar.tpl"}>

<div id="container">
<div id="main-body" class="main-content">

<div id="heading">
    <div class="inner">
        <h1>Reset Password</h1>
    </div>
</div>

<div class="content-inner">

<form name="userform" id="userform" action="<{$smarty.const.APPLICATION_URL}>/user/reset" method="post" enctype="multipart/form-data">
    <input type="hidden" name="c" value="<{$compound}>"/>
    <div class="section">
        <div>
            <{if $message}>
                <p style="color:red;"><{$message}></p>
            <{/if}>
        	<div class="form-row form-row-mandatory">
        		<label>Enter a new password<span class="mandatory">*</span></label>
        		<div class="form-field column-password">
                    <input class="input-password" type="password" name="PASSWORD" value="" size="32">
        		</div>
        	</div>
        	<div class="form-row form-row-mandatory">
        		<label>Retype the password<span class="mandatory">*</span></label>
        		<div class="form-field column-password2">
                    <input class="input-password2" type="password" name="PASSWORD2" value="" size="32">
        		</div>
        	</div>
        </div>
    </div>
    <div class="clearer"></div>
    <div class="button-bar buttons">
        <div class="button-general button-save">
            <a class="button-save" onclick="$('#userform').submit();return false;"><span class="button-face">Change</span></a>
        </div>
        <div class="clearer"></div>
    </div>
</form>

<{include file="footer.tpl"}>
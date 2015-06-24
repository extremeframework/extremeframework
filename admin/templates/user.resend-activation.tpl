<{include file="header.tpl"}>
</head>
<body>

<{include file="headerbar.tpl"}>

<div id="container">
<div id="main-body" class="main-content">

<div id="heading">
    <div class="inner">
        <h1>Account Activation</h1>
    </div>
</div>

<div class="content-inner">

<form name="userform" id="userform" action="<{$smarty.const.APPLICATION_URL}>/user/resend" method="post" enctype="multipart/form-data">
    <div class="section">
        <div>
            <{if $message}>
                <p style="color:red;"><{$message}></p>
            <{/if}>
        	<div class="form-row form-row-mandatory">
        		<label>Enter your account's email address:</span></label>
        		<div class="form-field column-email">
                    <div style="padding:5px 0 5px 0">An email with instructions to activate your account will be sent to this address</div>
                    <input class="input-email" type="text" name="email" value="<{$email|escape}>" size="60">
        		</div>
        	</div>
        </div>
    </div>
    <div class="clearer"></div>
    <div class="button-bar buttons">
        <div class="button-general button-save">
            <a class="button-save" href="#" onclick="$('#userform').submit();return false;"><span class="button-face">Send</span></a>
        </div>
        <div class="clearer"></div>
    </div>
</form>

<{include file="footer.tpl"}>
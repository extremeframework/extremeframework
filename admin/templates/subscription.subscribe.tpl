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
        <h1>Newsletter Subscription</h1>
    </div>
</div>

<div class="content-inner">

<form name="subscriberform" id="subscriberform" action="<{$smarty.const.APPLICATION_URL}>/subscription/subscribe" method="post" enctype="multipart/form-data">
    <input type="hidden" name="ID_SUPSCRIPTION" value="1">
    <div class="section">
        <div style="width:60%">
            <{if $message}>
                <p style="color:red;"><{$message}></p>
            <{/if}>
        	<div class="form-row form-row-mandatory">
        		<label>Your name</label>
        		<div class="form-field column-name">
                    <input class="input-name" type="text" name="NAME" value="<{$details->NAME|escape}>" size="40">
        		</div>
        	</div>
        	<div class="form-row form-row-mandatory">
        		<label>Email address</label>
        		<div class="form-field column-email">
                    <input class="input-email" type="text" name="EMAIL" value="<{$details->EMAIL|escape}>" size="40">
        		</div>
        	</div>
        </div>
    </div>
    <div class="clearer"></div>
    <div class="button-bar buttons">
        <div class="button-general button-save">
            <a class="button-save" onclick="$('#subscriberform').submit();return false;"><span class="button-face">Subscribe</span></a>
        </div>
        <div class="clearer"></div>
    </div>
</form>

<{include file="footer.tpl"}>
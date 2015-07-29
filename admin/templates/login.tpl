<{include file="header.tpl"}>
<title><{_t('Authentication', true)}></title>
</head>

<body id="signin">

<{assign var='title' value=_t('Sign in')}>
<{include file="top.tpl"}>

<div class="locales">
    <i class="fa fa-globe"></i>
    <a class="show-modal" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/quickSelect">
        <{_t('Change display language')}>
        <b class="caret"></b>
    </a>
</div>

<div class="account-signin">

    <div id="heading">
        <div class="inner">
            <h1><{_t('Sign in')}></h1>
            <div class="clearer"></div>
        </div>
    </div>

    <div id="signin-form">

    <{if isset($errors) }>
    <div style="padding:0 20px 10px 0;line-height:2em">
        <span style="color:red;position:relative;top:-10px;"><{$errors[0]}></span>
    </div>
    <{/if}>

    <form action="<{$smarty.const.APPLICATION_URL}>/authentication/login/<{if isset($return) }>?return=<{$return}><{/if}>" method="post">
        <{if isset($return) }><input type="hidden" id="absoluteUrl" name="return" value="<{$return}>"/><{/if}>
        <div class="form-row">
            <label for="signin_username"><{_t('Username')}></label>
            <div class="form-field">
                <input type="text" name="username" autocorrect="off" placeholder="<{_t('Username or Email', true)}>" autocapitalize="off" id="signin_username" />
            </div>
        </div>

    	<div class="clearer"></div>

        <div class="form-row">
    		<label for="signin_password"><{_t('Password')}></label>
    		<div class="form-field">
    		    <input name="password" id="signin_password" type="password" autocorrect="off" placeholder="<{_t('Password', true)}>" autocapitalize="off" />
    		</div>
    	</div>

        <div class="clearer"></div>

        <div class="buttons">
            <span class="button-general ">
                <button value="1" class="button large" type="submit"><span class="button-face"><{_t('Sign in')}></span></button>
            </span>

            <div class="form-row">
                <input type="checkbox" name="remember" value="1" id="sigin_remember" />
                <label for="sigin_remember"> <{_t('Keep me signed in')}></label>
            </div>
        </div>
    </form>
    </div>

    <div id="signin-footer">
        <span style="float:right">
            <a href="<{$smarty.const.APPLICATION_URL}>/user/forgot"><{_t('Forgot password')}></a>
        </span>
        <{if get_option('enable-registration', true)}>
            <a href="<{$smarty.const.APPLICATION_URL}>/user/register"><{_t('Create an account now')}></a>
        <{/if}>
        <div style="clear:both"></div>
    </div>
</div>

<{if get_option('enable-social-registration', false, null, false)}>
    <section class="social-signin">
        <button onclick="facebook_login();" class="button button-social button-facebook">
            <i class="fa fa-facebook"></i><{_t('Sign in with Facebook')}>
        </button>
        <button class="button-social button button-google" onclick="google_login();">
            <i class="fa fa-google-plus"></i><{_t('Sign in with Google+')}>
        </button>
        <button class="button-social button button-yahoo" onclick="yahoo_login();">
            <i class="fa fa-yahoo"></i><{_t('Sign in with Yahoo')}>
        </button>
    </section>
<{/if}>

<{include file="footer.tpl"}>
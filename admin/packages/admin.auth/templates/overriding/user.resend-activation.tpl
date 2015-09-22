<{include file="header.tpl"}>
<style>
.module.center .content-inner {
    margin: auto;
    padding: 0 20px;
    max-width: 620px;
}

.module.center .edit_details .equal-split>tbody>tr>td:nth-child(odd) {
    border-bottom: none!important;
}

a.button-send {
    font-weight: bold;
    padding: 5px 10px;
}
</style>
</head>
<body class="module center">

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{_t('Account Activation')}></span>
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

                <form name="userform" id="userform" action="<{$smarty.const.APPLICATION_URL}>/user/resend" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-custom-layout equal-split" style="margin:0 0 10px 0;">
                        <tbody>
                            <tr class="form-row form-row-email">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Enter your account\'s email address')}>:</label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-email">
                                        <input class="input-email" type="text" name="email" value="<{$email|escape}>" size="60">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="font-style: italic;"><{_t('An email with instructions to activate your account will be sent to this address.')}></div>
                </form>
            </div>
        </div>
    </div>

    <!-- Control buttons -->
    <div style="margin:15px 0 0 3px">
        <div class="button-general button-save btn btn-success">
            <a class="button-send" onclick="$('#userform').submit();return false;"><span class="button-face"><{_t('Send')}></span></a>
        </div>
        <div class="clearer"></div>
    </div>
</div>

<{include file="footer.tpl"}>
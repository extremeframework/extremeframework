<{include file="header.tpl"}>
<style>
.forgot-password .content-inner {
    margin: auto;
    padding: 0 20px;
    max-width: 620px;
}

.forgot-password .edit_details .equal-split>tbody>tr>td:nth-child(odd) {
    border-bottom: none!important;
}

a.button-send {
    font-weight: bold;
    padding: 5px 10px;
}
</style>
</head>
<body class="module forgot-password">

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{_t('Forgot Password')}></span>
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

                <form name="userform" id="userform" action="<{$smarty.const.APPLICATION_URL}>/user/forgot" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-custom-layout equal-split" style="margin-top:10px;">
                        <tbody>
                            <tr class="form-row form-row-email">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Enter your account\'s email address')}>:</label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-email">
                                        <input class="input-email" type="text" name="user_formdata_EMAIL" value="<{$details->EMAIL|escape}>" size="60">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>

    <!-- Control buttons -->
    <div style="margin:10px 0 0 3px">
        <div class="button-general button-save btn btn-success">
            <a class="button-send" onclick="$('#userform').submit();return false;"><span class="button-face"><{_t('Recover')}></span></a>
        </div>
        <div class="clearer"></div>
    </div>
</div>

<{include file="footer.tpl"}>
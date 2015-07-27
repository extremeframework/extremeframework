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
    <span class="h"><{_t('Reset Password')}></span>
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

                <form name="userform" id="userform" action="<{$smarty.const.APPLICATION_URL}>/user/reset" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="c" value="<{$compound}>"/>
                    <table class="table table-bordered table-custom-layout equal-split" style="margin:0 0 10px 0;">
                        <tbody>
                            <tr class="form-row form-row-password">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Enter a new password')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-password">
                                        <input class="input-password" type="password" name="PASSWORD" value="<{$password}>" size="32">
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
                                        <input class="input-password2" type="password" name="PASSWORD2" value="" size="32">
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
    <div style="margin:15px 0 0 3px">
        <div class="button-general button-save btn btn-success">
            <a class="button-send" onclick="$('#userform').submit();return false;"><span class="button-face"><{_t('Change')}></span></a>
        </div>
        <div class="clearer"></div>
    </div>
</div>

<{include file="footer.tpl"}>
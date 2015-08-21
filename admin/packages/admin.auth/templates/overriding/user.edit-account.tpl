<{include file="header.tpl"}>
</head>
<body class="module">

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><{_t('Edit Account Information')}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>
    </span>
</h1>

<div class="edit_details">
    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-top hidden-print">
        <div class="button-general button-save btn btn-success">
            <a class="button-save" onclick="$('#userform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
        </div>
        <div class="clearer"></div>
    </div>

    <!-- Details -->
    <div class="section">
        <div>
            <div class="edit-main edit_details">
                <{if $message}>
                    <ul class="message">
                        <li><{$message}></li>
                    </ul>
                <{/if}>

                <form name="userform" id="userform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/user/edit-account" method="post" enctype="multipart/form-data">
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
                            		    <label><{_t('Email')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-email">
                                        <input class="input-email input-type-text" type="text" name="user_formdata_EMAIL" value="<{$details->EMAIL|escape}>"/>
                                    </div>
                                </td>
                            </tr>
                            <tr class="form-row form-row-password">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Password')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-password">
                                        <input class="input-password input-type-text" type="password" name="user_formdata_PASSWORD" value=""/>
                                    </div>
                                </td>
                            </tr>
                            <tr class="form-row form-row-password">
                        		<td>
                                    <div class="form-field form-field-label">
                            		    <label><{_t('Confirm password')}></label>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div class="form-field form-field-value column-password2">
                                        <input class="input-password input-type-text" type="password" name="PASSWORD2" value=""/>
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
    <div class="edit-buttons edit-buttons-bottom hidden-print">
        <div class="button-general button-save btn btn-success">
            <a class="button-save" onclick="$('#userform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
        </div>
        <div class="clearer"></div>
    </div>
</div>

<{include file="footer.tpl"}>
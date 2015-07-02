<{include file="header.tpl"}>

</head>
<body>

<{include file="headerbar.tpl"}>

<div id="container">
<div id="main-body" class="main-content">

<div id="heading" style="margin: 0 0 10px 24px;">
    <h1>Billing & Payment Information</h1>
</div>

<div class="content-inner">
    <form name="checkoutform" id="checkoutform" action="<{$smarty.const.APPLICATION_URL}>/checkout/submit" method="post" enctype="multipart/form-data">
        <{if $message}>
            <p style="color:red;margin-left: 12px;"><{$message}></p>
        <{/if}>
        <div class="section row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Billing Information</div>
                    <div class="panel-body">
                    	<div class="form-row">
                    		<label>Country*</label>
                    		<div class="form-field">
                                <{html_ref_select autocomplete="1" ajax="0" method="" name="id_country" value=$data->CUSTOMER_ID_COUNTRY datasource="COUNTRY" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem="" noauth="1"}>
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>First name*</label>
                    		<div class="form-field">
                                <input type="text" name="first_name" value="<{$data->CUSTOMER_FIRST_NAME|escape}>" size="40">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>Last name*</label>
                    		<div class="form-field">
                                <input type="text" name="last_name" value="<{$data->CUSTOMER_LAST_NAME|escape}>" size="40">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>Email address*</label>
                    		<div class="form-field">
                                <input type="text" name="email" value="<{$data->CUSTOMER_EMAIL|escape}>" size="40">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>Phone number</label>
                    		<div class="form-field">
                                <input type="text" name="phone" value="<{$data->CUSTOMER_PHONE|escape}>" size="40">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>Address</label>
                    		<div class="form-field">
                                <input type="text" name="address" value="<{$data->CUSTOMER_ADDRESS|escape}>" size="40">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>City</label>
                    		<div class="form-field">
                                <input type="text" name="city" value="<{$data->CUSTOMER_CITY|escape}>" size="40">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>State</label>
                    		<div class="form-field">
                                <input type="text" name="state" value="<{$data->CUSTOMER_STATE|escape}>" size="40">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>Zip code</label>
                    		<div class="form-field">
                                <input type="text" name="zip_code" value="<{$data->CUSTOMER_ZIP_CODE|escape}>" size="40">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>Additional note / remark</label>
                    		<div class="form-field">
                                <textarea name="note" cols="40"><{$data->NOTE|escape}></textarea>
                    		</div>
                    	</div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading"><i class="fa fa-credit-card" style="font-size: 20px;margin-right: 5px;position: relative;top: 2px;"></i> Payment Information</div>
                    <div class="panel-body">
                        <input type="hidden" name="id_payment_type" value="1">
                    	<div class="form-row">
                    		<label>Credit card number*</label>
                    		<div class="form-field">
                                <input type="text" name="cc_number" value="<{$data->CC_NUMBER}>">
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>Expiry date*</label>
                    		<div class="form-field">
                                <select name="cc_expiry_month">
                                    <option value="" selected="selected" style="display: none;">Month</option>
                                    <{section name=i start=1 loop=13}>
                                        <option <{if $smarty.section.i.index == $data->CC_EXPIRY_MONTH}>selected="selected"<{/if}> value="<{$smarty.section.i.index}>"><{$smarty.section.i.index}></option>
                                    <{/section}>
                                </select>
                                <select name="cc_expiry_year">
                                    <option value="" selected="selected" style="display: none;">Year</option>
                                    <{section name=i start=2015 loop=2026}>
                                        <option <{if $smarty.section.i.index == $data->CC_EXPIRY_YEAR}>selected="selected"<{/if}> value="<{$smarty.section.i.index}>"><{$smarty.section.i.index}></option>
                                    <{/section}>
                                </select>
                    		</div>
                    	</div>
                    	<div class="form-row">
                    		<label>CVV code*</label>
                    		<div class="form-field">
                                <input type="text" name="cc_cvv" value="<{$data->CC_CVV}>">
                    		</div>
                    	</div>
                    </div>
                </div>
                <div class="row button-bar">
                    <div class="button-general button-save">
                        <a class="button-save" onclick="$('body').addClass('loading');$('#checkoutform').submit();return false;"><span class="button-face">Continue</span></a>
                    </div>
                    <a style="margin-left: 10px;position: relative;top: 8px;" href="<{$smarty.const.APPLICATION_URL}>/cart">Back to cart</a>
                    <div class="clearer"></div>
                </div>
            </div>
        </div>
    </form>

<{include file="footer.tpl"}>
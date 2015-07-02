<{include file="header.tpl"}>

</head>
<body>

<{include file="headerbar.tpl"}>

<div id="container">
<div id="main-body" class="main-content">

<div id="heading" style="margin: 0 0 0px 10px;">
    <h1>Review Your Order and Confirm Your Purchase</h1>
</div>

<div class="content-inner">
    <form name="paymentform" id="paymentform" action="<{$smarty.const.APPLICATION_URL}>/payment/placeOrder" method="post" enctype="multipart/form-data">
        <div class="section row">
            <{if $message}>
                <p style="color:red;"><{$message}></p>
            <{/if}>

            <!-- Part 1 -->
            <div class="panel panel-default">
                <div class="panel-heading">Billing & Payment Information</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <strong>Billing Information</strong> (<a href="<{$smarty.const.APPLICATION_URL}>/checkout/">Edit</a>)<br/>
                            <{$data->CUSTOMER_FIRST_NAME}> <{$data->CUSTOMER_LAST_NAME}><br/>
                            <{$data->CUSTOMER_EMAIL}><br/>
                            <{$data->CUSTOMER_ADDRESS}><br/>
                            <{$data->CUSTOMER_CITY}>, <{$data->CUSTOMER_STATE}> <{$data->CUSTOMER_ZIP_CODE}><br/>
                            <{$country->NAME}>
                            <{if $data->CUSTOMER_PHONE}><br/><abbr title="Phone">P:</abbr> <{$data->CUSTOMER_PHONE}><{/if}>
                        </div>
                        <div class="col-md-6">
                            <strong>Payment Information</strong> (<a href="<{$smarty.const.APPLICATION_URL}>/checkout/">Edit</a>)<br/>
                            <{$payment_type->NAME}>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Part 2 -->
            <div class="row">
                <div class="col-md-12">
                    <table class="item_list">
                        <thead>
                            <tr>
                                <th width="7%">&nbsp;</th>
                                <th width="44%">Product</th>
                                <th width="17%">Price</th>
                                <th width="15%">Quantity</th>
                                <th width="17%">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <{$total = 0}>
                            <{$saving = 0}>

                            <{foreach from=$items item=item}>
                                <tr>
                                    <td><img src="<{$smarty.const.APPLICATION_URL}>/thumb/60x60/<{$item->IMAGE}>"/></td>
                                    <td><{$item->TITLE}></td>
                                    <td>
                                        <{if $item->PRICE != $item->LIST_PRICE}><span style="text-decoration:line-through;color:red;margin-right:10px;"><{$item->LIST_PRICE}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></span><br/><{/if}>
                                        <{$item->PRICE}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}>
                                    </td>
                                    <td><{$item->QUANTITY}></td>
                                    <td><{($item->PRICE * $item->QUANTITY)}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></td>

                                    <{$total = $total + ($item->PRICE * $item->QUANTITY)}>
                                    <{$saving = $saving + (($item->LIST_PRICE - $item->PRICE) * $item->QUANTITY)}>
                                </tr>
                            <{/foreach}>

                            <tr style="font-size: 22px;">
                                <td colspan="3"></td>
                                <td>Total</td>
                                <td><{$total}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></td>
                            </tr>

                            <{if $saving}>
                                <tr style="font-size: 22px;">
                                    <td colspan="3"></td>
                                    <td>Savings</td>
                                    <td><span style="text-decoration:line-through;color:red;"><{$saving}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></span></td>
                                </tr>
                            <{/if}>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Part 3 -->
            <div style="margin-top: 20px;">
                <input type="hidden" name="keep_this" value="1"/>
                <input type="checkbox" name="must_agree" value="1"/>
                &nbsp;By checking this box, I agree to the <a href="#" target="_blank">Terms of Sale</a> and the <a href="#" target="_blank">Privacy Policy</a> of <{$smarty.const.ORGANIZATION_NAME}>
            </div>
            <div class="button-bar buttons" style="margin:0;padding:0;">
                <div class="button-general button-save">
                    <a class="button-save" onclick="$('body').addClass('loading');$('#paymentform').submit();return false;"><span class="button-face">Place Your Order</span></a>
                </div>
                <div class="clearer"></div>
            </div>
        </div>
    </form>

<{include file="footer.tpl"}>
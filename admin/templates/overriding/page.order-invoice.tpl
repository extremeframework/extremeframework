<{include file="header.tpl"}>

</head>
<body>

<div class="invoice" style="width: 600px;margin: auto;">
    <div id="heading" style="margin: 0 0 10px 15px;">
        <h1>Invoice #<{$order->PAYMENT_REF}></h1>
    </div>

    <div style="margin: 0px 10px 10px 15px;">

        <div style="margin: 10px 0 20px 0;">
            <a href="javascript:window.print();">Print</a>
        </div>

        <strong>Order Date:</strong> <{$order->CREATION_DATE}><br/>
        <strong>Order reference number:</strong> <{$order->PAYMENT_REF}><br/>&nbsp;<br/>

        <strong>Billing Information</strong><br/>
        <address>
            <strong><{$order->CUSTOMER_FIRST_NAME}> <{$order->CUSTOMER_LAST_NAME}></strong><br>
            <{$order->CUSTOMER_ADDRESS}><br>
            <{$order->CUSTOMER_CITY}>, <{$order->CUSTOMER_STATE}> <{$order->CUSTOMER_ZIP_CODE}><br>
            <{$country->NAME}><br>
            <{$order->CUSTOMER_EMAIL}>
            <{if $order->CUSTOMER_PHONE}><br/><abbr title="Phone">P:</abbr> <{$order->CUSTOMER_PHONE}><{/if}>
        </address>

        <strong>Product Information</strong><br/>
        <table class="item_list">
            <thead>
                <tr>
                    <th width="44%">Product</th>
                    <th width="17%">Price</th>
                    <th width="15%">Quantity</th>
                    <th width="17%">Amount</th>
                </tr>
            </thead>
            <tbody>
                <{$total = 0}>

                <{foreach from=$items item=item}>
                    <tr>
                        <td><{$item->TITLE}></td>
                        <td><{$item->PRICE}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></td>
                        <td><{$item->QUANTITY}></td>
                        <td><{($item->PRICE * $item->QUANTITY)}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></td>

                        <{$total = $total + ($item->PRICE * $item->QUANTITY)}>
                    </tr>
                <{/foreach}>

                <tr style="font-size: 22px;">
                    <td colspan="2">&nbsp;</td>
                    <td>Total</td>
                    <td><{$total}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></td>
                </tr>
            </tbody>
        </table>

        <{if $payment_type->INSTRUCTION}>
            <br/>
            <strong>Payment Instructions</strong><br/>
            <{$payment_type->INSTRUCTION}><br/>
        <{/if}>
    </div>
</div>

</body>
</html>
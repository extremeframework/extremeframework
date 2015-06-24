<p>Thank you for your order.</p>

<strong>Order Date:</strong> <{$order->CREATION_DATE}><br/>
<strong>Order reference number:</strong> <{$order->PAYMENT_REF}><br/>&nbsp;<br/>

<strong>Product Information</strong><br/>
<table class="item_list" border="1">
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
    <br/><strong>Payment Instructions</strong><br/>
    <{$payment_type->INSTRUCTION}>
<{/if}>

<p>We hope you enjoy the service!</p>

<p>Support Team</p>
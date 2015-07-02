<div class="section">
    <{if !$items}>
        <{if $other_purchases}>
            <div style="font-size: 18px;margin: 20px 0 10px 0;">Your cart is so empty...</div>

            <table class="item_list" style="border:0">
                <{foreach from=$other_purchases item=item}>
                    <tr>
                        <td width="7%"><img src="<{$smarty.const.APPLICATION_URL}>/thumb/30x30/<{$item->IMAGE}>"/></td>
                        <td width="30%">
                            <{$item->TITLE}><br/><div style="font-size: 12px;line-height: 24px;"><{$item->TAG_LINE}></div>
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="7%">
                            <{if $item->PRICE != $item->LIST_PRICE}><span style="text-decoration:line-through;color:red;margin-right:10px;"><{$item->LIST_PRICE}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></span><br/><{/if}>
                            <{$item->PRICE}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}>
                        </td>
                        <td>
                            <div class="button-general button-save">
                                <a href="javascript:void(0);" data-name="addCartItem" data-product-id="<{$item->ID_ADMIN_PRODUCT}>">+ Add</a>
                            </div>
                        </td>
                    </tr>
                <{/foreach}>
            </table>
        <{/if}>
    <{else}>
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
                        <td>
                            <select data-name="updateCartItem" data-product-id="<{$item->ID_ADMIN_PRODUCT}>">
                                <{section name=i start=1 loop=11}>
                                    <option <{if $smarty.section.i.index == $item->QUANTITY}>selected="selected"<{/if}> value="<{$smarty.section.i.index}>"><{$smarty.section.i.index}></option>
                                <{/section}>
                            </select>
                            <a href="javascript:void(0);" data-name="removeCartItem" data-product-id="<{$item->ID_ADMIN_PRODUCT}>">Remove</a>
                        </td>
                        <td><{($item->PRICE * $item->QUANTITY)}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></td>

                        <{$total = $total + ($item->PRICE * $item->QUANTITY)}>
                        <{$saving = $saving + (($item->LIST_PRICE - $item->PRICE) * $item->QUANTITY)}>
                    </tr>
                <{/foreach}>

                <{if $other_purchases}>
                    <tr>
                        <td colspan="5">
                            <div style="font-size: 18px;margin: 20px 0 10px 0;">Other common purchases...</div>

                            <table class="item_list" style="border:0">
                                <{foreach from=$other_purchases item=item}>
                                    <tr>
                                        <td width="7%"><img src="<{$smarty.const.APPLICATION_URL}>/thumb/30x30/<{$item->IMAGE}>"/></td>
                                        <td width="30%">
                                            <{$item->TITLE}><br/><div style="font-size: 12px;line-height: 24px;"><{$item->TAG_LINE}></div>
                                        </td>
                                        <td width="3%">&nbsp;</td>
                                        <td width="7%">
                                            <{if $item->PRICE != $item->LIST_PRICE}><span style="text-decoration:line-through;color:red;margin-right:10px;"><{$item->LIST_PRICE}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}></span><br/><{/if}>
                                            <{$item->PRICE}> <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}>
                                        </td>
                                        <td>
                                            <div class="button-general button-save">
                                                <a href="javascript:void(0);" data-name="addCartItem" data-product-id="<{$item->ID_ADMIN_PRODUCT}>">+ Add</a>
                                            </div>
                                        </td>
                                    </tr>
                                <{/foreach}>
                            </table>
                        </td>
                    </tr>
                <{/if}>

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


    <{/if}>
</div>

<div class="clearer"></div>

<{if $items}>
    <div class="button-bar" style="padding:10px;float: right;">
        <{if $total > 0}>
            <div class="button-general button-save">
                <a class="button-save" onclick="$('body').addClass('loading');" href="<{$smarty.const.APPLICATION_URL}>/payment/payWithPayPal"><span class="button-face"><i class="fa fa-paypal" style="font-size: 20px; margin-right: 5px;position: relative;top: 2px;"></i> Pay with PayPal</span></a>
            </div>
            <div class="button-general button-save" style="margin-left: 10px">
                <a class="button-save" href="<{$smarty.const.APPLICATION_URL}>/checkout"><span class="button-face"><i class="fa fa-credit-card" style="font-size: 20px; margin-right: 5px;position: relative;top: 2px;"></i> Pay with credit card</span></a>
            </div>
        <{else}>
            <div class="button-general button-save" style="margin-left: 10px">
                <a class="button-save" href="<{$smarty.const.APPLICATION_URL}>/checkout"><span class="button-face">Checkout</span></a>
            </div>
        <{/if}>
        <div class="clearer"></div>
    </div>
<{/if}>
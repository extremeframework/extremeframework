$(function() {
	$('select.autocomplete').select2();

	$('textarea').autogrow();

	$('textarea').tabby();

	//$('textarea').linedtextarea();

	if (parent.parent.resizeIframe && typeof(parent.parent.resizeIframe) == "function") {
	    parent.parent.resizeIframe($('html').height());
    }
});

$(function() {
    $('textarea[class*="css"]').ace({ theme: 'textmate', lang: 'css' });
    $('textarea[class*="php"]').ace({ theme: 'textmate', lang: 'php' });
});

$(function() {
    $('input.input-type-color').colorPicker({
		customBG: '#222',
		margin: '5px -2px 0',
		doRender: 'div div',
		cssAddon:
			'.cp-color-picker{border:1px solid #999; padding:10px 10px 0;' +
				'background:#eee; overflow:visible; border-radius:3px;}' +
			'.cp-color-picker:after{content:""; display:block; ' +
				'position:absolute; top:-15px; left:12px; border:8px solid #eee;' +
				'border-color: transparent transparent #eee}' +
			'.cp-color-picker:before{content:""; display:block; ' +
				'position:absolute; top:-16px; left:12px; border:8px solid #eee;' +
				'border-color: transparent transparent #999}' +
			'.cp-xy-slider:active {cursor:none;}' +
			'.cp-xy-slider{border:1px solid #999; margin-bottom:10px;}' +
			'.cp-xy-cursor{width:12px; height:12px; margin:-6px}' +
			'.cp-z-slider{margin-left:10px; border:1px solid #999;}' +
			'.cp-z-cursor{border-width:5px; margin-top:-5px;}' +
			'.cp-color-picker .cp-alpha{margin:10px 0 0; height:6px; border-radius:6px;' +
				'overflow:visible; border:1px solid #999; box-sizing:border-box;' +
				'background: linear-gradient(to right, rgba(238,238,238,1) 0%,rgba(238,238,238,0) 100%);}' +
			'.cp-color-picker .cp-alpha{margin:10px 0}' +
			'.cp-alpha-cursor{background: #eee; border-radius: 100%;' +
				'width:14px; height:14px; margin:-5px -7px; border:1px solid #666!important;' +
				'box-shadow:inset -2px -4px 3px #ccc}'
	});
});

$(function() {
    // x. Number and currency format
    //$('.currency-format').formatCurrency({symbol: '<{$smarty.const.DEFAULT_CURRENCY_SYMBOL}>', positiveFormat:"<{$smarty.const.POSITIVE_CURRENCY_FORMAT}>",negativeFormat:"<{$smarty.const.NEGATIVE_CURRENCY_FORMAT}>", roundToDecimalPlace: 2});
    //$('.number-format').formatCurrency({symbol: '', roundToDecimalPlace: 0});

    // 20150327
    //$('.currency-format').autoNumeric('init', {aSign:' <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}>', pSign:'s', mDec: 0 });
    //$('.number-format').autoNumeric('init', { mDec: 0 });

    $(document).ajaxComplete(function() {
        // 20150327
        //$('.currency-format').autoNumeric('init', {aSign:' <{$smarty.const.DEFAULT_CURRENCY_SYMBOL}>', pSign:'s', mDec: 0 });
        //$('.number-format').autoNumeric('init', { mDec: 0 });
    });

    // x. Date format
    $('.field-date').live('click', function(event) {
        $(this).datepicker({dateFormat: '<{$smarty.const.DATE_FORMAT}>', appendText: '(<{$smarty.const.DATE_FORMAT}>)'}).focus();
    });
});

$(function() {
    function barcode(elements, width) {
        elements.each(function() {
            var barcode = $(this).text().trim();
            var length = barcode.length;

            if (length > 0 && length < 8) {
                barcode = String('00000000' + barcode).slice(-8);

                length = 8;
            } else if (length > 8 && length < 13) {
                barcode = String('0000' + barcode).slice(-13);

                length = 13;
            }

            var type = null;

            if (length == 8) {
                type = 'ean8';
            } else if (length == 13) {
                type = 'ean13';
            }

            if (type != null) {
                $(this).barcode(barcode, type, {barWidth:width, barHeight:30});
            }
        });
    }

    barcode($('td.column-barcode'), 1);
    barcode($('div.column-barcode .attribute-value'), 2);
});

$(function() {
    function bind_language_label_span(span) {
        span.addClass('label-configurable');

        span.closest('li').unbind('click');
        span.closest('a').attr('href', '#');
        span.closest('a').unbind('click');

        span.click(function(){
            var thisspan = $(this);
            var oldhtml = thisspan.html();

            thisspan.addClass('label-configurable-active');

            var html = '<input type="text" value="' + thisspan.text().trim() + '"/>';

            thisspan.html(html);

            thisspan.unbind('click');

            thisspan.find('input').keypress(function(e) {
                var code = (e.keyCode ? e.keyCode : e.which);

                if (code == 13) {
                    var input = $(this);

                    var key = thisspan.data('key');
                    var lang = thisspan.data('lang');
                    var value = input.attr('value');

                    var url = '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/update?key='+key+'&lang='+lang+'&value='+value;
                    $.get(url);

                    thisspan.text(value);
                    thisspan.removeClass('label-configurable-active');
                }
            });

            return false;
        });
    }

    var span = $('.label').not('.label-configurable');
    bind_language_label_span(span);
});
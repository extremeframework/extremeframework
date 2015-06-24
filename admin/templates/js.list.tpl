$(document).ready(function(){
	$('.yesno').each(function() {
		var td = $(this);
		var tr = td.closest('tr');
		var id = tr.attr('data-id');
		var value = parseInt(td.attr('data-value'));
		var column = td.attr('data-column');
		var module = td.attr('data-module');

		td.html('<div class="button-general"><a class="toggle"><span class="button-face"></span></a></div>');

		var toggle = td.find('.toggle');

		if (value) {
			toggle.parent().addClass('button-selected');
			tr.addClass(column.toLowerCase());
		}

		toggle.click(function() {
			value = parseInt(td.attr('data-value'));

			if (value) {
				value = 0;
			} else {
				value = 1;
			}

			$.post('<{$smarty.const.APPLICATION_URL}>/api/' + module + '/update/' + id + '/' + column + '/' + value, function(data) {
				if (data.success) {
					td.attr('data-value', value);

					toggle.parent().toggleClass('button-selected');
					tr.toggleClass(column.toLowerCase());

					return false;
				}
			}, 'json');
		});
	});
});

$(document).ready(function(){
	var a = $('.button-export');
	var button = a.closest('div');

	button.css('padding-right', '8px');

	var sb_down = $('<span class="sb_down" style="display:none"></span>');
	button.append(sb_down);

	button.hover(function() {
		sb_down.css('display', '');
	}, function(){
		sb_down.hide();
	});

	var exportwidget = null;

	sb_down.click(function(){
		if (exportwidget == null) {
			$.get('<{$smarty.const.APPLICATION_URL}>/ajax/widget/?class=WidgetExport&module=<{$module}>', function(data) {
				exportwidget = $(data).appendTo($('body')).show();
			});
		} else {
			exportwidget.toggle();
		}
	});
});

$(document).ready(function(){
	$('.prettydate').prettyDate();
});

$(document).ready(function(){
    $('.fancybox')
    .attr('rel', 'gallery')
    .fancybox({
        padding : 0
    });
});
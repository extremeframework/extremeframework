<div class="toggle-fullscreen" title="<{_t('Toggle fullscreen mode', true)}>">
	<i class="fa fa-arrows-alt"></i>
</div>

<script type="text/javascript">
	$(function(){
		// x. Fullscreen toggle
		var fullscreen = $.cookie('fullscreen');

		if (fullscreen === "true") {		
			$('body').addClass('fullscreen');
		}		

		$('.toggle-fullscreen').off('click').on('click', function(){
			var body = $('body');

			if (body.hasClass('fullscreen')) {
				body.removeClass('fullscreen');
			} else {
				body.addClass('fullscreen');
			}

			$.cookie('fullscreen', body.hasClass('fullscreen'), { expires: 365 });
		});
	});
</script>	
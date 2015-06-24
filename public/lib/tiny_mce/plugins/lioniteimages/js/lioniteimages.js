;(function(){
	var LioniteImages = window.LioniteImages = {
		connector: 'php',
		connectorExt: 'php',
		init : function() {
			this.ajaxUpload($('.upload_control'),'connector/' + this.connector + '/upload.' + this.connectorExt);
			$.ajax({
				url: 'connector/' + this.connector + '/gallery.' + this.connectorExt,
				success: function(response) {
					$('#gallery').html(response);
				}
			});
			this.events();
		},
		events: function() {
			var self = this;
			$('#gallery').click(function(e){
				e.preventDefault();
				var el = $(e.target);
				if(el.is('a')) {
					if(el.is('.insert')) {
						var image = '<img src="' + el.attr('href') + '" alt="" />';
						self.insert(image);
						tinyMCEPopup.close();
					} else if(el.is('.delete')) {
						$.ajax({
							url: 'connector/' + self.connector + '/remove.' + self.connectorExt,
							data:'url=' + encodeURIComponent(el.attr('href'))
						});
						el.parents('li:first').remove();
					}
				}

			});
			$('.nav a').click(function(){
				if(!$(this).is('.selected')) {
					$('.nav .selected').removeClass('selected');
					$(this).addClass('selected');
					var ind = $('.nav a').index(this);
					$('.tab:visible').hide();
					$('.tab').eq(ind).show();
				}
			});
			$('.url .urlinsert').click(function(){
				var src = $(".url input[name='src']").val();
				if(src != '') {
					var image = '<img src="' + src + '" ';
					var attrs = ['alt','title'], val = '';
					for(var i in attrs) {
						val = $(".url input[name='" + attrs[i] + "']").val();
						if(val != '') {
							image += attrs[i] + '="' + val + '" ';
						}
					}
					image += '/>';
					var link = $(".url input[name='href']").val();
					if(link != '') {
						image = '<a href="' + link + '">' + image + '</a>';
					}
					self.insert(image);
				}
				tinyMCEPopup.close();
			});
		},
		insert : function(text) {
			tinyMCEPopup.execCommand('mceInsertContent', false, text);
		},
		ajaxUpload: function() {
			var self = this;
			$('.file-upload').each(function(){
				var el = this;
				var uploader = new qq.FileUploader({
					element: this,
					action: 'connector/' + self.connector + '/upload.' + self.connectorExt,
					template: '<div class="qq-uploader">' +
						'<div class="qq-upload-drop-area"><span>Drop files here to upload</span></div>' +
						'<div class="button qq-upload-button">Browse</div>' +
						'<ul class="qq-upload-list"></ul>' +
					'</div>',
					onQueue: function(id, fileName){
						$(el).find('.qq-upload-button').hide().after('<div class="progress"><span class="bar"></span><em>Sending : ' + fileName + '</em></div>');
						uploader.upload();
					},
					onProgress: function(id, fileName, loaded, total) {
						var percent = (loaded * 100 / total);
						var progress = $(el).find('.progress .bar');
						progress.animate({left:percent + '%'});
					},
					onComplete: function(id, fileName, response){
						$(el).find('.progress').remove();
						$(el).find('.qq-upload-button').show();

						if(response['success'] && response['success'] == true) {
							$('<li><a class="insert" href="' + response['image'] +  '">&nbsp;</a>'
							+ '<a class="delete" href="' + response['image'] +  '">&nbsp;</a>'
							+ '<img src="' + response['thumb'] + '" alt="" /></li>').appendTo('#gallery');
						}
					}
					//,debug: true
				});

			});
		}

	};
})();
$(function(){
	LioniteImages.init();
});

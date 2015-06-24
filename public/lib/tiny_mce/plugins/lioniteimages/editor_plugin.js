/**
 * Lionite image manager plugin for TinyMCE
 *
 * LICENSE - This software is provded under a commercial license. For sublicensing, modification and distribution
 * of this work, please consult the purchased license for restrictions.
 *
 * @author Eran Galperin
 * @copyright Copyright Lionite LTD. All rights reserved
 */

;(function() {
	tinymce.create('tinymce.plugins.LioniteImages', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('mceLioniteImages', function() {
				ed.windowManager.open({
					file : url + '/lioniteimages.htm',
					width : 700 + parseInt(ed.getLang('lioniteImages.delta_width', 0)),
					height : 507 + parseInt(ed.getLang('lioniteImages.delta_height', 0)),
					inline: true,
					popup_css : false
				}, {
					plugin_url : url
				});
			});

			// Register buttons
			ed.addButton('lioniteimages', {
				title : 'Lionite Image Manager',
				cmd : 'mceLioniteImages',
				image : url + '/img/icon.png'
			});
		},

		getInfo : function() {
			return {
				longname : 'Lionite Image Manager',
				author : 'Eran Galperin / Lionite',
				authorurl : 'http://www.lionite.com',
				infourl : 'http://demo.lionite.com/imagemanager',
				version : '1.0'
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('lioniteimages', tinymce.plugins.LioniteImages);
})();
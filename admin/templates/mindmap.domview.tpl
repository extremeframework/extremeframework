<html>
	<head>
		<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" type="text/css" href="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/css/mapjs-default-styles.css"></link>
	</head>
	<body>
		<style>
			#container {
				background-color: #FFFFFF;

				height: 100%;
				width: 100%;
				border: 1px dashed black;
			}
		</style>

        <div style="float:right">
    		<input type="button" class="scaleUp" value="+"></input>
    		<input type="button" class="scaleDown" value="-"></input>
    		<input type="button" class="toggleAddLinkMode" value="add link"></input>
            <{if $smarty.server.HTTP_REFERER != $mindmap_url}>
                <a href="<{$mindmap_url}>" target="blank"><input type="button" value="view full map"></input></a>
            <{/if}>
        </div>

		<div id="container"></div>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/jquery-2.0.2.min.js"></script>
		<script src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/jquery.hotkeys.js"></script>
		<script src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/jquery.hammer.min.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/underscore-1.4.4.js"></script>
		<script src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/color-0.4.1.min.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/observable.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/mapjs.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/url-helper.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/content.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/layout.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/clipboard.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/map-model.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/drag-and-drop.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/map-toolbar-widget.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/link-edit-widget.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/image-drop-widget.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/hammer-draggable.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/dom-map-view.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/dom-map-widget.js"></script>
		<script>
			jQuery.fn.attachmentEditorWidget = function (mapModel) {
				'use strict';
				return this.each(function () {
					var element = jQuery(this);
					mapModel.addEventListener('attachmentOpened', function (nodeId, attachment) {
						mapModel.setAttachment(
							'attachmentEditorWidget',
							nodeId, {
								contentType: 'text/html',
								content: prompt('attachment', attachment && attachment.content)
							}
						);
					});
				});
			};
			(function () {
				window.onerror = alert;
				var container = jQuery('#container'),
				idea = MAPJS.content(<{$json_mindmap}>),
				imageInsertController = new MAPJS.ImageInsertController("http://localhost:4999?u="),
				mapModel = new MAPJS.MapModel(MAPJS.DOMRender.layoutCalculator, []);
				container.domMapWidget(console, mapModel, false, imageInsertController);
				jQuery('body').mapToolbarWidget(mapModel);
				jQuery('body').attachmentEditorWidget(mapModel);
				$("[data-mm-action='export-image']").click(function () {
					MAPJS.pngExport(idea).then(function (url) {
						window.open(url, '_blank');
					});
				});
				mapModel.setIdea(idea);
				window.mapModel = mapModel;
				container.on('drop', function (e) {
					var dataTransfer = e.originalEvent.dataTransfer;
					e.stopPropagation();
					e.preventDefault();
					if (dataTransfer && dataTransfer.files && dataTransfer.files.length > 0) {
						var fileInfo = dataTransfer.files[0];
						if (/\.mup$/.test(fileInfo.name)) {
							var oFReader = new FileReader();
							oFReader.onload = function (oFREvent) {
								mapModel.setIdea(MAPJS.content(JSON.parse(oFREvent.target.result)));
							};
							oFReader.readAsText(fileInfo, 'UTF-8');
						}
					}
				});
			}());
		</script>
	</body>
</html>

<html>
    <head>
        <link rel="stylesheet" href="<{$smarty.const.APPLICATION_URL}>/lib/spectrum/css/spectrum.css" type="text/css"/>
        <link rel="stylesheet" href="<{$smarty.const.APPLICATION_URL}>/themes/hueman/fonts/font-awesome.min.css" type="text/css" media="all" />
    </head>
	<body>
		<style>
		    body {
		        margin: 0;
		        padding: 0;
		    }
			#container {
				background-color: white;
				width: 100%;
				height: 100%;
			}
			#xxx {
				background-size: 22px 22px;
				background-image:
				-webkit-repeating-linear-gradient(45deg, rgba(127, 191, 255, .4), rgba(127, 191, 255, .4) 1px, transparent 2px, transparent 15px),
				-webkit-repeating-linear-gradient(-45deg, rgba(255, 182, 193, .4), rgba(255, 182, 193, .4) 1px, transparent 2px, transparent 15px);
				background-image:
				-moz-repeating-linear-gradient(45deg, rgba(0, 191, 255, .5), rgba(0, 191, 255, .5) 1px, transparent 2px, transparent 15px),
				-moz-repeating-linear-gradient(-45deg, rgba(255, 182, 193, .5), rgba(255, 182, 193, .5) 1px, transparent 2px, transparent 15px);
				background-image:
				-o-repeating-linear-gradient(45deg, rgba(0, 191, 255, .5), rgba(0, 191, 255, .5) 1px, transparent 2px, transparent 15px),
				-o-repeating-linear-gradient(-45deg, rgba(255, 182, 193, .5), rgba(255, 182, 193, .5) 1px, transparent 2px, transparent 15px);
				background-image:
				repeating-linear-gradient(45deg, rgba(127, 191, 255, .5), rgba(127, 191, 255, .5) 1px, transparent 2px, transparent 15px),
				repeating-linear-gradient(-45deg, rgba(255, 182, 193, .5), rgba(255, 182, 193, .5) 1px, transparent 2px, transparent 15px);
			}
			.ideaInput {
				position: absolute;
				border: none;
				z-index: 999;
				background-color: transparent;
				color: #F8F8F8;
				font-family: "Helvetica";
				font-weight: bold;
				font-size: 13;
				text-align: center;
				resize: none;
			}
			.ideaInput:focus {
				outline: none;
			}
			.active {
				background-color: green;
				color: white;
			}
            .sp-replacer {
                padding: 0 4px 0 0;
                border: none;
                background: transparent;
            }
            .control-panel {
                position: fixed;
                z-index: 1;
            }
            .buttons {
                padding: 5px;
                background-color: white;
                margin: 5px 3px 0px 3px;
                box-shadow: 1px 1px 1px #6B6B6B;
                border: 1px solid gray;
                width: 30px;
            }
            .button {
                position: relative;
                display: block;
                padding: 5px 4px;
                margin-bottom: -1px;
                background-color: #ffffff;
                border: 1px solid #dddddd;
                font-size: 20px;
                color: rgb(63, 52, 52);
                text-align: center;
            }
            .button:hover {
                background-color: #eeeeee;
            }
            .icons {
                background-color: white;
                padding: 2px 0px 2px 0px;
                margin: 5px 3px 0px 3px;
                box-shadow: 1px -1px 1px #6B6B6B;
                border: 1px solid gray;
                width: 34px;
                text-align: center;
                position: fixed;
                top: 0;
                right: 0;
            }
            .icons img {
                margin-top: 1px;
                width: 22px;
                height: 22px;
                cursor: pointer;
                border: 1px solid #dddddd;
                padding: 1px;
            }
            .buttons input {
                box-shadow: 2px 2px 2px #C0C0C0;
            }
            .control-panel input {
                height: 24px;
                width: 100%;
                text-align: left;
            }
            .sp-dd {
                display: none;
            }
            .sp-preview {
                padding: 2px;
            }
            .mindmap-selector {
                background-color: white;
                padding: 2px 0px 2px 0px;
                margin: 5px 3px 0px 3px;
                box-shadow: 1px -1px 1px #6B6B6B;
                border: 1px solid gray;
                position:fixed;
                bottom:0;
                right: 40px;
                margin: 5px 3px 0px 3px;
                padding: 3px;
                height: 29px;
            }
		</style>
        <div class="control-panel">
            <a class="toggler" style="position:fixed;bottom:0;left:0;width:20px;height:20px;background-color:green;cursor:pointer;margin:3px;" onclick="$('.icons, .buttons, .mindmap-selector').toggle('fast');"></a>
            <{if $mindmaps}>
                <select class="mindmap-selector">
                    <option value="" disabled selected>-- Available mindmaps --</option>
                    <{foreach from=$mindmaps item=item}>
                        <option value="<{$item->ID}>" <{if $item->ID == $mindmap_id}>selectedx="selected"<{/if}>><{$item->TITLE}></option>
                    <{/foreach}>
                    <option value="-1">&lt;Create a new mindmap&gt;</option>
                </select>
            <{/if}>
            <div class="buttons">
                <{if $smarty.server.HTTP_REFERER != $mindmap_url}>
                    <a href="<{$mindmap_url}>" class="button" target="blank" title="View full map"><i class="fa fa-expand"></i></a>
                <{/if}>
        		<a class="button scaleUp zoomin" title="Zoom in"><i class="fa fa-search-plus"></i></a>
        		<a class="button scaleDown zoomout" title="Zoom out"><i class="fa fa-search-minus"></i></a>
            	<a class="button addSubIdea" title="Add a child node"><i class="fa fa-angle-right"></i></a>
        		<a class="button addSiblingIdea" title="Add a sibling node"><i class="fa fa-angle-double-right"></i></a>
            	<a class="button editNode" title="Edit node"><i class="fa fa-pencil"></i></a>
        		<a class="button toggleAddLinkMode" title="Add link"><i class="fa fa-link"></i></a>
                <a class="button toggleCollapse" title="Expand / Collapse"><i class="fa fa-comments-o"></i></a>
        		<a class="button visitNode" title="Visit node"><i class="fa fa-sign-in"></i></a>
        		<a class="button removeSubIdea" title="Delete node"><i class="fa fa-trash-o"></i></a>
                <a class="button export" title="Export as an image"><i class="fa fa-floppy-o"></i></a>
                <input type="text" class='updateStyle color-picker' data-mm-target-property='background'/>
                <a class="button changeBackground" title="Change mindmap background"><i class="fa fa-desktop"></i></a>
            </div>
            <div class="icons">
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/21_yellow_black_1-150x150.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/21_yellow_black_2-150x150.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/21_yellow_black_3-150x150.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/21_yellow_black_4-150x150.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/21_yellow_black_5-150x150.png" width="24"/>

                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/check-mark-11-m.png" width="24"/>

                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/red-filled-flag-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/orange-filled-flag-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/green-filled-flag-m.png" width="24"/>

                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/facebook-like-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/us-dollar-m.png" width="24"/>

                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/star-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/idea-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/alarm-clock-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/warning-28-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/warning-38-m.png" width="24"/>

                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/start-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/arrow-58-m.png" width="24"/>
                <img src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/icon/checked-user-m.png" width="24"/>
            </div>
        </div>
		<div id="container" data-mm-context="embedded"></div>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/jquery-2.0.2.min.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/jquery.mousewheel-3.1.3.js"></script>
		<script src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/jquery.hotkeys.js"></script>
		<script src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/jquery.hammer.min.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/underscore-1.4.4.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/kinetic-v4.5.4.js"></script>
		<script src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/lib/color-0.4.1.min.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/kinetic-src/kinetic.clip.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/kinetic-src/kinetic.idea.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/kinetic-src/kinetic.connector.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/kinetic-src/kinetic.link.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/observable.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/mapjs.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/url-helper.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/content.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/layout.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/clipboard.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/map-model.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/drag-and-drop.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/kinetic-src/kinetic-mediator.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/map-toolbar-widget.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/kinetic-src/map-widget.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/link-edit-widget.js"></script>
		<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/mapjs/src/image-drop-widget.js"></script>
        <script src="<{$smarty.const.APPLICATION_URL}>/lib/spectrum/js/spectrum.js" type="text/javascript"></script>
        <script>
            $(function() {
                $('canvas').css('background', 'url(<{$mindmap_background_url}>) repeat rgb(125, 156, 173)');

                $('.changeBackground').click(function() {
                    $.ajax({
                		url: '<{$smarty.const.APPLICATION_URL}>/mindmap/changeBackground/<{$mindmap_id}>',
                		success: function(data){
            		        var ele = {};

            		        if ($('#mindmap-wallpaper').length > 0) {
            		            ele = $('#mindmap-wallpaper');
            		        } else {
            		            ele = $('<div id="mindmap-wallpaper"></div>').appendTo('body');
            		        }

        			        ele.html(data);

                			$('.loading').hide();
                		}
                	});
                });
            });
        </script>
		<script>
            jQuery('.color-picker').spectrum({
                color: "#A486E8",
                flat: false,
                showInput: false,
                //className: "full-spectrum",
                showInitial: false,
                showPalette: true,
                showSelectionPalette: true,
                showPaletteOnly: true,
                maxPaletteSize: 15,
                preferredFormat: "hex",
                //localStorageKey: "spectrum.example",
                palette: [
                    /*["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)", "rgb(153, 153, 153)","rgb(183, 183, 183)",
                    "rgb(204, 204, 204)", "rgb(217, 217, 217)", "rgb(239, 239, 239)", "rgb(243, 243, 243)", "rgb(255, 255, 255)"],*/
                    ["rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
                    "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(153, 0, 255)", "rgb(255, 0, 255)",
                    "rgb(255, 242, 204)", "rgb(217, 234, 211)", "rgb(255, 255, 255)"],
                    /*
                    ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)",
                    "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)",
                    "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)",
                    "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)",
                    "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)",
                    "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
                    "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
                    "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
                    "rgb(133, 32, 12)", "rgb(153, 0, 0)", "rgb(180, 95, 6)", "rgb(191, 144, 0)", "rgb(56, 118, 29)",
                    "rgb(19, 79, 92)", "rgb(17, 85, 204)", "rgb(11, 83, 148)", "rgb(53, 28, 117)", "rgb(116, 27, 71)",
                    "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)",
                    "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]*/
                ]
            });

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
                MAPJS.defaultStyles = {
                    root: {background: '<{if $mindmap_root_background}><{$mindmap_root_background}><{else}>#22AAE0<{/if}>'},
                    nonRoot: {background: '<{if $mindmap_node_background}><{$mindmap_node_background}><{else}>#FFFFFF<{/if}>'}
                };
                MAPJS.nextId = function () {
                    var nextid = 0;

                    jQuery.ajax({
                         url:    '<{$smarty.const.APPLICATION_URL}>/api/mindmapitem/nextId',
                         success: function(result) {
                                      nextid = result;
                                  },
                         async:   false
                    });

                    return nextid;
                };
				window.onerror = alert;
				var container = jQuery('#container'),
				idea = MAPJS.content(<{$json_mindmap}>),
				isTouch = false,
				imageInsertController = new MAPJS.ImageInsertController("http://localhost:4999?u="),
				mapModel = new MAPJS.MapModel(MAPJS.KineticMediator.layoutCalculator, []);
				container.mapWidget(console,mapModel, isTouch, imageInsertController);
				jQuery('body').mapToolbarWidget(mapModel);
				jQuery('body').attachmentEditorWidget(mapModel);
				mapModel.setIdea(idea);
				jQuery('#linkEditWidget').linkEditWidget(mapModel);
				window.mapModel = mapModel;
				jQuery('.arrow').click(function () {
					jQuery(this).toggleClass('active');
				});

                // VIETTQ
                var update_node_data = function(nodeId, postString) {
                    postString = postString || '';

                    var node = mapModel.findIdeaById(nodeId);
                    var parentId = mapModel.getCurrentLayout().connectors[nodeId].from;
                    var parentIdea = mapModel.findIdeaById(parentId);
                    var parentIdToSet = parentIdea.isMindmapRoot? 0 : parentIdea.id;
                    var rank = parentIdea.findChildRankById(nodeId);

                    if (isNaN(rank)) {
                        rank = 1;
                    }

                    jQuery.ajax({
                         type:   'post',
                         url:    '<{$smarty.const.APPLICATION_URL}>/api/' + (node.isMindmapRoot? 'mindmap' : 'mindmapitem') + '/update/' + nodeId,
                         data:   'PARENT=' + parentIdToSet + '&RANK=' + rank + (postString.trim().length > 0? '&' + postString.trim() : '')
                    });
                };

                // VIETTQ
				mapModel.addEventListener('ideaChanged', function (method, args) {
                    //console.log('change ' + method);
                    //console.log(args);

                    var commands = [];

                    if (method == 'batch') {
                        jQuery.each(args, function(index, value) {
                            var m = value.shift();
                            var a = value;

                            commands[index] = [m, a];
                        })
                    } else {
                        commands = [[method, args]];
                    }

                    jQuery.each(commands, function(index, value) {
                        method = value[0];
                        args = value[1];

                        //console.log('command ' + method);
                        //console.log(args);

    				    switch (method) {
    				        case 'addSubIdea':
                                var nodeId = args[2];
                                update_node_data(nodeId);

    				            break;

    				        case 'changeParent':
                                var nodeId = args[0];
                                update_node_data(nodeId);

    				            break;

    				        case 'flip':
                                var nodeId = args[0];
                                update_node_data(nodeId);

    				            break;

    				        case 'positionBefore':
                                var nodeId = args[0];
                                update_node_data(nodeId);

                                var nodeId2 = args[1];
                                if (nodeId2 != null) {
                                    update_node_data(nodeId2);
                                }

    				            break;

    				        case 'updateAttr':
                                var nodeId = args[0];
                                var node = mapModel.findIdeaById(nodeId);

                                switch (args[1]) {
                                    case 'style':
                                        var background = args[2].background.replace('#', '');

                                        if (node.isMindmapRoot) {
                                            jQuery.get('<{$smarty.const.APPLICATION_URL}>/api/mindmap/update/' + nodeId + '/ROOT_BACKGROUND/' + encodeURIComponent(background));
                                        } else {
                                            jQuery.get('<{$smarty.const.APPLICATION_URL}>/api/mindmapitem/update/' + nodeId + '/BACKGROUND/' + encodeURIComponent(background));
                                        }

                                        break;

                                    case 'icon':
                                        var icon = args[2].url;

                                        if (node.isMindmapRoot) {
                                            // Yet supported
                                        } else {
                                            jQuery.get('<{$smarty.const.APPLICATION_URL}>/api/mindmapitem/update/' + nodeId + '?ICON=' + encodeURIComponent(icon));
                                        }

                                    case 'collapsed':
                                        var collapsed = args[2]? 1 : 0;

                                        if (node.isMindmapRoot) {
                                            jQuery.get('<{$smarty.const.APPLICATION_URL}>/api/mindmap/update/' + nodeId + '/COLLAPSED/' + collapsed);
                                        } else {
                                            jQuery.get('<{$smarty.const.APPLICATION_URL}>/api/mindmapitem/update/' + nodeId + '/COLLAPSED/' + collapsed);
                                        }

                                    default:
                                        break;
                                }

    				            break;

                            default:
                                break;
    				    }

                    });
				});

                // VIETTQ
				mapModel.addEventListener('nodeCreated', function (newNode) {
				    var node = mapModel.findIdeaById(newNode.id);
                    var parentIdea = mapModel.findIdeaById(mapModel.getCurrentlySelectedIdeaId());

                    jQuery.ajax({
                         type:   'post',
                         url:    '<{$smarty.const.APPLICATION_URL}>/api/' + (node.isMindmapRoot? 'mindmap' : 'mindmapitem') + '/save',
                         data:   JSON.stringify({
                            ID_MINDMAP : '<{$mindmap_id}>',
                            PARENT: parentIdea.isMindmapRoot? 0 : parentIdea.id,
                            TITLE: newNode.title,
                            ID:  newNode.id
                         })
                    });
            	});

                // VIETTQ
				mapModel.addEventListener('nodeRemoved', function (oldNode, nodeId) {
				    var parentIdea = mapModel.findIdeaById(mapModel.getCurrentlySelectedIdeaId());

                    if (!parentIdea.getAttr('collapsed')) {
                        jQuery.get('<{$smarty.const.APPLICATION_URL}>/api/mindmapitem/delete/'+nodeId);
                    }
            	});

                // VIETTQ
				mapModel.addEventListener('nodeTitleChanged', function (newNode) {
    				var node = mapModel.findIdeaById(newNode.id);

                    jQuery.ajax({
                         type:   'post',
                         url:    '<{$smarty.const.APPLICATION_URL}>/api/' + (node.isMindmapRoot? 'mindmap' : 'mindmapitem') + '/update/' + newNode.id,
                         data:   'TITLE=' + newNode.title
                    });
            	});

            	// VIETTQ
                jQuery('.icons img').click(function(){
                    var node = mapModel.findIdeaById(mapModel.getCurrentlySelectedIdeaId());

                    var src = $(this).attr('src');

                    if (node.attr && node.attr.icon && node.attr.icon.url && src == node.attr.icon.url) {
                        src = ' ';
                    }

                    mapModel.setIcon('', src, 24, 24, 'right', node.id);
                });

            	// VIETTQ
                jQuery('.visitNode').click(function(){
                    var node = mapModel.findIdeaById(mapModel.getCurrentlySelectedIdeaId());

                    if (!node.isMindmapRoot) {
                        window.open("<{$smarty.const.APPLICATION_URL}>/mindmapitem/mapview/" + node.id, node.title, "menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes");
                    }
                });

            	// VIETTQ
                jQuery('.export').click(function(){
                    var id = 'mindmap-canvas';
                    var canvasObject = $('.kineticjs-content canvas').attr('id', id);
                    var canvas = document.getElementById(id);

                    window.open(canvas.toDataURL("image/png"), '_blank');
                });

                jQuery('.mindmap-selector').change(function() {
                    var select = $(this);
                    var id = select.find(':selected').val();

                    if (id == -1) {
                        window.location.href = '<{$smarty.const.APPLICATION_URL}>/mindmap/newmap';
                    } else {
                        window.location.href = '<{$smarty.const.APPLICATION_URL}>/mindmap/mapview/' + id;
                    }
                });
			}());
		</script>
	</body>
</html>
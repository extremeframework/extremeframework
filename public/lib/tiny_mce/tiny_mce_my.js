tinyMCE.init({
	// General options
	mode : "exact",
	theme : "advanced",
	plugins : "lioniteimages,media,inlinepopups,fullscreen,paste,table",
    relative_urls : false,
    remove_script_host : false,
    convert_urls : true,
    force_br_newlines : false,
    force_p_newlines : true,
    forced_root_block : '',
	entity_encoding : "raw",

	// Paste options
    paste_auto_cleanup_on_paste : true,
    paste_remove_styles : true,
    paste_remove_styles_if_webkit : true,
    paste_remove_spans : true,

	// Theme options
    theme_advanced_buttons1 : "bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,formatselect,bullist,numlist,outdent,indent,separator,link,unlink,anchor,lioniteimages,media,separator,undo,redo,cleanup,code,separator,sub,sup,blockquote,table,fullscreen",
	theme_advanced_toolbar_location : "top",
	theme_advanced_statusbar_location : "bottom",
	theme_advanced_resizing : true,
    height:"350px",
    width:"600px",

	// Content CSS (should be your site CSS)
	content_css : APPLICATION_URL + "/css/content.css",
});
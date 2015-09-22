<{include file="header.tpl"}>
<link href="<{$smarty.const.APPLICATION_URL}>/css/layout.css" rel="stylesheet" type="text/css" />
</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_LAYOUT')}>
<{include file="top.tpl"}>

<h1 class="heading"><span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{$title}></span></h1>

<div style="float:right;padding:5px 0 5px 0;">
<b>Page:</b> <select name="page_id" class="select" style="width:200px" onchange="if(this.value!='0') window.location = '<{$smarty.const.APPLICATION_URL}>/customlayout/'+this[this.selectedIndex].value; else window.location = '<{$smarty.const.APPLICATION_URL}>/customlayout/';">
    <option value="0">--- Select a Page ---</option>
    <{foreach from=$pages item=item}>
        <option value="<{$item->ID}>"<{if $item->ID == $pageid}> selected<{/if}>><{$item->NAME}></option>
    <{/foreach}>
  </select>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td width="250" valign="top" style="padding-top:6px">
		          <ul id="default" class="modList">
		          <{foreach from=$modules item=item}>
                        <li id="<{$item->ID}>" class="mod"><{$item->NAME}></li>
                  <{/foreach}>
                  </ul>
        </td>
        <td valign="top">
            <{if $layout}><{include file="$layout"}><{/if}>
         </td>
      </tr>
    </tbody></table>

<{if $pageid}>
<script type="text/javascript">
// <![CDATA[
$(function() {
	$("#default,<{$jquerypositions}>").sortable({
		connectWith: '.modList',
		placeholder: 'modPlace',
		update: savePosition
	});

});

function savePosition() {
	var place = "";
	var count = 0;
	$(".mod").each(function() {
	    if (this.parentNode.id != 'default') {
    		count++;
    		place += ("modules[" + this.parentNode.id + "][]" + "=" + this.id + "&");
        }
	});
	$.ajax({
		type: "post",
		url: "<{$smarty.const.APPLICATION_URL}>/customlayout/update?pageid=" + <{$pageid}>,
		data: place
	});
}
// ]]>
</script>
<{/if}>

<{include file="footer.tpl"}>
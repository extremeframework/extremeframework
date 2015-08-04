<{include file="headerbar.tpl"}>

<div id="container">
<!--:pagebodybegin:-->

<{if Framework::hasModule('AdminMenu')}>
    <{if isset($smarty.request.context) && $smarty.request.context == 'settings'}>
        <{include file="menu.adminex.tpl"}>
    <{else}>
        <{$style = get_option('admin-menu-style', 'adminex', null, false)}>

        <{if $style == 'easytree'}>
            <{include file="menu.easytree.tpl"}>
        <{elseif $style == 'adminex'}>
            <{include file="menu.adminex.tpl"}>
        <{else}>
            <{include file="menu.tpl"}>
        <{/if}>
    <{/if}>
<{/if}>

<{if isset($smarty.session.user)}>
    <{if Framework::hasModule('AdminShortcut')}>
        <div id="shortcuts" <{if $is_horizontal_menu_visible}>class="with-horizontal-menu"<{/if}>>
            <form method="post" action="<{$smarty.const.APPLICATION_URL}>/adminshortcut/execute/" class="scope-main">
                <input type="text" name="op" placeholder="<{_t('Quick operation', true)}>" style="height:24px; width:130px;"/>
            </form>
            <script type="text/javascript">
                $(function() {
                    if (document.activeElement == document.body) {
                    	$('#shortcuts form :input:visible:first').focus();
                    }
                });
            </script>
        </div>
    <{/if}>
<{/if}>

<div id="main-body" class="main-content">
<!--:mainbodybegin:-->

<{if Framework::hasModule('AdminMenu')}>
    <{$is_horizontal_menu_visible = false}>
    <{include file="menu.horizontal.tpl"}>
<{/if}>

<div class="content-inner">
<{assign var='parentmenu' value=0}>
<{assign var='currentmenu' value=0}>
<{if isset($smarty.session.flatmenu) }>
    <{foreach from=$smarty.session.flatmenu item=menuitem}>
        <{if isset($module) && $menuitem->MODULE == $module}>
            <{assign var='currentmenu' value=$menuitem->ID}>
            <{if $menuitem->PARENT}>
                <{assign var='parentmenu' value=$menuitem->PARENT}>
            <{/if}>
        <{/if}>
    <{/foreach}>
<{/if}>
<{if !$parentmenu}>
    <{assign var='parentmenu' value=$currentmenu}>
<{/if}>

<{if isset($smarty.session.user) }>
    <div id="navigation" class="hidden-print">
        <input class="navigation-quick-search" placeholder="<{_t('Quick search', true)}>..."/>
        <{include file="menu.items.tpl" menus=$smarty.session.menu parent=0 depth=0}>
        <div class="clearer"></div>
    </div>

	<script type="text/javascript">
    	$(function(){
    		$('#navigation ul.sf-menu').superfish();

            // Enable vertical scrollbar for the navigation menu
            //$('#navigation').css({'height': $(window).height() - 60});
    		$('#navigation').niceScroll({horizrailenabled: false, autohidemode: true, cursorcolor: 'rgb(213, 213, 213)', cursorborderradius: 0});
    		$('.nicescroll-rails').css('left', $('#navigation').width());

    		// Navigation toggler
    		$('.navigation-toggler').off('click').on('click', function(){
                $('#navigation').toggle({animation:'queuedLeft', position:'left', full:true});
                $('#main-body').toggleClass('with-navigation');
    		});
    	});

        $(function(){
            $('.navigation-quick-search').keyup(function(){
                var input = $(this);
                var search = input.val().trim();

                $('ul.sf-menu li').each(function(){
                    var li = $(this);
                    var text = li.text().trim();

                    var match = search.length == 0 || text.toLowerCase().indexOf(search.toLowerCase()) !== -1;

                    if (match) {
                        li.show();
                    } else {
                        li.hide();
                    }
                });
            });
        });
    </script>
<{/if}>
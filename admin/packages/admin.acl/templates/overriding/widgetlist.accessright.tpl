<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<table class="item_list" id="accessrightadvancedlist">
	<thead>
	<tr>
         <th><{_t('Module')}></th>
         <th><{_t('Actions')}></th>
	</tr>
	</thead>
    <{php}>
    	$template->assign('summable', array());
    <{/php}>
	<tbody>
		<{foreach from=$modules item=row}>
			<tr id="item_<{$row[2]}>" class="<{if $counter%2 }>row1<{else}>row0<{/if}>" data-module="<{$row[0]}>">
                <td>
                    <{$row[3]}>
                </td>
               <{assign var=idmodule value=$row[2]}>
				<td style="width:80%">
                    <{foreach from=$row[1] item=rowchild}>
						<div class="button-general <{if $available_actions.$idmodule.$rowchild==$rowchild}>button-selected<{/if}>"><a class="toggle" data-action="<{$rowchild}>"><span class="button-face"><{$rowchild}></span></a></div>
                    <{/foreach}>
				</td>
			</tr>
		<{/foreach}>
	</tbody>
</table>

<script type="text/javascript">
$(function() {
	var ugid = '<{$id_user_group}>';

	$('a.toggle').click(function(e) {
        e.preventDefault();

		var a = $(this);
		var div = a.closest('div');
		var tr = div.closest('tr');

		var ison = div.hasClass('button-selected');

		var module = tr.attr('data-module');
		var action = a.attr('data-action');

		var url = null;

		if (ison) {
			url = '<{$smarty.const.APPLICATION_URL}>/accessright/jsonRemovePermission/' + ugid + '/' + module + '/' + action;
		} else {
			url = '<{$smarty.const.APPLICATION_URL}>/accessright/jsonAddPermission/' + ugid + '/' + module + '/' + action;
		}

		$.get(url, function(response) {
			if (response.success) {
				div.toggleClass('button-selected');

				var checkbox = a.find(':checkbox');

				if (ison) {
					checkbox.attr('checked', false);
				} else {
					checkbox.attr('checked', true);
				}
			}
		}, 'json');

        return false;
	});
});
</script>

<!--:listbodyend:-->
</div>
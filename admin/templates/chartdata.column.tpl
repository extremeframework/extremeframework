<chart>
	<series>
    <{foreach from=$data key=i item=item}>	
		<value xid="<{$i}>"><{$item.label}></value>
    <{/foreach}>			
	</series>
	<graphs>
		<graph gid="1">
        <{foreach from=$data key=i item=item}>	
    		<value xid="<{$i}>"><{$item.value}></value>
        <{/foreach}>			
		</graph>
	</graphs>
</chart>
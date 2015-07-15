<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-postrelation">

<{include file="top.tpl"}>

<script type="text/javascript">
function remove_attachment(element, attachment, spanid)
{
    element.value = element.value.replace(attachment, '');
    document.getElementById(spanid).style.visibility = 'hidden';
    document.getElementById(spanid).style.display = 'none';
}
</script>

<h2 class="heading"><{$formtitle}></h2>

<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=field item=message}>
            <li data-error-field="<{$field}>"><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="postrelationform" id="postrelationform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

<!-- Details -->
<div class="section" style="padding: 10px 0;">
    <div>
        <{foreach from=$columns item=column }>
                <{if $columnsettings.$column }>
                	<div class="form-row <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{$columnsettings.$column->text}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-<{$columnsettings.$column->code}>">
                		    <{include file="input-item.tpl"}>
                		</div>
                	</div>
            
                <{elseif $column == 'ID_POST' }>
                	<div class="form-row <{if in_array('ID_POST', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_POST')}><{if in_array('ID_POST', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-post">

                                                    <{if isset($formdata.ID_POST) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post" name="`$prefix`postrelation_formdata_ID_POST" value=$formdata.ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'PEER_ID_POST' }>
                	<div class="form-row <{if in_array('PEER_ID_POST', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PEER_POST')}><{if in_array('PEER_ID_POST', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-peer-id-post">

                                                    <{if isset($formdata.PEER_ID_POST) }>
                            <{assign var='tmp_value' value=$formdata.PEER_ID_POST}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-peer-id-post" name="`$prefix`postrelation_formdata_PEER_ID_POST" value=$formdata.PEER_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_POST_RELATION_TYPE' }>
                	<div class="form-row <{if in_array('ID_POST_RELATION_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_POST_RELATION_TYPE')}><{if in_array('ID_POST_RELATION_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-post-relation-type">

                                                    <{if isset($formdata.ID_POST_RELATION_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST_RELATION_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post-relation-type" name="`$prefix`postrelation_formdata_ID_POST_RELATION_TYPE" value=$formdata.ID_POST_RELATION_TYPE datasource="POST_RELATION_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#postrelationform').attr('action', '<{$actionurl}>');$('#postrelationform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postrelation/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#postrelationform', 'f2', '.button-save');
    	bind_hotkey('#postrelationform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#postrelationform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>
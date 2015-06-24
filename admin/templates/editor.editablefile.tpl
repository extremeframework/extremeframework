<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">

<{if $details->ID > 0}>
    <{$tmp = strtolower($smarty.const.L_EDITABLE_FILE)}>
    <{$title = "`$smarty.const.L_EDIT` $tmp"}>
<{else}>
    <{$tmp = strtolower($smarty.const.L_EDITABLE_FILE)}>
    <{$title = "`$smarty.const.L_NEW` $tmp"}>
<{/if}>

<{include file="top.tpl"}>

<h1 class="heading"><span class="h"><{$title}></span></h1>

<{foreach from=$messages.editablefile key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<form name="editablefileform" id="editablefileform" action="<{$smarty.const.APPLICATION_URL}>/editablefile/savefile/?back=1" method="post" enctype="multipart/form-data">
<{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>"><{/if}>
<{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>"><{/if}>

<!-- Details -->
<div class="section">
<div>
                        <{if empty($columns2hide) || !in_array('NAME', $columns2hide) }>
            	<div class="attribute-line column-name">
            		<label class="attribute-name"><{label key="L_EDITABLE_FILE_NAME"}></label>
            		<span class="attribute-value">

    <{$details->NAME}>
            		</span>
            	</div>
        	<{/if}>
    		                    <{if empty($columns2hide) || !in_array('FILE_PATH', $columns2hide) }>
            	<div class="attribute-line column-file-path">
            		<label class="attribute-name"><{label key="L_FILE_PATH"}></label>
            		<span class="attribute-value">

    <{$details->FILE_PATH}>
            		</span>
            	</div>
        	<{/if}>

        	<div class="attribute-line column-content">
        		<label><{label key="L_CONTENT"}></label>
        		<div class="form-field column-content">

    <textarea class="input-content" style="font-family:Courier New" id="<{$prefix}>editablefile_formdata_CONTENT" name="<{$prefix}>editablefile_formdata_CONTENT" rows="10" cols="80"><{$content}></textarea>
            		</div>
        	</div>

    	    <input type="hidden" class="input-id" name="editablefile_formdata_ID" value="<{$details->ID}>">
    	    <input type="hidden" class="input-file-path" name="editablefile_formdata_FILE_PATH" value="<{$details->FILE_PATH}>">

<div class="clearer"></div>


<!-- Control buttons -->
<div class="button-bar buttons">
    <div class="button-general button-save">
        <a class="button-save" onclick="$('#editablefileform').submit();return false;"><span class="button-face"><{label key="L_SAVE"}></span></a>
    </div>
    <{if $details->ID > 0}>
        <{/if}>
    <div class="button-general">
        <a class="button-cancel" href="<{$smarty.const.APPLICATION_URL}>/editablefile/cancel/"><span class="button-face"><{label key="L_CANCEL"}></span></a>
    </div>
    <div class="clearer"></div>
</div>
</form>

<{include file="footer.tpl"}>
<{$type = $customfield->TYPE}>
<{$name = $customfield->NAME}>
<{$module = $customfield->MODULE}>
<{$column = $customfield->COLUMN}>
<{$columncode = $customfield->COLUMN_CODE}>
<{$settings = $customfield->SETTINGS}>

<{if $type == 'textarea'}>
    <textarea class="input-<{$columncode}>" id="<{$module}>_formdata_<{$column}>_<{$id}>" name="<{$module}>_formdata_<{$column}>" <{if $settings.rows}>rows="<{$settings.rows}>"<{/if}> <{if $settings.cols}>cols="<{$settings.cols}>"<{/if}>><{$value}></textarea>
<{elseif $type == 'html'}>
    <textarea class="input-<{$columncode}>" id="<{$module}>_formdata_<{$column}>_<{$id}>" name="<{$module}>_formdata_<{$column}>" <{if $settings.rows}>rows="<{$settings.rows}>"<{/if}> <{if $settings.cols}>cols="<{$settings.cols}>"<{/if}>><{$value}></textarea>
    <script type="text/javascript">htmlEditor('<{$module}>_formdata_<{$column}>_<{$id}>')</script>
<{elseif $type == 'password'}>
    <input class="input-<{$columncode}> input-type-password" type="password" name="<{$module}>_formdata_<{$column}>" value="<{if $value}>*****<{/if}>" />
<{elseif $type == 'checkbox'}>
    <span class="input-type-radio"><input class="input-<{$columncode}>" type="checkbox" name="<{$module}>_formdata_<{$column}>" value="1" <{if $value}>checked="checked"<{/if}> /><{$name}></span>
<{elseif $type == 'yesno'}>
    <span class="input-type-radio"><input class="input-<{$columncode}>" type="radio" name="<{$module}>_formdata_<{$column}>" value="1" <{if $value}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$module}>_formdata_<{$column}>" value="0" <{if !$value}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
<{elseif $type == 'truefalse'}>
    <span class="input-type-radio"><input class="input-<{$columncode}>" type="radio" name="<{$module}>_formdata_<{$column}>" value="1" <{if $value}>checked="checked"<{/if}>><{label key="L_TRUE"}> <input type="radio" name="<{$module}>_formdata_<{$column}>" value="0" <{if !$value}>checked="checked"<{/if}> /><{label key="L_FALSE"}></span>
<{elseif $type == 'enabledisable'}>
    <span class="input-type-radio"><input class="input-<{$columncode}>" type="radio" name="<{$module}>_formdata_<{$column}>" value="1" <{if $value}>checked="checked"<{/if}>><{label key="L_ENABLED"}> <input type="radio" name="<{$module}>_formdata_<{$column}>" value="0" <{if !$value}>checked="checked"<{/if}> /><{label key="L_DISABLED"}></span>
<{elseif $type == 'gender'}>
    <span class="input-type-radio"><input class="input-<{$columncode}>" type="radio" name="<{$module}>_formdata_<{$column}>" value="1" <{if $value}>checked="checked"<{/if}>><{label key="L_MALE"}> <input type="radio" name="<{$module}>_formdata_<{$column}>" value="0" <{if !$value}>checked="checked"<{/if}> /><{label key="L_FEMALE"}></span>
<{elseif $type == 'date' || $type == 'datetime'}>
    <input class="input-<{$columncode}> input-type-date field-date" type="text" id="<{$module}>_formdata_<{$column}>" name="<{$module}>_formdata_<{$column}>" value="<{$value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
<{elseif $type == 'image' || $type == 'video'}>
	<input class="input-<{$columncode}> input-type-file" type="file" name="<{$column}>" />
    <span class="input-sizes-width-height"><input type="text" name="<{$column}>[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="<{$column}>[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $value}><div style="clear:both"></div><span id="<{$module}>_<{$column}>"><{media src=$value}> <a onclick="remove_attachment(document.<{$module}>form.<{$module}>_formdata_<{$column}>, '<{$value}>', '<{$module}>_<{$column}>')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$module}>_formdata_<{$column}>" value="<{$value}>" />
<{elseif $type == 'file'}>
	<input class="input-<{$columncode}> input-type-file" type="file" name="<{$column}>" />
	<{if $value}><span id="<{$module}>_<{$column}>"><br/><a href="<{$smarty.const.UPLOAD_URL}>/<{$value}>"><{$value|basename}></a> [<a onclick="remove_attachment(document.<{$module}>form.<{$module}>_formdata_<{$column}>, '<{$value}>', '<{$module}>_<{$column}>')">X</a>]</span><{/if}>
    <input type="hidden" name="<{$module}>_formdata_<{$column}>" value="<{$value}>" />
<{elseif $type == 'attachment'}>
	<input class="input-<{$columncode}> input-type-file" type="file" name="<{$column}>" />
	<input type="hidden" name="<{$module}>_formdata_<{$column}>" value="<{$value}>" />
    <{framework_attachment_edit module=$module column=$column attachment=$value baseurl=$smarty.const.UPLOAD_URL}>
<{elseif $type == 'number'}>
    <input class="input-<{$columncode}> input-type-number number-format" type="text" name="<{$module}>_formdata_<{$column}>" value="<{if $value != 0}>"<{$value}><{/if}>" />
<{elseif $type == 'price'}>
    <input class="input-<{$columncode}> input-type-currency currency-format" type="text" name="<{$module}>_formdata_<{$column}>" value="<{$value}>"  />
<{elseif $type == 'select'}>
    <{html_ref_select multiple=$settings.multiple autocomplete="1" ajax="0" id="input-`$columncode`" class="input-`$columncode`" name="`$module`_formdata_`$column`" value=$value options=$settings.options groupcol=$settings.groupcol blankitem=$settings.blankitem}>
<{elseif $type == 'refselect'}>
    <{html_ref_select multiple=$settings.multiple autocomplete="1" ajax="0" id="input-`$columncode`" class="input-`$columncode`" name="`$module`_formdata_`$column`" value=$value datasource=$settings.datasource valuecol=$settings.valuecol textcol=$settings.textcol sortcol=$settings.sortcol groupcol=$settings.groupcol blankitem=$settings.blankitem}>
<{else}>
    <input class="input-<{$columncode}> input-type-text" type="text" name="<{$module}>_formdata_<{$column}>" value="<{$value|escape}>"  />
<{/if}>
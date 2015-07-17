<{if $columnsettings.$column->type == 'textarea'}>
    <textarea class="input-<{$columnsettings.$column->code}>" name="<{$prefix}><{$module}>_formdata_<{$column}>" cols="80" rows="5"><{$formdata.$column|escape}></textarea>
<{elseif $columnsettings.$column->type == 'password'}>
    <input type="password" class="input-<{$columnsettings.$column->code}>" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="<{$formdata.$column|escape}>"/>
<{elseif $columnsettings.$column->type == 'refselect'}>
    <{html_ref_select autocomplete="1" method="" class="input-<{$columnsettings.$column->code}>" name="`$prefix``$module`_formdata_`$column`" value=$formdata.$column datasource="<{$columnsettings.$column->settings.datasource}>" valuecol="<{$columnsettings.$column->settings.valuecol}>" textcol="<{$columnsettings.$column->settings.textcol}>" sortcol="<{$columnsettings.$column->settings.sortcol}>" blankitem=""}>
<{elseif $columnsettings.$column->type == 'date' || $columnsettings.$column->type == 'datetime'}>
    <input type="text" class="input-<{$columnsettings.$column->code}> field-date" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="<{$formdata.$column|escape}>"/>
<{elseif $columnsettings.$column->type == 'number'}>
    <input class="input-<{$columnsettings.$column->code}>" type="text" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="<{if $formdata.<{$column}> != 0}><{$formdata.<{$column}>}><{/if}>"/>
<{elseif $columnsettings.$column->type == 'checkbox'}>
    <input type="checkbox" class="input-<{$columnsettings.$column->code}>" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="1" <{if $formdata.<{$column}>}>checked="checked"<{/if}>/>
<{elseif $columnsettings.$column->type == 'yesno'}>
    <input class="input-<{$columnsettings.$column->code}>" type="radio" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="1" <{if $formdata.<{$column}>}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="0" <{if !$formdata.<{$column}>}>checked="checked"<{/if}>><{_t('No')}>
<{elseif $columnsettings.$column->type == 'truefalse'}>
    <input class="input-<{$columnsettings.$column->code}>" type="radio" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="1" <{if $formdata.<{$column}>}>checked="checked"<{/if}>><{_t('True')}> <input type="radio" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="0" <{if !$formdata.<{$column}>}>checked="checked"<{/if}>><{_t('False')}>
<{elseif $columnsettings.$column->type == 'enabledisable'}>
    <input class="input-<{$columnsettings.$column->code}>" type="radio" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="1" <{if $formdata.<{$column}>}>checked="checked"><{/if}>><{_t('Enabled')}> <input type="radio" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="0" <{if !$formdata.<{$column}>}>checked="checked"<{/if}>><{_t('Disabled')}>
<{elseif $columnsettings.$column->type == 'gender'}>
    <input class="input-<{$columnsettings.$column->code}>" type="radio" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="1" <{if $formdata.<{$column}>}>checked="checked"><{/if}>>Male <input type="radio" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="0" <{if !$formdata.<{$column}>}>checked="checked"<{/if}>>Female
<{elseif $columnsettings.$column->type == 'image' || $settings->type == 'video'}>
	<input class="input-<{$columnsettings.$column->code}>" type="file" name="<{$column}>">
    <span class="input-sizes-width-height"><input type="text" name="<{$column}>[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="<{$column}>[height]" size="3" style="height:20px;width:25px;margin:0"></span>
	<{if $formdata.<{$column}>}><span id="<{$prefix}><{$module}>_<{$column}>"><br/><{media src=$formdata.<{$column}>}> <a onclick="remove_attachment(document.<{$module}>form.<{$prefix}><{$module}>_formdata_<{$column}>, '<{$formdata.<{$column}>}>', '<{$prefix}><{$module}>_<{$column}>')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="<{$formdata.<{$column}>}>">
<{elseif $columnsettings.$column->type == 'file'}>
    <input type="file" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="<{$formdata.<{$column}>}>">
<{elseif $columnsettings.$column->type == 'attachment'}>
	<input class="input-<{$columnsettings.$column->code}>" type="file" name="<{$column}>">
	<input type="hidden" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="<{$formdata.$column}>">
	<{framework_attachment_edit prefix=$prefix module=$module column=$column attachment=$formdata.$column baseurl=$smarty.const.UPLOAD_URL}>
<{else}>
    <input type="text" class="input-<{$columnsettings.$column->code}>" name="<{$prefix}><{$module}>_formdata_<{$column}>" value="<{$formdata.$column|escape}>"/>
<{/if}>
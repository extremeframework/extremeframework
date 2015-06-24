{namespace common.edit}

/**
 * @param type
 * @param value
 * @param prefix
 * @param module
 * @param column
 */
{template .renderValueField}
	{if $type == 'date' or $type == 'datetime'}
	    <input type="text" class="field-date" name="{$prefix}{$module}_formdata_{$column}" value="{$value}">
	    <script type="text/javascript">
	    	jQuery('.field-date').datepicker({dateFormat: 'dd/mm/yyyy', appendText: '(dd/mm/yyyy)'});
		</script>
	{elseif $type == 'checkbox'}
	    <input type="checkbox" name="{$prefix}{$module}_formdata_{$column}" value="1" {if $value}checked{/if}>
	{elseif $type == 'yesno'}
	    <input type="radio" name="{$prefix}{$module}_formdata_{$column}" value="1" {if $value}checked{/if}>Yes
	    <input type="radio" name="{$prefix}{$module}_formdata_{$column}" value="0" {if $value < 1}checked{/if}>No
	{elseif $type == 'gender'}
	    <input type="radio" name="{$prefix}{$module}_formdata_{$column}" value="1" {if $value}checked{/if}>Male
	    <input type="radio" name="{$prefix}{$module}_formdata_{$column}" value="0" {if $value < 1}checked{/if}>Female
	{elseif $type == 'textarea'}
	    <textarea id="{$prefix}{$module}_formdata_{$column}" name="{$prefix}{$module}_formdata_{$column}" rows="10" cols="80">{$value}</textarea>
	{elseif $type == 'html'}
	    <textarea id="{$prefix}{$module}_formdata_{$column}" name="{$prefix}{$module}_formdata_{$column}" rows="10" cols="80">{$value}</textarea>
		<script type="text/javascript">
			htmlEditor('{$prefix}{$module}_formdata_{$column}')
		</script>
	{elseif $type == 'image'}
	    <input type="file" name="{$column}" value="{$value}">

 		{if $value}
			<span id="{$prefix}{$module}_{$column}"><br/>--TODO: call media here <a onclick="remove_attachment(document.{$module}form.{$prefix}{$module}_formdata_{$column}, '{$value}', '{$prefix}{$module}_{$column}')">Remove</a></span>
		{/if}

	    <input type="hidden" name="{$prefix}{$module}_formdata_{$column}" value="{$value}">
	{elseif $type == 'file'}
	    <input type="file" name="{$column}" value="{$value}">

 		{if $value}
			<span id="{$prefix}{$module}_{$column}"><br/>--TODO: check upload url <a onclick="remove_attachment(document.{$module}form.{$prefix}{$module}_formdata_{$column}, '{$value}', '{$prefix}{$module}_{$column}')">Remove</a></span>
		{/if}

	    <input type="hidden" name="{$prefix}{$module}_formdata_{$column}" value="{$value}">
	{elseif $type == 'listsimple'}
		<select name="{$prefix}{$module}_formdata_{$column}" value="{$value}">
			<option value="TODO">TODO</option>
			<option value="TODO">TODO</option>
		</select>
	{elseif $type == 'listsql'}
		TODO
	{elseif $type == 'listws'}
		TODO
	{elseif $type == 'number'}
	    <input type="text" name="{$prefix}{$module}_formdata_{$column}" value="{$value}" size="16">
	{elseif $type == 'password'}
	    <input type="password" name="{$prefix}{$module}_formdata_{$column}" value="">
	{else}
	    <input type="text" name="{$prefix}{$module}_formdata_{$column}" value="{$value}" size="64">
	{/if}
{/template}
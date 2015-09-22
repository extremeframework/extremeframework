<{include file="header.tpl"}>

<style>
#config-options {
    padding: 10px;
}

#config-options ul {
    padding-left: 20px;
}

#config-options li {
    padding-bottom: 10px;
}

#config-options .title {
    font-weight: bold;
    font-family: Arial;
    color: #333;
    display: block;
}

#config-options .description {
    color: #666;
    display: block;
    font-style: italic;
    line-height: 18px;
    margin-bottom: 10px;
}

#config-options .description.group {
    font-style: normal;
    margin-top: 10px;
    margin-left: 20px;
}

#config-options h3 {
    color: #fff;
    font-size: 18px;
    background-color: #7D7D7D;
    padding: 10px;
}

#config-options input[type="file"] {
    display: inline-block;
}

#config-options img {
    margin-top: 5px;
    width: auto;
    height: auto;
    max-width: 300px;
    max-height: 180px;
    border: 1px dashed gray;
    padding: 5px;
    display: block;
}
</style>

</head>
<body class="module">
<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i>Theme Settings ::<{$themecode}>::</span>
</h1>

<div class="edit_details">
    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-top">
        <div class="button-general button-save btn btn-success">
            <a class="button-save" onclick="$('#theme-configuration-form').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
        </div>
        <div class="clearer"></div>
    </div>

    <form name="configuration-form" id="theme-configuration-form" class="scope-main" action="<{$smarty.const.APPLICATION_URL}>/theme/saveSettings" method="post" enctype="multipart/form-data">
        <input type="hidden" name="themecode" value="<{$themecode}>" />
        <input type="hidden" name="app" value="<{$app}>" />

        <ul id="config-options">
            <{foreach from=$groups item=group}>
                <li>
                    <h3><{$group.title}></h3>
                    <{if $group.description}><span class="description group"><{$group.description}></span><{/if}>

                    <ul>
                        <{foreach from=$group.options item=option}>
                            <li>
                                <{$type = $option.type}>
                                <{$code = $option.code}>
                                <{$name = "formdata-`$code`"}>
                                <{$value = $values.$code.value}>

                                <{if $type != 'checkbox'}>
                                    <label class="title"><{$option.title}></label>
                                    <{if $option.description}><span class="description"><{$option.description}></span><{/if}>
                                <{/if}>

                                <{if $type == 'textarea'}>
                                    <textarea class="input-<{$code}>" name="<{$name}>" cols="80" rows="5"><{$value}></textarea>
                                <{elseif $type == 'html'}>
                                    <{$tmpid = uniqid()}>

                                    <textarea class="input-<{$code}> enable-html" name="<{$name}>" id="<{$code}>-<{$tmpid}>" cols="80" rows="5"><{$value}></textarea>
                                <{elseif $type == 'color'}>
                                    <input class="input-<{$code}> input-type-<{$type}>" type="text" name="<{$name}>" value="<{$value}>"/>
                                <{elseif $type == 'image'}>
                                	<input class="input-<{$code}> input-type-<{$type}>" type="file" name="<{$name}>">
                                    <span class="input-sizes-width-height"><input type="text" name="<{$code}>[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="<{$code}>[height]" size="3" style="height:20px;width:25px;margin:0"></span>
                                	<{if $value}><{media src=$value height="80px" width="auto"}><{/if}>
                                    <input type="hidden" name="<{$name}>" value="<{$value}>">
                                <{elseif $type == 'checkbox'}>
                                    <input class="input-<{$code}> input-type-<{$type}>" type="checkbox" name="<{$name}>" value="<{$value}>"/>
                                    <{$option.title}>
                                    <{if $option.description}><span class="description"><{$option.description}></span><{/if}>
                                <{elseif $type == 'radio'}>
                                    <{foreach from=$option.options key=key item=item}>
                                        <input class="input-<{$code}> input-type-<{$type}>" type="radio" name="<{$name}>" value="<{$key}>" <{if $key == $value}>checked<{/if}>/> <{$item}>
                                    <{/foreach}>
                                <{elseif $type == 'select'}>
                                    <select class="input-<{$code}> input-type-<{$type}>" name="<{$name}>">
                                        <{foreach from=$option.options key=key item=item}>
                                            <option value="<{$key}>" <{if $key == $value}>selected<{/if}>><{$item}></option>
                                        <{/foreach}>
                                    </select>
                                <{elseif $type == 'refselect'}>
                                    <{html_ref_select multilingual="0" autocomplete="1" name="<{$name}>" value="<{$value}>" datasource="<{$option.options.datasource}>" valuecol="<{$option.options.valuecol}>" textcol="<{$option.options.textcol}>" sortcol="<{$option.options.sortcol}>" blankitem=""}>
                                <{else}>
                                    <input class="input-<{$code}> input-type-<{$type}>" type="text" name="<{$name}>" value="<{$value}>"/>
                                <{/if}>
                            </li>
                        <{/foreach}>
                    </ul>
                </li>
            <{/foreach}>
        </ul>
    </form>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-bottom">
        <div class="button-general button-save btn btn-success">
            <a class="button-save" onclick="$('#theme-configuration-form').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
        </div>
        <div class="clearer"></div>
    </div>
</div>

<{include file="footer.tpl"}>
<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="postsectionform" id="postsectionform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/postsection/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postsection_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="postsection_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="postsection_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-title form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="postsection_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="postsection_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Post section title')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>postsection_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                    <{if $columntooltips.TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-post">
            
        
        
        
        <{if !isset($excludedcolumns['ID_POST'])}>
    
        <{if $preset == 'ID_POST'}>
            <input type="hidden" class="input-id-post" name="postsection_formdata_ID_POST" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST']) && !$acleditablecolumns['ID_POST'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST'])}>
            <input type="hidden" class="input-id-post" name="postsection_formdata_ID_POST" value="<{$details->ID_POST}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Post')}></label>
            </td>
            <td class="form-field form-field-value column-id-post" colspan="3">
                                    
            <{if Framework::hasModule('Post')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-post" class="input-id-post" name="`$prefix`postsection_formdata_ID_POST" value=$details->ID_POST text=$details->reftext_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.post.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post input-type-text" type="text" name="<{$prefix}>postsection_formdata_ID_POST" value="<{$details->ID_POST|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_POST}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-tag-line">
            
        
        
        
        <{if !isset($excludedcolumns['TAG_LINE'])}>
    
        <{if $preset == 'TAG_LINE'}>
            <input type="hidden" class="input-tag-line" name="postsection_formdata_TAG_LINE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TAG_LINE']) && !$acleditablecolumns['TAG_LINE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TAG_LINE'])}>
            <input type="hidden" class="input-tag-line" name="postsection_formdata_TAG_LINE" value="<{$details->TAG_LINE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Tag line')}></label>
            </td>
            <td class="form-field form-field-value column-tag-line" colspan="3">
                                    

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>postsection_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
                    <{if $columntooltips.TAG_LINE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TAG_LINE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-image">
            
        
        
        
        <{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="postsection_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="postsection_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Image')}></label>
            </td>
            <td class="form-field form-field-value column-image" colspan="3">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>postsection_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postsection_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>postsection_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>postsection_formdata_IMAGE" value="<{$details->IMAGE}>" />
                    <{if $columntooltips.IMAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-background-image">
            
        
        
        
        <{if !isset($excludedcolumns['BACKGROUND_IMAGE'])}>
    
        <{if $preset == 'BACKGROUND_IMAGE'}>
            <input type="hidden" class="input-background-image" name="postsection_formdata_BACKGROUND_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['BACKGROUND_IMAGE']) && !$acleditablecolumns['BACKGROUND_IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['BACKGROUND_IMAGE'])}>
            <input type="hidden" class="input-background-image" name="postsection_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Background image')}></label>
            </td>
            <td class="form-field form-field-value column-background-image" colspan="3">
                                    

	<input class="input-background-image input-type-file" type="file" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postsection_BACKGROUND_IMAGE"><{media src=$details->BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_BACKGROUND_IMAGE, '<{$details->BACKGROUND_IMAGE}>', '<{$prefix}>postsection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
                    <{if $columntooltips.BACKGROUND_IMAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.BACKGROUND_IMAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-background-color">
            
        
        
        
        <{if !isset($excludedcolumns['BACKGROUND_COLOR'])}>
    
        <{if $preset == 'BACKGROUND_COLOR'}>
            <input type="hidden" class="input-background-color" name="postsection_formdata_BACKGROUND_COLOR" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['BACKGROUND_COLOR']) && !$acleditablecolumns['BACKGROUND_COLOR'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['BACKGROUND_COLOR'])}>
            <input type="hidden" class="input-background-color" name="postsection_formdata_BACKGROUND_COLOR" value="<{$details->BACKGROUND_COLOR}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Background color')}></label>
            </td>
            <td class="form-field form-field-value column-background-color" colspan="3">
                                    

    <input class="input-background-color input-type-color" type="text" name="<{$prefix}>postsection_formdata_BACKGROUND_COLOR" value="<{$details->BACKGROUND_COLOR|escape}>"  />
                    <{if $columntooltips.BACKGROUND_COLOR}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.BACKGROUND_COLOR}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-video">
            
        
        
        
        <{if !isset($excludedcolumns['VIDEO'])}>
    
        <{if $preset == 'VIDEO'}>
            <input type="hidden" class="input-video" name="postsection_formdata_VIDEO" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIDEO']) && !$acleditablecolumns['VIDEO'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIDEO'])}>
            <input type="hidden" class="input-video" name="postsection_formdata_VIDEO" value="<{$details->VIDEO}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Video')}></label>
            </td>
            <td class="form-field form-field-value column-video" colspan="3">
                                    

	<input class="input-video input-type-file" type="file" name="<{$prefix}>postsection_formdata_VIDEO" />
    <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->VIDEO}><div style="clear:both"></div><span id="<{$prefix}>postsection_VIDEO"><{media src=$details->VIDEO}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_VIDEO, '<{$details->VIDEO}>', '<{$prefix}>postsection_VIDEO')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>postsection_formdata_VIDEO" value="<{$details->VIDEO}>" />
                    <{if $columntooltips.VIDEO}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.VIDEO}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-content">
            
        
        
        
        <{if !isset($excludedcolumns['CONTENT'])}>
    
        <{if $preset == 'CONTENT'}>
            <input type="hidden" class="input-content" name="postsection_formdata_CONTENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONTENT']) && !$acleditablecolumns['CONTENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONTENT'])}>
            <input type="hidden" class="input-content" name="postsection_formdata_CONTENT" value="<{$details->CONTENT}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Content')}></label>
            </td>
            <td class="form-field form-field-value column-content" colspan="3">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>postsection_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>postsection_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                    <{if $columntooltips.CONTENT}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CONTENT}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-link-path">
            
        
        
        
        <{if !isset($excludedcolumns['LINK_PATH'])}>
    
        <{if $preset == 'LINK_PATH'}>
            <input type="hidden" class="input-link-path" name="postsection_formdata_LINK_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LINK_PATH']) && !$acleditablecolumns['LINK_PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LINK_PATH'])}>
            <input type="hidden" class="input-link-path" name="postsection_formdata_LINK_PATH" value="<{$details->LINK_PATH}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Link path')}></label>
            </td>
            <td class="form-field form-field-value column-link-path" colspan="3">
                                    

    <input class="input-link-path input-type-text" type="text" name="<{$prefix}>postsection_formdata_LINK_PATH" value="<{$details->LINK_PATH|escape}>"  />
                    <{if $columntooltips.LINK_PATH}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.LINK_PATH}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-ordering">
            
        
        
        
        <{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="postsection_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="postsection_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Ordering')}></label>
            </td>
            <td class="form-field form-field-value column-ordering" colspan="3">
                                    
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>postsection_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                    <{if $columntooltips.ORDERING}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                    
                    <!-- Custom fields -->
                    <{if $customfields}>
    <{foreach from=$customfields item=item}>
        <tr class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
    		<td>
                <div class="form-field form-field-label">
        		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                </div>
            </td>
            <td colspan="3">
                <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                    <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                    <{if $item->TOOLTIP}>
                        <i class="fa fa-info-circle" title="<{$item->TOOLTIP}>"></i>
                    <{/if}>
                </div>
            </td>
		</tr>
	<{/foreach}>
<{/if}>                </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{plugin key="postsection_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#postsectionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#postsectionform :input').change(function() {
        $('#postsectionform').data('changed', true);
    });

        function saveDraft() {
        if ($('#postsectionform').length) {
            if ($('#postsectionform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/postsection/savedraft/",
                    data: $('#postsectionform').serialize()
                });

                $('#postsectionform').data('changed', false);
            }
        }
    }

    $(function() {
        if (window.saveDraftTimer !== 'undefined' && window.saveDraftTimer != null) {
            window.clearInterval(window.saveDraftTimer);
        }

        window.saveDraftTimer = window.setInterval(saveDraft, <{$smarty.const.SAVE_DRAFT_INTERVAL}> * 1000);
    });
    </script>

<script type="text/javascript">
    $(function() {
        $('.message li').each(function(){
            var li = $(this);
            var field = li.data('error-field');
            var target = $('.input-' + field);

            target.closest('tr').addClass('form-row-with-error');

            li.css('cursor', 'pointer').click(function(){
                target.focus();
            });
        });
    });
</script>

<script type="text/javascript">
    ///////////////////////////////////////////////////////////////////////////////
    // VISIBILITY REFLECTION
    postsection_get_editing_model = function () {
        var model = {};

        var formdata = $('#postsectionform').find('[name*=postsection_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('postsection_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    postsection_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    postsection_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            postsection_apply_block_visibility(key, value);
        });
    }

    postsection_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    postsection_update_visibility_settings = function () {
        var model = postsection_get_editing_model();

        var settings = postsection_get_visibility_settings(model);

        postsection_apply_visibility_settings(settings);
    }

    $(function() {
        $('#postsectionform :input').change(function() {
            postsection_update_visibility_settings();
        });

        postsection_update_visibility_settings();
    });
</script>
<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Post Gallery')|ucwords}></h3>
</div>


<div id="postgallery-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="postgalleryform" id="postgalleryform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/postgallery/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postgallery_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="postgallery_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="postgallery_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-title form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="postgallery_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="postgallery_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Post gallery title')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>postgallery_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                    <{if $columntooltips.TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-post">
            
        
        
        
        <{if !isset($excludedcolumns['ID_POST'])}>
    
        <{if $preset == 'ID_POST'}>
            <input type="hidden" class="input-id-post" name="postgallery_formdata_ID_POST" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST']) && !$acleditablecolumns['ID_POST'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST'])}>
            <input type="hidden" class="input-id-post" name="postgallery_formdata_ID_POST" value="<{$details->ID_POST}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Post')}></label>
            </td>
            <td class="form-field form-field-value column-id-post" colspan="3">
                                    
            <{if Framework::hasModule('Post')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-post" class="input-id-post" name="`$prefix`postgallery_formdata_ID_POST" value=$details->ID_POST text=$details->reftext_ID_POST datasource="POST" datasourcename="Post" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.post.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post input-type-text" type="text" name="<{$prefix}>postgallery_formdata_ID_POST" value="<{$details->ID_POST|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_POST}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-image form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="postgallery_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="postgallery_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Image')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-image" colspan="3">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>postgallery_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postgallery_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.postgalleryform.<{$prefix}>postgallery_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>postgallery_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>postgallery_formdata_IMAGE" value="<{$details->IMAGE}>" />
                    <{if $columntooltips.IMAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-description">
            
        
        
        
        <{if !isset($excludedcolumns['DESCRIPTION'])}>
    
        <{if $preset == 'DESCRIPTION'}>
            <input type="hidden" class="input-description" name="postgallery_formdata_DESCRIPTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DESCRIPTION']) && !$acleditablecolumns['DESCRIPTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DESCRIPTION'])}>
            <input type="hidden" class="input-description" name="postgallery_formdata_DESCRIPTION" value="<{$details->DESCRIPTION}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Description')}></label>
            </td>
            <td class="form-field form-field-value column-description" colspan="3">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-description enable-html" id="<{$prefix}>postgallery_formdata_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>postgallery_formdata_DESCRIPTION" rows="5" ><{$details->DESCRIPTION}></textarea>
                    <{if $columntooltips.DESCRIPTION}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.DESCRIPTION}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-ordering">
            
        
        
        
        <{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="postgallery_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="postgallery_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Ordering')}></label>
            </td>
            <td class="form-field form-field-value column-ordering" colspan="3">
                                    
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>postgallery_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
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
        
        <{plugin key="postgallery_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#postgalleryform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#postgalleryform :input').change(function() {
        $('#postgalleryform').data('changed', true);
    });

        function saveDraft() {
        if ($('#postgalleryform').length) {
            if ($('#postgalleryform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/postgallery/savedraft/",
                    data: $('#postgalleryform').serialize()
                });

                $('#postgalleryform').data('changed', false);
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
    postgallery_get_editing_model = function () {
        var model = {};

        var formdata = $('#postgalleryform').find('[name*=postgallery_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('postgallery_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    postgallery_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    postgallery_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            postgallery_apply_block_visibility(key, value);
        });
    }

    postgallery_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    postgallery_update_visibility_settings = function () {
        var model = postgallery_get_editing_model();

        var settings = postgallery_get_visibility_settings(model);

        postgallery_apply_visibility_settings(settings);
    }

    $(function() {
        $('#postgalleryform :input').change(function() {
            postgallery_update_visibility_settings();
        });

        postgallery_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#postgalleryform', 'f2', 'a.button-save');
    	bind_hotkey('#postgalleryform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#postgalleryform', 'f3', 'a.button-save-more');
    	bind_hotkey('#postgalleryform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#postgalleryform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>
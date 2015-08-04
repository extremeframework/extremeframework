<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="pagegalleryform" id="pagegalleryform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagegallery/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pagegallery_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="pagegallery_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="pagegallery_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="pagegallery_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="pagegallery_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Page gallery title')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagegallery_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_PAGE'])}>
    
        <{if $preset == 'ID_PAGE'}>
            <input type="hidden" class="input-id-page" name="pagegallery_formdata_ID_PAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PAGE']) && !$acleditablecolumns['ID_PAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PAGE'])}>
            <input type="hidden" class="input-id-page" name="pagegallery_formdata_ID_PAGE" value="<{$details->ID_PAGE}>" />
        <{else}>
    		<td class="form-row form-row-id-page">
                <div class="form-field form-field-label">
        		    <label><{_t('Page')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-page" colspan="3">
                <div class="form-field form-field-value column-id-page">
                                            
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-page" class="input-id-page" name="`$prefix`pagegallery_formdata_ID_PAGE" value=$details->ID_PAGE text=$details->reftext_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-page input-type-text" type="text" name="<{$prefix}>pagegallery_formdata_ID_PAGE" value="<{$details->ID_PAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_PAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_PAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="pagegallery_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="pagegallery_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-row form-row-image form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Image')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-image form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-image">
                                            

	<input class="input-image input-type-file" type="file" name="<{$prefix}>pagegallery_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagegallery_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.pagegalleryform.<{$prefix}>pagegallery_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>pagegallery_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagegallery_formdata_IMAGE" value="<{$details->IMAGE}>" />
                        <{if $columntooltips.IMAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['LINK_ID_PAGE'])}>
    
        <{if $preset == 'LINK_ID_PAGE'}>
            <input type="hidden" class="input-link-id-page" name="pagegallery_formdata_LINK_ID_PAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LINK_ID_PAGE']) && !$acleditablecolumns['LINK_ID_PAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LINK_ID_PAGE'])}>
            <input type="hidden" class="input-link-id-page" name="pagegallery_formdata_LINK_ID_PAGE" value="<{$details->LINK_ID_PAGE}>" />
        <{else}>
    		<td class="form-row form-row-link-id-page">
                <div class="form-field form-field-label">
        		    <label><{_t('Link page')}></label>
                </div>
            </td>
            <td class="form-row form-row-link-id-page" colspan="3">
                <div class="form-field form-field-value column-link-id-page">
                                            
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-link-id-page" class="input-link-id-page" name="`$prefix`pagegallery_formdata_LINK_ID_PAGE" value=$details->LINK_ID_PAGE text=$details->reftext_LINK_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-link-id-page input-type-text" type="text" name="<{$prefix}>pagegallery_formdata_LINK_ID_PAGE" value="<{$details->LINK_ID_PAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.LINK_ID_PAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.LINK_ID_PAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['LINK_PATH'])}>
    
        <{if $preset == 'LINK_PATH'}>
            <input type="hidden" class="input-link-path" name="pagegallery_formdata_LINK_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LINK_PATH']) && !$acleditablecolumns['LINK_PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LINK_PATH'])}>
            <input type="hidden" class="input-link-path" name="pagegallery_formdata_LINK_PATH" value="<{$details->LINK_PATH}>" />
        <{else}>
    		<td class="form-row form-row-link-path">
                <div class="form-field form-field-label">
        		    <label><{_t('Link path')}></label>
                </div>
            </td>
            <td class="form-row form-row-link-path" colspan="3">
                <div class="form-field form-field-value column-link-path">
                                            

    <input class="input-link-path input-type-text" type="text" name="<{$prefix}>pagegallery_formdata_LINK_PATH" value="<{$details->LINK_PATH|escape}>"  />
                        <{if $columntooltips.LINK_PATH}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.LINK_PATH}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DESCRIPTION'])}>
    
        <{if $preset == 'DESCRIPTION'}>
            <input type="hidden" class="input-description" name="pagegallery_formdata_DESCRIPTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DESCRIPTION']) && !$acleditablecolumns['DESCRIPTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DESCRIPTION'])}>
            <input type="hidden" class="input-description" name="pagegallery_formdata_DESCRIPTION" value="<{$details->DESCRIPTION}>" />
        <{else}>
    		<td class="form-row form-row-description">
                <div class="form-field form-field-label">
        		    <label><{_t('Description')}></label>
                </div>
            </td>
            <td class="form-row form-row-description" colspan="3">
                <div class="form-field form-field-value column-description">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-description enable-html" id="<{$prefix}>pagegallery_formdata_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>pagegallery_formdata_DESCRIPTION" rows="5" ><{$details->DESCRIPTION}></textarea>
                        <{if $columntooltips.DESCRIPTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DESCRIPTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="pagegallery_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="pagegallery_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('Ordering')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>pagegallery_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                        <{if $columntooltips.ORDERING}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{if $customfields}>
            <div class="layout-block layout-block-section">
                <div class="layout-section">
                    <div class="layout-section-header">
                        <span><{_t('Additional information')}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
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
                                            </div>
                                        </td>
                            		</tr>
                            	<{/foreach}>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <{/if}>

        <{plugin key="pagegallery_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagegalleryform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#pagegalleryform :input').change(function() {
        $('#pagegalleryform').data('changed', true);
    });

        function saveDraft() {
        if ($('#pagegalleryform').length) {
            if ($('#pagegalleryform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/pagegallery/savedraft/",
                    data: $('#pagegalleryform').serialize()
                });

                $('#pagegalleryform').data('changed', false);
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
    pagegallery_get_editing_model = function () {
        var model = {};

        var formdata = $('#pagegalleryform').find('[name*=pagegallery_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('pagegallery_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    pagegallery_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    pagegallery_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            pagegallery_apply_block_visibility(key, value);
        });
    }

    pagegallery_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    pagegallery_update_visibility_settings = function () {
        var model = pagegallery_get_editing_model();

        var settings = pagegallery_get_visibility_settings(model);

        pagegallery_apply_visibility_settings(settings);
    }

    $(function() {
        $('#pagegalleryform :input').change(function() {
            pagegallery_update_visibility_settings();
        });

        pagegallery_update_visibility_settings();
    });
</script>
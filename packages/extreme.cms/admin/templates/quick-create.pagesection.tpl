<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Page Section')|ucwords}></h3>
</div>


<div id="pagesection-edit" class="edit_details">

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

    <form name="pagesectionform" id="pagesectionform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagesection/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pagesection_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="pagesection_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="pagesection_form_top" args=$details}>

                        
    
    
            <!-- Custom layout tabs -->
        <div class="layout-block layout-block-tabs layout-block-tabs-bottom">
            <div id="pagesection-view-layout-tabs-general-image-misc" class="layout-tabs view-layout-tabs pagesection-view-layout-tabs" style="clear:both">
                <ul>
                                            <li><a href="#tab-general"><{_t('L_GENERAL')}></a></li>
                                            <li><a href="#tab-image"><{_t('L_IMAGE')}></a></li>
                                            <li><a href="#tab-misc"><{_t('L_MISC')}></a></li>
                                    </ul>

                                    <div id="tab-general">
                                                
                                                    
            <!-- Custom layout rows -->
        <div class="layout-block layout-block-rows">
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                            
<tr class="form-row form-row-tab-anchor-title">
            
        
        
        
        <{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-tab-anchor-title" name="pagesection_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-tab-anchor-title" name="pagesection_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Page section title')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-tab-anchor-title" colspan="3">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                    <{if $columntooltips.TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                            
<tr class="form-row form-row-title form-row-mandatory">
            
                    </tr>                                            
<tr class="form-row form-row-parent">
            
        
        
        
        <{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-parent" name="pagesection_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-parent" name="pagesection_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Code')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-parent" colspan="3">
                                    <{if $details->ID && $details->CODE != ''}>
                        <input type="hidden" class="input-parent" name="pagesection_formdata_CODE" value="<{$details->CODE}>" />
                        
    <{$details->CODE|escape}>
                    <{else}>
                        

    <input class="input-code input-type-text" type="text" name="<{$prefix}>pagesection_formdata_CODE" value="<{$details->CODE|escape}>"  />
                        <{if $columntooltips.CODE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                        <{/if}>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                            
<tr class="form-row form-row-code form-row-mandatory">
            
                    </tr>                                            
<tr class="form-row form-row-tag-line">
                        </tr>                                            
<tr class="form-row form-row-meta-keywords">
                        </tr>                                            
<tr class="form-row form-row-meta-description">
                        </tr>                                            
<tr class="form-row form-row-id-template">
            
                    </tr>                                            
<tr class="form-row form-row-content">
            
                    </tr>                                            
<tr class="form-row form-row-tags">
                        </tr>                                            
<tr class="form-row form-row-latest-update">
                        </tr>                                    </tbody>
            </table>
        </div>
        <!-- Custom layout rows end -->
    
    
    

                                                                    </div>
                                    <div id="tab-image">
                                                
                                                    
            <!-- Custom layout rows -->
        <div class="layout-block layout-block-rows">
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                            
<tr class="form-row form-row-nbr-views">
            
        
        
        
        <{if !isset($excludedcolumns['BACKGROUND_IMAGE'])}>
    
        <{if $preset == 'BACKGROUND_IMAGE'}>
            <input type="hidden" class="input-nbr-views" name="pagesection_formdata_BACKGROUND_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['BACKGROUND_IMAGE']) && !$acleditablecolumns['BACKGROUND_IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['BACKGROUND_IMAGE'])}>
            <input type="hidden" class="input-nbr-views" name="pagesection_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Background image')}></label>
            </td>
            <td class="form-field form-field-value column-nbr-views" colspan="3">
                                    

	<input class="input-background-image input-type-file" type="file" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_BACKGROUND_IMAGE"><{media src=$details->BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE, '<{$details->BACKGROUND_IMAGE}>', '<{$prefix}>pagesection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
                    <{if $columntooltips.BACKGROUND_IMAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.BACKGROUND_IMAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                            
<tr class="form-row form-row-background-image">
            
                    </tr>                                            
<tr class="form-row form-row-background-color">
            
                    </tr>                                            
<tr class="form-row form-row-font-awesome-icon">
            
        
        
        
        <{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-font-awesome-icon" name="pagesection_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-font-awesome-icon" name="pagesection_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Image')}></label>
            </td>
            <td class="form-field form-field-value column-font-awesome-icon" colspan="3">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>pagesection_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>pagesection_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagesection_formdata_IMAGE" value="<{$details->IMAGE}>" />
                    <{if $columntooltips.IMAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                            
<tr class="form-row form-row-image">
            
                    </tr>                                    </tbody>
            </table>
        </div>
        <!-- Custom layout rows end -->
    
    
    

                                                                    </div>
                                    <div id="tab-misc">
                                                
                                                    
            <!-- Custom layout rows -->
        <div class="layout-block layout-block-rows">
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                            
<tr class="form-row form-row-video">
                        </tr>                                            
<tr class="form-row form-row-">
            
        
        
        
        <{if !isset($excludedcolumns['VIEW_MORE_TITLE'])}>
    
        <{if $preset == 'VIEW_MORE_TITLE'}>
            <input type="hidden" class="input-" name="pagesection_formdata_VIEW_MORE_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VIEW_MORE_TITLE']) && !$acleditablecolumns['VIEW_MORE_TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VIEW_MORE_TITLE'])}>
            <input type="hidden" class="input-" name="pagesection_formdata_VIEW_MORE_TITLE" value="<{$details->VIEW_MORE_TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('View more title')}></label>
            </td>
            <td class="form-field form-field-value column-" colspan="3">
                                    

    <input class="input-view-more-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_TITLE" value="<{$details->VIEW_MORE_TITLE|escape}>"  />
                    <{if $columntooltips.VIEW_MORE_TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.VIEW_MORE_TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                            
<tr class="form-row form-row-view-more-title">
            
                    </tr>                                            
<tr class="form-row form-row-view-more-id-page">
            
                    </tr>                                            
<tr class="form-row form-row-view-more-link">
            
        
        
        
        <{if !isset($excludedcolumns['HIDE_TITLE'])}>
    
        <{if $preset == 'HIDE_TITLE'}>
            <input type="hidden" class="input-view-more-link" name="pagesection_formdata_HIDE_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['HIDE_TITLE']) && !$acleditablecolumns['HIDE_TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['HIDE_TITLE'])}>
            <input type="hidden" class="input-view-more-link" name="pagesection_formdata_HIDE_TITLE" value="<{$details->HIDE_TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Hide title')}></label>
            </td>
            <td class="form-field form-field-value column-view-more-link" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="1" <{if $details->HIDE_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="0" <{if !$details->HIDE_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.HIDE_TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.HIDE_TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                            
<tr class="form-row form-row-hide-title">
            
                    </tr>                                            
<tr class="form-row form-row-is-tab-anchor-section">
            
        
        
        
        <{if !isset($excludedcolumns['TAB_ANCHOR_TITLE'])}>
    
        <{if $preset == 'TAB_ANCHOR_TITLE'}>
            <input type="hidden" class="input-is-tab-anchor-section" name="pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TAB_ANCHOR_TITLE']) && !$acleditablecolumns['TAB_ANCHOR_TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TAB_ANCHOR_TITLE'])}>
            <input type="hidden" class="input-is-tab-anchor-section" name="pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$details->TAB_ANCHOR_TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Tab anchor title')}></label>
            </td>
            <td class="form-field form-field-value column-is-tab-anchor-section" colspan="3">
                                    

    <input class="input-tab-anchor-title input-type-text" type="text" name="<{$prefix}>pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$details->TAB_ANCHOR_TITLE|escape}>"  />
                    <{if $columntooltips.TAB_ANCHOR_TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TAB_ANCHOR_TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        </div>
        <!-- Custom layout rows end -->
    
    
    

                                                                    </div>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$( "#pagesection-view-layout-tabs-general-image-misc" ).tabs({
                		cookie: {
                			// store cookie for a day, without, it would be a session cookie
                			expires: 1
                		}
                	});
                });
                </script>
            </div>
        </div>
        <!-- Custom layout tabs end -->
    

            <!-- Custom fields -->
            <div class="layout-block layout-block-rows">
                <table class="table table-bordered table-custom-layout equal-split">
                    <tbody>
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
<{/if}>                    </tbody>
                </table>
            </div>
        
        <{plugin key="pagesection_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('pagesection_formdata_TITLE', 'pagesection_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagesectionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#pagesectionform :input').change(function() {
        $('#pagesectionform').data('changed', true);
    });

        function saveDraft() {
        if ($('#pagesectionform').length) {
            if ($('#pagesectionform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/pagesection/savedraft/",
                    data: $('#pagesectionform').serialize()
                });

                $('#pagesectionform').data('changed', false);
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
    pagesection_get_editing_model = function () {
        var model = {};

        var formdata = $('#pagesectionform').find('[name*=pagesection_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('pagesection_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    pagesection_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    pagesection_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            pagesection_apply_block_visibility(key, value);
        });
    }

    pagesection_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    pagesection_update_visibility_settings = function () {
        var model = pagesection_get_editing_model();

        var settings = pagesection_get_visibility_settings(model);

        pagesection_apply_visibility_settings(settings);
    }

    $(function() {
        $('#pagesectionform :input').change(function() {
            pagesection_update_visibility_settings();
        });

        pagesection_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pagesectionform', 'f2', 'a.button-save');
    	bind_hotkey('#pagesectionform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#pagesectionform', 'f3', 'a.button-save-more');
    	bind_hotkey('#pagesectionform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#pagesectionform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>
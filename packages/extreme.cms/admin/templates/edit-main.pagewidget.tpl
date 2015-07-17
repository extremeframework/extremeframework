<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="pagewidgetform" id="pagewidgetform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagewidget/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pagewidget_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="pagewidget_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="pagewidget_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_PAGE'])}>
    
        <{if $preset == 'ID_PAGE'}>
            <input type="hidden" class="input-id-page" name="pagewidget_formdata_ID_PAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PAGE']) && !$acleditablecolumns['ID_PAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PAGE'])}>
            <input type="hidden" class="input-id-page" name="pagewidget_formdata_ID_PAGE" value="<{$details->ID_PAGE}>" />
        <{else}>
    		<td class="form-row form-row-id-page">
                <div class="form-field form-field-label">
        		    <label><{_t('L_PAGE')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-page" colspan="3">
                <div class="form-field form-field-value column-id-page">
                                            
            <{if Framework::hasModule('Page')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-page" class="input-id-page" name="`$prefix`pagewidget_formdata_ID_PAGE" value=$details->ID_PAGE text=$details->reftext_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                </span>
                    <{else}>
            <input class="input-id-page input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_ID_PAGE" value="<{$details->ID_PAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_PAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_PAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="pagewidget_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="pagewidget_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_TITLE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="pagewidget_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="pagewidget_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_CODE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="pagewidget_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['LINK'])}>
    
        <{if $preset == 'LINK'}>
            <input type="hidden" class="input-link" name="pagewidget_formdata_LINK" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LINK']) && !$acleditablecolumns['LINK'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LINK'])}>
            <input type="hidden" class="input-link" name="pagewidget_formdata_LINK" value="<{$details->LINK}>" />
        <{else}>
    		<td class="form-row form-row-link">
                <div class="form-field form-field-label">
        		    <label><{_t('L_LINK')}></label>
                </div>
            </td>
            <td class="form-row form-row-link" colspan="3">
                <div class="form-field form-field-value column-link">
                                            

    <input class="input-link input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_LINK" value="<{$details->LINK|escape}>"  />
                        <{if $columntooltips.LINK}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.LINK}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="pagewidget_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="pagewidget_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-row form-row-image">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IMAGE')}></label>
                </div>
            </td>
            <td class="form-row form-row-image" colspan="3">
                <div class="form-field form-field-value column-image">
                                            

	<input class="input-image input-type-file" type="file" name="<{$prefix}>pagewidget_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagewidget_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.pagewidgetform.<{$prefix}>pagewidget_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>pagewidget_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagewidget_formdata_IMAGE" value="<{$details->IMAGE}>" />
                        <{if $columntooltips.IMAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_WIDGET_TYPE'])}>
    
        <{if $preset == 'ID_WIDGET_TYPE'}>
            <input type="hidden" class="input-id-widget-type" name="pagewidget_formdata_ID_WIDGET_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_WIDGET_TYPE']) && !$acleditablecolumns['ID_WIDGET_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_WIDGET_TYPE'])}>
            <input type="hidden" class="input-id-widget-type" name="pagewidget_formdata_ID_WIDGET_TYPE" value="<{$details->ID_WIDGET_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-widget-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_WIDGET_TYPE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-widget-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-widget-type">
                                            
            <{if Framework::hasModule('WidgetType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-widget-type" class="input-id-widget-type" name="`$prefix`pagewidget_formdata_ID_WIDGET_TYPE" value=$details->ID_WIDGET_TYPE text=$details->reftext_ID_WIDGET_TYPE datasource="WIDGET_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgettype/new" title="Create a New Widget Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-widget-type input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_ID_WIDGET_TYPE" value="<{$details->ID_WIDGET_TYPE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_WIDGET_TYPE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_WIDGET_TYPE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_WIDGET_POSITION'])}>
    
        <{if $preset == 'ID_WIDGET_POSITION'}>
            <input type="hidden" class="input-id-widget-position" name="pagewidget_formdata_ID_WIDGET_POSITION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_WIDGET_POSITION']) && !$acleditablecolumns['ID_WIDGET_POSITION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_WIDGET_POSITION'])}>
            <input type="hidden" class="input-id-widget-position" name="pagewidget_formdata_ID_WIDGET_POSITION" value="<{$details->ID_WIDGET_POSITION}>" />
        <{else}>
    		<td class="form-row form-row-id-widget-position">
                <div class="form-field form-field-label">
        		    <label><{_t('L_WIDGET_POSITION')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-widget-position" colspan="3">
                <div class="form-field form-field-value column-id-widget-position">
                                            
            <{if Framework::hasModule('WidgetPosition')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-widget-position" class="input-id-widget-position" name="`$prefix`pagewidget_formdata_ID_WIDGET_POSITION" value=$details->ID_WIDGET_POSITION text=$details->reftext_ID_WIDGET_POSITION datasource="WIDGET_POSITION" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/new" title="Create a New Widget Position">+</a>
                </span>
                    <{else}>
            <input class="input-id-widget-position input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_ID_WIDGET_POSITION" value="<{$details->ID_WIDGET_POSITION|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_WIDGET_POSITION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_WIDGET_POSITION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CONTENT'])}>
    
        <{if $preset == 'CONTENT'}>
            <input type="hidden" class="input-content" name="pagewidget_formdata_CONTENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONTENT']) && !$acleditablecolumns['CONTENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONTENT'])}>
            <input type="hidden" class="input-content" name="pagewidget_formdata_CONTENT" value="<{$details->CONTENT}>" />
        <{else}>
    		<td class="form-row form-row-content">
                <div class="form-field form-field-label">
        		    <label><{_t('L_CONTENT')}></label>
                </div>
            </td>
            <td class="form-row form-row-content" colspan="3">
                <div class="form-field form-field-value column-content">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>pagewidget_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>pagewidget_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                        <{if $columntooltips.CONTENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CONTENT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['HIDE_TITLE'])}>
    
        <{if $preset == 'HIDE_TITLE'}>
            <input type="hidden" class="input-hide-title" name="pagewidget_formdata_HIDE_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['HIDE_TITLE']) && !$acleditablecolumns['HIDE_TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['HIDE_TITLE'])}>
            <input type="hidden" class="input-hide-title" name="pagewidget_formdata_HIDE_TITLE" value="<{$details->HIDE_TITLE}>" />
        <{else}>
    		<td class="form-row form-row-hide-title">
                <div class="form-field form-field-label">
        		    <label><{_t('L_HIDE_TITLE')}></label>
                </div>
            </td>
            <td class="form-row form-row-hide-title" colspan="3">
                <div class="form-field form-field-value column-hide-title">
                                            

    <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" value="1" <{if $details->HIDE_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" value="0" <{if !$details->HIDE_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.HIDE_TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.HIDE_TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="pagewidget_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="pagewidget_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ORDERING')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>pagewidget_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
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

        <{plugin key="pagewidget_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('pagewidget_formdata_TITLE', 'pagewidget_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagewidgetform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#pagewidgetform :input').change(function() {
        $('#pagewidgetform').data('changed', true);
    });

        function saveDraft() {
        if ($('#pagewidgetform').length) {
            if ($('#pagewidgetform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/pagewidget/savedraft/",
                    data: $('#pagewidgetform').serialize()
                });

                $('#pagewidgetform').data('changed', false);
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
    pagewidget_get_editing_model = function () {
        var model = {};

        var formdata = $('#pagewidgetform').find('[name*=pagewidget_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('pagewidget_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    pagewidget_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    pagewidget_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            pagewidget_apply_block_visibility(key, value);
        });
    }

    pagewidget_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    pagewidget_update_visibility_settings = function () {
        var model = pagewidget_get_editing_model();

        var settings = pagewidget_get_visibility_settings(model);

        pagewidget_apply_visibility_settings(settings);
    }

    $(function() {
        $('#pagewidgetform :input').change(function() {
            pagewidget_update_visibility_settings();
        });

        pagewidget_update_visibility_settings();
    });
</script>
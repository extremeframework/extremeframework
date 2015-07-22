<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="postcategoryform" id="postcategoryform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/postcategory/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postcategory_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="postcategory_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="postcategory_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="postcategory_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="postcategory_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>postcategory_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['SLUG'])}>
    
        <{if $preset == 'SLUG'}>
            <input type="hidden" class="input-slug" name="postcategory_formdata_SLUG" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['SLUG']) && !$acleditablecolumns['SLUG'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['SLUG'])}>
            <input type="hidden" class="input-slug" name="postcategory_formdata_SLUG" value="<{$details->SLUG}>" />
        <{else}>
    		<td class="form-row form-row-slug form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Slug')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-slug form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-slug">
                                            <{if $details->ID && $details->SLUG != ''}>
                            <input type="hidden" class="input-slug" name="postcategory_formdata_SLUG" value="<{$details->SLUG}>" />
                            
    <{$details->SLUG|escape}>
                        <{else}>
                            

    <input class="input-slug input-type-text" type="text" name="<{$prefix}>postcategory_formdata_SLUG" value="<{$details->SLUG|escape}>"  />
                            <{if $columntooltips.SLUG}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.SLUG}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PARENT'])}>
    
        <{if $preset == 'PARENT'}>
            <input type="hidden" class="input-parent" name="postcategory_formdata_PARENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PARENT']) && !$acleditablecolumns['PARENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PARENT'])}>
            <input type="hidden" class="input-parent" name="postcategory_formdata_PARENT" value="<{$details->PARENT}>" />
        <{else}>
    		<td class="form-row form-row-parent">
                <div class="form-field form-field-label">
        		    <label><{_t('Parent')}></label>
                </div>
            </td>
            <td class="form-row form-row-parent" colspan="3">
                <div class="form-field form-field-value column-parent">
                                            
            <{if Framework::hasModule('PostCategory')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`postcategory_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.postcategory.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new" title="Create a New Post Category">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>postcategory_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                            <{if $columntooltips.PARENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PARENT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DESCRIPTION'])}>
    
        <{if $preset == 'DESCRIPTION'}>
            <input type="hidden" class="input-description" name="postcategory_formdata_DESCRIPTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DESCRIPTION']) && !$acleditablecolumns['DESCRIPTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DESCRIPTION'])}>
            <input type="hidden" class="input-description" name="postcategory_formdata_DESCRIPTION" value="<{$details->DESCRIPTION}>" />
        <{else}>
    		<td class="form-row form-row-description">
                <div class="form-field form-field-label">
        		    <label><{_t('Description')}></label>
                </div>
            </td>
            <td class="form-row form-row-description" colspan="3">
                <div class="form-field form-field-value column-description">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-description enable-html" id="<{$prefix}>postcategory_formdata_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>postcategory_formdata_DESCRIPTION" rows="5" ><{$details->DESCRIPTION}></textarea>
                        <{if $columntooltips.DESCRIPTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DESCRIPTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_TEMPLATE'])}>
    
        <{if $preset == 'ID_TEMPLATE'}>
            <input type="hidden" class="input-id-template" name="postcategory_formdata_ID_TEMPLATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_TEMPLATE']) && !$acleditablecolumns['ID_TEMPLATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_TEMPLATE'])}>
            <input type="hidden" class="input-id-template" name="postcategory_formdata_ID_TEMPLATE" value="<{$details->ID_TEMPLATE}>" />
        <{else}>
    		<td class="form-row form-row-id-template form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Template')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-template form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-template">
                                            
            <{if Framework::hasModule('Template')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-template" class="input-id-template" name="`$prefix`postcategory_formdata_ID_TEMPLATE" value=$details->ID_TEMPLATE text=$details->reftext_ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.template.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/template/new" title="Create a New Template">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-template input-type-text" type="text" name="<{$prefix}>postcategory_formdata_ID_TEMPLATE" value="<{$details->ID_TEMPLATE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_TEMPLATE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_TEMPLATE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="postcategory_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="postcategory_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('Ordering')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>postcategory_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
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

        <{plugin key="postcategory_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('postcategory_formdata_NAME', 'postcategory_formdata_SLUG');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#postcategoryform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#postcategoryform :input').change(function() {
        $('#postcategoryform').data('changed', true);
    });

        function saveDraft() {
        if ($('#postcategoryform').length) {
            if ($('#postcategoryform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/postcategory/savedraft/",
                    data: $('#postcategoryform').serialize()
                });

                $('#postcategoryform').data('changed', false);
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
    postcategory_get_editing_model = function () {
        var model = {};

        var formdata = $('#postcategoryform').find('[name*=postcategory_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('postcategory_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    postcategory_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    postcategory_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            postcategory_apply_block_visibility(key, value);
        });
    }

    postcategory_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    postcategory_update_visibility_settings = function () {
        var model = postcategory_get_editing_model();

        var settings = postcategory_get_visibility_settings(model);

        postcategory_apply_visibility_settings(settings);
    }

    $(function() {
        $('#postcategoryform :input').change(function() {
            postcategory_update_visibility_settings();
        });

        postcategory_update_visibility_settings();
    });
</script>
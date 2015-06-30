<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{$smarty.const.L_CLOSE}>">x</button>
    <h3><{label key="L_QUICK_CREATE" format="ucwords"}> <{$smarty.const.L_POST_CATEGORY|ucwords}></h3>
</div>


<div id="postcategory-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.postcategory) }>
        <ul class="message">
            <{foreach from=$messages.postcategory key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="postcategoryform" id="postcategoryform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/postcategory/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postcategory_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
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
        		    <label><{label key="L_POST_CATEGORY_NAME"}><span class="mandatory">*</span></label>
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
        		    <label><{label key="L_SLUG"}><span class="mandatory">*</span></label>
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
    <{/if}>    </tr>                                                                                                                                                                                                                                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{if $customfields}>
            <div class="layout-block layout-block-section">
                <div class="layout-section">
                    <div class="layout-section-header">
                        <span><{label text="L_ADDITIONAL_INFORMATION"}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
                                <{foreach from=$customfields item=item}>
                                    <tr>
                                		<td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
                                            <div class="form-field form-field-label">
                                    		    <label><{label text=$item->NAME}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>" colspan="3">
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
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{label key="L_CANCEL"}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{label key="L_SAVE"}></strong>
            </button>
                            <a class="btn btn-full-form scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new">
                    <strong><{label key="L_GO_TO_FULL_FORM"}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#postcategoryform', 'f2', 'a.button-save');
    	bind_hotkey('#postcategoryform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#postcategoryform', 'f3', 'a.button-save-more');
    	bind_hotkey('#postcategoryform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#postcategoryform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>
<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{$smarty.const.L_CLOSE}>">x</button>
    <h3><{label key="L_QUICK_CREATE|ucwords"}> <{$smarty.const.L_USER_ROLE|ucwords}></h3>
</div>


<div id="userrole-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.userrole) }>
        <ul class="message">
            <{foreach from=$messages.userrole key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="userroleform" id="userroleform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/userrole/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userrole_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="userrole_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="userrole_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="userrole_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="userrole_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_USER_ROLE_NAME"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>userrole_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
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

        <{plugin key="userrole_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#userroleform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#userroleform :input').change(function() {
        $('#userroleform').data('changed', true);
    });

        function saveDraft() {
        if ($('#userroleform').length) {
            if ($('#userroleform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userrole/savedraft/",
                    data: $('#userroleform').serialize()
                });

                $('#userroleform').data('changed', false);
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
    userrole_get_editing_model = function () {
        var model = {};

        var formdata = $('#userroleform').find('[name*=userrole_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('userrole_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    userrole_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    userrole_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            userrole_apply_block_visibility(key, value);
        });
    }

    userrole_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    userrole_update_visibility_settings = function () {
        var model = userrole_get_editing_model();

        var settings = userrole_get_visibility_settings(model);

        userrole_apply_visibility_settings(settings);
    }

    $(function() {
        $('#userroleform :input').change(function() {
            userrole_update_visibility_settings();
        });

        userrole_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{label key="L_CANCEL"}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{label key="L_SAVE"}></strong>
            </button>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#userroleform', 'f2', 'a.button-save');
    	bind_hotkey('#userroleform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#userroleform', 'f3', 'a.button-save-more');
    	bind_hotkey('#userroleform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#userroleform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>
<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('New')|ucwords}> <{_t('Dashboard Item Type')|ucwords}></h3>
</div>


<div id="dashboarditemtype-edit" class="edit_details">

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

    <form name="dashboarditemtypeform" id="dashboarditemtypeform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="dashboarditemtype_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="pre-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="dashboarditemtype_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="dashboarditemtype_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
                    </tr>                                                                                            
<tr class="form-row form-row-code form-row-mandatory">
            
                    </tr>                                                                                            
<tr class="form-row form-row-ordering">
            
                    </tr>                    
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
        
        <{plugin key="dashboarditemtype_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('dashboarditemtype_formdata_NAME', 'dashboarditemtype_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#dashboarditemtypeform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#dashboarditemtypeform :input').change(function() {
        $('#dashboarditemtypeform').data('changed', true);
    });

        function saveDraft() {
        if ($('#dashboarditemtypeform').length) {
            if ($('#dashboarditemtypeform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/savedraft/",
                    data: $('#dashboarditemtypeform').serialize()
                });

                $('#dashboarditemtypeform').data('changed', false);
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
    dashboarditemtype_get_editing_model = function () {
        var model = {};

        var formdata = $('#dashboarditemtypeform').find('[name*=dashboarditemtype_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('dashboarditemtype_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    dashboarditemtype_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    dashboarditemtype_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            dashboarditemtype_apply_block_visibility(key, value);
        });
    }

    dashboarditemtype_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    dashboarditemtype_update_visibility_settings = function () {
        var model = dashboarditemtype_get_editing_model();

        var settings = dashboarditemtype_get_visibility_settings(model);

        dashboarditemtype_apply_visibility_settings(settings);
    }

    $(function() {
        $('#dashboarditemtypeform :input').change(function() {
            dashboarditemtype_update_visibility_settings();
        });

        dashboarditemtype_update_visibility_settings();
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
    	bind_hotkey('#dashboarditemtypeform', 'f2', 'a.button-save');
    	bind_hotkey('#dashboarditemtypeform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#dashboarditemtypeform', 'f3', 'a.button-save-more');
    	bind_hotkey('#dashboarditemtypeform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#dashboarditemtypeform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>
<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{$smarty.const.L_CLOSE}>">x</button>
    <h3><{label key="L_NEW|ucwords"}> <{$smarty.const.L_ADMIN_MENU_ITEM|ucwords}></h3>
</div>


<div id="adminmenuitem-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.adminmenuitem) }>
        <ul class="message">
            <{foreach from=$messages.adminmenuitem key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminmenuitemform" id="adminmenuitemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminmenuitem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="pre-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminmenuitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminmenuitem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
                    </tr>                                                                                                                                                                                                                                                                                                                                                                <tr>
    
            
                    </tr>                                                                                            <tr>
    
            
                    </tr>                                                                                            <tr>
    
            
                    </tr>                                                                                            <tr>
    
            
                    </tr>                                                                                            <tr>
    
            
                    </tr>                                                                                                                                                                                                </tbody>
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

        <{plugin key="adminmenuitem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmenuitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminmenuitemform :input').change(function() {
        $('#adminmenuitemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminmenuitemform').length) {
            if ($('#adminmenuitemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/savedraft/",
                    data: $('#adminmenuitemform').serialize()
                });

                $('#adminmenuitemform').data('changed', false);
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
    adminmenuitem_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminmenuitemform').find('[name*=adminmenuitem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminmenuitem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminmenuitem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminmenuitem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminmenuitem_apply_block_visibility(key, value);
        });
    }

    adminmenuitem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminmenuitem_update_visibility_settings = function () {
        var model = adminmenuitem_get_editing_model();

        var settings = adminmenuitem_get_visibility_settings(model);

        adminmenuitem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminmenuitemform :input').change(function() {
            adminmenuitem_update_visibility_settings();
        });

        adminmenuitem_update_visibility_settings();
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
    	bind_hotkey('#adminmenuitemform', 'f2', 'a.button-save');
    	bind_hotkey('#adminmenuitemform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminmenuitemform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminmenuitemform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminmenuitemform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>
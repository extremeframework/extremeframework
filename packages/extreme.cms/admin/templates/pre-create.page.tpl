<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('New')|ucwords}> <{_t('Page')|ucwords}></h3>
</div>


<div id="page-edit" class="edit_details">

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

    <form name="pageform" id="pageform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/page/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="page_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="pre-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="page_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="page_form_top" args=$details}>

                        
    
    
            <!-- Custom layout tabs -->
        <div class="layout-block layout-block-tabs layout-block-tabs-bottom">
            <div id="page-view-layout-tabs-general-image-misc" class="layout-tabs view-layout-tabs page-view-layout-tabs" style="clear:both">
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
                                            
<tr class="form-row form-row-view-more-link">
            
                    </tr>                                            
<tr class="form-row form-row-name form-row-mandatory">
            
                    </tr>                                            
<tr class="form-row form-row-title form-row-mandatory">
            
                    </tr>                                            
<tr class="form-row form-row-parent">
            
                    </tr>                                            
<tr class="form-row form-row-slug form-row-mandatory">
            
                    </tr>                                            
<tr class="form-row form-row-tag-line">
            
                    </tr>                                            
<tr class="form-row form-row-meta-keywords">
            
                    </tr>                                            
<tr class="form-row form-row-meta-description">
            
                    </tr>                                            
<tr class="form-row form-row-id-template form-row-mandatory">
            
                    </tr>                                            
<tr class="form-row form-row-content">
            
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
            
                    </tr>                                            
<tr class="form-row form-row-thumb">
            
                    </tr>                                            
<tr class="form-row form-row-background-image">
                        </tr>                                            
<tr class="form-row form-row-background-color">
            
                    </tr>                                            
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
            
                    </tr>                                            
<tr class="form-row form-row-introduction">
            
                    </tr>                                            
<tr class="form-row form-row-footer">
            
                    </tr>                                            
<tr class="form-row form-row-additional-css">
            
                    </tr>                                            
<tr class="form-row form-row-custom-top-id-menu">
            
                    </tr>                                            
<tr class="form-row form-row-custom-side-id-menu">
            
                    </tr>                                            
<tr class="form-row form-row-view-more-title">
            
                    </tr>                                            
<tr class="form-row form-row-view-more-id-page">
            
                    </tr>                                    </tbody>
            </table>
        </div>
        <!-- Custom layout rows end -->
    
    
    

                                                                    </div>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$( "#page-view-layout-tabs-general-image-misc" ).tabs({
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
        
        <{plugin key="page_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('page_formdata_NAME', 'page_formdata_SLUG');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#pageform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#pageform :input').change(function() {
        $('#pageform').data('changed', true);
    });

        function saveDraft() {
        if ($('#pageform').length) {
            if ($('#pageform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/page/savedraft/",
                    data: $('#pageform').serialize()
                });

                $('#pageform').data('changed', false);
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
    page_get_editing_model = function () {
        var model = {};

        var formdata = $('#pageform').find('[name*=page_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('page_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    page_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    page_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            page_apply_block_visibility(key, value);
        });
    }

    page_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    page_update_visibility_settings = function () {
        var model = page_get_editing_model();

        var settings = page_get_visibility_settings(model);

        page_apply_visibility_settings(settings);
    }

    $(function() {
        $('#pageform :input').change(function() {
            page_update_visibility_settings();
        });

        page_update_visibility_settings();
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
    	bind_hotkey('#pageform', 'f2', 'a.button-save');
    	bind_hotkey('#pageform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#pageform', 'f3', 'a.button-save-more');
    	bind_hotkey('#pageform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#pageform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>
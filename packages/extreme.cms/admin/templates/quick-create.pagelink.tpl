<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('L_PAGE_LINK')|ucwords}></h3>
</div>


<div id="pagelink-edit" class="edit_details">

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

    <form name="pagelinkform" id="pagelinkform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagelink/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pagelink_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="pagelink_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="pagelink_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="pagelink_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="pagelink_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_TITLE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagelink_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_PAGE_LINK_TYPE'])}>
    
        <{if $preset == 'ID_PAGE_LINK_TYPE'}>
            <input type="hidden" class="input-id-page-link-type" name="pagelink_formdata_ID_PAGE_LINK_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PAGE_LINK_TYPE']) && !$acleditablecolumns['ID_PAGE_LINK_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PAGE_LINK_TYPE'])}>
            <input type="hidden" class="input-id-page-link-type" name="pagelink_formdata_ID_PAGE_LINK_TYPE" value="<{$details->ID_PAGE_LINK_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-page-link-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_PAGE_LINK_TYPE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-page-link-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-page-link-type">
                                            
            <{if Framework::hasModule('PageLinkType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-page-link-type" class="input-id-page-link-type" name="`$prefix`pagelink_formdata_ID_PAGE_LINK_TYPE" value=$details->ID_PAGE_LINK_TYPE text=$details->reftext_ID_PAGE_LINK_TYPE datasource="PAGE_LINK_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/new" title="Create a New Page Link Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-page-link-type input-type-text" type="text" name="<{$prefix}>pagelink_formdata_ID_PAGE_LINK_TYPE" value="<{$details->ID_PAGE_LINK_TYPE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_PAGE_LINK_TYPE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_PAGE_LINK_TYPE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                        </tbody>
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

        <{plugin key="pagelink_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagelinkform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#pagelinkform :input').change(function() {
        $('#pagelinkform').data('changed', true);
    });

        function saveDraft() {
        if ($('#pagelinkform').length) {
            if ($('#pagelinkform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/pagelink/savedraft/",
                    data: $('#pagelinkform').serialize()
                });

                $('#pagelinkform').data('changed', false);
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
    pagelink_get_editing_model = function () {
        var model = {};

        var formdata = $('#pagelinkform').find('[name*=pagelink_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('pagelink_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    pagelink_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    pagelink_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            pagelink_apply_block_visibility(key, value);
        });
    }

    pagelink_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    pagelink_update_visibility_settings = function () {
        var model = pagelink_get_editing_model();

        var settings = pagelink_get_visibility_settings(model);

        pagelink_apply_visibility_settings(settings);
    }

    $(function() {
        $('#pagelinkform :input').change(function() {
            pagelink_update_visibility_settings();
        });

        pagelink_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pagelinkform', 'f2', 'a.button-save');
    	bind_hotkey('#pagelinkform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#pagelinkform', 'f3', 'a.button-save-more');
    	bind_hotkey('#pagelinkform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#pagelinkform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>
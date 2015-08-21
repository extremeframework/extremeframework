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
        <input type="hidden" name="view-type" value="edit" />
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
                                                                                            
<tr class="form-row form-row-title form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="pagelink_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="pagelink_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Page link title')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagelink_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                    <{if $columntooltips.TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-page">
            
        
        
        
        <{if !isset($excludedcolumns['ID_PAGE'])}>
    
        <{if $preset == 'ID_PAGE'}>
            <input type="hidden" class="input-id-page" name="pagelink_formdata_ID_PAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PAGE']) && !$acleditablecolumns['ID_PAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PAGE'])}>
            <input type="hidden" class="input-id-page" name="pagelink_formdata_ID_PAGE" value="<{$details->ID_PAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Page')}></label>
            </td>
            <td class="form-field form-field-value column-id-page" colspan="3">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-page" class="input-id-page" name="`$prefix`pagelink_formdata_ID_PAGE" value=$details->ID_PAGE text=$details->reftext_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-page input-type-text" type="text" name="<{$prefix}>pagelink_formdata_ID_PAGE" value="<{$details->ID_PAGE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_PAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_PAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-font-awesome-icon">
            
        
        
        
        <{if !isset($excludedcolumns['FONT_AWESOME_ICON'])}>
    
        <{if $preset == 'FONT_AWESOME_ICON'}>
            <input type="hidden" class="input-font-awesome-icon" name="pagelink_formdata_FONT_AWESOME_ICON" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FONT_AWESOME_ICON']) && !$acleditablecolumns['FONT_AWESOME_ICON'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FONT_AWESOME_ICON'])}>
            <input type="hidden" class="input-font-awesome-icon" name="pagelink_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Font awesome icon')}></label>
            </td>
            <td class="form-field form-field-value column-font-awesome-icon" colspan="3">
                                    

    <input class="input-font-awesome-icon input-type-text" type="text" name="<{$prefix}>pagelink_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON|escape}>"  />
                    <{if $columntooltips.FONT_AWESOME_ICON}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.FONT_AWESOME_ICON}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-link-id-page">
            
        
        
        
        <{if !isset($excludedcolumns['LINK_ID_PAGE'])}>
    
        <{if $preset == 'LINK_ID_PAGE'}>
            <input type="hidden" class="input-link-id-page" name="pagelink_formdata_LINK_ID_PAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LINK_ID_PAGE']) && !$acleditablecolumns['LINK_ID_PAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LINK_ID_PAGE'])}>
            <input type="hidden" class="input-link-id-page" name="pagelink_formdata_LINK_ID_PAGE" value="<{$details->LINK_ID_PAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Link page')}></label>
            </td>
            <td class="form-field form-field-value column-link-id-page" colspan="3">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-link-id-page" class="input-link-id-page" name="`$prefix`pagelink_formdata_LINK_ID_PAGE" value=$details->LINK_ID_PAGE text=$details->reftext_LINK_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-link-id-page input-type-text" type="text" name="<{$prefix}>pagelink_formdata_LINK_ID_PAGE" value="<{$details->LINK_ID_PAGE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.LINK_ID_PAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.LINK_ID_PAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-link-path">
            
        
        
        
        <{if !isset($excludedcolumns['LINK_PATH'])}>
    
        <{if $preset == 'LINK_PATH'}>
            <input type="hidden" class="input-link-path" name="pagelink_formdata_LINK_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LINK_PATH']) && !$acleditablecolumns['LINK_PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LINK_PATH'])}>
            <input type="hidden" class="input-link-path" name="pagelink_formdata_LINK_PATH" value="<{$details->LINK_PATH}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Link path')}></label>
            </td>
            <td class="form-field form-field-value column-link-path" colspan="3">
                                    

    <input class="input-link-path input-type-text" type="text" name="<{$prefix}>pagelink_formdata_LINK_PATH" value="<{$details->LINK_PATH|escape}>"  />
                    <{if $columntooltips.LINK_PATH}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.LINK_PATH}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-page-link-type form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['ID_PAGE_LINK_TYPE'])}>
    
        <{if $preset == 'ID_PAGE_LINK_TYPE'}>
            <input type="hidden" class="input-id-page-link-type" name="pagelink_formdata_ID_PAGE_LINK_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PAGE_LINK_TYPE']) && !$acleditablecolumns['ID_PAGE_LINK_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PAGE_LINK_TYPE'])}>
            <input type="hidden" class="input-id-page-link-type" name="pagelink_formdata_ID_PAGE_LINK_TYPE" value="<{$details->ID_PAGE_LINK_TYPE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Page link type')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-id-page-link-type" colspan="3">
                                    
            <{if Framework::hasModule('PageLinkType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-page-link-type" class="input-id-page-link-type" name="`$prefix`pagelink_formdata_ID_PAGE_LINK_TYPE" value=$details->ID_PAGE_LINK_TYPE text=$details->reftext_ID_PAGE_LINK_TYPE datasource="PAGE_LINK_TYPE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.pagelinktype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/new" title="Create a New Page Link Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-page-link-type input-type-text" type="text" name="<{$prefix}>pagelink_formdata_ID_PAGE_LINK_TYPE" value="<{$details->ID_PAGE_LINK_TYPE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_PAGE_LINK_TYPE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_PAGE_LINK_TYPE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-ordering">
            
        
        
        
        <{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="pagelink_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="pagelink_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Ordering')}></label>
            </td>
            <td class="form-field form-field-value column-ordering" colspan="3">
                                    
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>pagelink_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                    <{if $columntooltips.ORDERING}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                    
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
</script>
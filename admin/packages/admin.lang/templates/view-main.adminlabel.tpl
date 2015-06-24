<div class="view-main">
    <{plugin key="adminlabel_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LABEL']) && ((isset($aclviewablecolumns['LABEL']) && $aclviewablecolumns['LABEL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LABEL']) || $aclviewablecolumns['LABEL']))) }>
        <{if !isset($columns2hide) || !in_array('LABEL', $columns2hide) }>
    		<td class="form-field form-field-label column-label">
	            		        <label class="attribute-name"><{label key="L_LABEL"}></label>
            </td>
            <td class="form-field form-field-value column-label" colspan="3">
            	<div class="attribute-line column-label type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LABEL']) && $acleditablecolumns['LABEL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LABEL']) || $acleditablecolumns['LABEL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->LABEL|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-label input-type-text" type="text" name="<{$prefix}>adminlabel_formdata_LABEL" value="<{$details->LABEL|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->LABEL|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                            </tbody>
        </table>
    	<!-- Standard layout columns end -->
    
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
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{label text=$item->NAME}></label>
                                    </td>
                                    <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                    	<div class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>>
                                    		<div class="attribute-value">
                                                <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                                    		</div>
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

    <{foreach from=$additional_view_fields item=item}>
    	<div class="attribute-line custom-field type-<{$item.type}>">
    		<label class="attribute-name"><{$item.label}></label>
    		<div class="attribute-value">
                <{$item.value}>
    		</div>
    	</div>
	<{/foreach}>

    <{plugin key="adminlabel_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminlabelview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminlabelview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminlabelview_apply_block_visibility(key, value);
            });
        }

        adminlabelview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminlabelview_update_visibility_settings = function () {
            var settings = adminlabelview_get_visibility_settings();

            adminlabelview_apply_visibility_settings(settings);
        }

        $(function() {
            adminlabelview_update_visibility_settings();
        });

        $(function() {
            // x. Row expanders
            $('.view-main .view-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);
                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var module = expander.data('module');
                var id = expander.data('id');

                // Hide others
                table.find('tr').not(tr).find('.view-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.view-embedded-view').not('tr.' + module + '-view-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.' + module + '-view-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/" + module + "/rowExpandedView/" + id + "?source=view&colcount=4"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
            });

//            // x. Onfly view edit
//            $('td.form-field-value').die('click').live('click', function(){
//                var td = $(this);
//
//                var view = $(this).find('.value-mode');
//                var edit = $(this).find('.edit-mode');
//                var input = $(this).find('.edit-mode>:input');
//
//                if (view.length == 0 || edit.length == 0) {
//                    return;
//                }
//
//                if (edit.is(":visible")) {
//                    return;
//                }
//
//                view.hide();
//                edit.show();
//
//                input.css('max-width', td.width() - 10);
//                input.focus();
//
//                var saved = false;
//
//                input.off('blur').on('blur', function(event) {
//                    event.preventDefault();
//
//                    // Workaround in case of an unexpected blur event from an auto-complete selection box
//                    if (input.is("select") && event.type == 'blur') {
//                        return;
//                    }
//
//                    var saved = false;
//                    input.change();
//                    saved = true;
//                });
//
//                input.off('change').on('change', function(event) {
//                    event.preventDefault();
//
//                    if (saved) {
//                        return;
//                    }
//
//                    var message = edit.find('.message');
//
//                    if (message.length == 0) {
//                        message = $('<div class="message"></div>').insertBefore(input);
//                    }
//
//                    $.ajax({
//                        type: "post",
//                        dataType: "json",
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminlabel/fieldSave",
//                        data: td.find(':input').serialize() + "&adminlabel_formdata_UUID=<{$details->UUID}>"
//                    }).done(function(data) {
//                        if (data.success) {
//                            if (input.is("select")) {
//                                var txt = input.find('option:selected').map(function () {
//                                    return $(this).text().trim();
//                                }).get().join(', ');
//
//                                view.html(txt);
//                            } else {
//                                view.html(input.val());
//                            }
//
//                            view.show();
//                            edit.hide();
//
//                            message.remove();
//                        } else {
//                            input.focus();
//
//                            message.html('<span>' + data.message + '</span>');
//                        }
//                    });
//                });
//            });
        });

    </script>
</div>
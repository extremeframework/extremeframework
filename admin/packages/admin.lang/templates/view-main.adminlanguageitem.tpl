<div class="view-main">
    <{plugin key="adminlanguageitem_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_LANGUAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_LANGUAGE']) && $aclviewablecolumns['ID_ADMIN_LANGUAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LANGUAGE']) || $aclviewablecolumns['ID_ADMIN_LANGUAGE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_LANGUAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-language">
	                    		                    		        <label class="attribute-name"><{_t('L_ADMIN_LANGUAGE')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-language" colspan="3">
            	<div class="attribute-line column-id-admin-language type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_LANGUAGE']) && $acleditablecolumns['ID_ADMIN_LANGUAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_LANGUAGE']) || $acleditablecolumns['ID_ADMIN_LANGUAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_LANGUAGE}>
        <{if isset($smarty.session.acl.adminlanguage.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/view/<{$details->refuuid_ID_ADMIN_LANGUAGE}>"><{$details->reftext_ID_ADMIN_LANGUAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_LANGUAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_LANGUAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminLanguage')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-language" class="input-id-admin-language" name="`$prefix`adminlanguageitem_formdata_ID_ADMIN_LANGUAGE" value=$details->ID_ADMIN_LANGUAGE text=$details->reftext_ID_ADMIN_LANGUAGE datasource="ADMIN_LANGUAGE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/new" title="Create a New Admin Language">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-language input-type-text" type="text" name="<{$prefix}>adminlanguageitem_formdata_ID_ADMIN_LANGUAGE" value="<{$details->ID_ADMIN_LANGUAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_LANGUAGE}>
        <{if isset($smarty.session.acl.adminlanguage.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/view/<{$details->refuuid_ID_ADMIN_LANGUAGE}>"><{$details->reftext_ID_ADMIN_LANGUAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_LANGUAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_LANGUAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_LABEL']) && ((isset($aclviewablecolumns['ID_ADMIN_LABEL']) && $aclviewablecolumns['ID_ADMIN_LABEL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LABEL']) || $aclviewablecolumns['ID_ADMIN_LABEL']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_LABEL', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-label">
	                    		                    		        <label class="attribute-name"><{_t('L_ADMIN_LABEL')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-label" colspan="3">
            	<div class="attribute-line column-id-admin-label type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_LABEL']) && $acleditablecolumns['ID_ADMIN_LABEL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_LABEL']) || $acleditablecolumns['ID_ADMIN_LABEL'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_LABEL}>
        <{if isset($smarty.session.acl.adminlabel.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/view/<{$details->refuuid_ID_ADMIN_LABEL}>"><{$details->reftext_ID_ADMIN_LABEL|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_LABEL|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_LABEL}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminLabel')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-label" class="input-id-admin-label" name="`$prefix`adminlanguageitem_formdata_ID_ADMIN_LABEL" value=$details->ID_ADMIN_LABEL text=$details->reftext_ID_ADMIN_LABEL datasource="ADMIN_LABEL" valuecol="ID" textcol="LABEL" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/new" title="Create a New Admin Label">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-label input-type-text" type="text" name="<{$prefix}>adminlanguageitem_formdata_ID_ADMIN_LABEL" value="<{$details->ID_ADMIN_LABEL|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_LABEL}>
        <{if isset($smarty.session.acl.adminlabel.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/view/<{$details->refuuid_ID_ADMIN_LABEL}>"><{$details->reftext_ID_ADMIN_LABEL|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_LABEL|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_LABEL}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TRANSLATION']) && ((isset($aclviewablecolumns['TRANSLATION']) && $aclviewablecolumns['TRANSLATION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TRANSLATION']) || $aclviewablecolumns['TRANSLATION']))) }>
        <{if !isset($columns2hide) || !in_array('TRANSLATION', $columns2hide) }>
    		<td class="form-field form-field-label column-translation">
	            		        <label class="attribute-name"><{_t('L_TRANSLATION')}></label>
            </td>
            <td class="form-field form-field-value column-translation" colspan="3">
            	<div class="attribute-line column-translation type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TRANSLATION']) && $acleditablecolumns['TRANSLATION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TRANSLATION']) || $acleditablecolumns['TRANSLATION'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->TRANSLATION|plugin:"adminlanguageitem_view_field_TRANSLATION":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-translation enable-html" id="<{$prefix}>adminlanguageitem_formdata_TRANSLATION_<{$tmpid}>" name="<{$prefix}>adminlanguageitem_formdata_TRANSLATION" rows="5" ><{$details->TRANSLATION}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->TRANSLATION|plugin:"adminlanguageitem_view_field_TRANSLATION":$details}>
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
                    <span><{_t('L_ADDITIONAL_INFORMATION')}></span>
                    <div class="header-arrow"></div>
                    <div class="clearer"></div>
                </div>
                <div class="layout-section-content">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$customfields item=item}>
                                <tr>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{_t($item->NAME)}></label>
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

    <{plugin key="adminlanguageitem_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminlanguageitemview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminlanguageitemview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminlanguageitemview_apply_block_visibility(key, value);
            });
        }

        adminlanguageitemview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminlanguageitemview_update_visibility_settings = function () {
            var settings = adminlanguageitemview_get_visibility_settings();

            adminlanguageitemview_apply_visibility_settings(settings);
        }

        $(function() {
            adminlanguageitemview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/fieldSave",
//                        data: td.find(':input').serialize() + "&adminlanguageitem_formdata_UUID=<{$details->UUID}>"
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
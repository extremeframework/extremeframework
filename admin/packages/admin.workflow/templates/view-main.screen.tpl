<div class="view-main">
    <{plugin key="screen_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('Screen title')}></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
            	<div class="attribute-line column-title type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TITLE']) && $acleditablecolumns['TITLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TITLE']) || $acleditablecolumns['TITLE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TITLE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>screen_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TITLE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
        <{if !isset($columns2hide) || !in_array('ID_WORKFLOW', $columns2hide) }>
    		<td class="form-field form-field-label column-id-workflow">
	                    		                    		        <label class="attribute-name"><{_t('Workflow')}></label>
            </td>
            <td class="form-field form-field-value column-id-workflow" colspan="3">
            	<div class="attribute-line column-id-workflow type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_WORKFLOW']) && $acleditablecolumns['ID_WORKFLOW']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_WORKFLOW']) || $acleditablecolumns['ID_WORKFLOW'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_WORKFLOW}>
        <{if isset($smarty.session.acl.workflow.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$details->refuuid_ID_WORKFLOW}>"><{$details->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$details->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WORKFLOW}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Workflow')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-workflow" class="input-id-workflow" name="`$prefix`screen_formdata_ID_WORKFLOW" value=$details->ID_WORKFLOW text=$details->reftext_ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <{if isset($smarty.session.acl.workflow.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-workflow input-type-text" type="text" name="<{$prefix}>screen_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_WORKFLOW}>
        <{if isset($smarty.session.acl.workflow.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$details->refuuid_ID_WORKFLOW}>"><{$details->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$details->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WORKFLOW}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
        <{if !isset($columns2hide) || !in_array('CODE', $columns2hide) }>
    		<td class="form-field form-field-label column-code">
	            		        <label class="attribute-name"><{_t('Code')}></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
            	<div class="attribute-line column-code type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CODE']) && $acleditablecolumns['CODE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CODE']) || $acleditablecolumns['CODE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CODE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-code input-type-text" type="text" name="<{$prefix}>screen_formdata_CODE" value="<{$details->CODE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CODE|escape}>
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
                    <span><{_t('Additional information')}></span>
                    <div class="header-arrow"></div>
                    <div class="clearer"></div>
                </div>
                <div class="layout-section-content">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$customfields item=item}>
                                <tr class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{_t($item->NAME)}></label>
                                    </td>
                                    <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                		<div class="attribute-value">
                                            <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
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

    <{if $additional_view_fields}>
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                <{foreach from=$additional_view_fields item=item}>
                    <tr class="attribute-line">
                		<td class="form-field form-field-label">
            		        <label class="attribute-name"><{$item.label}></label>
                        </td>
                        <td class="form-field form-field-value">
                    		<div class="attribute-value">
                                <{$item.value}>
                    		</div>
                        </td>
            		</tr>
            	<{/foreach}>
            </tbody>
        </table>
    <{/if}>

    <{plugin key="screen_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        screenview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        screenview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                screenview_apply_block_visibility(key, value);
            });
        }

        screenview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        screenview_update_visibility_settings = function () {
            var settings = screenview_get_visibility_settings();

            screenview_apply_visibility_settings(settings);
        }

        $(function() {
            screenview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/screen/fieldSave",
//                        data: td.find(':input').serialize() + "&screen_formdata_UUID=<{$details->UUID}>"
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
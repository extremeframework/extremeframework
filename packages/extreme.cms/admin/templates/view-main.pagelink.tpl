<div class="view-main">
    <{plugin key="pagelink_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('L_TITLE')}></label>
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
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagelink_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_PAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-page">
	                    		        	                <{if isset($smarty.session.acl.page.view)}>
    	                    <{if $details->ID_PAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="page" data-id="<{$details->refuuid_ID_PAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('L_PAGE')}></label>
            </td>
            <td class="form-field form-field-value column-id-page" colspan="3">
            	<div class="attribute-line column-id-page type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_PAGE']) && $acleditablecolumns['ID_PAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_PAGE']) || $acleditablecolumns['ID_PAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_ID_PAGE}>"><{$details->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-page" class="input-id-page" name="`$prefix`pagelink_formdata_ID_PAGE" value=$details->ID_PAGE text=$details->reftext_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                </span>
                    <{else}>
            <input class="input-id-page input-type-text" type="text" name="<{$prefix}>pagelink_formdata_ID_PAGE" value="<{$details->ID_PAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_ID_PAGE}>"><{$details->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['FONT_AWESOME_ICON']) && ((isset($aclviewablecolumns['FONT_AWESOME_ICON']) && $aclviewablecolumns['FONT_AWESOME_ICON']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FONT_AWESOME_ICON']) || $aclviewablecolumns['FONT_AWESOME_ICON']))) }>
        <{if !isset($columns2hide) || !in_array('FONT_AWESOME_ICON', $columns2hide) }>
    		<td class="form-field form-field-label column-font-awesome-icon">
	            		        <label class="attribute-name"><{_t('L_FONT_AWESOME_ICON')}></label>
            </td>
            <td class="form-field form-field-value column-font-awesome-icon" colspan="3">
            	<div class="attribute-line column-font-awesome-icon type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['FONT_AWESOME_ICON']) && $acleditablecolumns['FONT_AWESOME_ICON']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['FONT_AWESOME_ICON']) || $acleditablecolumns['FONT_AWESOME_ICON'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->FONT_AWESOME_ICON|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-font-awesome-icon input-type-text" type="text" name="<{$prefix}>pagelink_formdata_FONT_AWESOME_ICON" value="<{$details->FONT_AWESOME_ICON|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->FONT_AWESOME_ICON|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LINK_ID_PAGE']) && ((isset($aclviewablecolumns['LINK_ID_PAGE']) && $aclviewablecolumns['LINK_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_ID_PAGE']) || $aclviewablecolumns['LINK_ID_PAGE']))) }>
        <{if !isset($columns2hide) || !in_array('LINK_ID_PAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-link-id-page">
	                    		        	                <{if isset($smarty.session.acl.page.view)}>
    	                    <{if $details->LINK_ID_PAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="page" data-id="<{$details->refuuid_LINK_ID_PAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('L_LINK_PAGE')}></label>
            </td>
            <td class="form-field form-field-value column-link-id-page" colspan="3">
            	<div class="attribute-line column-link-id-page type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LINK_ID_PAGE']) && $acleditablecolumns['LINK_ID_PAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LINK_ID_PAGE']) || $acleditablecolumns['LINK_ID_PAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_LINK_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_LINK_ID_PAGE}>"><{$details->reftext_LINK_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_LINK_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->LINK_ID_PAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-link-id-page" class="input-link-id-page" name="`$prefix`pagelink_formdata_LINK_ID_PAGE" value=$details->LINK_ID_PAGE text=$details->reftext_LINK_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                </span>
                    <{else}>
            <input class="input-link-id-page input-type-text" type="text" name="<{$prefix}>pagelink_formdata_LINK_ID_PAGE" value="<{$details->LINK_ID_PAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_LINK_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_LINK_ID_PAGE}>"><{$details->reftext_LINK_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_LINK_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->LINK_ID_PAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LINK_PATH']) && ((isset($aclviewablecolumns['LINK_PATH']) && $aclviewablecolumns['LINK_PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK_PATH']) || $aclviewablecolumns['LINK_PATH']))) }>
        <{if !isset($columns2hide) || !in_array('LINK_PATH', $columns2hide) }>
    		<td class="form-field form-field-label column-link-path">
	            		        <label class="attribute-name"><{_t('L_LINK_PATH')}></label>
            </td>
            <td class="form-field form-field-value column-link-path" colspan="3">
            	<div class="attribute-line column-link-path type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LINK_PATH']) && $acleditablecolumns['LINK_PATH']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LINK_PATH']) || $acleditablecolumns['LINK_PATH'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->LINK_PATH|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-link-path input-type-text" type="text" name="<{$prefix}>pagelink_formdata_LINK_PATH" value="<{$details->LINK_PATH|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->LINK_PATH|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_PAGE_LINK_TYPE']) && ((isset($aclviewablecolumns['ID_PAGE_LINK_TYPE']) && $aclviewablecolumns['ID_PAGE_LINK_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE_LINK_TYPE']) || $aclviewablecolumns['ID_PAGE_LINK_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_PAGE_LINK_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-page-link-type">
	                    		                    		        <label class="attribute-name"><{_t('L_PAGE_LINK_TYPE')}></label>
            </td>
            <td class="form-field form-field-value column-id-page-link-type" colspan="3">
            	<div class="attribute-line column-id-page-link-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_PAGE_LINK_TYPE']) && $acleditablecolumns['ID_PAGE_LINK_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_PAGE_LINK_TYPE']) || $acleditablecolumns['ID_PAGE_LINK_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_PAGE_LINK_TYPE}>
        <{if isset($smarty.session.acl.pagelinktype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/view/<{$details->refuuid_ID_PAGE_LINK_TYPE}>"><{$details->reftext_ID_PAGE_LINK_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAGE_LINK_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAGE_LINK_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('PageLinkType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-page-link-type" class="input-id-page-link-type" name="`$prefix`pagelink_formdata_ID_PAGE_LINK_TYPE" value=$details->ID_PAGE_LINK_TYPE text=$details->reftext_ID_PAGE_LINK_TYPE datasource="PAGE_LINK_TYPE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/new" title="Create a New Page Link Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-page-link-type input-type-text" type="text" name="<{$prefix}>pagelink_formdata_ID_PAGE_LINK_TYPE" value="<{$details->ID_PAGE_LINK_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_PAGE_LINK_TYPE}>
        <{if isset($smarty.session.acl.pagelinktype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/view/<{$details->refuuid_ID_PAGE_LINK_TYPE}>"><{$details->reftext_ID_PAGE_LINK_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAGE_LINK_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAGE_LINK_TYPE}>
    <{/if}>
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

    <div class="layout-block layout-block-section">
        <div class="layout-section">
            <div class="layout-section-content">
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
            </div>
        </div>
    </div>

    <{plugin key="pagelink_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        pagelinkview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        pagelinkview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                pagelinkview_apply_block_visibility(key, value);
            });
        }

        pagelinkview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        pagelinkview_update_visibility_settings = function () {
            var settings = pagelinkview_get_visibility_settings();

            pagelinkview_apply_visibility_settings(settings);
        }

        $(function() {
            pagelinkview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/pagelink/fieldSave",
//                        data: td.find(':input').serialize() + "&pagelink_formdata_UUID=<{$details->UUID}>"
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
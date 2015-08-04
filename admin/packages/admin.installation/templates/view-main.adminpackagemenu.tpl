<div class="view-main">
    <{plugin key="adminpackagemenu_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE']) && ((isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) && $aclviewablecolumns['ID_ADMIN_PACKAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PACKAGE']) || $aclviewablecolumns['ID_ADMIN_PACKAGE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_PACKAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-package">
	                    		        	                <{if isset($smarty.session.acl.adminpackage.view)}>
    	                    <{if $details->ID_ADMIN_PACKAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminpackage" data-id="<{$details->refuuid_ID_ADMIN_PACKAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Admin package')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-package" colspan="3">
            	<div class="attribute-line column-id-admin-package type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_PACKAGE']) && $acleditablecolumns['ID_ADMIN_PACKAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_PACKAGE']) || $acleditablecolumns['ID_ADMIN_PACKAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_PACKAGE}>
        <{if isset($smarty.session.acl.adminpackage.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$details->refuuid_ID_ADMIN_PACKAGE}>"><{$details->reftext_ID_ADMIN_PACKAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PACKAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PACKAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminPackage')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-package" class="input-id-admin-package" name="`$prefix`adminpackagemenu_formdata_ID_ADMIN_PACKAGE" value=$details->ID_ADMIN_PACKAGE text=$details->reftext_ID_ADMIN_PACKAGE datasource="ADMIN_PACKAGE" valuecol="CODE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminpackage.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new" title="Create a New Admin Package">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package input-type-text" type="text" name="<{$prefix}>adminpackagemenu_formdata_ID_ADMIN_PACKAGE" value="<{$details->ID_ADMIN_PACKAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_PACKAGE}>
        <{if isset($smarty.session.acl.adminpackage.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$details->refuuid_ID_ADMIN_PACKAGE}>"><{$details->reftext_ID_ADMIN_PACKAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PACKAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PACKAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_MENU']) && ((isset($aclviewablecolumns['ID_ADMIN_MENU']) && $aclviewablecolumns['ID_ADMIN_MENU']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_MENU']) || $aclviewablecolumns['ID_ADMIN_MENU']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_MENU', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-menu">
	                    		                    		        <label class="attribute-name"><{_t('Admin menu')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-menu" colspan="3">
            	<div class="attribute-line column-id-admin-menu type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_MENU']) && $acleditablecolumns['ID_ADMIN_MENU']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_MENU']) || $acleditablecolumns['ID_ADMIN_MENU'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_MENU}>
        <{if isset($smarty.session.acl.adminmenu.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$details->refuuid_ID_ADMIN_MENU}>"><{$details->reftext_ID_ADMIN_MENU|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_MENU}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminMenu')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-menu" class="input-id-admin-menu" name="`$prefix`adminpackagemenu_formdata_ID_ADMIN_MENU" value=$details->ID_ADMIN_MENU text=$details->reftext_ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminmenu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new" title="Create a New Admin Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-menu input-type-text" type="text" name="<{$prefix}>adminpackagemenu_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_MENU}>
        <{if isset($smarty.session.acl.adminmenu.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$details->refuuid_ID_ADMIN_MENU}>"><{$details->reftext_ID_ADMIN_MENU|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_MENU|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_MENU}>
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

    <{plugin key="adminpackagemenu_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminpackagemenuview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminpackagemenuview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminpackagemenuview_apply_block_visibility(key, value);
            });
        }

        adminpackagemenuview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminpackagemenuview_update_visibility_settings = function () {
            var settings = adminpackagemenuview_get_visibility_settings();

            adminpackagemenuview_apply_visibility_settings(settings);
        }

        $(function() {
            adminpackagemenuview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/fieldSave",
//                        data: td.find(':input').serialize() + "&adminpackagemenu_formdata_UUID=<{$details->UUID}>"
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
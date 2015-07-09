<div class="view-main">
    <{plugin key="postrelation_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
        <{if !isset($columns2hide) || !in_array('ID_POST', $columns2hide) }>
    		<td class="form-field form-field-label column-id-post">
	                    		        	                <{if isset($smarty.session.acl.post.view)}>
    	                    <{if $details->ID_POST}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="post" data-id="<{$details->refuuid_ID_POST}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('L_POST')}></label>
            </td>
            <td class="form-field form-field-value column-id-post" colspan="3">
            	<div class="attribute-line column-id-post type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_POST']) && $acleditablecolumns['ID_POST']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_POST']) || $acleditablecolumns['ID_POST'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_POST}>
        <{if isset($smarty.session.acl.post.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->refuuid_ID_POST}>"><{$details->reftext_ID_POST|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Post')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-post" class="input-id-post" name="`$prefix`postrelation_formdata_ID_POST" value=$details->ID_POST text=$details->reftext_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                </span>
                    <{else}>
            <input class="input-id-post input-type-text" type="text" name="<{$prefix}>postrelation_formdata_ID_POST" value="<{$details->ID_POST|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_POST}>
        <{if isset($smarty.session.acl.post.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->refuuid_ID_POST}>"><{$details->reftext_ID_POST|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PEER_ID_POST']) && ((isset($aclviewablecolumns['PEER_ID_POST']) && $aclviewablecolumns['PEER_ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PEER_ID_POST']) || $aclviewablecolumns['PEER_ID_POST']))) }>
        <{if !isset($columns2hide) || !in_array('PEER_ID_POST', $columns2hide) }>
    		<td class="form-field form-field-label column-peer-id-post">
	                    		        	                <{if isset($smarty.session.acl.post.view)}>
    	                    <{if $details->PEER_ID_POST}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="post" data-id="<{$details->refuuid_PEER_ID_POST}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('L_PEER_POST')}></label>
            </td>
            <td class="form-field form-field-value column-peer-id-post" colspan="3">
            	<div class="attribute-line column-peer-id-post type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PEER_ID_POST']) && $acleditablecolumns['PEER_ID_POST']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PEER_ID_POST']) || $acleditablecolumns['PEER_ID_POST'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_PEER_ID_POST}>
        <{if isset($smarty.session.acl.post.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->refuuid_PEER_ID_POST}>"><{$details->reftext_PEER_ID_POST|escape}></a>
        <{else}>
            <{$details->reftext_PEER_ID_POST|escape}>        <{/if}>
    <{else}>
		<{$details->PEER_ID_POST}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Post')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-peer-id-post" class="input-peer-id-post" name="`$prefix`postrelation_formdata_PEER_ID_POST" value=$details->PEER_ID_POST text=$details->reftext_PEER_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                </span>
                    <{else}>
            <input class="input-peer-id-post input-type-text" type="text" name="<{$prefix}>postrelation_formdata_PEER_ID_POST" value="<{$details->PEER_ID_POST|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_PEER_ID_POST}>
        <{if isset($smarty.session.acl.post.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->refuuid_PEER_ID_POST}>"><{$details->reftext_PEER_ID_POST|escape}></a>
        <{else}>
            <{$details->reftext_PEER_ID_POST|escape}>        <{/if}>
    <{else}>
		<{$details->PEER_ID_POST}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_POST_RELATION_TYPE']) && ((isset($aclviewablecolumns['ID_POST_RELATION_TYPE']) && $aclviewablecolumns['ID_POST_RELATION_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST_RELATION_TYPE']) || $aclviewablecolumns['ID_POST_RELATION_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_POST_RELATION_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-post-relation-type">
	                    		                    		        <label class="attribute-name"><{_t('L_POST_RELATION_TYPE')}></label>
            </td>
            <td class="form-field form-field-value column-id-post-relation-type" colspan="3">
            	<div class="attribute-line column-id-post-relation-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_POST_RELATION_TYPE']) && $acleditablecolumns['ID_POST_RELATION_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_POST_RELATION_TYPE']) || $acleditablecolumns['ID_POST_RELATION_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_POST_RELATION_TYPE}>
        <{if isset($smarty.session.acl.postrelationtype.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/view/<{$details->refuuid_ID_POST_RELATION_TYPE}>"><{$details->reftext_ID_POST_RELATION_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST_RELATION_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST_RELATION_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('PostRelationType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-post-relation-type" class="input-id-post-relation-type" name="`$prefix`postrelation_formdata_ID_POST_RELATION_TYPE" value=$details->ID_POST_RELATION_TYPE text=$details->reftext_ID_POST_RELATION_TYPE datasource="POST_RELATION_TYPE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/new" title="Create a New Post Relation Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-post-relation-type input-type-text" type="text" name="<{$prefix}>postrelation_formdata_ID_POST_RELATION_TYPE" value="<{$details->ID_POST_RELATION_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_POST_RELATION_TYPE}>
        <{if isset($smarty.session.acl.postrelationtype.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/view/<{$details->refuuid_ID_POST_RELATION_TYPE}>"><{$details->reftext_ID_POST_RELATION_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST_RELATION_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST_RELATION_TYPE}>
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

    <{plugin key="postrelation_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        postrelationview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        postrelationview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                postrelationview_apply_block_visibility(key, value);
            });
        }

        postrelationview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        postrelationview_update_visibility_settings = function () {
            var settings = postrelationview_get_visibility_settings();

            postrelationview_apply_visibility_settings(settings);
        }

        $(function() {
            postrelationview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/postrelation/fieldSave",
//                        data: td.find(':input').serialize() + "&postrelation_formdata_UUID=<{$details->UUID}>"
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
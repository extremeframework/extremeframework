<div class="view-main">
    <{plugin key="postsection_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('Post section title')}></label>
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
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>postsection_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_POST']) && ((isset($aclviewablecolumns['ID_POST']) && $aclviewablecolumns['ID_POST']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_POST']) || $aclviewablecolumns['ID_POST']))) }>
        <{if !isset($columns2hide) || !in_array('ID_POST', $columns2hide) }>
    		<td class="form-field form-field-label column-id-post">
	                    		        	                <{if isset($smarty.session.acl.post.view)}>
    	                    <{if $details->ID_POST}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="post" data-id="<{$details->refuuid_ID_POST}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Post')}></label>
            </td>
            <td class="form-field form-field-value column-id-post" colspan="3">
            	<div class="attribute-line column-id-post type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_POST']) && $acleditablecolumns['ID_POST']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_POST']) || $acleditablecolumns['ID_POST'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_POST}>
        <{if isset($smarty.session.acl.post.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->refuuid_ID_POST}>"><{$details->reftext_ID_POST|escape}></a>
        <{else}>
            <{$details->reftext_ID_POST|escape}>        <{/if}>
    <{else}>
		<{$details->ID_POST}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Post')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-post" class="input-id-post" name="`$prefix`postsection_formdata_ID_POST" value=$details->ID_POST text=$details->reftext_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol=""}>

                            <{if isset($smarty.session.acl.post.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post input-type-text" type="text" name="<{$prefix}>postsection_formdata_ID_POST" value="<{$details->ID_POST|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_POST}>
        <{if isset($smarty.session.acl.post.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->refuuid_ID_POST}>"><{$details->reftext_ID_POST|escape}></a>
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
    
            
        
        
            <{if !isset($excludedcolumns['TAG_LINE']) && ((isset($aclviewablecolumns['TAG_LINE']) && $aclviewablecolumns['TAG_LINE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAG_LINE']) || $aclviewablecolumns['TAG_LINE']))) }>
        <{if !isset($columns2hide) || !in_array('TAG_LINE', $columns2hide) }>
    		<td class="form-field form-field-label column-tag-line">
	            		        <label class="attribute-name"><{_t('Tag line')}></label>
            </td>
            <td class="form-field form-field-value column-tag-line" colspan="3">
            	<div class="attribute-line column-tag-line type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TAG_LINE']) && $acleditablecolumns['TAG_LINE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TAG_LINE']) || $acleditablecolumns['TAG_LINE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TAG_LINE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>postsection_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TAG_LINE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-image">
	            		        <label class="attribute-name"><{_t('Image')}></label>
            </td>
            <td class="form-field form-field-value column-image" colspan="3">
            	<div class="attribute-line column-image type-image">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IMAGE']) && $acleditablecolumns['IMAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IMAGE']) || $acleditablecolumns['IMAGE'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->IMAGE thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>postsection_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postsection_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>postsection_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>postsection_formdata_IMAGE" value="<{$details->IMAGE}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->IMAGE thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['BACKGROUND_IMAGE']) && ((isset($aclviewablecolumns['BACKGROUND_IMAGE']) && $aclviewablecolumns['BACKGROUND_IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_IMAGE']) || $aclviewablecolumns['BACKGROUND_IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('BACKGROUND_IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-background-image">
	            		        <label class="attribute-name"><{_t('Background image')}></label>
            </td>
            <td class="form-field form-field-value column-background-image" colspan="3">
            	<div class="attribute-line column-background-image type-image">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['BACKGROUND_IMAGE']) && $acleditablecolumns['BACKGROUND_IMAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['BACKGROUND_IMAGE']) || $acleditablecolumns['BACKGROUND_IMAGE'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->BACKGROUND_IMAGE thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-background-image input-type-file" type="file" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postsection_BACKGROUND_IMAGE"><{media src=$details->BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_BACKGROUND_IMAGE, '<{$details->BACKGROUND_IMAGE}>', '<{$prefix}>postsection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" value="<{$details->BACKGROUND_IMAGE}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->BACKGROUND_IMAGE thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['BACKGROUND_COLOR']) && ((isset($aclviewablecolumns['BACKGROUND_COLOR']) && $aclviewablecolumns['BACKGROUND_COLOR']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BACKGROUND_COLOR']) || $aclviewablecolumns['BACKGROUND_COLOR']))) }>
        <{if !isset($columns2hide) || !in_array('BACKGROUND_COLOR', $columns2hide) }>
    		<td class="form-field form-field-label column-background-color">
	            		        <label class="attribute-name"><{_t('Background color')}></label>
            </td>
            <td class="form-field form-field-value column-background-color" colspan="3">
            	<div class="attribute-line column-background-color type-color">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['BACKGROUND_COLOR']) && $acleditablecolumns['BACKGROUND_COLOR']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['BACKGROUND_COLOR']) || $acleditablecolumns['BACKGROUND_COLOR'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->BACKGROUND_COLOR|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-background-color input-type-color" type="text" name="<{$prefix}>postsection_formdata_BACKGROUND_COLOR" value="<{$details->BACKGROUND_COLOR|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->BACKGROUND_COLOR|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VIDEO']) && ((isset($aclviewablecolumns['VIDEO']) && $aclviewablecolumns['VIDEO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VIDEO']) || $aclviewablecolumns['VIDEO']))) }>
        <{if !isset($columns2hide) || !in_array('VIDEO', $columns2hide) }>
    		<td class="form-field form-field-label column-video">
	            		        <label class="attribute-name"><{_t('Video')}></label>
            </td>
            <td class="form-field form-field-value column-video" colspan="3">
            	<div class="attribute-line column-video type-video">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VIDEO']) && $acleditablecolumns['VIDEO']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VIDEO']) || $acleditablecolumns['VIDEO'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->VIDEO thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-video input-type-file" type="file" name="<{$prefix}>postsection_formdata_VIDEO" />
    <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->VIDEO}><div style="clear:both"></div><span id="<{$prefix}>postsection_VIDEO"><{media src=$details->VIDEO}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_VIDEO, '<{$details->VIDEO}>', '<{$prefix}>postsection_VIDEO')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>postsection_formdata_VIDEO" value="<{$details->VIDEO}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->VIDEO thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CONTENT']) && ((isset($aclviewablecolumns['CONTENT']) && $aclviewablecolumns['CONTENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONTENT']) || $aclviewablecolumns['CONTENT']))) }>
        <{if !isset($columns2hide) || !in_array('CONTENT', $columns2hide) }>
    		<td class="form-field form-field-label column-content">
	            		        <label class="attribute-name"><{_t('Content')}></label>
            </td>
            <td class="form-field form-field-value column-content" colspan="3">
            	<div class="attribute-line column-content type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CONTENT']) && $acleditablecolumns['CONTENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CONTENT']) || $acleditablecolumns['CONTENT'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->CONTENT|plugin:"postsection_view_field_CONTENT":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>postsection_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>postsection_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->CONTENT|plugin:"postsection_view_field_CONTENT":$details}>
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
	            		        <label class="attribute-name"><{_t('Link path')}></label>
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
                                    

    <input class="input-link-path input-type-text" type="text" name="<{$prefix}>postsection_formdata_LINK_PATH" value="<{$details->LINK_PATH|escape}>"  />
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

    <{plugin key="postsection_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        postsectionview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        postsectionview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                postsectionview_apply_block_visibility(key, value);
            });
        }

        postsectionview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        postsectionview_update_visibility_settings = function () {
            var settings = postsectionview_get_visibility_settings();

            postsectionview_apply_visibility_settings(settings);
        }

        $(function() {
            postsectionview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/postsection/fieldSave",
//                        data: td.find(':input').serialize() + "&postsection_formdata_UUID=<{$details->UUID}>"
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
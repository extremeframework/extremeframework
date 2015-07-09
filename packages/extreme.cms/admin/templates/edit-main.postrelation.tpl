<div class="edit-main edit_details">
    <{if isset($messages.postrelation) }>
        <ul class="message">
            <{foreach from=$messages.postrelation key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="postrelationform" id="postrelationform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/postrelation/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postrelation_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="postrelation_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="postrelation_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_POST'])}>
    
        <{if $preset == 'ID_POST'}>
            <input type="hidden" class="input-id-post" name="postrelation_formdata_ID_POST" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST']) && !$acleditablecolumns['ID_POST'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST'])}>
            <input type="hidden" class="input-id-post" name="postrelation_formdata_ID_POST" value="<{$details->ID_POST}>" />
        <{else}>
    		<td class="form-row form-row-id-post">
                <div class="form-field form-field-label">
        		    <label><{_t('L_POST')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-post" colspan="3">
                <div class="form-field form-field-value column-id-post">
                                            
            <{if Framework::hasModule('Post')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-post" class="input-id-post" name="`$prefix`postrelation_formdata_ID_POST" value=$details->ID_POST text=$details->reftext_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                </span>
                    <{else}>
            <input class="input-id-post input-type-text" type="text" name="<{$prefix}>postrelation_formdata_ID_POST" value="<{$details->ID_POST|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_POST}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PEER_ID_POST'])}>
    
        <{if $preset == 'PEER_ID_POST'}>
            <input type="hidden" class="input-peer-id-post" name="postrelation_formdata_PEER_ID_POST" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PEER_ID_POST']) && !$acleditablecolumns['PEER_ID_POST'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PEER_ID_POST'])}>
            <input type="hidden" class="input-peer-id-post" name="postrelation_formdata_PEER_ID_POST" value="<{$details->PEER_ID_POST}>" />
        <{else}>
    		<td class="form-row form-row-peer-id-post">
                <div class="form-field form-field-label">
        		    <label><{_t('L_PEER_POST')}></label>
                </div>
            </td>
            <td class="form-row form-row-peer-id-post" colspan="3">
                <div class="form-field form-field-value column-peer-id-post">
                                            
            <{if Framework::hasModule('Post')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-peer-id-post" class="input-peer-id-post" name="`$prefix`postrelation_formdata_PEER_ID_POST" value=$details->PEER_ID_POST text=$details->reftext_PEER_ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                </span>
                    <{else}>
            <input class="input-peer-id-post input-type-text" type="text" name="<{$prefix}>postrelation_formdata_PEER_ID_POST" value="<{$details->PEER_ID_POST|escape}>"  />
        <{/if}>
                            <{if $columntooltips.PEER_ID_POST}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PEER_ID_POST}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_POST_RELATION_TYPE'])}>
    
        <{if $preset == 'ID_POST_RELATION_TYPE'}>
            <input type="hidden" class="input-id-post-relation-type" name="postrelation_formdata_ID_POST_RELATION_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST_RELATION_TYPE']) && !$acleditablecolumns['ID_POST_RELATION_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST_RELATION_TYPE'])}>
            <input type="hidden" class="input-id-post-relation-type" name="postrelation_formdata_ID_POST_RELATION_TYPE" value="<{$details->ID_POST_RELATION_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-post-relation-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_POST_RELATION_TYPE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-post-relation-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-post-relation-type">
                                            
            <{if Framework::hasModule('PostRelationType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-post-relation-type" class="input-id-post-relation-type" name="`$prefix`postrelation_formdata_ID_POST_RELATION_TYPE" value=$details->ID_POST_RELATION_TYPE text=$details->reftext_ID_POST_RELATION_TYPE datasource="POST_RELATION_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/new" title="Create a New Post Relation Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-post-relation-type input-type-text" type="text" name="<{$prefix}>postrelation_formdata_ID_POST_RELATION_TYPE" value="<{$details->ID_POST_RELATION_TYPE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_POST_RELATION_TYPE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST_RELATION_TYPE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
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
                                		<td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
                                            <div class="form-field form-field-label">
                                    		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>" colspan="3">
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

        <{plugin key="postrelation_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#postrelationform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#postrelationform :input').change(function() {
        $('#postrelationform').data('changed', true);
    });

        function saveDraft() {
        if ($('#postrelationform').length) {
            if ($('#postrelationform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/postrelation/savedraft/",
                    data: $('#postrelationform').serialize()
                });

                $('#postrelationform').data('changed', false);
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
    postrelation_get_editing_model = function () {
        var model = {};

        var formdata = $('#postrelationform').find('[name*=postrelation_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('postrelation_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    postrelation_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    postrelation_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            postrelation_apply_block_visibility(key, value);
        });
    }

    postrelation_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    postrelation_update_visibility_settings = function () {
        var model = postrelation_get_editing_model();

        var settings = postrelation_get_visibility_settings(model);

        postrelation_apply_visibility_settings(settings);
    }

    $(function() {
        $('#postrelationform :input').change(function() {
            postrelation_update_visibility_settings();
        });

        postrelation_update_visibility_settings();
    });
</script>
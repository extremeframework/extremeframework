<div class="edit-main edit_details">
    <{if isset($messages.workflowlog) }>
        <ul class="message">
            <{foreach from=$messages.workflowlog key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="workflowlogform" id="workflowlogform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/workflowlog/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="workflowlog_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="workflowlog_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="workflowlog_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_WORKFLOW'])}>
    
        <{if $preset == 'ID_WORKFLOW'}>
            <input type="hidden" class="input-id-workflow" name="workflowlog_formdata_ID_WORKFLOW" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_WORKFLOW']) && !$acleditablecolumns['ID_WORKFLOW'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_WORKFLOW'])}>
            <input type="hidden" class="input-id-workflow" name="workflowlog_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW}>" />
        <{else}>
    		<td class="form-row form-row-id-workflow">
                <div class="form-field form-field-label">
        		    <label><{_t('L_WORKFLOW')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-workflow" colspan="3">
                <div class="form-field form-field-value column-id-workflow">
                                            
            <{if Framework::hasModule('Workflow')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-workflow" class="input-id-workflow" name="`$prefix`workflowlog_formdata_ID_WORKFLOW" value=$details->ID_WORKFLOW text=$details->reftext_ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                </span>
                    <{else}>
            <input class="input-id-workflow input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_WORKFLOW}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_WORKFLOW}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_WORKFLOW_TRANSITION'])}>
    
        <{if $preset == 'ID_WORKFLOW_TRANSITION'}>
            <input type="hidden" class="input-id-workflow-transition" name="workflowlog_formdata_ID_WORKFLOW_TRANSITION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_WORKFLOW_TRANSITION']) && !$acleditablecolumns['ID_WORKFLOW_TRANSITION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_WORKFLOW_TRANSITION'])}>
            <input type="hidden" class="input-id-workflow-transition" name="workflowlog_formdata_ID_WORKFLOW_TRANSITION" value="<{$details->ID_WORKFLOW_TRANSITION}>" />
        <{else}>
    		<td class="form-row form-row-id-workflow-transition">
                <div class="form-field form-field-label">
        		    <label><{_t('L_WORKFLOW_TRANSITION')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-workflow-transition" colspan="3">
                <div class="form-field form-field-value column-id-workflow-transition">
                                            
            <{if Framework::hasModule('WorkflowTransition')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-workflow-transition" class="input-id-workflow-transition" name="`$prefix`workflowlog_formdata_ID_WORKFLOW_TRANSITION" value=$details->ID_WORKFLOW_TRANSITION text=$details->reftext_ID_WORKFLOW_TRANSITION datasource="WORKFLOW_TRANSITION" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/new" title="Create a New Workflow Transition">+</a>
                </span>
                    <{else}>
            <input class="input-id-workflow-transition input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_ID_WORKFLOW_TRANSITION" value="<{$details->ID_WORKFLOW_TRANSITION|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_WORKFLOW_TRANSITION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_WORKFLOW_TRANSITION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="workflowlog_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="workflowlog_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_MODULE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`workflowlog_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                </span>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['OBJECT_ID'])}>
    
        <{if $preset == 'OBJECT_ID'}>
            <input type="hidden" class="input-object-id" name="workflowlog_formdata_OBJECT_ID" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['OBJECT_ID']) && !$acleditablecolumns['OBJECT_ID'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['OBJECT_ID'])}>
            <input type="hidden" class="input-object-id" name="workflowlog_formdata_OBJECT_ID" value="<{$details->OBJECT_ID}>" />
        <{else}>
    		<td class="form-row form-row-object-id">
                <div class="form-field form-field-label">
        		    <label><{_t('L_OBJECT')}></label>
                </div>
            </td>
            <td class="form-row form-row-object-id" colspan="3">
                <div class="form-field form-field-value column-object-id">
                                            

    <input class="input-object-id input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_OBJECT_ID" value="<{$details->OBJECT_ID|escape}>"  />
                        <{if $columntooltips.OBJECT_ID}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.OBJECT_ID}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DATE'])}>
    
        <{if $preset == 'DATE'}>
            <input type="hidden" class="input-date" name="workflowlog_formdata_DATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DATE']) && !$acleditablecolumns['DATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DATE'])}>
            <input type="hidden" class="input-date" name="workflowlog_formdata_DATE" value="<{$details->DATE}>" />
        <{else}>
    		<td class="form-row form-row-date">
                <div class="form-field form-field-label">
        		    <label><{_t('L_DATE')}></label>
                </div>
            </td>
            <td class="form-row form-row-date" colspan="3">
                <div class="form-field form-field-value column-date">
                                            
    <input class="input-date input-type-date field-date" type="text" id="<{$prefix}>workflowlog_formdata_DATE" name="<{$prefix}>workflowlog_formdata_DATE" value="<{$details->DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                        <{if $columntooltips.DATE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DATE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_USER'])}>
    
        <{if $preset == 'ID_USER'}>
            <input type="hidden" class="input-id-user" name="workflowlog_formdata_ID_USER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER']) && !$acleditablecolumns['ID_USER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER'])}>
            <input type="hidden" class="input-id-user" name="workflowlog_formdata_ID_USER" value="<{$details->ID_USER}>" />
        <{else}>
    		<td class="form-row form-row-id-user">
                <div class="form-field form-field-label">
        		    <label><{_t('L_USER')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-user" colspan="3">
                <div class="form-field form-field-value column-id-user">
                                            
            <{if Framework::hasModule('User')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`workflowlog_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                </span>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_USER}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DETAILS'])}>
    
        <{if $preset == 'DETAILS'}>
            <input type="hidden" class="input-details" name="workflowlog_formdata_DETAILS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DETAILS']) && !$acleditablecolumns['DETAILS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DETAILS'])}>
            <input type="hidden" class="input-details" name="workflowlog_formdata_DETAILS" value="<{$details->DETAILS}>" />
        <{else}>
    		<td class="form-row form-row-details">
                <div class="form-field form-field-label">
        		    <label><{_t('L_DETAILS')}></label>
                </div>
            </td>
            <td class="form-row form-row-details" colspan="3">
                <div class="form-field form-field-value column-details">
                                            

    <input class="input-details input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_DETAILS" value="<{$details->DETAILS|escape}>"  />
                        <{if $columntooltips.DETAILS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DETAILS}>"></i>
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

        <{plugin key="workflowlog_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#workflowlogform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#workflowlogform :input').change(function() {
        $('#workflowlogform').data('changed', true);
    });

        function saveDraft() {
        if ($('#workflowlogform').length) {
            if ($('#workflowlogform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowlog/savedraft/",
                    data: $('#workflowlogform').serialize()
                });

                $('#workflowlogform').data('changed', false);
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
    workflowlog_get_editing_model = function () {
        var model = {};

        var formdata = $('#workflowlogform').find('[name*=workflowlog_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('workflowlog_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    workflowlog_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    workflowlog_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            workflowlog_apply_block_visibility(key, value);
        });
    }

    workflowlog_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    workflowlog_update_visibility_settings = function () {
        var model = workflowlog_get_editing_model();

        var settings = workflowlog_get_visibility_settings(model);

        workflowlog_apply_visibility_settings(settings);
    }

    $(function() {
        $('#workflowlogform :input').change(function() {
            workflowlog_update_visibility_settings();
        });

        workflowlog_update_visibility_settings();
    });
</script>